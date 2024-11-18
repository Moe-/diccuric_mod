instance DIC_2045_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Darek";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	9;
	id 			=	2045;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 13;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 64;
	attribute[ATR_HITPOINTS] 	= 64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fatbald", 2, 1,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    

	//-------- inventory --------                                    

		CreateInvItems (self, ItFoRice,3);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
		EquipItem (self, ItMw_1H_Sickle_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2045;
};

FUNC VOID Rtn_start_2045 ()
	{
	TA_Stand	(06,00,18,00, "BHOF1_03");
	TA_SitAround	(18,00,22,00, "BHOF1_03");
	TA_Sleep	(22,00,06,00, "BHOF1_03");
	};