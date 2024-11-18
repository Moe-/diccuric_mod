instance DIC_2063_Amalric (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Amalric";
	npctype 	= 	NPCTYPE_FRIEND;
	guild 		=	GIL_KdW;
	level 		=	18;
	voice 		=	8;
	id 			=	2063;
	flags			= NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	40;
	attribute[ATR_DEXTERITY] 			= 	30;
	attribute[ATR_MANA_MAX] 			= 	60;
	attribute[ATR_MANA] 				= 	60;
	attribute[ATR_HITPOINTS_MAX]		= 	180;
	attribute[ATR_HITPOINTS] 			= 	180;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony", 84, 1, KDW_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		5);
	
	//-------- inventory --------
	//EquipItem		(self,ItMw_2H_Staff_03);
	CreateInvItem	(self, ItArRuneIceWave);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2063;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2063 ()
	{
	// evtl. im Kreis gehen
    TA_PracticeMagic	(15,00,22,00,"HOEHLE_021");
    TA_ReadBook		  	(22,00,15,00,"HOEHLE_022");	
	};
	
func void Rtn_Folge_2063 ()
	{
	TA_FollowPC		(15,00,22,00,"HOEHLE_022");
    TA_FollowPC	  	(22,00,15,00,"HOEHLE_022");	
    };
    
func void rtn_angriff_2063 ()
	{
	TA_AmalricAngreifen (15,00,22,00,"HOEHLE_008");
	TA_AmalricAngreifen (22,00,15,00,"HOEHLE_008");
	};    
    
// ---------- Double für Außenwelt ---------------
instance DIC_2076_Amalric (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Amalric";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_KdW;
	level 		=	18;
	voice 		=	8;
	id 			=	2076;
	flags			= NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	40;
	attribute[ATR_DEXTERITY] 			= 	30;
	attribute[ATR_MANA_MAX] 			= 	60;
	attribute[ATR_MANA] 				= 	60;
	attribute[ATR_HITPOINTS_MAX]		= 	180;
	attribute[ATR_HITPOINTS] 			= 	180;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony", 84, 1, KDW_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		5);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_03);
	CreateInvItem	(self, ItArRuneIceWave);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2076;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_ende_2076 ()
	{
	// evtl. im Kreis gehen
    TA_SitCampfire	  (15,00,22,00,"GRAB01_00");
    TA_SitCampfire	  (22,00,15,00,"GRAB01_00");	
	};
	
func void Rtn_start_2076 ()
	{
	TA_FollowPC		(15,00,22,00,"ZUR_H06_34");
    TA_FollowPC	  	(22,00,15,00,"ZUR_H06_34");	
    };