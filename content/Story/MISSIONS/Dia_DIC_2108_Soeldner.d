// **************************************************
//						EXIT 
// **************************************************
instance  DIA_2108_Soeldner_EXIT (C_INFO)
{
	npc			= DIC_2108_Soeldner;
	nr			= 999;
	condition		= DIA_2108_Soeldner_EXIT_Condition;
	information		= DIA_2108_Soeldner_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC INT DIA_2108_Soeldner_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_2108_Soeldner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// *************************************************************************
// 				DEIN JOB?
// *************************************************************************

INSTANCE DIA_2108_Soeldner_WhatJob(C_INFO) 
{
	npc		= DIC_2108_Soeldner;
	nr		= 1;
	condition	= DIA_2108_Soeldner_WhatJob_Condition;
	information	= DIA_2108_Soeldner_WhatJob_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Was machst du hier?";
}; 

FUNC INT DIA_2108_Soeldner_WhatJob_Condition()
{
	return 1;
};

FUNC VOID DIA_2108_Soeldner_WhatJob_Info()
{
	AI_Output (other, self, "DIA_2108_Soeldner_WhatJob_15_00"); //Was machst du hier?
	AI_Output (self, other, "DIA_2108_Soeldner_WhatJob_11_01"); //Das geht dich nichts an, mach dass du wegkommst.
};