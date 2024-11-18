instance DIC_2350_Magier (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Magier";
	npctype		=	npctype_ambient;
	guild 		=	GIL_KdW;      
	level 		=	26;
	voice 		=	5;
	id 			=	2350;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 90;
	attribute[ATR_MANA] 		= 90;
	attribute[ATR_HITPOINTS_MAX]= 352;
	attribute[ATR_HITPOINTS] 	= 352;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Pony", 7,  0,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;	
			
	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- Spells --------        
	CreateInvItem (self,ItArRuneChainlightning);
	
	//-------- inventory --------                                    

	CreateInvItem (self, ItFo_Potion_Health_03);
	CreateInvItems (self, ItFo_Potion_Mana_02,2);
	EquipItem (self, Lebensamulett);
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_2350;

	//--------------- //MISSIONs----------------

};

FUNC VOID Rtn_start_2350 ()
{
	TA_Walk					(23,00,06,00,"STADT_MITTE_024");
	TA_PracticeMagic		(06,00,23,00,"STADT_MITTE_024");
};

