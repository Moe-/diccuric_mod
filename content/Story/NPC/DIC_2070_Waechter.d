instance DIC_2070_Waechter (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Waechter";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_KdF;
	level 		=	15;
	voice 		=	5;
	id 			=	2070;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	40;
	attribute[ATR_DEXTERITY] 			= 	30;
	attribute[ATR_MANA_MAX] 			= 	60;
	attribute[ATR_MANA] 				= 	60;
	attribute[ATR_HITPOINTS_MAX]		= 	75;
	attribute[ATR_HITPOINTS] 			= 	60;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald", 5, 1, KDF_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		3);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneIceWave);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2070;
	fight_tactic	=	FAI_HUMAN_STRONG;
	};

FUNC VOID Rtn_start_2070 ()
	{
	// evtl. im Kreis gehen
    TA_SitAround	  (15,00,22,00,"HOEHLE_007");
    TA_SitAround	  (22,00,15,00,"HOEHLE_007");	
	};
	
func void rtn_angriff_2070 ()
	{
	TA_AmalricAngreifen (15,00,22,00,"HOEHLE_007");
	TA_AmalricAngreifen (22,00,15,00,"HOEHLE_007");
	};
	
func void rtn_herostoppen_2070 ()
	{
	TA_HeroAngreifen (15,00,22,00,"HOEHLE_007");
	TA_HeroAngreifen (22,00,15,00,"HOEHLE_007");
	};