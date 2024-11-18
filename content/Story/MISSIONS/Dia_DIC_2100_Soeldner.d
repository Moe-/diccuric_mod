// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2100_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2100_Soeldner;
	nr			= 999;
	condition		= DIA_2100_Soeldner_EXIT_Condition;
	information		= DIA_2100_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2100_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2100_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				ERZBROCKEN SCHLEPPEN
// *************************************************************************

INSTANCE DIA_2100_Soeldner_THXERZ(C_INFO) 
{
	npc		= DIC_2100_Soeldner;
	nr		= 1;
	condition	= DIA_2100_Soeldner_THXERZ_Condition;
	information	= DIA_2100_Soeldner_THXERZ_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
}; 

FUNC INT DIA_2100_Soeldner_THXERZ_Condition()
{
	return 1;
};

FUNC VOID DIA_2100_Soeldner_THXERZ_Info()
{
	AI_Output (self, other, "DIA_2100_Soeldner_THXERZ_14_00"); //Hey Bursche! Danke noch mal, dass du mir geholfen hast, die Erzbrocken zum Lagerhaus zu schleppen. Beim n‰chsten Mal muss ich dir ja nicht mehr helfen, du weiﬂt ja jetzt, wie es geht.
};