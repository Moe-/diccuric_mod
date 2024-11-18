instance DIC_2006_Waechter (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Wächter Waschhaus";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Grd;
	level 		=	20;
	voice		=	7;
	id 			=	2006;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 2, GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);
	
	senses_range = 1000;
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2006;
};

FUNC VOID Rtn_start_2006 ()
	{
	TA_Guard	(06,00,21,00,"WASCHPLATZ_01"); 
	TA_Guard	(21,00,06,00,"WASCHPLATZ_06"); 
	};
	
func void Rtn_GeWechselt_2006 ()
	{
	TA_SitAround	(08,00,10,00,"B_HAUS1_01");
	TA_StandAround  (10,00,22,00,"B_HAUS1_00");
	TA_Sleep	(22,00,08,00,"B_HAUS1_00");
	};