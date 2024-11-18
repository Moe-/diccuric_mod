
// **************************************************
//						EXIT 
// **************************************************
instance  DIA_Grd_2004_EXIT (C_INFO)
{
	npc			= AT_2004_Gardist;
	nr			= 999;
	condition		= DIA_Grd_2004_EXIT_Condition;
	information		= DIA_Grd_2004_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Grd_2004_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Grd_2004_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Dem Ziel entgegen!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Der Schläfer möge dich behüten!
	};
	AI_PlayAni		(hero,	"T_SALUT");
	AI_PlayAni		(self,	"T_SALUT");	
	AI_StopProcessInfos	( self );
};
// ***************************** 
//	Test ani 
// *****************************

instance DIA_Grd_2004_TEST (C_INFO)
{
	npc			= AT_2004_Gardist;
	nr			= 1;
	condition		= DIA_Grd_2004_TEST_Condition;
	information		= DIA_Grd_2004_TEST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeig mir die Animationen ..."; 
};
                      

FUNC int DIA_Grd_2004_TEST_CONDITION()
{
	return 1;
};

func void DIA_Grd_2004_TEST_INFO()
{
	AI_PlayAni			(hero,	"T_SALUT");
	AI_PlayAni			(self,	"T_SALUT");


	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Zeig mir die Animation ...


	Info_ClearChoices (DIA_Grd_2004_TEST);

	Info_Addchoice (DIA_Grd_2004_TEST,"äm, nee doch nicht", DIA_Grd_2004_TEST_End);
	Info_Addchoice (DIA_Grd_2004_TEST,"t_Run_2_RunL", DIA_Grd_2004_TEST_001);
	Info_Addchoice (DIA_Grd_2004_TEST,"s_RunL",DIA_Grd_2004_TEST_002);


};


func void DIA_Grd_2004_TEST_001()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_TEST);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_RUN_2_RUNL");
};

func void DIA_Grd_2004_TEST_002()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_TEST);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(other,	"S_RUNL");
};

func void DIA_Grd_2004_TEST_END()
{
	Info_ClearChoices 	(DIA_Grd_2004_TEST);
};

// ***************************** 
//	Kampf ani 
// *****************************

instance DIA_Grd_2004_KAMPF (C_INFO)
{
	npc			= AT_2004_Gardist;
	nr			= 2;
	condition		= DIA_Grd_2004_KAMPF_Condition;
	information		= DIA_Grd_2004_KAMPF_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeig mir die Kampf Animationen"; 
};
FUNC int DIA_Grd_2004_KAMPF_CONDITION()
{
	return 1;
};

func void DIA_Grd_2004_KAMPF_INFO()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Zeig mir die Animation ...


	Info_ClearChoices (DIA_Grd_2004_KAMPF);

	Info_Addchoice (DIA_Grd_2004_KAMPF,"äm, nee doch nicht", DIA_Grd_2004_KAMPF_End);
	Info_Addchoice (DIA_Grd_2004_KAMPF,"t_Run_2_Fist", DIA_Grd_2004_KAMPF_001);
	Info_Addchoice (DIA_Grd_2004_KAMPF,"s_Fist", DIA_Grd_2004_KAMPF_002);
	Info_Addchoice (DIA_Grd_2004_KAMPF,"t_Fist_2_FistRun", DIA_Grd_2004_KAMPF_003);
	Info_Addchoice (DIA_Grd_2004_KAMPF,"t_FistRun_2_Fist", DIA_Grd_2004_KAMPF_004);
	Info_Addchoice (DIA_Grd_2004_KAMPF,"t_Move_2_FistMove", DIA_Grd_2004_KAMPF_005);
	Info_Addchoice (DIA_Grd_2004_KAMPF,"t_FistMove_2_Move", DIA_Grd_2004_KAMPF_006);
};
func void DIA_Grd_2004_KAMPF_001()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_RUN_2_FIST");
};
func void DIA_Grd_2004_KAMPF_002()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(other,	"S_FIST");
};
func void DIA_Grd_2004_KAMPF_003()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_FIST_2_FISTRUN");
};
func void DIA_Grd_2004_KAMPF_004()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_FISTRUN_2_FIST");
};
func void DIA_Grd_2004_KAMPF_005()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_MOVE_2_FISTMOVE");
};
func void DIA_Grd_2004_KAMPF_006()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_FISTMOVE_2_MOVE");
};

