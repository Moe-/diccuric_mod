instance DIC_2370_Vorarbeiterin (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Seana";
	npctype		= 	npctype_main;
	guild 		=	GIL_BAU;      
	level 		=	7;
	voice 		=	16;
	id 			=	2370;


	//-------- abilities --------
	attribute[ATR_STRENGTH]	 		= 30;
	attribute[ATR_DEXTERITY] 		= 60;
	attribute[ATR_MANA_MAX] 		= 20;
	attribute[ATR_MANA] 			= 20;
	attribute[ATR_HITPOINTS_MAX]		= 152;
	attribute[ATR_HITPOINTS] 		= 152;

	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Hum_Body_Babe0", 	1, 			1,			"Bab_Head_Hair1", 	3,  		DEFAULT,	Bau_Kleid4);
	Mdl_ApplyOverlayMds	(self,"Humans_Babe.mds");
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- inventory --------
	CreateInvItems	(self, ItMiNugget,	15);
	CreateInvItems	(self, ItFoRice,	5);
	CreateInvItems	(self, ItFoBooze,	3);
	CreateInvItems	(self, ItMiJoint_1,	1);
	EquipItem  	(self, Heerscherstab); 

	//-------- Talente -------- 		
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2370;
};

FUNC VOID Rtn_start_2370 ()
	{
	TA_Boss		 	(08,00,20,00,"ZUM_REISFELD_39");
	TA_SitAround		(20,00,23,00,"SF_REISFELD_11");
    	TA_Sleep		(23,00,08,00,"SF_REISFELD_12");
	};