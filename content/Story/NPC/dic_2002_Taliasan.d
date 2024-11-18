instance dic_2002_Taliasan (Npc_Default)
	{
	//------- primary data ----------
	name = "Taliasan";
	guild = GIL_KdW;
	npctype = NPCTYPE_FRIEND;
	level = 20;
	voice = 3;
	id = 2002;

	//----- attributes ---------
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
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
				TAL_ROBE);	// Rüstung (instance)

	B_Scale (self);

	Mdl_SetModelFatness (self, 0);

	// ---- talents ------
	Npc_SetTalentSkill (Self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (Self, NPC_TALENT_MAGE,4);

	// ------ inventory ----
	EquipItem (self, ItMw_1H_Sword_Broad_03);
	CreateInvItems 	(self, ItMiFlask,5);
	CreateInvItems(self, ItArRuneFireRain, 1);
	CreateInvItems(self, ItArRuneFireball, 1);


	// ------- senses ------
	//senses = SENSE_SEE | SENSE_SMELL;
	//senses_range = 2225;

	// --------- ai -------
	fight_tactic = FAI_HUMAN_MAGE;

	// Anmeldung des Tagesablaufes
	daily_routine = Rtn_Start_2002;
	};


func void Rtn_Start_2002 ()
	{
	TA_PotionAlchemy	(21,30,23,30,"SHUETTE303_LABI");
	TA_Sleep		(23,30,07,30,"SHUETTE303_EINGANG");
	TA_PracticeMagic	(07,30,15,30,"STADT_WEG_118");
	TA_Stand		(15,30,16,30,"STADT_WEG_120");
	TA_SitAround		(16,30,22,30,"SHUETTE303_EINGANG");
	};
	
func void Rtn_Benchol_2002 ()
	{
	TA_GeheBenchol		(12,00,24,00,"STADT_WEG_040");
	TA_GeheBenchol		(24,00,12,00,"STADT_WEG_040");
	};
	
func void Rtn_Heiltrank_2002 ()
	{
	TA_PotionAlchemy	(07,30,01,30,"SHUETTE303_LABI");
	TA_Sleep		(01,30,07,30,"SHUETTE303_EINGANG");
	};
	