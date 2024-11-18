//------------ ENDE -----------------
instance DIA_DIC_Gladwin_Exit (C_INFO)
	{
	npc = DIC_2061_Gladwin;
	nr = 999;
	condition = DIA_DIC_Gladwin_Exit_Condition;
	information = DIA_DIC_Gladwin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Gladwin_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Gladwin_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Neutral -----------------
instance DIA_DIC_Gladwin_Neutral (C_INFO)
	{
	npc = DIC_2061_Gladwin;
	nr = 1;
	condition = DIA_DIC_Gladwin_Neutral_Condition;
	information = DIA_DIC_Gladwin_Neutral_Info;
	permanent = 0;
	important = 1;
	description = "Bleibe Neutral";
	};

func int DIA_DIC_Gladwin_Neutral_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))
		{
		return 1;
		};
	};

func void DIA_DIC_Gladwin_Neutral_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Gladwin_Neutral_06_00"); //Hast du ein Jagamondo?
	AI_Output (other, self, "DIA_DIC_Gladwin_Neutral_15_01"); //Was ist ein Jagamondo?
	AI_Output (self, other, "DIA_DIC_Gladwin_Neutral_06_02"); //Ein Jagamondo ist etwas, womit du sehr weit reisen kannst. Hast du eins bei dir?
	AI_Output (other, self, "DIA_DIC_Gladwin_Neutral_15_03"); //Nein.
	AI_Output (self, other, "DIA_DIC_Gladwin_Neutral_06_04"); //Das macht mich sehr traurig.
	
	AI_StopProcessInfos (self);
	};
	