// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2102_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2102_Soeldner;
	nr			= 999;
	condition		= DIA_2102_Soeldner_EXIT_Condition;
	information		= DIA_2102_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2102_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2102_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				DUFT
// *************************************************************************

INSTANCE DIA_2102_Soeldner_GoodSmell(C_INFO) 
{
	npc		= DIC_2102_Soeldner;
	nr		= 1;
	condition	= DIA_2102_Soeldner_GoodSmell_Condition;
	information	= DIA_2102_Soeldner_GoodSmell_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wie geht's?";
}; 

FUNC INT DIA_2102_Soeldner_GoodSmell_Condition()
{
	return 1;
};

FUNC VOID DIA_2102_Soeldner_GoodSmell_Info()
{
	AI_Output (other, self, "DIA_2102_Soeldner_GoodSmell_15_00"); //Wie geht's?
	AI_Output (self, other, "DIA_2102_Soeldner_GoodSmell_05_01"); //Lass dir was gesagt sein! Wenn du in einer Stadt bist, achte auf den duftenden Geruch von abgesengten Borsten!
	AI_Output (self, other, "DIA_2102_Soeldner_GoodSmell_05_02"); //Das ist ein untrügliches Zeichen dafür, dass die ersten Schweine geschlachtet sind. Leider gibt's frisches Fleisch hier nur selten.
	AI_Output (self, other, "DIA_2102_Soeldner_GoodSmell_05_03"); //Selbst Eingepökeltes im Rauchfang habe ich hier nirgends gesehen. Aber was soll's! Ich bin ein Söldner und kein Feinschmecker. Und was erzähl ich dir das überhaupt?
};