instance DIC_2043_Slap (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Slap";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_Grd;      
	level 		=	5;
	voice 		=	4;
	id 			=	2043;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 13;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 75;
	attribute[ATR_HITPOINTS] 	= 75;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald",45 , 1, -1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	                            	
	//-------- Talente -------- 	                                  

	
	//-------- inventory --------                                    

		
	EquipItem (self, ItMw_1H_Sickle_01);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItems (self, ItFoRice,4);
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2043;
	};

FUNC VOID Rtn_start_2043 ()
	{
	TA_StandAround	(08,00,20,00,"B_05");
	TA_StandAround	(20,00,08,00,"B_05");
	};