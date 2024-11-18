instance DIC_2011_Graveyarn (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Graveyarn";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_Grd;
	level 		=	21;
	voice		=	4;
	id 			=	2011;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 95;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 250;
	attribute[ATR_HITPOINTS] 	= 250;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 16, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
    	self.aivar[AIV_IMPORTANT] = TRUE;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW, 2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_Heavy_01);
	EquipItem	(self, ItRw_Crossbow_03);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2011;
};

FUNC VOID Rtn_start_2011 ()
{
	TA_SmallTalk	(06,00,15,00,"STADT_MARKT_00"); 
	TA_SmallTalk	(15,00,22,00,"STADT_UNTEN_01");
	TA_Sleep	(22,00,06,00,"B_HAUS1_02");
};

func void Rtn_Wald_2011 ()
	{
	TA_GuidePC		(08,00,20,00,"STADT_WEG_184");
	TA_GuidePC		(20,00,08,00,"STADT_WEG_184");
	};
	
func void Rtn_Mine_2011 ()
	{
	TA_GuidePC	(08,00,20,00,"ZAM_20");
	TA_GuidePC	(20,00,08,00,"ZAM_20");
	};
	
func void Rtn_Front_2011 ()
	{
	TA_Guard	(08,00,20,00,"ZAM_20");
	TA_Guard	(20,00,08,00,"ZAM_20");
	};