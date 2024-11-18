instance DIC_2025_Fiebeler (Npc_Default)
	{
	//-------- primary data --------
	
	name 		= 	"Fiebeler";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Grd;
	level 		=	10;
	voice		=	8;
	id 			=	2025;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 10;
	attribute[ATR_MANA] 		= 10;
	attribute[ATR_HITPOINTS_MAX]= 125;
	attribute[ATR_HITPOINTS] 	= 125;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Fighter", 03, 1, GUR_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_03);
	EquipItem	(self, ItRw_Bow_Long_04);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2025;
	};

FUNC VOID Rtn_start_2025 ()
	{
	TA_StandAround	(08,00,11,30,"B_41");
	TA_ReadBook	(11,30,13,00,"B_41");
	TA_StandAround	(13,00,23,30,"B_41");
	TA_Sleep	(23,30,08,00,"B_41");
	};