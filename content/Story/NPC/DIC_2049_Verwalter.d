instance DIC_2049_Verwalter (Npc_Default)
	{
	//-------- primary data --------
	name =							"Piret";
	npctype =						npctype_main;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							9;
	id =							2049;
		
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
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2 ,"Hum_Head_Pony", 58,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	CreateInvItem (self, ItMi_Amulet_Psi_01);
	EquipItem (self, ItMw_2H_Sword_Light_03);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_3);
	CreateInvItem (self, ItLsTorch);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2049;
	};

FUNC VOID Rtn_start_2049 ()
	{

    TA_Stand		(06,00,10,00,"MINIBURG_30");
    TA_Smalltalk	(10,00,14,00,"MINIBURG_32");
    TA_Stand		(14,00,23,00,"MINIBURG_30");	
	TA_SLEEP		(23,00,06,00,"MINIBURG_31");	
	};


