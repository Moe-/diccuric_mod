instance DIC_2057_Payn (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Payn";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_GUR;
	level 		=	12;
	voice 		=	3;
	id 			=	2057;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 0 ,"Hum_Head_Bald", 19,  0, GUR_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		2);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneFireball);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2057;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2057 ()
	{
    TA_Stand	  (15,00,22,00,"HOEHLE_034");
    TA_Stand	  (22,00,15,00,"HOEHLE_034");	
	};