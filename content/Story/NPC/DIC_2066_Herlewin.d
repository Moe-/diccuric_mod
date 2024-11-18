instance DIC_2066_Herlewin (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Herlewin";
	npctype 	= 	NPCTYPE_FRIEND;
	guild 		=	GIL_KdW;
	level 		=	12;
	voice 		=	12;
	id 			=	2066;
	flags			= NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	30;
	attribute[ATR_DEXTERITY] 			= 	20;
	attribute[ATR_MANA_MAX] 			= 	50;
	attribute[ATR_MANA] 				= 	50;
	attribute[ATR_HITPOINTS_MAX]		= 	120;
	attribute[ATR_HITPOINTS] 			= 	100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald", 5, 1, KDW_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		3);
	
	//-------- inventory --------
	//EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneIceCube);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2066;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2066 ()
	{
    TA_PotionAlchemy	  (15,00,22,00,"HOEHLE_037");
    TA_SmallTalk	 	 (22,00,15,00,"HOEHLE_018");	
	};
	
FUNC VOID Rtn_Amalric_2066 ()
	{
    TA_SmallTalk	  (15,00,22,00,"HOEHLE_020");
    TA_SmallTalk	  (22,00,15,00,"HOEHLE_020");	
	};
	
func void Rtn_Folge_2066 ()
	{
	TA_FollowPC		(15,00,22,00,"HOEHLE_020");
    TA_FollowPC	  	(22,00,15,00,"HOEHLE_020");	
    };
    
func void rtn_angriff_2066 ()
	{
	TA_AmalricAngreifen (15,00,22,00,"HOEHLE_008");
	TA_AmalricAngreifen (22,00,15,00,"HOEHLE_008");
	};
    
// ------------- Double ----------
instance DIC_2079_Herlewin (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Herlewin";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_KdW;
	level 		=	12;
	voice 		=	12;
	id 			=	2079;
	flags			= NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	30;
	attribute[ATR_DEXTERITY] 			= 	20;
	attribute[ATR_MANA_MAX] 			= 	50;
	attribute[ATR_MANA] 				= 	50;
	attribute[ATR_HITPOINTS_MAX]		= 	120;
	attribute[ATR_HITPOINTS] 			= 	100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald", 5, 1, KDW_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		3);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneIceCube);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2079;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_ende_2079 ()
	{
    TA_SitCampfire	  (15,00,22,00,"GRAB01_00");
    TA_SitCampfire	  (22,00,15,00,"GRAB01_00");	
	};
	
func void Rtn_start_2079 ()
	{
	TA_FollowPC		(15,00,22,00,"ZUR_H06_34");
    TA_FollowPC	  	(22,00,15,00,"ZUR_H06_34");	
    };