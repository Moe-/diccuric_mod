instance DIC_2008_Pyt (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Pyt";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	18;
	voice		=	3;
	id 			=	2008;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 16, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	CreateInvItem	(self, Py_Empf);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2008;
};

FUNC VOID Rtn_start_2008 ()
	{	
	TA_Meditate	(08,00,12,00,"STADT_WEG_131");
	TA_SmallTalk	(12,00,20,00,"STADT_UNTEN_00");
	TA_SitAround	(20,00,23,30,"STADT_WEG_131");
	TA_Sleep	(23,30,08,00,"HHUET02_EINGANG");
	};