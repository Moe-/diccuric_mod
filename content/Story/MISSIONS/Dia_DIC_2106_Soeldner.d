// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2106_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2106_Soeldner;
	nr			= 999;
	condition		= DIA_2106_Soeldner_EXIT_Condition;
	information		= DIA_2106_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2106_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2106_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				LASSMICHINRUHE!!
// *************************************************************************

INSTANCE DIA_2106_Soeldner_GoAway(C_INFO) 
{
	npc		= DIC_2106_Soeldner;
	nr		= 1;
	condition	= DIA_2106_Soeldner_GoAway_Condition;
	information	= DIA_2106_Soeldner_GoAway_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hi, wie geht's?";
}; 

FUNC INT DIA_2106_Soeldner_GoAway_Condition()
{
	return 1;
};

FUNC VOID DIA_2106_Soeldner_GoAway_Info()
{
	AI_Output (other, self, "DIA_2102_Soeldner_GoodSmell_15_00"); //Wie geht's?
	AI_Output (self, other, "DIA_2106_Soeldner_GoAway_13_01"); //Lass mich in Ruhe!
};