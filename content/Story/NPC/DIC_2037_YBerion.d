instance DIC_2037_YBerion (Npc_Default)
	{
	//-------- primary data --------
	
	name 			=	"Nolwenn";
	npctype 		= 	npctype_main;
	guild 			=	GIL_KdW;
	level 			=	30;
	//flags			= 	NPC_FLAG_IMMORTAL;
	voice 			= 	12;
	id 				=	2037;
			
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		= 60;
	attribute[ATR_DEXTERITY] 		= 45;
	attribute[ATR_MANA_MAX] 		= 50;
	attribute[ATR_MANA] 			= 50;
	attribute[ATR_HITPOINTS_MAX]	= 400;
	attribute[ATR_HITPOINTS]		= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 83,  0, GUR_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Spells--------                                    


	//-------- Talente -------- 
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	CreateInvItem(self, ItArRunePyrokinesis);
	CreateInvItem(self, ItWr_GolemBook1);
	
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 1000);
	CreateInvItem	(self, ItLsTorch);
	CreateInvItems	(self, ItArRuneLight, 2);
	CreateInvItems	(self, ItArScrollLight, 10);
	CreateInvItems	(self, ItArRuneFirebolt, 2);
	CreateInvItems	(self, ItArScrollFirebolt, 10);
	CreateInvItems	(self, ItArRuneFireball, 2);
	CreateInvItems	(self, ItArScrollFireball, 10);
	CreateInvItems	(self, ItArRuneFirestorm, 2);
	
	
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2037;
	};

FUNC VOID Rtn_start_2037 ()
	{
    	TA_Smalltalk		(05,00,01,00,"STADT_WEG_078");
    	TA_Stand		(01,00,05,00,"STADT_MARKT_01");	
	};