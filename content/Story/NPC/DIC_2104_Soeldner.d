instance DIC_2104_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"S�ldner";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_Sld;
	level 		=	17;
	voice		=	8;
	id 			=	2104;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 2,SLD_ARMOR_M);
        
	B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);	
			
	//-------- inventory --------
	// k.A. wieviel Sachen er dabeihaben darf/soll
	EquipItem (self,ItMw_2H_Sword_Old_01 );
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 20);
	CreateInvItems (self, ItLsTorch,2);
	CreateInvItems (self, ItFo_Potion_Health_02,2);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2104;
};

FUNC VOID Rtn_start_2104 ()
{
	// Mu� ver�ndert werden!!
	TA_StandAround	(06,00,21,00,"STADT_WEG_135"); 
	TA_Sleep	(21,00,06,00,"SHUETTE304_EINGANG"); 
};