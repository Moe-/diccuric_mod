instance SLD_61_Remember (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Soeldner;
	Npctype =				NPCTYPE_AMBIENT;
	guild =					GIL_NONE;      
	level =					8;
    voice =					11;
	id =					2161;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	senses_range	=	1000;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, SLD_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,3);		
	CreateInvItems(self, ItMiNugget, 15);
	CreateInvItems (self, ItFoRice,9);
	CreateInvItems (self, ItFoBooze, 7);
	CreateInvItems (self, ItLsTorch, 3);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2161;
};

FUNC VOID Rtn_see_2161 ()
	{
	TA_JungeAbfangen	(00,00,08,00,"ZUM_REISFELD_16");
	TA_JungeAbfangen	(08,00,00,00,"ZUM_REISFELD_16");
	};

func void Rtn_Folgen_2161 ()
	{
	TA_FollowPc		(00,00,08,00,"ZUM_REISFELD_16");
	TA_FollowPc 		(08,00,00,00,"ZUM_REISFELD_16");
	};

FUNC VOID Rtn_start_2161 ()
{
	TA_GuardWheelOpen		(07,55,19,55, "B_39");
	TA_GuardWheelOpen		(19,55,07,55, "B_39");
};