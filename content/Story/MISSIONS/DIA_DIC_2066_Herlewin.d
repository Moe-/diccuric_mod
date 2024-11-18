//------------ ENDE -----------------
instance DIA_DIC_Herlewin_Exit (C_INFO)
	{
	npc = DIC_2066_Herlewin;
	nr = 999;
	condition = DIA_DIC_Herlewin_Exit_Condition;
	information = DIA_DIC_Herlewin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Herlewin_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Herlewin_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Freund -----------------
instance DIA_DIC_Herlewin_Freund (C_INFO)
	{
	npc = DIC_2066_Herlewin;
	nr = 1;
	condition = DIA_DIC_Herlewin_Freund_Condition;
	information = DIA_DIC_Herlewin_Freund_Info;
	permanent = 0;
	important = 1;
	description = "Freund";
	};

func int DIA_DIC_Herlewin_Freund_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk) && Npc_KnowsInfo(other, DIA_DIC_Amalric_Hilfe))
		{
		return 1;
		};
	};

func void DIA_DIC_Herlewin_Freund_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Herlewin_Freund_12_00"); //Wenn ich nur wüsste, was Argantael damals tat. Damals im Kampf gegen die Grirawyr. Wann war es noch und was tat er damals? War es Argantael der eine entscheidende Rolle spielte, ich weiss es nicht mehr, verdammt, ich muss mich konzentrieren.
	};
	
//------------ Herlewin, ich kann dir helfen!  -----------------
instance DIA_DIC_Herlewin_Hier (C_INFO)
	{
	npc = DIC_2066_Herlewin;
	nr = 2;
	condition = DIA_DIC_Herlewin_Hier_Condition;
	information = DIA_DIC_Herlewin_Hier_Info;
	permanent = 0;
	important = 0;
	description = "Ich kann dir helfen! ";
	};

func int DIA_DIC_Herlewin_Hier_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Herlewin_Freund) && BuchGeistGelesen == 2)
		{
		return 1;
		};
	};

func void DIA_DIC_Herlewin_Hier_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Herlewin_Hier_15_00"); //Herlewin, ich kann dir helfen! 
	AI_Output (other, self, "DIA_DIC_Herlewin_Hier_15_01"); //Argantael war ein Zauberer der im Jahre 1342  in der Schlacht gegen die Grirawyr einen Nebel heraufbeschwor, der vom Wind nicht verweht werden konnte. In der Schlacht war der Nebel von entscheidendem Vorteil. Die Angreifer waren in der Unterzahl aber die feindlichen Grigrawyr glaubten, gegen ein mächtiges Herr anzutreten und flohen schließlich.
	AI_Output (self, other, "DIA_DIC_Herlewin_Hier_12_02"); //Ja! So ist es. Seit ein paar Tagen grübele ich vergeblich darüber, wie es sich mit dem wahrheitsgemässen Verlauf der Geschichte zutrug. Ein Buch in dem ich mein Wissen vor 18 Jahren niederschrieb, habe ich verloren. Danke für deine Hilfe. Aber sage mir, wer bist du?
	AI_Output (other, self, "DIA_DIC_Herlewin_Hier_15_03"); //Mein Name ist Ardaric.  Ich habe erst seit kurzem einen Weg in die Höhle gefunden. Amalric und ich haben uns dazu entschlossen, gegen Feordwin  anzutreten. Ich möchte dich um deine Hilfe im Kampf gegen Feordwin bitten.
	AI_Output (self, other, "DIA_DIC_Herlewin_Hier_12_04"); //Ich helfe dir. Aber ich brauche einen Kampf Zauber mit dem man Wasser gefrieren könnte. Erst dann kann ich euch wirklich helfen.
	};
	
//------------ Gut ich werde sehen, das ich dir einen Zauber beschaffen kann. -----------------
instance DIA_DIC_Herlewin_Zauber (C_INFO)
	{
	npc = DIC_2066_Herlewin;
	nr = 3;
	condition = DIA_DIC_Herlewin_Zauber_Condition;
	information = DIA_DIC_Herlewin_Zauber_Info;
	permanent = 0;
	important = 0;
	description = "Gut. Warte hier auf mich.";
	};

func int DIA_DIC_Herlewin_Zauber_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Herlewin_Hier)  && !Npc_KnowsInfo(other, DIA_DIC_Herlewin_Geben))
		{
		return 1;
		};
	};

func void DIA_DIC_Herlewin_Zauber_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Herlewin_Zauber_15_00"); //Gut. Warte hier auf mich.
	
	AI_StopProcessInfos (self);
	};
	
//------------ Hier ist der Zauber, nach dem du fragst.  -----------------
instance DIA_DIC_Herlewin_Geben (C_INFO)
	{
	npc = DIC_2066_Herlewin;
	nr = 4;
	condition = DIA_DIC_Herlewin_Geben_Condition;
	information = DIA_DIC_Herlewin_Geben_Info;
	permanent = 0;
	important = 0;
	description = "Hier ist der Zauber, nach dem du fragst.";
	};

func int DIA_DIC_Herlewin_Geben_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Herlewin_Hier) && 
		(Npc_HasItems (hero, ItArRuneThunderbolt) >= 1 || Npc_HasItems (hero, ItArScrollThunderbolt) >= 1
		|| Npc_HasItems (hero, ItArRuneIceCube) >= 1 || Npc_HasItems (hero, ItArScrollIceCube) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Herlewin_Geben_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Herlewin_Geben_15_00"); //Hier ist der Zauber, nach dem du fragst. 
	AI_Output (self, other, "DIA_DIC_Herlewin_Geben_11_01"); //Du findest mich bei Amalric.
	
	// Zauber geben
	if (Npc_HasItems (hero, ItArScrollThunderbolt) >= 1)
		{
		B_GiveInvItems(other, self,ItArScrollThunderbolt,1);
		}
	else if (Npc_HasItems (hero, ItArScrollIceCube) >= 1)
		{
		B_GiveInvItems(other, self,ItArScrollIceCube,1);	
		}
	else if (Npc_HasItems (hero, ItArRuneThunderbolt) >= 1)
		{
		B_GiveInvItems(other, self,ItArRuneThunderbolt,1);	
		}
	else
		{
		B_GiveInvItems(other, self,ItArRuneIceCube,1);	
		};
	
	// Zu Amalric gehen
	Npc_ExchangeRoutine(self,"AMALRIC");
	
	B_LogEntry (PruefungGeist, "Herlewin wird auch bei Amalric warten, um mir zu helfen.");
	
	AI_StopProcessInfos (self);
	};