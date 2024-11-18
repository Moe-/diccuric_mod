// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2109_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2109_Soeldner;
	nr			= 999;
	condition		= DIA_2109_Soeldner_EXIT_Condition;
	information		= DIA_2109_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2109_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2109_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				WER IST DER BOSS?!
// *************************************************************************

INSTANCE DIA_2109_Soeldner_WhoBoss(C_INFO) 
{
	npc		= DIC_2109_Soeldner;
	nr		= 1;
	condition	= DIA_2109_Soeldner_WhoBoss_Condition;
	information	= DIA_2109_Soeldner_WhoBoss_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wer hat hier das Sagen?";
}; 

FUNC INT DIA_2109_Soeldner_WhoBoss_Condition()
{
	return 1;
};

FUNC VOID DIA_2109_Soeldner_WhoBoss_Info()
{
	AI_Output (other, self, "Info_grd_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_2109_Soeldner_WhoBoss_08_01"); //Berengar, unser König.
};