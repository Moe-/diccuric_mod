//------------ ENDE -----------------
instance DIA_DIC_Eustace_Exit (C_INFO)
	{
	npc = DIC_2060_Eustace;
	nr = 999;
	condition = DIA_DIC_Eustace_Exit_Condition;
	information = DIA_DIC_Eustace_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Eustace_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Eustace_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Eustace_Angriff (C_INFO)
	{
	npc = DIC_2060_Eustace;
	nr = 1;
	condition = DIA_DIC_Eustace_Angriff_Condition;
	information = DIA_DIC_Eustace_Angriff_Info;
	permanent = 0;
	important = 1;
	description = "Greife dich an";
	};

func int DIA_DIC_Eustace_Angriff_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))
		{
		return 1;
		};
	};

func void DIA_DIC_Eustace_Angriff_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Eustace_Angriff_06_00"); //Ich bin ein Seher. Ich sehe in deine Zukunft: du wirst sehr bald sterben. Lass mich mal sehen wie du umkommen wirst. Du stirbst durch...  (überrascht) meine Hand. 
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	AI_StopProcessInfos (self);
	};
	