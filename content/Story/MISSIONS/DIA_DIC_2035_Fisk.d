// ************************************************************
// 			  				   EXIT
// ************************************************************

INSTANCE DIA_DIC_Fisk_EXIT (C_INFO)
	{
	npc			= DIC_2035_Fisk;
	nr			= 999;
	condition	= DIA_DIC_Fisk_EXIT_Condition;
	information	= DIA_DIC_Fisk_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
	};

FUNC INT DIA_DIC_Fisk_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_Fisk_EXIT_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ---------------- Spieler frägt zwecks Händler ------------
instance DIA_DIC_Fisk_Haendler (C_INFO)
	{
	npc = DIC_2035_Fisk;
	nr = 1;
	condition = DIA_DIC_Fisk_Haendler_Condition;
	information = DIA_DIC_Fisk_Haendler_Info;
	permanent = 0;
	important = 0;
	description = "Du bist ein Händler?";
	};

func int DIA_DIC_Fisk_Haendler_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Homer_Haendler) && !(Npc_KnowsInfo(other, DIA_DIC_Fisk_Fell)))
		{
		return 1;
		};
	};

func void DIA_DIC_Fisk_Haendler_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Fisk_Haendler_15_00"); //Du bist ein Händler?
	AI_Output (self, other, "DIA_DIC_Fisk_Haendler_12_01"); //Ich war früher, als ich für Gomez gearbeitet habe, ein Händler. Aber inzwischen habe ich das aufgegeben...
	};

// --------------- Spieler hat Fell dabei ----------------
instance DIA_DIC_Fisk_Fell (C_INFO)
	{
	npc = DIC_2035_Fisk;
	nr = 2;
	condition = DIA_DIC_Fisk_Fell_Condition;
	information = DIA_DIC_Fisk_Fell_Info;
	permanent = 0;
	important = 1;
	description = "Hey, warte mal!";
	};

func int DIA_DIC_Fisk_Fell_Condition ()
	{
	if (Npc_HasItems(hero, ItAt_Wolf_01) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Fisk_Fell_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Fisk_Fell_12_00"); //Hey Ardaric, warte mal!
	AI_Output (other, self, "DIA_DIC_Fisk_Fell_15_01"); //Ja?
	AI_Output (self, other, "DIA_DIC_Fisk_Fell_12_02"); //Wie du vielleicht weißt, war ich früher mal ein Händler...nun ja, ich habe diesen Beruf nie ganz aufgegeben.
	AI_Output (self, other, "DIA_DIC_Fisk_Fell_12_03"); //Ich suche schon seit langem nach einem Wolfsfell, wie du es dabei hast. Schau doch mal, ob ich was zum tauschen habe, oder ob du es mir verkaufen willst!
	AI_Output (other, self, "DIA_DIC_Fisk_Fell_15_04"); //Und dann kann ich immer bei dir einkaufen?
	AI_Output (self, other, "DIA_DIC_Fisk_Fell_12_05"); //Ja?etzt weißt du ja, dass ich ein Händler bin. Du kannst natürlich jederzeit bei mir vorbeikommen!
	
	B_LogEntry (HandelsQuest, "Als ich mit dem Wolfsfell bei Fisk war, wollte er es unbedingt haben. Er ist also ein weiterer Händler.");
	B_LogEntry (BekanntePersonen, "Fisk ist ein weiterer Händler.");
	};

// ------------- Handeln ----------------
instance DIA_DIC_Fisk_Kaufen (C_INFO)
	{
	npc = DIC_2035_Fisk;
	nr = 3;
	condition = DIA_DIC_Fisk_Kaufen_Condition;
	information = DIA_DIC_Fisk_Kaufen_Info;
	permanent = 1;
	important = 0;
	trade = 1;
	description = "Zeig mir deine Ware.";
	};

func int DIA_DIC_Fisk_Kaufen_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Fisk_Fell))
		{
		return 1;
		};
	};

func void DIA_DIC_Fisk_Kaufen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Fisk_Kaufen_15_00"); //Zeig mir deine Ware.
	};