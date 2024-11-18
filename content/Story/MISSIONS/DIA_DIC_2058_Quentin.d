//------------ ENDE -----------------
instance DIA_DIC_Quentin_Exit (C_INFO)
	{
	npc = DIC_2058_Quentin;
	nr = 999;
	condition = DIA_DIC_Quentin_Exit_Condition;
	information = DIA_DIC_Quentin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Quentin_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Quentin_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	//Npc_SetKnowsPlayer (self, hero);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Quentin_Angriff (C_INFO)
	{
	npc = DIC_2058_Quentin;
	nr = 1;
	condition = DIA_DIC_Quentin_Angriff_Condition;
	information = DIA_DIC_Quentin_Angriff_Info;
	permanent = 0;
	important = 1;
	description = "Greife dich an";
	};

func int DIA_DIC_Quentin_Angriff_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))	
	//if (Npc_KnowsPlayer (self, hero))
		{
		return 1;
		};
	};

func void DIA_DIC_Quentin_Angriff_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Quentin_Angriff_04_00"); //Ein Angriff!
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	AI_StopProcessInfos (self);
	};
	