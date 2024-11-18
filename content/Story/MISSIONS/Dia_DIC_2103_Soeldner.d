// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2103_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2103_Soeldner;
	nr			= 999;
	condition		= DIA_2103_Soeldner_EXIT_Condition;
	information		= DIA_2103_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2103_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2103_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// *************************************************************************
// 				BAUERN
// *************************************************************************

INSTANCE DIA_2103_Soeldner_GoBauer(C_INFO) 
{
	npc		= DIC_2103_Soeldner;
	nr		= 1;
	condition	= DIA_2103_Soeldner_GoBauer_Condition;
	information	= DIA_2103_Soeldner_GoBauer_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hallo!";
}; 

FUNC INT DIA_2103_Soeldner_GoBauer_Condition()
{
	return 1;
};

FUNC VOID DIA_2103_Soeldner_GoBauer_Info()
{
	AI_Output (other, self, "DIA_2103_Soeldner_GoBauer_15_00"); //Hallo!
	AI_Output (self, other, "DIA_2103_Soeldner_GoBauer_06_01"); //Wenn du nach Arbeit suchst, geh doch mal zu den Bauern. Das Korn steht gut, und wenn es dieses Jahr nicht verhagelt, gibt es eine Menge für dich zu tun. 
};