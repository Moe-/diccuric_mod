instance DIC_2102_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Söldner";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	17;
	voice		=	5;
	id 			=	2102;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 30;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 110;
	attribute[ATR_HITPOINTS] 	= 110;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 49, 1,SLD_ARMOR_M);
        
	B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);	
			
	//-------- inventory --------
	// k.A. wieviel Sachen er dabeihaben darf/soll
	EquipItem (self, ItMw_1H_Mace_War_03);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 23);
	CreateInvItems (self, ItFoBooze,5);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,2);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2102;
};

FUNC VOID Rtn_start_2102 ()
{
	// Muß verändert werden!!
	TA_SitAround	(06,00,22,00,"STADT_WEG_104A"); 
	TA_Sleep	(22,00,06,00,"HHUETTEM04_EINGANG"); 
};