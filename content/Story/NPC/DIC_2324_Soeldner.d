instance DIC_2324_Soeldner (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Soeldner";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_Grd;
	level 		=	12;
	voice 		=	7;
	id 			=	2324;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	30;
	attribute[ATR_DEXTERITY] 			= 	20;
	attribute[ATR_MANA_MAX] 			= 	50;
	attribute[ATR_MANA] 				= 	50;
	attribute[ATR_HITPOINTS_MAX]		= 	100;
	attribute[ATR_HITPOINTS] 			= 	75;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 10,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic = FAI_HUMAN_STRONG;

	//-------- Talente -------
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_1H_Sword_Short_05);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItems	(self, ItFoApple, 4);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2324;
	};

FUNC VOID Rtn_start_2324 ()
	{
    TA_HeroAngreifen     	(00,00,08,00,"VM_OBE_WEG4");	
    TA_HeroAngreifen		(08,00,24,00,"VM_OBE_WEG4");	
	};