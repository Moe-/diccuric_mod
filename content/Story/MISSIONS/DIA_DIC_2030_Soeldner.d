//------------ ENDE -----------------
instance DIA_DIC_2030_Soeldner_Exit (C_INFO)
	{
	npc = DIC_2030_Soeldner;
	nr = 999;
	condition = DIA_DIC_2030_Soeldner_Exit_Condition;
	information = DIA_DIC_2030_Soeldner_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};
	
func int DIA_DIC_2030_Soeldner_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_2030_Soeldner_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// ------------ Los komm! ----------------
instance DIA_DIC_2030_Soeldner_Komm (C_INFO)
	{
	npc = DIC_2030_Soeldner;
	nr = 2;
	condition = DIA_DIC_2030_Soeldner_Komm_Condition;
	information = DIA_DIC_2030_Soeldner_Komm_Info;
	permanent = 0;
	important = 1;
	description = "Los komm, Kleiner!";
	};
	
func int DIA_DIC_2030_Soeldner_Komm_Condition ()
	{
	if (Npc_KnowsInfo(other,DIA_DIC_Graveyarn_RepariertJa))
		{
		return 1;
		};
	};
	
func void DIA_DIC_2030_Soeldner_Komm_Info ()
	{
	AI_Output (self, other, "DIA_DIC_2030_Soeldner_Komm_05_00"); //Los komm, Kleiner! Und bleib hinter mir, sonst stirbst du noch...
	self.name = "Söldner";
	Wld_InsertNpc (Scavenger, "ZUM_REISFELD_04");
	Wld_InsertNpc (Scavenger, "ZUM_REISFELD_04");
	Wld_InsertNpc (Scavenger, "ZUM_REISFELD_04");
	Wld_InsertNpc (Scavenger, "ZUM_REISFELD_04");

	Npc_ExchangeRoutine	(DIC_2030_Soeldner,"WEITER");			// irgendwie klappt das nit self nicht wenn er anders heist
	AI_StopProcessInfos (DIC_2030_Soeldner);
	};
	
//------------ Hier sind wir -----------------
instance DIA_DIC_2030_Soeldner_Scavs (C_INFO)
	{
	npc = DIC_2030_Soeldner;
	nr = 2;
	condition = DIA_DIC_2030_Soeldner_Scavs_Condition;
	information = DIA_DIC_2030_Soeldner_Scavs_Info;
	permanent = 0;
	important = 1;
	description = "Hier sind wir!";
	};
	
func int DIA_DIC_2030_Soeldner_Scavs_Condition ()
	{
	if (Npc_GetDistToWP(self,"ZUM_REISFELD_04")<=300)
		{
		return 1;
		};
	};
	
func void DIA_DIC_2030_Soeldner_Scavs_Info ()
	{
	AI_Output (self, other, "DIA_DIC_2030_Soeldner_Scavs_05_00"); //Hier sind wir. Viel Spaß mit den Scavengern. Du findest mich dann wieder im Lager.

	B_LogEntry (ScavJagd, "Ein Söldner hat mich zu den Scavengern geführt. Jetzt muss ich sie nur noch erledigen und ausnehmen.");
	
	//self.name = "Söldner";
	
	Npc_ExchangeRoutine	(self,"START");
	AI_StopProcessInfos (self);
	};