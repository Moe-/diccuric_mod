//------------ ENDE -----------------
instance DIA_DIC_Modares_Exit (C_INFO)
	{
	npc = DIC_2081_Modares;
	nr = 999;
	condition = DIA_DIC_Modares_Exit_Condition;
	information = DIA_DIC_Modares_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Modares_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Modares_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Modares_Wachen (C_INFO)
	{
	npc = DIC_2081_Modares;
	nr = 1;
	condition = DIA_DIC_Modares_Wachen_Condition;
	information = DIA_DIC_Modares_Wachen_Info;
	permanent = 0;
	important = 1;
	description = "vorbeigeschlichen";
	};

func int DIA_DIC_Modares_Wachen_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Modares_Wachen_Info ()
	{
	AI_Output (self,other,"DIA_DIC_Modares_Wachen_11_00"); //Hast dich wohl an den Wachen vorbeigeschlichen. Nicht ungeschickt! Ha ha. Aber das ist das letzte was dir gelungen ist, denn du hast deinen Tod selbst herbeigeführt.
	
	Npc_SetTarget (self, hero);
	AI_Attack (self);
	
	AI_StopProcessInfos (self);
	};