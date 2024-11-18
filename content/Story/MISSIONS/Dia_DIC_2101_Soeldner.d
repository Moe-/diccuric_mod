// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2101_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2101_Soeldner;
	nr			= 999;
	condition		= DIA_2101_Soeldner_EXIT_Condition;
	information		= DIA_2101_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2101_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2101_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				WASSER
// *************************************************************************

INSTANCE DIA_2101_Soeldner_HolWasser(C_INFO) 
{
	npc		= DIC_2101_Soeldner;
	nr		= 1;
	condition	= DIA_2101_Soeldner_HolWasser_Condition;
	information	= DIA_2101_Soeldner_HolWasser_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
}; 

FUNC INT DIA_2101_Soeldner_HolWasser_Condition()
{
	return 1;
};

FUNC VOID DIA_2101_Soeldner_HolWasser_Info()
{
	AI_Output (self, other, "DIA_2101_Soeldner_HolWasser_13_00"); //Hey Junge, hol mir mal einen Eimer Wasser.
	AI_Output (other, self, "DIA_2101_Soeldner_HolWasser_15_01"); //Selbst wenn du dich damit waschen würdest, werde ich es nicht tun.
	AI_Output (self, other, "DIA_2101_Soeldner_HolWasser_13_02"); //Werd nicht frech, Kleiner, sonst langt's eine.
};


	