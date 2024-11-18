instance DIC_2306_Feldarbeiter (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Feldarbeiter";
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	2;
	id 			=	2306;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",78 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self, ItFoRice,4);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
		EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2306;
	};

FUNC VOID Rtn_start_2306 ()
	{
	TA_Stand		(20,40,07,40,"SF_BHOF1_30");
	TA_StandAround	(07,40,20,40,"SF_BHOF1_26");
	};
