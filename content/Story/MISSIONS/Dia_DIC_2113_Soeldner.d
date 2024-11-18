// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2113_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2113_Soeldner;
	nr			= 999;
	condition		= DIA_2113_Soeldner_EXIT_Condition;
	information		= DIA_2113_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2113_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2113_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				WEISER KÄMPFER
// *************************************************************************

INSTANCE DIA_2113_Soeldner_WhiseFighter(C_INFO) 
{
	npc		= DIC_2113_Soeldner;
	nr		= 1;
	condition	= DIA_2113_Soeldner_WhiseFighter_Condition;
	information	= DIA_2113_Soeldner_WhiseFighter_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
}; 

FUNC INT DIA_2113_Soeldner_WhiseFighter_Condition()
{
	return 1;
};

FUNC VOID DIA_2113_Soeldner_WhiseFighter_Info()
{
	AI_Output (self, other, "DIA_2113_Soeldner_WhiseFighter_12_00"); //Denke daran, Berengar ist der weiseste unter den Weisen, und der größte Kämpfer unter den Kämpfern.
};