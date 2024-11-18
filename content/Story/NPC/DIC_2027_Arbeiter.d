instance DIC_2027_Arbeiter (Npc_Default)
	{
	//-------- primary data --------
	
	name =							"Arbeiter";
	guild =							GIL_Stt;      
	level =							5;
	flags =							0;
	
	voice =							2;
	id =							2027;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	125;
	attribute[ATR_HITPOINTS] =		125;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,0,"Hum_Head_Thief", 8, 1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	EquipItem	(self, ItMw_1H_Sword_03);	
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2027;
	};

FUNC VOID Rtn_start_2027 ()
	{	
	TA_SitAround	(08,00,10,00,"HHUETTK03_EINGANG");
	TA_StandAround  (10,00,22,00,"HHUETTK03_EINGANG");
	TA_Sleep	(22,00,08,00,"HHUETTK03_EINGANG"); 
	};