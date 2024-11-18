instance Dic_2505_Moriarty (Npc_Default)
{
	//-------- primary data --------
	
	name 			=		"Moriarty";
	npctype 		= 		NPCTYPE_MAIN;
	guild 			=		GIL_NONE;
	level 			=		10;
	voice 			=		8;
	id 			=		2505;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		= 	50;
	attribute[ATR_MANA_MAX] 		= 	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]		= 	200;
	attribute[ATR_HITPOINTS] 		= 	0;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 3 ,"Hum_Head_Bald", 55,  0, STT_ARMOR_O);

	B_Scale (self);

	//-------- Talente -------


		
	//-------- inventory --------


	CreateInvItem (self, Komunikator);
	CreateInvItem (self, ItFo_Potion_Health_02);
	CreateInvItem (self, ItMiHammer);
	CreateInvItem (self, Tagebuch_Moriarty);

 
	
	//-------------Daily Routine-------------
	daily_routine	= 	Rtn_Start_2505;
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//------------- //MISSION-------------------
};

FUNC VOID Rtn_Start_2505 ()
{
	TA_Stand	(24,00,06,00,"SF_SUMPF_144B");
	TA_Stand	(06,00,24,00,"SF_SUMPF_144B");
};
