instance DIC_2050_Jaeger (Npc_Default)
{
	//-------- primary data --------
	name =							"Kallixtus";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_TPL;
	level =							17;
	
	
	voice =							13;
	id =							2050;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_Pony", 45,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2050;
	};

FUNC VOID Rtn_start_2050 ()
	{
	TA_SLEEP		(23,00,06,00,"MINIBURG_25");
	TA_StandAround	(06,00,18,00,"MINIBURG_24");
	TA_Smalltalk	(18,00,19,00,"MINIBURG_32");
	TA_StandAround	(19,00,23,00,"MINIBURG_24");
	};


