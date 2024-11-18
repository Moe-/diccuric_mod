instance DIC_2040_Baltar (Npc_Default)
	{
	//-------- primary data --------
	
	name 		= 	"Berengar";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_KdF;
	level 		=	20;
	voice		=	5;
	id 			=	2040;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 225;
	attribute[ATR_HITPOINTS] 	= 225;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 15, 1, Baltar_Ruestung);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

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
	daily_routine = Rtn_start_2040;
	};

FUNC VOID Rtn_start_2040 ()
	{
	TA_StandAround	(06,00,15,00,"B_50"); 
	TA_SmallTalk	(15,00,16,00,"B_50");
	TA_StandAround	(16,00,06,00,"B_50");
	};
	
FUNC VOID Rtn_thronsaal_2040 ()
	{
	TA_StandAround	(06,00,15,00,"HAUPTGEBAEUDE_12"); 
	TA_SitAround	(15,00,16,00,"HAUPTGEBAEUDE_12");
	TA_StandAround	(16,00,06,00,"HAUPTGEBAEUDE_12");
	};