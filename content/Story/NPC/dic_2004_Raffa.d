instance dic_2004_Raffa (Npc_Default)
	{
	//------- primary data ----------
	name = "Raffa";
	guild = GIL_Grd;
	npctype = NPCTYPE_MAIN;
	level = 20;
	voice = 8;
	id = 2004;

	//----- attributes ---------
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 175;
	attribute[ATR_HITPOINTS] = 175;

	//------ visuals --------
	Mdl_SetVisual	(self, "humans.mds");	// Animationsdatei
	Mdl_ApplyOverlayMds (self, "humans_militia.mds"); //Militärbewegungen
	Mdl_SetVisualBody (self, "hum_body_naked0", //body mesh
				0,	//body texture variant
				1,	//skin color
				"hum_head_fighter",	// head mesh
				30,	//head texture variant
				2,	//teeth texture variant
				GRD_ARMOR_I);	// Rüstung (instance)

	B_Scale (self);

	Mdl_SetModelFatness (self, 0);

	// ---- talents ------
	Npc_SetTalentSkill (Self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (Self, NPC_TALENT_BOW,1);

	// ------ inventory ----
	EquipItem (self, ItMw_1H_Sword_Broad_03);
	CreateInvItem	(self, ItFo_Potion_Health_02);
	CreateInvItems (self,ItMi_Plants_Swampherb_01,10);
	// ------- senses ------
	senses = SENSE_SEE | SENSE_SMELL;
	senses_range = 2225;

	// --------- ai -------
	fight_tactic = FAI_HUMAN_STRONG;

	// Anmeldung des Tagesablaufes
	daily_routine = Rtn_Start_2004;
	};

func void Rtn_Start_2004 ()
	{
	TA_Sleep		(23,30,08,00,"B_WG_41");
	TA_WalkAround	(08,00,12,00,"VB_03");
	TA_Stand		(12,00,14,00,"VB_03");
	TA_Stand		(14,00,16,00,"VB_09");
	TA_Stand		(16,00,17,00,"VB_03");
	TA_Stand		(17,00,18,00,"VB_09");
	TA_Smoke		(18,00,19,00,"VB_03");
	TA_WalkAround	(19,00,22,00,"VB_03");
	TA_SitAround    (22,00,22,15,"B_WG_41");
	TA_WalkAround	(22,15,23,30,"B_WG_41");	
	};
	
func void Rtn_Stadt_2004 ()
	{
	TA_Stand (06,00,14,00,"STADT_WEG_059");
	TA_Stand (14,00,20,00,"STADT_WEG_081");
	TA_Stand (20,00,22,00,"STADT_WEG_009");
	TA_Sleep (22,00,06,00,"B_WG_41");
	};
	
func void Rtn_Lynn_2004  ()
	{
	TA_Sleep	(23,00,07,30,"B_WG_41");
	TA_SitAround	(07,30,14,00,"B_WG_41");
	TA_SmallTalk	(14,00,15,00,"B_WG_41");
	TA_StandAround	(15,00,20,00,"B_WG_41");
	TA_SitAround	(20,00,23,00,"B_WG_41");
	};
	