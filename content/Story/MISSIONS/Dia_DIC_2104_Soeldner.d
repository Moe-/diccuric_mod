// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2104_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2104_Soeldner;
	nr			= 999;
	condition		= DIA_2104_Soeldner_EXIT_Condition;
	information		= DIA_2104_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2104_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2104_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				HIERBLEIBEN UND MITMISCHEN!
// *************************************************************************

INSTANCE DIA_2104_Soeldner_StayHere(C_INFO) 
{
	npc		= DIC_2104_Soeldner;
	nr		= 1;
	condition	= DIA_2104_Soeldner_StayHere_Condition;
	information	= DIA_2104_Soeldner_StayHere_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
}; 

FUNC INT DIA_2104_Soeldner_StayHere_Condition()
{
	return 1;
};

FUNC VOID DIA_2104_Soeldner_StayHere_Info()
{
	AI_Output (self, other, "DIA_2104_Soeldner_StayHere_08_00"); //Du tust gut daran, hier bei uns mitzumischen. Mein Kumpel ist nicht mitgekommen. Er hätte es hier weitgebracht. Was für ein Idiot!
};