//------------ ENDE -----------------
instance DIA_DIC_YBerion_Exit (C_INFO)
	{
	npc = DIC_2037_YBerion;
	nr = 999;
	condition = DIA_DIC_YBerion_Exit_Condition;
	information = DIA_DIC_YBerion_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_YBerion_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_YBerion_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------- Spieler hat Tauschgegenstand bei sich -------
INSTANCE DIA_DIC_YBerion_Sumpfhai (C_INFO)
	{
	npc			= DIC_2037_YBerion;
	nr			= 1;
	condition	= DIA_DIC_YBerion_Sumpfhai_Condition;
	information	= DIA_DIC_YBerion_Sumpfhai_Info;
	permanent	= 0;
	important = 1;
	description = "Wo hast du die Sumpfhaihaut her?";
	};

FUNC INT DIA_DIC_YBerion_Sumpfhai_Condition()
	{
	if (Npc_HasItems(other, ItAt_Swampshark_01) >= 1)
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_YBerion_Sumpfhai_Info()
	{
	AI_Output (self, other, "DIA_DIC_YBerion_Sumpfhai_12_00"); //Du besitzt eine Sumpfhaihaut?!?!?
	AI_Output (other, self, "DIA_DIC_YBerion_Sumpfhai_15_01"); //Ja, ich habe sie gerade erst gekauft.
	AI_Output (self, other, "DIA_DIC_YBerion_Sumpfhai_12_02"); //Willst du tauschen?
	
	B_LogEntry (HandelsQuest, "Nolwenn gab sich zu erkennen, als er meine Sumpfhaihut sah.");
	B_LogEntry (BekanntePersonen, "Der n‰chste H‰ndler heiﬂt Nolwenn.");
	};

// ------------- Handeln ---------------
instance DIA_DIC_YBerion_Handeln (C_INFO)
	{
	npc = DIC_2037_YBerion;
	nr = 2;
	condition = DIA_DIC_YBerion_Handeln_Condition;
	information = DIA_DIC_YBerion_Handeln_Info;
	permanent = 1;
	important = 0;
	description = "Okay, lass uns tauschen.";
	trade = 1;
	};

func int DIA_DIC_YBerion_Handeln_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_YBerion_Sumpfhai))
		{
		return 1;
		};
	};

func void DIA_DIC_YBerion_Handeln_Info ()
	{
	AI_Output (other, self, "DIA_DIC_YBerion_Handeln_15_00"); //Okay, lass uns tauschen.
	};