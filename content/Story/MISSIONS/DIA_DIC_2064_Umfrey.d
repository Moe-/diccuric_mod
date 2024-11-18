//------------ ENDE -----------------
instance DIA_DIC_Umfrey_Exit (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 999;
	condition = DIA_DIC_Umfrey_Exit_Condition;
	information = DIA_DIC_Umfrey_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Umfrey_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Umfrey_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Freund -----------------
instance DIA_DIC_Umfrey_Freund (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 1;
	condition = DIA_DIC_Umfrey_Freund_Condition;
	information = DIA_DIC_Umfrey_Freund_Info;
	permanent = 0;
	important = 1;
	description = "Freund";
	};

func int DIA_DIC_Umfrey_Freund_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk) && Npc_KnowsInfo(other, DIA_DIC_Amalric_Hilfe))
		{
		return 1;
		};
	};

func void DIA_DIC_Umfrey_Freund_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Umfrey_Freund_10_00"); //Ach ach ach / wer l�uft mir immer nach? / Es ist ein kleiner schwarzer Mann / den man mit den Augen sehen kann, / doch H�nde k�nnen ihn nicht ergreifen / Werde ich an diesem R�tsel verzweifeln?
	};
	
//------------ Schatten -----------------
instance DIA_DIC_Umfrey_Schatten (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 2;
	condition = DIA_DIC_Umfrey_Schatten_Condition;
	information = DIA_DIC_Umfrey_Schatten_Info;
	permanent = 0;
	important = 0;
	description = "Schatten";
	};

func int DIA_DIC_Umfrey_Schatten_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Umfrey_Freund))
		{
		return 1;
		};
	};

func void DIA_DIC_Umfrey_Schatten_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Umfrey_Schatten_15_00"); //Schatten
	AI_Output (self, other, "DIA_DIC_Umfrey_Schatten_10_01"); //Du hast mein R�tsel gel�st! Du bist es Wert, dass man dir Geh�r schenkt. Also sprich, was hast du zu sagen?
	AI_Output (other, self, "DIA_DIC_Umfrey_Schatten_15_02"); //Mit Almaric habe ich bereits gesprochen. Er will mir helfen, gegen Feordwin anzutreten. Er sagte auch du w�rdest uns unterst�tzen.
	AI_Output (self, other, "DIA_DIC_Umfrey_Schatten_10_03"); //Ja. Ich helfe euch. Doch zuvor ben�tige ich einen starken Kampfzauber - wie w�re es mit einem Zauber der die Nacht zum Tag macht? Beschaffst du mir einen Kampfzauber, stehe ich euch bei. Denn mit leeren H�nden, kann ich euch nicht helfen, ich h�tte keine Chance gegen die Wachen.
	};
	
//------------ Zeit -----------------
instance DIA_DIC_Umfrey_Zeit (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 3;
	condition = DIA_DIC_Umfrey_Zeit_Condition;
	information = DIA_DIC_Umfrey_Zeit_Info;
	permanent = 1;
	important = 0;
	description = "Zeit";
	};

func int DIA_DIC_Umfrey_Zeit_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Umfrey_Freund) && !Npc_KnowsInfo(other, DIA_DIC_Umfrey_Schatten))
		{
		return 1;
		};
	};

func void DIA_DIC_Umfrey_Zeit_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Umfrey_Zeit_15_00"); //Zeit
	AI_Output (self, other, "DIA_DIC_Umfrey_Zeit_10_01"); //Hm, du hast gesprochen, und f�r mich ist es an der Zeit zu schweigen.
	
	AI_StopProcessInfos (self);
	};
	
//------------ Wind -----------------
instance DIA_DIC_Umfrey_Wind (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 4;
	condition = DIA_DIC_Umfrey_Wind_Condition;
	information = DIA_DIC_Umfrey_Wind_Info;
	permanent = 1;
	important = 0;
	description = "Wind";
	};

func int DIA_DIC_Umfrey_Wind_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Umfrey_Freund) && !Npc_KnowsInfo(other, DIA_DIC_Umfrey_Schatten))
		{
		return 1;
		};
	};

func void DIA_DIC_Umfrey_Wind_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Umfrey_Wind_15_00"); //Wind
	AI_Output (self, other, "DIA_DIC_Umfrey_Wind_10_01"); //Wind, wovon redest du?
	
	AI_StopProcessInfos (self);
	};
	
//------------ Gut ich werde sehen, das ich dir einen Zauber beschaffen kann. -----------------
instance DIA_DIC_Umfrey_Zauber (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 5;
	condition = DIA_DIC_Umfrey_Zauber_Condition;
	information = DIA_DIC_Umfrey_Zauber_Info;
	permanent = 0;
	important = 0;
	description = "Gut ich werde sehen, dass ich dir einen Zauber beschaffen kann.";
	};

func int DIA_DIC_Umfrey_Zauber_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Umfrey_Schatten) && !Npc_KnowsInfo(other, DIA_DIC_Umfrey_Geben))
		{
		return 1;
		};
	};

func void DIA_DIC_Umfrey_Zauber_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Umfrey_Zauber_15_00"); //Gut ich werde sehen, dass ich dir einen Zauber beschaffen kann.
	
	AI_StopProcessInfos (self);
	};
	
//------------ Hier ist der Zauber. -----------------
instance DIA_DIC_Umfrey_Geben (C_INFO)
	{
	npc = DIC_2064_Umfrey;
	nr = 6;
	condition = DIA_DIC_Umfrey_Geben_Condition;
	information = DIA_DIC_Umfrey_Geben_Info;
	permanent = 0;
	important = 0;
	description = "Hier ist der Zauber.";
	};

func int DIA_DIC_Umfrey_Geben_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Umfrey_Schatten) && 
		(Npc_HasItems (hero, ItArRuneThunderball) >= 1 || Npc_HasItems (hero, ItArScrollThunderball) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Umfrey_Geben_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Umfrey_Geben_15_00"); //Hier ist der Zauber.
	AI_Output (self, other, "DIA_DIC_Umfrey_Geben_10_01"); //Gut. Ich gehe r�ber zu Amalric und warte dort auf dich.
	
	// Zauber geben
	if (Npc_HasItems (hero, ItArScrollThunderball) >= 1)
		{
		B_GiveInvItems(other, self,ItArScrollThunderball,1);
		}
	else
		{
		B_GiveInvItems(other, self,ItArRuneThunderball,1);	
		};
	
	// Zu Amalric gehen
	Npc_ExchangeRoutine(self,"AMALRIC");
	
	B_LogEntry (PruefungGeist, "Umfrey wird mir auch helfen und wartet bei Amalric auf mich.");
	
	AI_StopProcessInfos (self);
	};