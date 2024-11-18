//------------ ENDE -----------------
instance DIA_DIC_Feordwin_Exit (C_INFO)
	{
	npc = DIC_2068_Feordwin;
	nr = 999;
	condition = DIA_DIC_Feordwin_Exit_Condition;
	information = DIA_DIC_Feordwin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Feordwin_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Feordwin_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Was hat das zu bedeuten? -----------------
instance DIA_DIC_Feordwin_Bedeuten (C_INFO)
	{
	npc = DIC_2068_Feordwin;
	nr = 1;
	condition = DIA_DIC_Feordwin_Bedeuten_Condition;
	information = DIA_DIC_Feordwin_Bedeuten_Info;
	permanent = 0;
	important = 1;
	description = "Bedeuten";
	};

func int DIA_DIC_Feordwin_Bedeuten_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Amalric_Los))
		{
		return 1;
		};
	};

func void DIA_DIC_Feordwin_Bedeuten_Info ()
	{
	//AI_TurnToNpc (DIC_2068_Feordwin, DIC_2063_Amalric);
	//AI_TurnToNpc (DIC_2063_Amalric, DIC_2068_Feordwin);
	
	Npc_ExchangeRoutine(self,"STEHEN");
	AI_GotoNpc(self, hero);
	AI_GotoNpc(DIC_2063_Amalric, hero);	
	
	AI_Output (self, other, "DIA_DIC_Feordwin_Bedeuten_09_00"); //Was hat das zu bedeuten? Amalric! Antworte!
	};
	
//------------ Was hat das zu bedeuten? -----------------
instance DIA_DIC_Feordwin_Glaubst (C_INFO)
	{
	npc = DIC_2068_Feordwin;
	nr = 2;
	condition = DIA_DIC_Feordwin_Glaubst_Condition;
	information = DIA_DIC_Feordwin_Glaubst_Info;
	permanent = 0;
	important = 1;
	description = "Glaubst";
	};

func int DIA_DIC_Feordwin_Glaubst_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Amalric_FeordwinA))
		{
		return 1;
		};
	};

func void DIA_DIC_Feordwin_Glaubst_Info ()
	{
	
	AI_Output (self, other, "DIA_DIC_Feordwin_Bedeuten_09_02"); //Du Irrgläubiger. Glaubst du ich begreife nicht was hier vorgeht? Der Spitzbube da an deiner Seite: Merkst du denn nicht, das du unter einem schlechten Einfluss stehst. Nicht gegen mich solltest du dich wenden, sondern gegen diesen kleinen Bastard! 
	
	};