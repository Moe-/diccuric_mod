instance DIC_2101_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Söldner";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	17;
	voice		=	13;
	id 			=	2101;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 30;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 120;
	attribute[ATR_HITPOINTS] 	= 120;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 2,SLD_ARMOR_M);
        
	B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	// k.A. wieviel Sachen er dabeihaben darf/soll
	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 23);
	CreateInvItems (self, ItFoBooze,5);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,8);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2101;
};

FUNC VOID Rtn_start_2101 ()
{
	// Muß verändert werden!!
	TA_Stand	(06,00,21,00,"STADT_WEG_049"); 
	TA_WalkAround	(21,00,06,00,"STADT_WEG_049"); 
};