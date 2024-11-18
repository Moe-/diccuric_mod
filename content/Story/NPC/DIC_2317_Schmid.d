instance DIC_2317_Schmied (Npc_Default)
{
	//-------- primary data --------
	name 	=	"Schmied";
	npctype =	NPCTYPE_Main;
	guild 	=	GIL_TPL;
	level 	=	20;
	
	voice 	=	7;
	id 		=	2316;
		
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
	//Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Fighter", 19,  2, TPL_ARMOR_H);

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
	daily_routine = Rtn_start_2317;
	};

FUNC VOID Rtn_start_2317 ()
{
	TA_SitAround	(06,00,08,00,"MINIBURG_29");
	
	TA_Smith_Fire	(08,00,08,10,"MINIBURG_34");
	TA_Smith_Anvil	(08,10,08,20,"MINIBURG_34");
	TA_Smith_Fire	(08,20,08,30,"MINIBURG_34");
	TA_Smith_Anvil	(08,30,08,40,"MINIBURG_34");
	TA_Smith_Cool	(08,40,08,50,"MINIBURG_34");
    TA_Smith_Sharp	(08,50,08,55,"MINIBURG_34");
    TA_Smalltalk	(08,55,10,00,"MINIBURG_33");

	TA_Smith_Fire	(10,00,10,10,"MINIBURG_34");
	TA_Smith_Anvil	(10,10,10,20,"MINIBURG_34");
	TA_Smith_Fire	(10,20,10,30,"MINIBURG_34");
	TA_Smith_Anvil	(10,30,10,40,"MINIBURG_34");
	TA_Smith_Cool	(10,40,10,50,"MINIBURG_34");
    TA_Smith_Sharp	(10,50,10,55,"MINIBURG_34");
    TA_Smalltalk	(10,55,12,00,"MINIBURG_33");

	TA_Smith_Fire	(12,00,12,10,"MINIBURG_34");
	TA_Smith_Anvil	(12,10,12,20,"MINIBURG_34");
	TA_Smith_Fire	(12,20,12,30,"MINIBURG_34");
	TA_Smith_Anvil	(12,30,12,40,"MINIBURG_34");
	TA_Smith_Cool	(12,40,12,50,"MINIBURG_34");
    TA_Smith_Sharp	(12,50,12,55,"MINIBURG_34");
    TA_Smalltalk	(12,55,14,00,"MINIBURG_33");
          
	TA_Smith_Fire	(14,00,14,10,"MINIBURG_34");
	TA_Smith_Anvil	(14,10,14,20,"MINIBURG_34");
	TA_Smith_Fire	(14,20,14,30,"MINIBURG_34");
	TA_Smith_Anvil	(14,30,14,40,"MINIBURG_34");
	TA_Smith_Cool	(14,40,14,50,"MINIBURG_34");
    TA_Smith_Sharp	(14,50,14,55,"MINIBURG_34");
    TA_Smalltalk	(14,55,16,00,"MINIBURG_33");

	TA_Smith_Fire	(16,00,16,10,"MINIBURG_34");
	TA_Smith_Anvil	(16,10,16,20,"MINIBURG_34");
	TA_Smith_Fire	(16,20,16,30,"MINIBURG_34");
	TA_Smith_Anvil	(16,30,16,40,"MINIBURG_34");
	TA_Smith_Cool	(16,40,16,50,"MINIBURG_34");
    TA_Smith_Sharp	(16,50,16,55,"MINIBURG_34");
    TA_Smalltalk	(16,55,18,00,"MINIBURG_33");

	TA_Smith_Fire	(18,00,18,10,"MINIBURG_34");
	TA_Smith_Anvil	(18,10,18,20,"MINIBURG_34");
	TA_Smith_Fire	(18,20,18,30,"MINIBURG_34");
	TA_Smith_Anvil	(18,30,18,40,"MINIBURG_34");
	TA_Smith_Cool	(18,40,18,50,"MINIBURG_34");
    TA_Smith_Sharp	(18,50,18,55,"MINIBURG_34");
    TA_Smalltalk	(18,55,20,00,"MINIBURG_33");

	TA_SitAround	(20,00,23,00,"MINIBURG_33");
	TA_Sleep		(23,00,06,00,"MINIBURG_52");
};