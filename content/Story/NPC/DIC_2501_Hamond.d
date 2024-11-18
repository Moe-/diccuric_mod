instance DIC_2501_Hamond (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Hamond";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	16;
	voice		=	13;
	id 			=	2501;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 75;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 12, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2501;
};

FUNC VOID Rtn_start_2501 ()
{
	TA_Stay	(06,00,21,00,"HHUET09_WANZE"); 
	TA_Stay	(06,00,21,00,"HHUET09_WANZE"); 
};

FUNC VOID Rtn_patroul_2501 ()
{
	TA_Smalltalk	(06,30,07,00,"STADT_UNTEN_01");
	TA_Smalltalk	(07,00,09,00,"ZAM_22"); 
	TA_Smalltalk	(09,00,10,40,"STADT_UNTEN_01");
	TA_Smalltalk	(10,40,14,00,"ZAM_22");
	TA_Smalltalk	(14,00,16,00,"STADT_UNTEN_01");
	TA_Smalltalk	(16,00,18,00,"ZAM_22");
	TA_SitAround	(18,00,21,00,"STADT_UNTEN_01");
	TA_Smalltalk	(21,00,23,00,"STADT_UNTEN_01");
	TA_Sleep	(23,00,06,30,"HHUET10_EINGANG");
};