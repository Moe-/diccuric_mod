//------------ ENDE -----------------
instance DIA_DIC_2024_Torwache_Exit (C_INFO)
	{
	npc = DIC_2024_Torwache;
	nr = 999;
	condition = DIA_DIC_2024_Torwache_Exit_Condition;
	information = DIA_DIC_2024_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2024_Torwache_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2024_Torwache_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// -------------- Warnung vor Woelfen ----------------
instance DIA_DIC_Torwache_Woelfe (C_INFO)
	{
	npc = DIC_2024_Torwache;
	nr = 1;
	condition = DIA_DIC_Torwache_Woelfe_Condition;
	information = DIA_DIC_Torwache_Woelfe_Info;
	important = 1;
	permanent = 0;
	description = "Achtung Wölfe!";
	};

func int DIA_DIC_Torwache_Woelfe_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Torwache_Woelfe_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Torwache_Woelfe_04_00"); //Hey, pass auf!
	AI_Output (other, self, "DIA_DIC_Torwache_Woelfe_15_01"); //Was ist denn los?
	AI_Output (self, other, "DIA_DIC_Torwache_Woelfe_04_02"); //Schau! Die Wölfe da vorne versammeln sich...ich fürchte, dass sie bald angreifen!
	
	TagHinterTorAngriff = Wld_GetDay();
	
	//Npc_SetStateTime (self, 0);

	//AI_Output (self, other, "DIA_DIC_Torwache_Woelfe_04_03"); //ALARM!!!

	//AI_StartState(Wolf_HT, ZS_HTAngriff, 0, "");
	//AI_GotoWP (DIC_2003_Alwin, "STADT_PATH02_02");
	//AI_GotoWP (DIC_2004_Raffa, "STADT_PATH02_02");
	//AI_GotoWP (DIC_2008_Pyt, "STADT_PATH02_02");
	//AI_GotoWP (DIC_2010_Gabb, "STADT_PATH02_02");
	};

// -------------- Woelfe abgewehrt -------------------
instance DIA_DIC_Torwache_Gewonnen (C_INFO)
	{
	npc = DIC_2024_Torwache;
	nr = 2;
	condition = DIA_DIC_Torwache_Gewonnen_Condition;
	information = DIA_DIC_Torwache_Gewonnen_Info;
	important = 1;
	permanent = 0;
	description = "Achtung Wölfe!";
	};

func int DIA_DIC_Torwache_Gewonnen_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Torwache_Woelfe) && Npc_IsDead(Wolf_HT))
		{
		return 1;
		};
	};

func void DIA_DIC_Torwache_Gewonnen_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Torwache_Gewonnen_04_00"); //Ahh. Wir konnten die Wölfe abwehren.
	AI_Output (other, self, "DIA_DIC_Torwache_Gewonnen_15_01"); //Passiert sowas hier öfters?
	AI_Output (self, other, "DIA_DIC_Torwache_Gewonnen_04_02"); //Täglich. Aber gewöhnen tut man sich nie an diese Angriffe. Keine Ahnung, warum die Wölfe ständig angreifen.
	AI_Output (self, other, "DIA_DIC_Torwache_Gewonnen_04_03"); //Unsere Aufgabe ist es, die Wölfe nicht ins Lager zu lassen, wo sie nur Chaos und Angst verursachen würden.
	};