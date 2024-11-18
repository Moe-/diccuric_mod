// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2112_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2112_Soeldner;
	nr			= 999;
	condition		= DIA_2112_Soeldner_EXIT_Condition;
	information		= DIA_2112_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2112_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2112_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				(WETTER)LAGE!!
// *************************************************************************

INSTANCE DIA_2112_Soeldner_Weather(C_INFO) 
{
	npc		= DIC_2112_Soeldner;
	nr		= 1;
	condition	= DIA_2112_Soeldner_Weather_Condition;
	information	= DIA_2112_Soeldner_Weather_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wie ist die Lage?";
}; 

FUNC INT DIA_2112_Soeldner_Weather_Condition()
{
	return 1;
};

FUNC VOID DIA_2112_Soeldner_Weather_Info()
{
	AI_Output (other, self, "DIA_2107_Soeldner_WhatsUp_15_00"); //Wie ist die Lage?
	AI_Output (self, other, "DIA_2112_Soeldner_Weather_14_01"); //So wie es aussieht, zieht es sich zu. Die Wolken kündigen einen Wolkenbruch an. Und in meiner Hütte ist das Dach undicht. Verdammt.
};