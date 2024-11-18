instance DIC_2502_Leofwin (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Leofwin";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_SLD;
	level 		=	16;
	voice		=	14;
	id 		=	2502;
	flags		=	NPC_FLAG_IMMORTAL;	
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 13, 1, SLD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- ai --------
   	self.aivar[AIV_IMPORTANT] 	= TRUE;
   	aivar[AIV_TALKBEFOREATTACK] 	= TRUE;

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
	daily_routine = Rtn_start_2502;
};

FUNC VOID Rtn_start_2502 ()
{
	TA_SitAround	(07,00,23,00,"HHUET09_WANZE"); 
	TA_Sleep	(23,00,07,00,"HHUET09_WANZE"); 

};

FUNC VOID Rtn_patroul_2502 ()
{
	TA_Smalltalk	(06,30,07,00,"STADT_UNTEN_01");
	TA_Smalltalk	(07,00,09,00,"ZAM_22"); 
	TA_Smalltalk	(09,00,10,40,"STADT_UNTEN_01");
	TA_Smalltalk	(10,40,14,00,"ZAM_22");
	TA_Smalltalk	(14,00,16,00,"STADT_UNTEN_01");
	TA_Smalltalk	(16,00,18,00,"ZAM_22");
	TA_SitAround	(18,00,21,00,"STADT_UNTEN_01");
	TA_Smalltalk	(21,00,23,00,"STADT_UNTEN_01");
	TA_Sleep	(23,00,06,30,"HHUET09_WANZE");
};