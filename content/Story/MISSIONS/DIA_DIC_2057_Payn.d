//------------ ENDE -----------------
instance DIA_DIC_Payn_Exit (C_INFO)
	{
	npc = DIC_2057_Payn;
	nr = 999;
	condition = DIA_DIC_Payn_Exit_Condition;
	information = DIA_DIC_Payn_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Payn_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Payn_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	//Npc_SetKnowsPlayer (self, hero);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Payn_Angriff (C_INFO)
	{
	npc = DIC_2057_Payn;
	nr = 1;
	condition = DIA_DIC_Payn_Angriff_Condition;
	information = DIA_DIC_Payn_Angriff_Info;
	permanent = 0;
	important = 1;
	description = "Greife dich an";
	};

func int DIA_DIC_Payn_Angriff_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))	
	//if (Npc_KnowsPlayer (self, hero))
		{
		return 1;
		};
	};

func void DIA_DIC_Payn_Angriff_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Payn_Angriff_03_00"); //Zehn Orks von einem magischen Blitz verbrannt. Erst fing ihr Fell Feuer, dann war es nur noch eine Frage von Sekunden, und ihr Leben ward ausgehaucht. Du hast es wohl überlebt. Und willst jetzt deine Rache?
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	AI_StopProcessInfos (self);
	};
	