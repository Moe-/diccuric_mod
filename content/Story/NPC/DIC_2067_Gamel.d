instance DIC_2067_Gamel (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Gamel";
	npctype 	= 	NPCTYPE_FRIEND;
	guild 		=	GIL_KdW;
	level 		=	12;
	voice 		=	13;
	id 			=	2067;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0 ,"Hum_Head_Bald", 9, 1, KDW_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		2);
	
	//-------- inventory --------
	//EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneWindfist);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2067;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2067 ()
	{
    TA_SitCampfire	  (15,00,22,00,"HOEHLE_004");
    TA_SitCampfire	  (22,00,15,00,"HOEHLE_004");	
	};
	
FUNC VOID Rtn_Amalric_2067 ()
	{
    TA_SmallTalk	  (15,00,22,00,"HOEHLE_020");
    TA_SmallTalk	  (22,00,15,00,"HOEHLE_020");	
	};
	
func void Rtn_Folge_2067 ()
	{
	TA_FollowPC		(15,00,22,00,"HOEHLE_020");
    TA_FollowPC	  	(22,00,15,00,"HOEHLE_020");	
    };
    
func void rtn_angriff_2067 ()
	{
	TA_AmalricAngreifen (15,00,22,00,"HOEHLE_008");
	TA_AmalricAngreifen (22,00,15,00,"HOEHLE_008");
	};
    
// --------------- Double ----------------
instance DIC_2080_Gamel (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Gamel";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_KdW;
	level 		=	12;
	voice 		=	13;
	id 			=	2080;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0 ,"Hum_Head_Bald", 9, 1, KDW_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		2);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneWindfist);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2080;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_ende_2080 ()
	{
    TA_SitCampfire	  (15,00,22,00,"GRAB01_00");
    TA_SitCampfire	  (22,00,15,00,"GRAB01_00");	
	};
	
func void Rtn_start_2080 ()
	{
	TA_FollowPC		(15,00,22,00,"ZUR_H06_34");
    TA_FollowPC	  	(22,00,15,00,"ZUR_H06_34");	
    };
    
