instance APTP_2013_CARL (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Carl";
	npctype		= 		NPCTYPE_FRIEND;
	guild =				GIL_NONE;      
	level 		=		30;
	flags 		=		0;
	voice 		=		3;
	id 		=		2213;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	50;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 		=	150;
	attribute[ATR_HITPOINTS] 		=	150;

	//------ Protection -------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]		=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]		=	80;
	protection	[PROT_FLY]		=	80;
	protection	[PROT_MAGIC]		=	50;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				69hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 109,  1, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem 	(self, ItMw_1h_Club_01);
	CreateInvItems (self, ItMiNugget,5);
	CreateInvItem  (self, Itfo_Potion_Water_01);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2213;

};

FUNC VOID Rtn_start_2213 ()
{
	TA_Sleep	(24,00,06,00,"BH_16");
	TA_Sleep	(06,00,24,00,"BH_16");	
//	TA_Intercept	(24,00,06,00,"PTP_20");
//	TA_Intercept	(06,00,24,00,"PTP_20");	  

};

FUNC VOID Rtn_runter_2213 ()
{
	TA_Stay	(24,00,06,00,"BH_00");
  	TA_Stay	(06,00,24,00,"BH_00");	 
};

func void Rtn_Follow_2213 ()
{
	TA_FollowPC	(23,00,16,00,"BH_00");
	TA_FollowPC	(16,00,23,00,"BH_00");
};
FUNC VOID Rtn_ende_2213 ()
{
	TA_Intercept	(24,00,06,00,"PTP_27");
  	TA_Intercept	(06,00,24,00,"PTP_27");	 
};
FUNC VOID Rtn_ende1_2213 ()
{
	TA_StandAround	(24,00,06,00,"PTP_CARL");
  	TA_StandAround	(06,00,24,00,"PTP_CARL");
};