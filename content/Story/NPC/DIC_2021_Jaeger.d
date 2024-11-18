instance DIC_2021_Jaeger (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Jaeger";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	18;
	voice		=	5;
	id 			=	2021;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 85;
	attribute[ATR_DEXTERITY] 	= 75;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Fighter", 11, 1, SLD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW, 2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_03);
	EquipItem	(self, ItRw_Bow_Long_04);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2021;
};

FUNC VOID Rtn_start_2021 ()
{
	TA_SmallTalk	(06,00,11,00,"STADT_WEG_056"); 
	TA_SitAround	(11,00,16,00,"SHUETTE4_01");
	TA_SmallTalk	(16,00,19,00,"STADT_WEG_056");
	TA_SitAround	(19,00,20,00,"STADT_UNTEN_04");
	TA_SmallTalk	(20,00,23,00,"STADT_UNTEN_04");
	TA_SLEEP	(23,00,06,00,"HBARACKE_2");
};

// ------- Jaeger helfen an der "Front" ---------
FUNC VOID Rtn_front_2021 ()
{
	TA_StandAround	(06,00,15,00,"FOREST01_36"); 
	TA_SmallTalk	(15,00,20,00,"FOREST01_36");
	TA_SitAround	(20,00,06,00,"FOREST01_35B");
};

FUNC VOID Rtn_Kampf_2021 ()
{                       
	TA_StandAround	(06,00,18,00,"FOREST01_10"); 
	TA_StandAround	(18,00,06,00,"FOREST01_10");
};