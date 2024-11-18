instance APTP_2011_GOSSLIN (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Gosslin";
	npctype		= 	NPCTYPE_FRIEND;
	guild 		=	GIL_NOV;
	level 		=	30;
	voice 		=	11;
	id 		=	2211;
	flags		=	NPC_FLAG_IMMORTAL;	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	8;
	attribute[ATR_MANA] 			=	8;
	attribute[ATR_HITPOINTS_MAX] 		=	108;
	attribute[ATR_HITPOINTS] 		=	108;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 31 ,  2, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;


	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
//	CreateInvItem (self, ItMw_2H_Staff_02);	
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2211;
};

FUNC VOID Rtn_start_2211 ()
{
	TA_SitAround	(08,00,10,00,"PTP_04");
	TA_SitAround	(10,00,08,00,"PTP_04");	
};

FUNC VOID Rtn_Carl_2211 ()
{
	TA_FollowPC	(08,00,10,00,"PTP_27");
	TA_FollowPC	(10,00,08,00,"PTP_27");	
};

FUNC VOID Rtn_WAIT_2211 ()
{
	TA_StandAround	(08,00,10,00,"PTP_04");
	TA_StandAround	(10,00,08,00,"PTP_04");	

};