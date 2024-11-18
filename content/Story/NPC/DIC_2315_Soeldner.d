instance DIC_2315_Soeldner (Npc_Default)
{
	//-------- primary data --------
	name 	=	"Söldner";
	npctype =	NPCTYPE_AMBIENT;
	guild 	=	GIL_TPL;
	level 	=	20;
	
	voice 	=	3;
	id 		=	2315;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//------ Protection -------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	70;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Fighter", 16,  2, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	CreateInvItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	CreateInvItem (self, ItFo_Potion_Health_02 );
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2315;
	};

FUNC VOID Rtn_start_2315 ()
	{
    TA_Guard		(00,00,08,00,"MINIBURG_41");
    TA_Guard		(08,00,10,00,"MINIBURG_45");	
	TA_Guard		(12,00,17,00,"MINIBURG_40");
	TA_PracticeSword(17,00,18,00,"MINIBURG_TRAIN1");
	TA_Guard		(18,00,00,00,"MINIBURG_40");
	};
