instance Dic_2504_Asarend (Npc_Default)
{
	//-------- primary data --------
	
	name 			=		"Asarend";
	npctype 		= 		NPCTYPE_FRIEND;
	guild 			=		GIL_TPL;
	level 			=		30;
	voice 			=		8;
	id 			=		2504;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	85;
	attribute[ATR_DEXTERITY] 		= 	65;
	attribute[ATR_MANA_MAX] 		= 	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX]		= 	400;
	attribute[ATR_HITPOINTS] 		= 	400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 3 ,"Hum_Head_Bald", 11,  0, TPL_ARMOR_H);

	B_Scale (self);

	//-------- Talente -------

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);					
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);					
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);		
	Npc_SetTalentSkill	(self,NPC_TALENT_MAGE,6);
		
	//-------- inventory --------
	CreateInvItem(self, ItArRunePyrokinesis);
	CreateInvItem (self, Roter_Wind);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItLsTorch);
	CreateInvItem (self, ItFo_Potion_Health_02);
	CreateInvItem (self, ItMiHammer);
//	CreateInvItem (self, ItKeKey_A);
 
	
	//-------------Daily Routine-------------
	daily_routine	= 	Rtn_Start_2504;
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//------------- //MISSION-------------------
};

FUNC VOID Rtn_Start_2504 ()
{
	TA_Sleep	(24,00,06,00,"SHUETTE301_EINGANG");
	TA_Meditate	(06,00,08,00,"STADT_TURM1_05");
	TA_PracticeSword(08,00,11,00,"STADT_MAUER_012");
	TA_SmallTalk	(11,00,12,00,"STADT_MARKT_00");
	
	TA_Smith_Fire	(12,00,12,10,"STADT_TURM1_01");
	TA_Smith_Anvil	(12,10,12,20,"STADT_TURM1_01");
	TA_Smith_Fire	(12,20,12,30,"STADT_TURM1_01");
	TA_Smith_Anvil	(12,30,12,40,"STADT_TURM1_01");
	TA_Smith_Cool	(12,40,12,50,"STADT_TURM1_01");
        TA_Smith_Sharp	(12,50,12,55,"STADT_TURM1_01");
        TA_StandAround	(12,55,12,57,"STADT_TURM1_00");
        TA_SitAround	(12,57,13,05,"STADT_TURM1_00");
          
	TA_Smith_Fire	(13,05,13,15,"STADT_TURM1_01");
	TA_Smith_Anvil	(13,15,13,20,"STADT_TURM1_01");
	TA_Smith_Fire	(13,20,13,30,"STADT_TURM1_01");
	TA_Smith_Anvil	(13,30,13,40,"STADT_TURM1_01");
	TA_Smith_Cool	(13,40,13,50,"STADT_TURM1_01");
        TA_Smith_Sharp	(13,50,13,55,"STADT_TURM1_01");
        TA_StandAround	(13,55,13,57,"STADT_TURM1_00");
        TA_SitAround	(13,57,14,05,"STADT_TURM1_00");

	TA_Smith_Fire	(14,05,14,15,"STADT_TURM1_01");
	TA_Smith_Anvil	(14,15,14,20,"STADT_TURM1_01");
	TA_Smith_Fire	(14,20,14,30,"STADT_TURM1_01");
	TA_Smith_Anvil	(14,30,14,40,"STADT_TURM1_01");
	TA_Smith_Cool	(14,40,14,50,"STADT_TURM1_01");
        TA_Smith_Sharp	(14,50,14,55,"STADT_TURM1_01");
        TA_StandAround	(14,55,14,57,"STADT_TURM1_00");
        TA_SitAround	(14,57,15,05,"STADT_TURM1_00");

	TA_Smith_Fire	(15,05,15,15,"STADT_TURM1_01");
	TA_Smith_Anvil	(15,15,15,20,"STADT_TURM1_01");
	TA_Smith_Fire	(15,20,15,30,"STADT_TURM1_01");
	TA_Smith_Anvil	(15,30,15,40,"STADT_TURM1_01");
	TA_Smith_Cool	(15,40,15,50,"STADT_TURM1_01");
        TA_Smith_Sharp	(15,50,15,55,"STADT_TURM1_01");
        TA_StandAround	(15,55,15,57,"STADT_TURM1_00");
        TA_SitAround	(15,57,16,10,"STADT_TURM1_00");
	
	Ta_RepairHut	(16,10,17,00,"STADT_TURM1_01");
	TA_PracticeSword	(17,00,20,00,"STADT_MAUER_012");
	TA_SmallTalk	(20,00,22,00,"STADT_MARKT_00");
	TA_Meditate	(22,00,24,00,"STADT_TURM1_05");
	
	
};
