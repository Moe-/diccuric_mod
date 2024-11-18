instance DIC_2007_Schneider (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Taylor";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	16;
	voice		=	11;
	id 			=	2007;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 16, 1, NOV_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2007;
};

FUNC VOID Rtn_start_2007 ()
{
	TA_SitAround	(06,00,12,00,"SHUETTE202_EINGANG");
	TA_SmallTalk	(12,00,20,00,"STADT_UNTEN_00");
	TA_StandAround	(20,00,21,00,"SHUETTE202_EINGANG");
	TA_SitAround	(21,00,23,00,"SHUETTE202_EINGANG");
	TA_Sleep		(23,00,06,00,"SHUETTE202_EINGANG"); 
};