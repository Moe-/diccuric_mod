instance DIC_2062_Masci (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Masci";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB;
	level 		=	12;
	voice 		=	7;
	id 			=	2062;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Thief", 5,  4, DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		2);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneWindfist);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2062;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2062 ()
	{
	// evtl. im Kreis gehen
    TA_Stand	  	(15,00,22,00,"HOEHLE_027");
    TA_ReadBook		(22,00,00,00,"HOEHLE_038");
    TA_Stand	  	(00,00,15,00,"HOEHLE_027");	
	};