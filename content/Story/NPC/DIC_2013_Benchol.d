instance DIC_2013_Benchol (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Benchol";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Grd;
	level 		=	10;
	voice		=	7;
	id 			=	2013;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 125;
	attribute[ATR_HITPOINTS] 	= 125;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Fighter", 12, 1, SLD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_War_03);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2013;
};

FUNC VOID Rtn_start_2013 ()
	{ 
	TA_StandAround	(06,00,15,00,"SHUETTE4_03");
	TA_SitAround	(15,00,19,00,"SHUETTE4_02");
	TA_StandAround	(19,00,21,00,"SHUETTE4_03");
	TA_Sleep	(21,00,06,00,"HBARACKE_2"); 
	};