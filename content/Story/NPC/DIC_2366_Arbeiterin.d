instance DIC_2366_Arbeiterin (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Arbeiterin";
	npctype		= 	npctype_main;
	guild 		=	GIL_BAU;
	level 		=	5;
	voice 		=	16;
	id 		=	2366;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]	= 140;
	attribute[ATR_HITPOINTS] 	= 140;


	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Hum_Body_Babe0", 	1, 			2,			"Bab_Head_Hair2", 	4,  		DEFAULT,	Bau_Kleid2);
	Mdl_ApplyOverlayMds	(self,"Humans_Babe.mds");
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- inventory --------
	CreateInvItems	(self, ItMiNugget,	15);
	CreateInvItems	(self, ItFoRice,	5);
	CreateInvItems	(self, ItFoBooze,	3);
	CreateInvItems	(self, ItMiJoint_1,	1);
	EquipItem 	(self, ItMw_1H_Scythe_01);

	//-------- Talente -------- 		
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2366;
};

FUNC VOID Rtn_start_2366 ()
	{
	TA_PickRice	 	(08,00,20,00,"ZUM_REISFELD_42B");
	TA_SmallTalk		(20,00,23,00,"SF_REISFELD_19");
	TA_Sleep		(23,00,08,00,"SF_REISFELD_15");
	};
    