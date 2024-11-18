instance DIC_2081_Modares (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Modares";
	npctype 	= 	NPCTYPE_MAIN;
	guild 		=	GIL_Nov;
	level 		=	12;
	voice 		=	11;
	id 			=	2081;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	60;
	attribute[ATR_DEXTERITY] 			= 	50;
	attribute[ATR_MANA_MAX] 			= 	50;
	attribute[ATR_MANA] 				= 	50;
	attribute[ATR_HITPOINTS_MAX]		= 	240;
	attribute[ATR_HITPOINTS] 			= 	200;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 1,  1, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic = FAI_HUMAN_STRONG;

	//-------- Talente -------
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	
	//-------- inventory --------
	EquipItem		(self,ItMw_1H_Sword_Long_05);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	CreateInvItem	(self, TriramarAmulette);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2081;
	};

FUNC VOID Rtn_start_2081 ()
	{
    TA_HeroAngreifen     	(00,00,08,00,"VM_HOEHL_TUER");	
    TA_HeroAngreifen		(08,00,24,00,"VM_HOEHL_TUER");	
	};