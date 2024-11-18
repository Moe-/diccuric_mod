//------------ ENDE -----------------
instance DIA_DIC_Koll_Exit (C_INFO)
	{
	npc = DIC_2031_Koll;
	nr = 999;
	condition = DIA_DIC_Koll_Exit_Condition;
	information = DIA_DIC_Koll_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Koll_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Koll_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------- Karte ---------------
instance DIA_DIC_Koll_Karte (C_INFO)
	{
	npc = DIC_2031_Koll;
	nr = 1;
	condition = DIA_DIC_Koll_Karte_Condition;
	information = DIA_DIC_Koll_Karte_Info;
	permanent = 1;
	important = 0;
	description = "Gib mir die Karte.";
	};

func int DIA_DIC_Koll_Karte_Condition ()
	{
	if ((Npc_HasItems (self, Graveyarn_Karte) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Koll_Karte_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Koll_Karte_15_00"); //Gib mir die Karte.
	AI_Output (self, other, "DIA_DIC_Koll_Karte_05_01"); //Verschwinde. Sonst gibt’s ein blaues Auge!

	Info_AddChoice (DIA_DIC_Koll_Karte, "Willst du mit meiner Waffe Bekanntschaft machen?", DIA_DIC_Koll_Angriff);
	Info_AddChoice (DIA_DIC_Koll_Karte, "Gut. Ich gehe.", DIA_DIC_Koll_Wegrennen);
	};

func void DIA_DIC_Koll_Angriff ()
	{
	AI_Output (other, self, "DIA_DIC_Koll_Angriff_15_00"); //Willst du mit meiner Waffe Bekanntschaft machen? Ich sage es nur noch einmal: Gib mir die Karte.
	Info_ClearChoices(DIA_DIC_Koll_Karte);
	
	B_LogEntry (DerKartenzeichner, "Ich habe mit Koll um die Karte gekämpft.");
	
	AI_StopProcessInfos (self);
	
	Npc_SetTarget (self, hero);
	AI_Attack(self);
	};

func void DIA_DIC_Koll_Wegrennen ()
	{
	AI_Output (other, self, "DIA_DIC_Koll_Wegrennen_15_00"); //Gut. Ich gehe.
	Info_ClearChoices(DIA_DIC_Koll_Karte);
	
	B_LogEntry (DerKartenzeichner, "Koll wollte mir die Karte nicht geben.");
	};

/*
// -------------- Kurzes Ansprechen vor Rennen -------------------
instance DIA_DIC_Koll_Ansprechen (C_INFO)
	{
	npc = DIC_2031_Koll;
	nr = 2;
	condition = DIA_DIC_Koll_Ansprechen_Condition;
	information = DIA_DIC_Koll_Ansprechen_Info;
	permanent = 0;
	important = 1;
	description = "Möge der Bessere gewinnen!";
	};

func int DIA_DIC_Koll_Ansprechen_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Graveyarn_Karte))
		{
		return 1;
		};
	};

func void DIA_DIC_Koll_Ansprechen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Koll_Ansprechen_15_00"); //Möge der Bessere von uns, also ich, gewinnen!
	Npc_SetStateTime (self, 0);
	AI_StopProcessInfos (self);
	};
*/

// --------- Zweikampf --------------
instance DIA_DIC_Koll_Zweikampf (C_INFO)
	{
	npc = DIC_2031_Koll;
	nr = 3;
	condition = DIA_DIC_Koll_Zweikampf_Condition;
	information = DIA_DIC_Koll_Zweikampf_Info;
	permanent = 0;
	important = 1;
	description = "Da bist du ja!";
	};

func int DIA_DIC_Koll_Zweikampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Baltar_KenneKoll) || Npc_KnowsInfo (other, DIA_DIC_Baltar_WerKoll))
		{
		return 1;
		};
	};

func void DIA_DIC_Koll_Zweikampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Koll_Zweikampf_05_00"); //Ah, da bist du ja!
	
	Wld_SendTrigger ("ARENA_E1"); 
	Wld_SendTrigger ("ARENA_E2");

	if KampfInArena == 0
	{
		KampfInArena = 3;
	}
	else
	{
		KampfInArena = 4;
	};

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"START");	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	
/*
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	Npc_SetTarget (self, other);
	AI_Attack (self);
*/
	};
