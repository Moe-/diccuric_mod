//------------ ENDE -----------------
instance DIA_DIC_Aldred_Exit (C_INFO)
	{
	npc = DIC_2056_Aldred;
	nr = 999;
	condition = DIA_DIC_Aldred_Exit_Condition;
	information = DIA_DIC_Aldred_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Aldred_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Aldred_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	//Npc_SetKnowsPlayer (self, hero);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Aldred_Angriff (C_INFO)
	{
	npc = DIC_2056_Aldred;
	nr = 1;
	condition = DIA_DIC_Aldred_Angriff_Condition;
	information = DIA_DIC_Aldred_Angriff_Info;
	permanent = 0;
	important = 1;
	description = "Greife dich an";
	};

func int DIA_DIC_Aldred_Angriff_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))
	//if (Npc_KnowsPlayer (self, hero))
		{
		return 1;
		};
	};

func void DIA_DIC_Aldred_Angriff_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Aldred_Angriff_02_00"); //Ah, Novize! Du kannst mir eben mal helfen. Da hinten die Säcke mit dem Reis, die müssen zum Lagerhaus. Da, nahe am Wasserfall. Ja, im Lagerhaus wird nur Reis aufbewahrt. Da vorne, die Säcke, siehst du sie nicht? 
	AI_Output (self, other, "DIA_DIC_Aldred_Angriff_02_01"); //Na ja die Sonne blendet auch stark im Moment. Komm mit ich zeig es dir. Was? Du willst nicht spuren? Na warte ! 
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	AI_StopProcessInfos (self);
	};
	