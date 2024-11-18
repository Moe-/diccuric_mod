instance DIC_2312_Soeldner (Npc_Default)
{
	//-------- primary data --------
	name 	=	"Söldner";
	npctype =	NPCTYPE_AMBIENT;
	guild 	=	GIL_TPL;
	level 	=	20;
	
	voice 	=	3;
	id 		=	2312;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Fighter", 12,  2, TPL_ARMOR_H);

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
	daily_routine = Rtn_start_2312;
	};

FUNC VOID Rtn_start_2312 ()
	{	
	TA_Walk			(06,00,08,55,"MINIBURG_29");
	TA_Smalltalk	(08,55,10,00,"MINIBURG_33");
	TA_PotionAlchemy(10,00,10,55,"MINIBURG_31");
	TA_Smalltalk	(10,55,12,00,"MINIBURG_33");
	TA_PotionAlchemy(12,00,12,55,"MINIBURG_31");
	TA_Smalltalk	(12,55,14,00,"MINIBURG_33");
	TA_PotionAlchemy(14,00,14,55,"MINIBURG_31");
	TA_Smalltalk	(14,55,16,00,"MINIBURG_33");
	TA_PotionAlchemy(16,00,16,55,"MINIBURG_31");
	TA_Smalltalk	(16,55,18,00,"MINIBURG_33");
	TA_PotionAlchemy(18,00,18,55,"MINIBURG_31");
	TA_Smalltalk	(18,55,20,00,"MINIBURG_33");
	TA_SitCampfire	(20,00,23,00,"MINIBURG_32");
	TA_SLEEP		(23,00,06,00,"MINIBURG_48");
	};
