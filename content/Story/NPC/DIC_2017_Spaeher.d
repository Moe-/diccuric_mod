instance DIC_2017_Spaeher (Npc_Default)
	{
	//-------- primary data --------
	
	name =							"Späher";
	guild =							GIL_NONE;      
	level =							2;
	flags =							0;
	
	voice =							9;
	id =							2017;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Thief", 4, 1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem	(self, ItMw_1H_Mace_War_03);
	CreateInvItem (self, Notizblock);
	CreateInvItem (self, TeleportRune);
	//CreateInvItem (self, AnkunftRuneInAkt);
	CreateInvItem (self, AnkunftRune);
	CreateInvItem (self, Teleport_Des);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2017;
	};

FUNC VOID Rtn_start_2017 ()
	{
	TA_Stand	(20,00,07,00,"FOREST01_17");
	TA_Stand	(07,00,07,20,"FOREST01_17");
	TA_Stand	(07,20,20,00,"FOREST01_17");
	};