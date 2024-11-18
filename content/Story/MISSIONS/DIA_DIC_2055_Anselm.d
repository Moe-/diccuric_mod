//------------ ENDE -----------------
instance DIA_DIC_Anselm_Exit (C_INFO)
	{
	npc = DIC_2055_Anselm;
	nr = 999;
	condition = DIA_DIC_Anselm_Exit_Condition;
	information = DIA_DIC_Anselm_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Anselm_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Anselm_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	//Npc_SetKnowsPlayer (self, hero);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Anselm_Angriff (C_INFO)
	{
	npc = DIC_2055_Anselm;
	nr = 1;
	condition = DIA_DIC_Anselm_Angriff_Condition;
	information = DIA_DIC_Anselm_Angriff_Info;
	permanent = 0;
	important = 1;
	description = "Greife dich an";
	};

func int DIA_DIC_Anselm_Angriff_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))	
	//if (Npc_KnowsPlayer (self, hero))
		{
		return 1;
		};
	};

func void DIA_DIC_Anselm_Angriff_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Anselm_Angriff_11_00"); //O Ewigkeit du machst mir bang' / O Ewig / Ewig ist zu lang' / Hie gilt fürwahr kein Schertzen:
	AI_Output (self, other, "DIA_DIC_Anselm_Angriff_11_01"); //Drumb / wenn ich diese lange Nacht Zusampt der grossen Pein betracht' / Erschreck ich recht von Hertzen /
	AI_Output (self, other, "DIA_DIC_Anselm_Angriff_11_02"); //Nichts ist zu finden weit und breit So schrecklich als die Ewigkeit.
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	AI_StopProcessInfos (self);
	};
	