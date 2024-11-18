// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_DIC_Harlok_Exit (C_INFO)
	{
	npc			= DIC_2083_Harlok;
	nr			= 999;
	condition	= DIA_DIC_Harlok_Exit_Condition;
	information	= DIA_DIC_Harlok_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
	};

FUNC INT DIA_DIC_Harlok_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_Harlok_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};
	
// ****************************************
var int Harlok_Merke_STR;
var int Harlok_Merke_DEX;
	
INSTANCE DIA_DIC_Harlok_Lernen (C_INFO)
	{
	npc			= DIC_2083_Harlok;
	nr			= 1;
	condition	= DIA_DIC_Harlok_Lernen_Condition;
	information	= DIA_DIC_Harlok_Lernen_Info;
	permanent	= 1;
	description = "Kannst du mir was beibringen?";
	};

FUNC INT DIA_DIC_Harlok_Lernen_Condition()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Verwalter_Lernen))
			{
			return 1;
			};
	};

FUNC VOID DIA_DIC_Harlok_Lernen_Info()
	{	
	AI_Output (other, self,"DIA_DIC_2050_Jaeger_Lernen_15_00"); //Kannst du mir was beibringen?
	
	Log_CreateTopic (BekanntePersonen, LOG_MISSION);
	Log_SetTopicStatus (BekanntePersonen, LOG_OBSOLETE);
	B_LogEntry(BekanntePersonen, "Harlok - Er kann mir helfen, geschickter und stärker zu werden.");
	
	Harlok_Merke_STR = hero.attribute[ATR_STRENGTH];
	Harlok_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Ja. Bei mir kannst du lernen, deine Geschicklichkeit zu verbessern oder deine Kampfkraft zu steigern.
	
	Info_ClearChoices	(DIA_DIC_Harlok_Lernen);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,DIALOG_BACK									,DIA_DIC_Harlok_Lernen_BACK);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_1);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_1);
	
	
};

func void DIA_DIC_Harlok_Lernen_BACK()
{
	if (Harlok_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Deine Kampfkraft ist um einiges gestiegen.
	};
	if (Harlok_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Dein Geschick im Umgang mit Bögen und Armbrüsten ist schon besser geworden.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Komm bald wieder - es gibt viel zu lernen!
	Info_ClearChoices	(DIA_DIC_Harlok_Lernen);
};

func void DIA_DIC_Harlok_Lernen_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(DIA_DIC_Harlok_Lernen);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,DIALOG_BACK									,DIA_DIC_Harlok_Lernen_BACK);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_1);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_1);
};

func void DIA_DIC_Harlok_Lernen_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(DIA_DIC_Harlok_Lernen);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,DIALOG_BACK									,DIA_DIC_Harlok_Lernen_BACK);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_1);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_1);
};

func void DIA_DIC_Harlok_Lernen_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(DIA_DIC_Harlok_Lernen);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,DIALOG_BACK									,DIA_DIC_Harlok_Lernen_BACK);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_1);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_1);
};

func void DIA_DIC_Harlok_Lernen_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(DIA_DIC_Harlok_Lernen);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,DIALOG_BACK									,DIA_DIC_Harlok_Lernen_BACK);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_DIC_Harlok_Lernen_STR_1);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_5);
	Info_AddChoice		(DIA_DIC_Harlok_Lernen,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),DIA_DIC_Harlok_Lernen_DEX_1);
};