func void DIA_Grd_2004_KAMPF_END()
{
	Info_ClearChoices 	(DIA_Grd_2004_KAMPF);
};
// ***************************** 
//	Fass ani 
// *****************************

instance DIA_Grd_2004_FASS (C_INFO)
{
	npc			= AT_2004_Gardist;
	nr			= 3;
	condition		= DIA_Grd_2004_FASS_Condition;
	information		= DIA_Grd_2004_FASS_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeig mir die Fass Animationen"; 
};
FUNC int DIA_Grd_2004_FASS_CONDITION()
{
	return 1;
};

func void DIA_Grd_2004_FASS_INFO()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Zeig mir die Animation ...


	Info_ClearChoices (DIA_Grd_2004_FASS);

	Info_Addchoice (DIA_Grd_2004_FASS,"äm, nee doch nicht", DIA_Grd_2004_FASS_End);
	Info_Addchoice (DIA_Grd_2004_FASS,"t_BarrelO_Stand_2_S0", DIA_Grd_2004_FASS_001);
	Info_Addchoice (DIA_Grd_2004_FASS,"s_BarrelO_S0", DIA_Grd_2004_FASS_002);
	Info_Addchoice (DIA_Grd_2004_FASS,"t_BarrelO_S0_2_S1", DIA_Grd_2004_FASS_003);
	Info_Addchoice (DIA_Grd_2004_FASS,"s_BarrelO_S1", DIA_Grd_2004_FASS_004);
};

func void DIA_Grd_2004_FASS_001()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_FASS);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_BARRELO_STAND_2_S0");
};
func void DIA_Grd_2004_FASS_002()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_FASS);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(other,	"S_BARRELO_S0");
};
func void DIA_Grd_2004_FASS_003()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_FASS);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_BARRELO_S0_2_S1");
};
func void DIA_Grd_2004_FASS_004()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_FASS);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(other,	"S_BARRELO_S1");
};

func void DIA_Grd_2004_FASS_END()
{
	Info_ClearChoices 	(DIA_Grd_2004_FASS);
};


// ***************************** 
//	Magic ani 
// *****************************

instance DIA_Grd_2004_Magic (C_INFO)
{
	npc			= AT_2004_Gardist;
	nr			= 4;
	condition		= DIA_Grd_2004_Magic_Condition;
	information		= DIA_Grd_2004_Magic_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeig mir die Magic Animationen"; 
};
FUNC int DIA_Grd_2004_Magic_CONDITION()
{
	return 1;
};

func void DIA_Grd_2004_Magic_INFO()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Zeig mir die Animation ...


	Info_ClearChoices (DIA_Grd_2004_Magic);

	Info_Addchoice (DIA_Grd_2004_Magic,"äm, nee doch nicht", DIA_Grd_2004_Magic_End);
	Info_Addchoice (DIA_Grd_2004_Magic,"t_practiceMagic", DIA_Grd_2004_Magic_001);
	Info_Addchoice (DIA_Grd_2004_Magic,"t_practiceMagic2", DIA_Grd_2004_Magic_002);
	Info_Addchoice (DIA_Grd_2004_Magic,"t_practiceMagic3", DIA_Grd_2004_Magic_003);
	Info_Addchoice (DIA_Grd_2004_Magic,"t_practiceMagic4", DIA_Grd_2004_Magic_004);
	Info_Addchoice (DIA_Grd_2004_Magic,"t_practiceMagic5", DIA_Grd_2004_Magic_005);

};

func void DIA_Grd_2004_Magic_001()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_Magic);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_PRACTICEMAGIC");
};
func void DIA_Grd_2004_Magic_002()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_Magic);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_PRACTICEMAGIC2");
};
func void DIA_Grd_2004_Magic_003()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_Magic);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_PRACTICEMAGIC3");
};
func void DIA_Grd_2004_Magic_004()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_Magic);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_PRACTICEMAGIC4");
};
func void DIA_Grd_2004_Magic_005()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(DIA_Grd_2004_Magic);
	AI_StopProcessInfos	(self);
	AI_PlayAni		(self,	"T_PRACTICEMAGIC5");
};
func void DIA_Grd_2004_Magic_END()
{
	Info_ClearChoices 	(DIA_Grd_2004_Magic);
};

