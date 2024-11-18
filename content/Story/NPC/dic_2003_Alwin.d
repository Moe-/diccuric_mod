instance dic_2003_Alwin (Npc_Default)
	{
	//------- primary data ----------
	name = "Alwin";
	guild = GIL_Sld;
	npctype = NPCTYPE_FRIEND;
	level = 10;
	voice = 1;
	id = 2003;

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
				1,	//body texture variant
				1,	//skin color
				"hum_head_fighter",	// head mesh
				50,	//head texture variant
				1,	//teeth texture variant
				GRD_ARMOR_I);	// Rüstung (instance)

	B_Scale (self);

	Mdl_SetModelFatness (self, 0);

	// ---- talents ------
	Npc_SetTalentSkill (Self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (Self, NPC_TALENT_BOW,1);

	// ------ inventory ----
	EquipItem (self, ItMw_1H_Sword_Broad_03);
	CreateInvItem	(self, ItFo_Potion_Health_02);


	// --------- ai -------
	fight_tactic = FAI_HUMAN_STRONG;

	// Anmeldung des Tagesablaufes
	daily_routine = Rtn_Start_2003;
	};

func void Rtn_haus_2003 ()
	{
	TA_Sleep		(23,30,08,00,"STADT_WEG_045");
	TA_SitAround	(08,00,11,30,"STADT_UNTEN_00");
	TA_SmallTalk	(15,00,22,00,"STADT_UNTEN_00");
	TA_SitAround	(13,00,23,30,"STADT_UNTEN_00");	
	};
	
func void Rtn_Wald_2003 ()
	{
	TA_GuidePC	(08,00,20,00,"STADT_PATH02_02");
	TA_GuidePC	(20,00,08,00,"STADT_PATH02_02");
	};
	
func void Rtn_Bruecke_2003 ()
	{
	TA_GuidePC	(08,00,20,00,"STADT_WEG_004");
	TA_GuidePC	(20,00,08,00,"STADT_WEG_004");
	};
	
func void Rtn_Folge_2003 ()
	{
	TA_GuidePC	(08,00,20,00,"ZAM_20");
	TA_GuidePC	(20,00,08,00,"ZAM_20");
	};
	
FUNC VOID Rtn_start_2003()	//Steht zur Mission bereit
	{
	TA_Stand	(23,00,16,00,"STADT_WEG_150");
	TA_Stand	(16,00,23,00,"STADT_WEG_150");	
	};

FUNC VOID Rtn_tauch_2003()	//Steht zur Mission bereit
{
	TA_Guard	(23,00,16,00,"STADT_WEG_176");
	TA_Guard	(16,00,23,00,"STADT_WEG_176");	
	
};

FUNC VOID Rtn_guidetauch_2003()	//Leitet Spieler zu Tauchplatz
{
	TA_GuidePC	(23,00,16,00,"SEE_UB_26");
	TA_GuidePC	(16,00,23,00,"SEE_UB_26");
};

FUNC VOID Rtn_follow_2003()		//geht zum Spieler(warum auch immer)
{
	TA_FollowPC	(23,00,16,00,"");
	TA_FollowPC	(16,00,23,00,"");
};

FUNC VOID Rtn_Suche_2003()	//Sucht nach Pflanze
{
	TA_SearchDC	(23,00,16,00,"SEE_UB_27");
	TA_SearchDC	(16,00,23,00,"SEE_UB_27");
};

func void Rtn_Gegangen_2003()
	{
	TA_StandAround (06,00,18,00,"UNTERWORLD");
	TA_StandAround (06,00,18,00,"UNTERWORLD");
	};