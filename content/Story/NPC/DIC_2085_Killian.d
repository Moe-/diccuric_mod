instance DIC_2085_Killian (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Jäger";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					8;

	
	voice =					13;
	id =					2085;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  4, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems (self, ItMiNugget, 30);
	CreateInvItems (self, ItFoRice,5);
	CreateInvItems (self, ItFoBooze, 4);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	
	EquipItem (self, ItMw_1H_Mace_02);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2085;
	};

FUNC VOID Rtn_start_2085 ()
{
    TA_SitAround			(06,00,18,00,"SUMPF_BERG_50");
    TA_SitAround			(18,00,22,00,"SUMPF_BERGHUT");
	TA_Sleep				(22,00,06,00,"SUMPF_BERGHUT");
};







