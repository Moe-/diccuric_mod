// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Carlorg_Exit (C_INFO)
{
	npc		= Aptp_2012_Carlorg;
	nr		= 999;
	condition	= DIA_Carlorg_Exit_Condition;
	information	= DIA_Carlorg_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC int  DIA_Carlorg_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Carlorg_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

instance  INFO_Carlorg_fight (C_INFO)
{
	npc		= Aptp_2012_Carlorg;
	nr		= 1;
	condition	= INFO_Carlorg_fight_Condition;
	information	= INFO_Carlorg_fight_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC int INFO_Carlorg_fight_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Gosslin_help))
	&& (Npc_GetDistToWP(Aptp_2013_Carl,"PTP_27")>500)
	{
	return 1;
	};
};

FUNC VOID  INFO_Carlorg_fight_Info()
{
	AI_DrawWeapon		(hero);
	AI_Output		(self, other,"Info_HighPriest5FAILED_17_02"); //NUUUUN WIIIIRST DUUUU STEEEERBEEEEEN!!!!!
	Npc_SetTrueGuild	(self,GIL_GOBBO);
	self.guild		= GIL_GOBBO;
	self.npctype 		= NPCTYPE_MAIN;
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	AI_StopProcessInfos	( self );
};
