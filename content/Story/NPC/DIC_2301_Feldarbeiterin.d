instance DIC_2301_Feldarbeiterin (Npc_Default)
	{
	//-------- primary data --------
	name 		=		"Feldarbeiter";
	Npctype 	=		Npctype_Ambient;
	guild 		=		GIL_BAU;
	level 		=		6;
	voice 		=		16;
	id 			=		2301;
	
	flags		= NPC_FLAG_IMMORTAL;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	24;
	attribute[ATR_DEXTERITY] 		=	13;
	attribute[ATR_MANA_MAX] 		=	12;
	attribute[ATR_MANA] 			=	12;
	attribute[ATR_HITPOINTS_MAX] 	=	132;
	attribute[ATR_HITPOINTS] 		=	132;


	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",10 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- inventory --------
	CreateInvItems	(self, ItMiNugget,	15);
	CreateInvItems	(self, ItFoRice,	5);
	CreateInvItems	(self, ItFoBooze,	3);
	CreateInvItems	(self, ItMiJoint_1,	1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_2301;
	};

FUNC VOID Rtn_Start_2301 ()
	{
    TA_Pick	 	(08,00,23,00,"BHOF1_FELD1_00");
    TA_Stand			(23,00,08,00,"SF_BHOF1_35");
	};
