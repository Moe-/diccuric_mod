instance DIC_2357_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					"S�ldner";
	Npctype =				Npctype_Ambient;
	guild =					GIL_Stt;   
	level =					10;
	
	voice =					3;
	id =					2357;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1 ,"Hum_Head_FatBald", 77 , 0, GRD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	//Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    
	EquipItem		(self, ItMw_1H_Sword_Long_01);
	EquipItem		(self, ItRw_Bow_Small_02);
	CreateInvItems	(self, ItAmArrow, 20);
	CreateInvItems	(self, ItFoRice,8);
	CreateInvItems	(self, ItFoLoaf,5);
	CreateInvItems	(self, ItFoMutton,4);
	CreateInvItems	(self, ItMiNugget, 25);
	CreateInvItems	(self, ItFoBooze,5);
	CreateInvItems	(self, ItLsTorch,5);
	CreateInvItems	(self, ItFo_Potion_Health_02,10);
	

		
	//------------- ai -------------
	daily_routine	=	Rtn_start_2357;
	//fight_tactic	=	FAI_HUMAN_MASTER; 
	senses			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_2357 ()
{
	TA_Teaching		  		(08,00,20,00,"STADTHUET02_02");
	TA_Sleep				(20,00,08,00,"HHUET04_EINGANG");
};






