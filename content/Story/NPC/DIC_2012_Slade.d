instance DIC_2012_Slade (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Slade";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	20;
	voice		=	6;
	id 			=	2012;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 95;
	attribute[ATR_DEXTERITY] 	= 95;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 225;
	attribute[ATR_HITPOINTS] 	= 225;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 19, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW, 2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_Heavy_02);
	EquipItem	(self, ItRw_Crossbow_02);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2012;
};

FUNC VOID Rtn_start_2012 ()
{
	TA_WalkAround	(06,00,21,00,"STADT_WEG_077"); 
	TA_StandAround	(21,00,06,00,"STADT_WEG_077"); 
};

FUNC VOID Rtn_taliasan_2012 ()
{
	TA_Guard	(06,00,21,00,"STADT_PATH01_03"); 
	TA_StandAround	(21,00,06,00,"STADT_PATH01_03"); 
};

func void Rtn_Gegangen_2012()
	{
	TA_StandAround (06,00,18,00,"UNTERWORLD");
	TA_StandAround (06,00,18,00,"UNTERWORLD");
	};