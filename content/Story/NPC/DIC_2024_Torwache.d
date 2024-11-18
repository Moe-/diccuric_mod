instance DIC_2024_Torwache (Npc_Default)
	{
	//-------- primary data --------
	
	name 		= 	"Torwache";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Grd;
	level 		=	20;
	voice		=	4;
	id 			=	2024;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 75;
	attribute[ATR_DEXTERITY] 	= 75;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 250;
	attribute[ATR_HITPOINTS] 	= 250;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Fighter", 11, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_04);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItems	(self, ItAmBolt,50);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2024;
	};

FUNC VOID Rtn_start_2024 ()
	{ 
	TA_Guard	(06,00,15,00,"STADT_PATH02_02");
	TA_Guard	(15,00,19,00,"STADT_PATH02_02");
	TA_Guard	(19,00,21,00,"STADT_PATH02_02");
	TA_Guard	(21,00,06,00,"STADT_PATH02_02"); 
	};