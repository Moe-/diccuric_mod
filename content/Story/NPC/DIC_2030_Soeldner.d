instance DIC_2030_Soeldner (Npc_Default)
	{
	//-------- primary data --------
	
	name 		= 	"Söldner";
	npctype		= 	NPCTYPE_FRIEND;
	guild 		=	GIL_Sld;
	level 		=	20;
	voice		=	5;
	id 			=	2030;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 85;
	attribute[ATR_DEXTERITY] 	= 75;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 225;
	attribute[ATR_HITPOINTS] 	= 225;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 14, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW, 2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Axe_Heavy_02);
	EquipItem	(self, ItRw_Crossbow_03);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2030;
	};

FUNC VOID Rtn_start_2030 ()
	{
	TA_Guard	(06,00,15,00,"B_20"); 
	TA_StandAround	(15,00,22,00,"B_20");
	TA_Sleep	(22,00,06,00,"B_20");
	};

func void Rtn_Scavs_2030 ()
	{
	TA_Guard		(08,00,20,00,"STADT_WEG_152");
	TA_Guard		(20,00,08,00,"STADT_WEG_152");
	};


func void Rtn_Weiter_2030 ()
	{
	TA_GuidePC		(08,00,20,00,"ZUM_REISFELD_04");
	TA_GuidePC		(20,00,08,00,"ZUM_REISFELD_04");
	};