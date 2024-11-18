instance DIC_2060_Eustace (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Arencan";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_GUR;
	level 		=	12;
	voice 		=	6;
	id 			=	2060;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Pony", 7,  4, GUR_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		2);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_2H_Staff_01);
	CreateInvItem	(self, ItArRuneWindfist);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2060;
	fight_tactic	=	FAI_HUMAN_MAGE;
	};

FUNC VOID Rtn_start_2060 ()
	{
    TA_SitCampfire	  (15,00,22,00,"HOEHLE_004");
    TA_SitCampfire	  (22,00,15,00,"HOEHLE_004");	
	};