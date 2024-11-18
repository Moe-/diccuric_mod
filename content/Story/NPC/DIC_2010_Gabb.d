instance DIC_2010_Gabb (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Gabb";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Grd;
	level 		=	18;
	voice		=	9;
	id 			=	2010;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Fighter", 11, 1, GRD_ARMOR_H);
        
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
	daily_routine = Rtn_start_2010;
};

FUNC VOID Rtn_start_2010 ()
{
	TA_GuardPatrol (06,00,21,00,"STADT_WEG_084"); 
	TA_GuardPatrol (21,00,06,00,"STADT_WEG_020"); 
};