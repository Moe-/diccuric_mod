// ************************************************************
// 			  				   EXIT
// ************************************************************

INSTANCE DIA_DIC_Saturas_EXIT (C_INFO)
	{
	npc			= DIC_2036_Saturas;
	nr			= 999;
	condition	= DIA_DIC_Saturas_EXIT_Condition;
	information	= DIA_DIC_Saturas_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
	};

FUNC INT DIA_DIC_Saturas_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_Saturas_EXIT_Info()
	{
	AI_StopProcessInfos	(self);
	};

// -------------- Spieler hat Crawlerei dabei ----------------
INSTANCE DIA_DIC_Saturas_Crawlerei (C_INFO)
	{
	npc			= DIC_2036_Saturas;
	nr			= 1;
	condition	= DIA_DIC_Saturas_Crawlerei_Condition;
	information	= DIA_DIC_Saturas_Crawlerei_Info;
	permanent	= 0;
	important = 1;
	description = "Wo hast du das Crawlerei her?";
	};

FUNC INT DIA_DIC_Saturas_Crawlerei_Condition()
	{
	if (Npc_HasItems(other, Crawlerei) >= 1)
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Saturas_Crawlerei_Info()
	{
	AI_Output (self, other, "DIA_DIC_Saturas_Crawlerei_14_00"); //Wo hast du das Crawlerei her?
	AI_Output (other, self, "DIA_DIC_Saturas_Crawlerei_15_01"); //Ich habe es bei einem Händler gekauft.
	AI_Output (self, other, "DIA_DIC_Saturas_Crawlerei_14_02"); //Verkaufst du es mir?
	
	B_LogEntry (HandelsQuest, "Faris wollte mein Crawlerei kaufen.");
	B_LogEntry (BekanntePersonen, "Faris ist noch ein Händler.");
	};

// -------------- Handeln ----------------
INSTANCE DIA_DIC_Saturas_Handeln (C_INFO)
	{
	npc			= DIC_2036_Saturas;
	nr			= 2;
	condition	= DIA_DIC_Saturas_Handeln_Condition;
	information	= DIA_DIC_Saturas_Handeln_Info;
	permanent	= 1;
	important = 0;
	trade = 1;
	description = "Lass uns handeln!";
	};

FUNC INT DIA_DIC_Saturas_Handeln_Condition()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Saturas_Crawlerei))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Saturas_Handeln_Info()
	{
	AI_Output (other, self, "DIA_DIC_Saturas_Handeln_15_00"); //Lass uns handeln!
	};