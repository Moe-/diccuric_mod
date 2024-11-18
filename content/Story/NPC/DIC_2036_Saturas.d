instance DIC_2036_Saturas (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Faris";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_KDW;      
	level 		=	29;
	voice 		=	14;
	id 			=	2036;
	//flags       =   NPC_FLAG_IMMORTAL;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 388;
	attribute[ATR_HITPOINTS] 	= 388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//							body mesh     		bdytex	skin	head mesh     		headtex		teethtex	ruestung	
	Mdl_SetVisualBody (self,	"hum_body_Naked0",	0, 		3,		"Hum_Head_FatBald", 7,  		0,			KDW_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,	NPC_TALENT_MAGE,	6);

	//-------- Spells --------
	CreateInvItem 		(self,	ItArRuneChainLightning);
	CreateInvItem 		(self,	ItArRuneIceCube);

	//-------- inventory --------                                    
	CreateInvItem 		(self, 	ItFo_Potion_Health_01);
	CreateInvItem 		(self, 	ItFo_Potion_Mana_01);
	EquipItem 			(self, 	Schutzamulett_Feuer);
	EquipItem 			(self,	Machtring);
	CreateInvItem		(self,	ItFo_Plants_Flameberry_01 );
	CreateInvItems		(self, ItAt_Swampshark_01, 5);
	CreateInvItems		(self, ItMiNugget, 850);
	CreateInvItems		(self, ItRw_Bow_Small_01, 9);
	CreateInvItems		(self, ItRw_Bow_Small_02, 7);
	CreateInvItems		(self, ItRw_Bow_Small_03, 8);
	CreateInvItems		(self, ItRw_Bow_Small_04, 5);
	CreateInvItems		(self, ItRw_Bow_Small_05, 3);
	CreateInvItems		(self, ItRw_Bow_Long_01, 1);
	
	
	CreateInvItems		(self, ItAmArrow, 1000);
	CreateInvItems		(self, ItAmBolt, 1000);
	CreateInvItems		(self, Schutzamulett_Feuer, 2);
	CreateInvItems		(self, Schutzamulett_Waffen, 3);
	CreateInvItems		(self, Schutzamulett_Geschosse, 2);
	
	


	//------------- ai -------------
	daily_routine 	= Rtn_start_2036;
	fight_tactic	= FAI_HUMAN_MAGE;
	senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	};

FUNC VOID Rtn_start_2036 ()
	{
	TA_Stand		(01,00,05,00,"STADT_MARKT_04");	
	TA_StandAround		(05,00,01,00,"STADT_MARKT_04");	
	};