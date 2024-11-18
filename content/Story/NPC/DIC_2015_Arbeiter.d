instance DIC_2015_Arbeiter (Npc_Default)
	{
	//-------- primary data --------
	
	name =							"Zubov";
	guild =							GIL_Stt;      
	level =							2;
	flags =							0;
	
	voice =							9;
	id =							2015;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 110, 1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2015;
	};


FUNC VOID Rtn_start_2015 ()
{
	TA_SitAround	(06,00,15,00,"SHUETTE4_06"); 
	TA_StandAround	(15,00,16,00,"SHUETTE4_06");
	TA_SitAround	(16,00,24,00,"SHUETTE4_06");
	TA_Sleep		(24,00,06,00,"HHUETTEM10_EINGANG");
};

FUNC VOID Rtn_Rampe_2015 ()
	{
	TA_Smalltalk	(06,00,23,00,"RAMPE_05");		
	TA_Sleep		(23,00,06,00,"HHUETTEM10_EINGANG");
	};

FUNC VOID Rtn_Zahnrad_2015()
{
	TA_GuidePC		(08,00,20,00,"RAMPE_02");
	TA_GuidePC		(20,00,08,00,"RAMPE_02");
};


func void Rtn_Reparieren_2015 ()
	{
	TA_Stand		(11,00,23,00,"RAMPE_08L");
	TA_Stand		(23,00,11,00,"RAMPE_08L");
	};
	
FUNC VOID Rtn_taliasan_2015 ()
	{
	TA_Smalltalk	(06,00,23,00,"RAMPE_05");		
	TA_Sleep		(23,00,06,00,"HHUETTEM10_EINGANG");
	};
	
FUNC VOID Rtn_back_2015 ()
{
	TA_SitCampfire	(22,00,06,00,"STADT_UNTEN_04");
	TA_StandAround  (06,00,11,00,"STADT_WEG_050");
	TA_Smalltalk	(11,00,15,00,"STADT_UNTEN_04");
	TA_StandAround	(15,00,22,00,"STADT_WEG_050");
};
