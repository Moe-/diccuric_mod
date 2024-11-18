//------------ ENDE -----------------
instance DIA_DIC_Masci_Exit (C_INFO)
	{
	npc = DIC_2062_Masci;
	nr = 999;
	condition = DIA_DIC_Masci_Exit_Condition;
	information = DIA_DIC_Masci_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Masci_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Masci_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Neutral -----------------
instance DIA_DIC_Masci_Neutral (C_INFO)
	{
	npc = DIC_2062_Masci;
	nr = 1;
	condition = DIA_DIC_Masci_Neutral_Condition;
	information = DIA_DIC_Masci_Neutral_Info;
	permanent = 0;
	important = 1;
	description = "Bleibe Neutral";
	};

func int DIA_DIC_Masci_Neutral_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))
		{
		return 1;
		};
	};

func void DIA_DIC_Masci_Neutral_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Masci_Neutral_07_00"); //liber, liber-a, liber-um, liber-i, liber-ae, liber-a, liber-i, liber-ae, liber-i, liber-orum, liber-arum, liber-orum
	
	AI_StopProcessInfos (self);
	};
	