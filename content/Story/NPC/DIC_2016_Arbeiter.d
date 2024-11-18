instance DIC_2016_Arbeiter (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Arbeiter";
	npctype		=	npctype_main;
	guild 		=	GIL_Stt;      
	level 		=	2;
	voice 		=	4;
	id 			=	2016;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",5 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self, ItFoRice,5);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2016;
	};


FUNC VOID Rtn_start_2016 ()
{
	TA_SitAround	(06,00,15,00,"SHUETTE4_01"); 
	TA_StandAround	(15,00,16,00,"SHUETTE4_01");
	TA_SitAround	(16,00,24,00,"SHUETTE4_01");
	TA_Sleep		(24,00,06,00,"HHUETTEM07_EINGANG");
};

FUNC VOID Rtn_Rampe_2016 ()
	{
	TA_Sleep		(23,00,06,00,"HHUETTEM07_EINGANG");
	TA_Smalltalk	(06,00,23,00,"RAMPE_07");
	};

FUNC VOID Rtn_Zahnrad_2016()
{
	TA_Stand		(08,00,20,00,"RAMPE_02");
	TA_Stand		(20,00,08,00,"RAMPE_02");
};


FUNC VOID Rtn_schneller_2016()
{
	TA_GuidePC		(08,00,20,00,"RAMPE_02");
	TA_GuidePC		(20,00,08,00,"RAMPE_02");
};


func void Rtn_Reparieren_2016 ()
	{
	TA_Stand		(11,00,23,00,"RAMPE_08R");
	TA_Stand		(23,00,11,00,"RAMPE_08R");
	};
	
FUNC VOID Rtn_Taliasan_2016 ()
	{
	TA_Sleep	(23,00,06,00,"HHUETTEM07_EINGANG");
	TA_Smalltalk		(06,00,23,00,"RAMPE_07");
	};
	
FUNC VOID Rtn_back_2016 ()
{
	TA_SitCampfire	(22,00,06,00,"STADT_UNTEN_04");
	TA_StandAround  (06,00,11,00,"STADT_WEG_050");
	TA_Smalltalk	(11,00,15,00,"STADT_UNTEN_04");
	TA_StandAround	(15,00,22,00,"STADT_WEG_050");
};
