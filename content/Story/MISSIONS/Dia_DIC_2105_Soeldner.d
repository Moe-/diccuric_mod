// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2105_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2105_Soeldner;
	nr			= 999;
	condition		= DIA_2105_Soeldner_EXIT_Condition;
	information		= DIA_2105_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2105_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2105_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				KAMPF FÜR DAS RECHT
// *************************************************************************

INSTANCE DIA_2105_Soeldner_FightRight(C_INFO) 
{
	npc		= DIC_2105_Soeldner;
	nr		= 1;
	condition	= DIA_2105_Soeldner_FightRight_Condition;
	information	= DIA_2105_Soeldner_FightRight_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hallo!";
}; 

FUNC INT DIA_2105_Soeldner_FightRight_Condition()
{
	return 1;
};

FUNC VOID DIA_2105_Soeldner_FightRight_Info()
{
	AI_Output (other, self, "DIA_2105_Soeldner_FightRight_15_00"); //Hallo!
	AI_Output (self, other, "DIA_2105_Soeldner_FightRight_10_01"); //Merk dir eines! Wir kämpfen für das Recht! Der der sich König nennt, ist ein Halunke: Mit welchen Mitteln er sich den Thron unter den Nagel riss, will ich hier nicht laut aussprechen.
};