// ****************************************************************
// ------------------ Orkpriester 1 -----------------------------
// ****************************************************************

instance Dic_2503_Gruftpriest (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Grabwächter";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_ORCSHAMAN;
	level 		=		50;
	 	
	voice 		=		17;
	id 		=		2503;
	
	//-------- visuals --------
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	B_Scale					(self);
	Mdl_SetModelFatness		(self,0);
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 		=	1000;
	attribute[ATR_HITPOINTS] 		=	1000;

	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]		=	50;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]		=	25;
	protection	[PROT_FLY]		=	50;
	protection	[PROT_MAGIC]		=	0;
	 	

	//-------- talente --------
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 6);
	
	//-------- inventory --------
	CreateInvItem		(self,	ItRwOrcstaff);		// für Magiemodus
	CreateInvItem 		(self,  Weltenspalter);
	CreateInvItem		(self,	ItArRuneFireball);


  	  
	//------------- ai -------------
	daily_routine			= Rtn_Start_2503;
	senses				= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	fight_tactic			= FAI_HUMAN_MAGE;
	aivar[AIV_TALKBEFOREATTACK] 	= TRUE;
};

FUNC VOID Rtn_Start_2503 ()
{
	TA_Intercept	(07,00,12,00,"SF_H08_07");
	TA_Intercept	(12,00,07,00,"SF_H08_07");

};

