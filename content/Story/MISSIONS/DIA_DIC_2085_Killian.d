//*****************************************************************
//						EXIT							
//*****************************************************************

instance  DIC_2085_Killian_Exit (C_INFO)
{
	npc			=  DIC_2085_Killian;
	nr			=  999;
	condition	=  DIC_2085_Killian_Exit_Condition;
	information	=  DIC_2085_Killian_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "ENDE";
};                       

FUNC int  DIC_2085_Killian_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIC_2085_Killian_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*****************************************************************
//						Verpiﬂ dich								
//*****************************************************************

instance  DIC_2085_Killian_GetLost (C_INFO)
{
	npc			=  DIC_2085_Killian;
	nr			=  1;
	condition	=  DIC_2085_Killian_GetLost_Condition;
	information	=  DIC_2085_Killian_GetLost_Info;
	permanent	=  1;
	important 	= 1;
};                       

FUNC int  DIC_2085_Killian_GetLost_Condition()
{
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID  DIC_2085_Killian_GetLost_Info()
{
	AI_Output (self, other,"Org_861_Killian_GetLost_Info_13_00"); //Verpiss dich!
	AI_StopProcessInfos	( self );
};