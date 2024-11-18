//------------ ENDE -----------------
instance DIA_DIC_Arbeiter_2022_Exit (C_INFO)
	{
	npc = DIC_2022_Arbeiter;
	nr = 999;
	condition = DIA_DIC_Arbeiter_2022_Exit_Condition;
	information = DIA_DIC_Arbeiter_2022_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};
	
func int DIA_DIC_Arbeiter_2022_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_Arbeiter_2022_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};