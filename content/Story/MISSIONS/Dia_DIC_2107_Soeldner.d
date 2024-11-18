// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2107_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2107_Soeldner;
	nr			= 999;
	condition		= DIA_2107_Soeldner_EXIT_Condition;
	information		= DIA_2107_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2107_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2107_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				DIE LAGE
// *************************************************************************

INSTANCE DIA_2107_Soeldner_WhatsUp(C_INFO) 
{
	npc		= DIC_2107_Soeldner;
	nr		= 1;
	condition	= DIA_2107_Soeldner_WhatsUp_Condition;
	information	= DIA_2107_Soeldner_WhatsUp_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wie ist die Lage?";
}; 

FUNC INT DIA_2107_Soeldner_WhatsUp_Condition()
{
	return 1;
};

FUNC VOID DIA_2107_Soeldner_WhatsUp_Info()
{
	AI_Output (other, self, "DIA_2107_Soeldner_WhatsUp_15_00"); //Wie ist die Lage?
	AI_Output (self, other, "DIA_2107_Soeldner_WhatsUp_14_01"); //Im Dorf und in der Burg ist alles ruhig. Nur die Wolfsrudel machen uns zu schaffen...
};