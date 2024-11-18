//------------ ENDE -----------------
instance DIA_DIC_2082_Waechter_Exit (C_INFO)
	{
	npc = DIC_2082_Waechter;
	nr = 999;
	condition = DIA_DIC_2082_Waechter_Exit_Condition;
	information = DIA_DIC_2082_Waechter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2082_Waechter_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2082_Waechter_Exit_Info ()
	{		
	AI_StopProcessInfos (self);
	};

// -------------- Kein Durchgang ---------------
instance DIA_DIC_2082_Waechter_Stop (C_INFO)
	{
		npc = DIC_2082_Waechter;
		nr = 1;
		condition = DIA_DIC_2082_Waechter_Stop_Condition;
		information = DIA_DIC_2082_Waechter_Stop_Info;
		permanent = 1;
		important = 1;
		description = "Was willst du?";
	};
	
func int DIA_DIC_2082_Waechter_Stop_Condition ()
	{
	if (Npc_KnowsInfo (other,DIA_DIC_Baltar_Uebernehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_2082_Waechter_Stop_Info ()
	{
	AI_Output (self, other, "DIA_DIC_2082_Waechter_Stop_06_00"); //Berengar darf nicht gestört werden. Und jetzt geh!	
	AI_Output (other, self, "DIA_DIC_2082_Waechter_Stop_15_01"); //Aber ich muss mit ihm sprechen.
	AI_Output (self, other, "DIA_DIC_2082_Waechter_Stop_06_02"); //Wenn es was wichtiges gibt, richte es Graveyarn aus.
	
	AI_GotoWP(hero, "HAUPTGEBAEUDE_01");
	AI_StopProcessInfos (self);
	};