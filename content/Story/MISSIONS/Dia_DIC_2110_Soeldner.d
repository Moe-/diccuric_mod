// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2110_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2110_Soeldner;
	nr			= 999;
	condition		= DIA_2110_Soeldner_EXIT_Condition;
	information		= DIA_2110_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2110_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2110_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				NEWS!!
// *************************************************************************

INSTANCE DIA_2110_Soeldner_SomeNews(C_INFO) 
{
	npc		= DIC_2110_Soeldner;
	nr		= 1;
	condition	= DIA_2110_Soeldner_SomeNews_Condition;
	information	= DIA_2110_Soeldner_SomeNews_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Na, gibt's was neues?";
}; 

FUNC INT DIA_2110_Soeldner_SomeNews_Condition()
{
	return 1;
};

FUNC VOID DIA_2110_Soeldner_SomeNews_Info()
{
	AI_Output (other, self, "DIA_2110_Soeldner_SomeNews_15_00"); //Na, gibt's was neues?
	AI_Output (self, other, "DIA_2110_Soeldner_SomeNews_10_01"); //Ha, Jüngling! Kennen wir uns? Du siehst aus, als würdest du schon weiche Knie kriegen, wenn du ein Wildschwein erlegen sollst. Was willst du dann hier?
	AI_Output (self, other, "DIA_2110_Soeldner_SomeNews_10_02"); //Uns steht eine Schlacht bevor. Ich sag dir eins: Wenn man stirbt, wen kümmert's? In der nächsten Welt geht's weiter.
};