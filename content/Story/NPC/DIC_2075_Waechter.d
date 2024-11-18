instance DIC_2075_Waechter (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Waechter";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_KdF;
	level 		=	15;
	voice 		=	10;
	id 			=	2875;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 7, 0, KDF_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		3);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	EquipItem	(self, ItArRuneIceWave);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2875;
	fight_tactic	=	FAI_HUMAN_STRONG;
	};

FUNC VOID Rtn_start_2875 ()
	{
	// evtl. im Kreis gehen
    TA_GuardPatrol	  (15,00,22,00,"HOEHLE_006");
    TA_GuardPatrol	  (22,00,15,00,"HOEHLE_006");	
	};
	
func void rtn_angriff_2875 ()
	{
	TA_AmalricAngreifen (15,00,22,00,"HOEHLE_006");
	TA_AmalricAngreifen (22,00,15,00,"HOEHLE_006");
	};
	
func void rtn_herostoppen_2075 ()
	{
	TA_HeroAngreifen (15,00,22,00,"HOEHLE_007");
	TA_HeroAngreifen (22,00,15,00,"HOEHLE_007");
	};