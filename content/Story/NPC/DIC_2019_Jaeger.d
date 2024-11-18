instance DIC_2019_Jaeger (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Jaeger";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	18;
	voice		=	9;
	id 			=	2019;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 7, 1, SLD_ARMOR_M);
        
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
	daily_routine = Rtn_start_2019;
};

FUNC VOID Rtn_start_2019 ()
{
	TA_StandAround	(06,00,15,00,"FOREST01_36"); 
	TA_SmallTalk	(15,00,20,00,"FOREST01_36");
	TA_SitAround	(20,00,06,00,"FOREST01_35A");
};

FUNC VOID Rtn_Kampf_2019 ()
{                       
	TA_StandAround	(06,00,18,00,"FOREST01_10"); 
	TA_StandAround	(18,00,06,00,"FOREST01_10");
};      