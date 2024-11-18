instance DIC_2009_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Rotrou";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	16;
	voice		=	14;
	id 			=	2009;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 30;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 100;
	attribute[ATR_HITPOINTS] 	= 100;

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
	
	EquipItem	(self, RotrouSchwert);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	CreateInvItem	(self, Gluecksbringer);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2009;
};

FUNC VOID Rtn_start_2009 ()
{
	TA_Guard	(06,00,21,00,"SEE_VOR_STADT_56"); 
	TA_Guard	(21,00,06,00,"SEE_VOR_STADT_56"); 
};