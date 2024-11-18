// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2111_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2111_Soeldner;
	nr			= 999;
	condition		= DIA_2111_Soeldner_EXIT_Condition;
	information		= DIA_2111_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2111_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2111_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				DU HIER?!
// *************************************************************************

INSTANCE DIA_2111_Soeldner_WhyHere(C_INFO) 
{
	npc		= DIC_2111_Soeldner;
	nr		= 1;
	condition	= DIA_2111_Soeldner_WhyHere_Condition;
	information	= DIA_2111_Soeldner_WhyHere_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hallo. Warum bist du hier im Lager?";
}; 

FUNC INT DIA_2111_Soeldner_WhyHere_Condition()
{
	return 1;
};

FUNC VOID DIA_2111_Soeldner_WhyHere_Info()
{
	AI_Output (other, self, "DIA_2111_Soeldner_WhyHere_15_00"); //Hallo. Warum bist du hier im Lager?
	AI_Output (self, other, "DIA_2111_Soeldner_WhyHere_14_01"); //Der König von Gatyah hat mich schlecht behandelt. Und außerdem hatte ich es satt, ein Dieb zu sein.
};