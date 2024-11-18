instance DIC_2319_Wache (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Wache";
	npctype		=	npctype_ambient;
	guild 		=	GIL_Grd;
	level 		=	15;
	voice 		=	3;
	id 			=	2319;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 15, 1, GRD_ARMOR_H);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self, ItRw_Crossbow_01);
	EquipItem	(self, ItMw_2H_Sword_Light_03);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	
	 //-------------Daily Routine-------------
	daily_routine = Rtn_start_2319;
	};

FUNC VOID Rtn_start_2319 ()
	{
	TA_Guard			(06,00,21,00,"B_46");
	TA_Guard			(19,00,21,00,"B_46");
	TA_Guard			(21,00,06,00,"B_46");
	};

func void Rtn_Angriff_2319 ()
	{
	TA_AltenMannFinden	(06,00,18,00,"B_52");
	TA_AltenMannFinden	(18,00,06,00,"B_52");
	};
