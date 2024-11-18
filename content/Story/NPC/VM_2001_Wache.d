instance VM_2001_Wache (Npc_Default)
	{
	//------- primary data ----------
	name = "Mike";
	guild = GIL_NONE;
	npctype = NPCTYPE_AMBIENT;
	level = 10;
	voice = 8;
	id = 2001;

	//----- attributes ---------
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;

	//------ visuals --------
	Mdl_SetVisual	(self, "humans.mds");	// Animationsdatei
	Mdl_ApplyOverlayMds (self, "humans_militia.mds"); //Militärbewegungen
	Mdl_SetVisualBody (self, "hum_body_naked0", //body mesh
				0,	//body texture variant
				1,	//skin color
				"hum_head_fighter",	// head mesh
				51,	//head texture variant
				2,	//teeth texture variant
				GRD_ARMOR_I);	// Rüstung (instance)

	B_Scale (self);

	Mdl_SetModelFatness (self, 0);

	// ---- talents ------
	Npc_SetTalentSkill (Self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (Self, NPC_TALENT_2H,1);

	// ------ inventory ----
	EquipItem (self, ItMw_1H_Sword_Bastard_04);
	CreateInvItems(self, ITFO_Potion_Health_01, 7);
	CreateInvItems(self, ItMiJoint_1, 3);
	CreateInvItems(self, ItMiJoint_2, 2);
	CreateInvItems(self, ItMiJoint_3, 1);



	// ------- senses ------
	senses = SENSE_SEE | SENSE_SMELL;
	senses_range = 2225;

	// --------- ai -------
	fight_tactic = FAI_HUMAN_STRONG;

	// Anmeldung des Tagesablaufes
	daily_routine = Rtn_Start_2001;
	};

func void Rtn_Start_2001 ()
	{
	TA_Stand (00,00,12,00,"VM_OBE_WACHE1");
	TA_Smoke (12,00,13,00,"VM_OBE_WACHE1");
	TA_WalkAround (13,00,14,00,"VM_OBE_WACHE1");
	TA_Stand (14,00,22,00,"VM_OBE_WACHE1");
	TA_Smoke (22,00,23,00,"VM_OBE_WACHE1");
	TA_WalkAround (23,00,00,00,"VM_OBE_WACHE1");
	};