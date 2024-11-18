
// ****************************************************************
// ------------------ Orkpriester PTP -----------------------------
// ****************************************************************
instance APTP_2012_CARLORG (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Carlorg";
	Npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_ORCSHAMAN;
	level 		=		20;
	voice 		=		17;
	id 		=		2212;
		
	//-------- visuals --------
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	B_Scale				(self);
	Mdl_SetModelFatness		(self,0);
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 		=	1000;
	attribute[ATR_HITPOINTS] 		=	1000;

	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]		=	60;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]		=	17;
	protection	[PROT_FLY]		=	0;
	protection	[PROT_MAGIC]		=	1000;
		

	//-------- talente --------
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 6);
	

	//-------- inventory --------
	CreateInvItem		(self,	ItRwUdOrcstaff);		// für Magiemodus
    	CreateInvItem		(self,	ItWr_Credits);
    	CreateInvItem		(self,	ItArRuneThunderball);
	//------------- ai -------------
	daily_routine 			= Rtn_start_2212;
	senses				= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	fight_tactic			= FAI_HUMAN_MAGE;
	aivar[AIV_TALKBEFOREATTACK] 	= TRUE;
};

FUNC VOID Rtn_start_2212 ()
{
	TA_Intercept	(07,00,12,00,"PTP_27");
	TA_Intercept	(12,00,07,00,"PTP_27");
};

FUNC VOID Rtn_fight_2212 ()
{
	TA_Intercept	(07,00,12,00,"PTP_04");
	TA_Intercept	(12,00,07,00,"PTP_04");

};