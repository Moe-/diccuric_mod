instance DIC_2022_Arbeiter (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Arbeiter";
	npctype		=	npctype_main;
	guild 		=	GIL_Stt;      
	level 		=	2;
	voice 		=	6;
	id 			=	2022;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",3 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self, ItFoRice,5);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2022;
	};

FUNC VOID Rtn_start_2022 ()
	{
	TA_Sleep	(22,00,06,00,"HHUETTEM06_EINGANG");
	TA_Smalltalk	(06,00,22,00,"STADT_WEG_095");
	};