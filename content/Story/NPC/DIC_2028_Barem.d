instance DIC_2028_Barem (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Barem";
	npctype		= 	NPCTYPE_FRIEND;
	guild 		=	GIL_Gur;
	level 		=	18;
	flags		= 	NPC_FLAG_IMMORTAL;
	voice		=	2;
	id 			=	2028;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 0,"Hum_Head_Fighter", 14, 1, SLD_ARMOR_M);
        
	B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_MASTER;
    	
    self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION] = TRUE;
    aivar[AIV_TALKBEFOREATTACK] = TRUE;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW, 2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	
	EquipItem	(self, ItMw_1H_Sword_04);
	//EquipItem	(self, ItMw_1H_Mace_War_03);
	EquipItem	(self, ItRw_Bow_Long_04);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2028;
};

func void Rtn_start_2028 ()
	{
	TA_HoleHorn (06,00,15,00,"SEE_VOR_STADT_22");
	TA_HoleHorn (15,00,06,00,"SEE_VOR_STADT_22");
	};
	
FUNC VOID Rtn_baum_2028 ()
{
	TA_SitAround	(06,00,15,00,"WIESE02_04"); 
	TA_Meditate	(15,00,16,00,"WIESE02_04");
	TA_SitAround	(16,00,06,00,"WIESE02_04");
};