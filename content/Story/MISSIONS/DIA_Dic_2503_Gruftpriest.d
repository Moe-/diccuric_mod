// *********************** Gruftpriester ***********************

INSTANCE Info_Dic_Gruftpriest (C_INFO)
{
	npc		= Dic_2503_Gruftpriest;
	nr		= 1;
	condition	= Info_Dic_Gruftpriest_Condition;
	information	= Info_Dic_Gruftpriest_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Dic_Gruftpriest_Condition()
{
	return TRUE;
};

FUNC VOID Info_Dic_Gruftpriest_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	
	AI_Output 		(self, other,"Info_HighPriest1_17_01"); //STEEERBLICHEEERRRR!!!!
	AI_Output 		(self, other,"Info_HighPriest1_17_02"); //DU WAAAGST ES, MEINE RUUHHE ZU ST÷÷÷REN!
	AI_Output 		(self, other,"Info_HighPriest1_17_03"); //BEREEEITE DIIICH AUF DAS EEEENDE VOOOR!
	//AI_Output 		(other, self,"Info_HighPriest1_15_04"); //Fragt sich, nur wessen Ende, du wurmzerfressener Fleischklops!
	

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);	
};

