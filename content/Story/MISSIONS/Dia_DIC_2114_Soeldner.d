// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2114_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2114_Soeldner;
	nr			= 999;
	condition		= DIA_2114_Soeldner_EXIT_Condition;
	information		= DIA_2114_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2114_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2114_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				BETTERLIFE GmBH
// *************************************************************************

INSTANCE DIA_2114_Soeldner_BetterLife(C_INFO) 
{
	npc		= DIC_2114_Soeldner;
	nr		= 1;
	condition	= DIA_2114_Soeldner_BetterLife_Condition;
	information	= DIA_2114_Soeldner_BetterLife_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
}; 

FUNC INT DIA_2114_Soeldner_BetterLife_Condition()
{
	return 1;
};

FUNC VOID DIA_2114_Soeldner_BetterLife_Info()
{
	AI_Output(self,other,"Info_Stt_4_Leben_02_04"); //Schwerter werden geschmiedet, Bögen gebaut, Pfeile hergestellt, Katapulte zusammengehämmert. Kriegsvorbereitungen sind eben keine Kleinigkeit.
};