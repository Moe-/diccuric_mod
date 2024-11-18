instance DIC_2068_Feordwin (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Feordwin";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_KdF;
	level 		=	18;
	voice 		=	9;
	id 			=	2068;
	flags			= NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	40;
	attribute[ATR_DEXTERITY] 			= 	30;
	attribute[ATR_MANA_MAX] 			= 	60;
	attribute[ATR_MANA] 				= 	60;
	attribute[ATR_HITPOINTS_MAX]		= 	100;
	attribute[ATR_HITPOINTS] 			= 	80;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Thief", 8,  0, KDF_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		5);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_03);
	CreateInvItem	(self, ItArRuneSummonSkeletons);
	CreateInvItem	(self, RuneDesGeistes);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2068;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2068 ()
	{
	// evtl. im Kreis gehen
    TA_ReadBook	  (15,00,22,00,"HOEHLE_008");
    TA_Smoke	  (22,00,15,00,"HOEHLE_008");	
	};
	
func void rtn_angriff_2068 ()
	{
	TA_AmalricAngreifen (15,00,22,00,"HOEHLE_008");
	TA_AmalricAngreifen (22,00,15,00,"HOEHLE_008");
	};
	
func void rtn_Stehen_2068 ()
	{
	TA_Stand (15,00,22,00,"HOEHLE_008");
	TA_Stand (22,00,15,00,"HOEHLE_008");
	};