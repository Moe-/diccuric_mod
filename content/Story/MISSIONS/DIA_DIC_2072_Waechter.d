//------------ ENDE -----------------
instance DIA_DIC_2072_Waechter_Exit (C_INFO)
	{
	npc = DIC_2072_Waechter;
	nr = 999;
	condition = DIA_DIC_2072_Waechter_Exit_Condition;
	information = DIA_DIC_2072_Waechter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2072_Waechter_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2072_Waechter_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};