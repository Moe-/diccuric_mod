instance DIC_2046_Baeuerin (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Rebekka";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_BAU;
	level 		=	1;
	voice 		=	16;
	id 			=	2046;
	flags      	=   NPC_FLAG_IMMORTAL; //Keine Todesanimationen!!!

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;


	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Hum_Body_Babe0", 	1, 			1,			"Bab_Head_Hair2", 	3,  		DEFAULT,	Bau_Kleid4);
	Mdl_ApplyOverlayMds	(self,"Humans_Babe.mds");
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- inventory --------
	CreateInvItems	(self, ItMiNugget,	15);
	CreateInvItems	(self, ItFoRice,	5);
	CreateInvItems	(self, ItFoBooze,	3);
	CreateInvItems	(self, ItMiJoint_1,	1);

	//-------- Talente -------- 		
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2046;
	};
	
func void Rtn_start_2046 ()
	{
	TA_SitAround	(06,00,18,00, "BHOF1_03");
	TA_Boss	(18,00,22,00, "BHOF1_03");
	TA_Sleep	(22,00,06,00, "BHOF1_03");
	};