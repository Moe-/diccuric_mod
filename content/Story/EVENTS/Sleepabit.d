// ************************** 
//  Held wieder regenerieren 
// ************************** 
func void HeldRegenerieren () 
{ 
     hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HPLost; 
     hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX]; 
      
     // -- Freischläge je nach level generrieren -- 
     var int FSTemp; 
     FSTemp = 0; 
     FSTemp = FSTemp - ((hero.attribute[ATR_HITPOINTS_MAX] / 2) + 50); 
      
     HPCounter = (FSTemp - 40); 
     HPLost = 0; 
      
     hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] + MPLost;      
     hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX]; 
     MPCounter = (FSTemp / 10);  // hier anders da mehr Schaden angerichtet wird 
     MPLost = 0; 
      
     hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + SPLost;      
     SPCounter = FSTemp; 
     SPLost = 0; 
      
     hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] + GPLost;      
     GPCounter = FSTemp; 
     GPLost = 0; 
     
     VielEssenAufheben ();
}; 


//****************************
// 		PC_Sleep 
//****************************

func void PC_Sleep (var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if	(Wld_IsTime(00,00,t,00))	
	{
		Wld_SetTime	(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime	(t,00);
	};

	if(Bedroll_Used)
	{
		// Bedroll wieder zurücksetzen
		Bedroll_Used = 0;
		AI_StandUp(self);
	};

	PrintScreen	("Du hast geschlafen und bist ausgeruht!", -1,-1,"font_old_20_white.tga",3);
	HeldRegenerieren();
	//hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	//hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];	

	//-------- AssessEnterRoom-Wahrnehmung versenden --------
	PrintGlobals		(PD_ITEM_MOBSI);
	Npc_SendPassivePerc	(hero,	PERC_ASSESSENTERROOM, NULL, hero);		//...damit der Spieler dieses Feature nicht zum Hütteplündern ausnutzt!
};



func void SLEEPABIT_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	    //WICHTIG: Damit nicht immer die Menupunkte vom Labor
		//         dazwischen rumgurken! 
	    use_Lab=FALSE;
	    LaborBenutzt = 0;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
	
};

	




//-------------------- Gar nicht schlafen -------------------------

INSTANCE PC_NoSleep (c_Info)

{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_NoSleep_Condition;
	information		= PC_NoSleep_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_NoSleep_Condition()
{		
	if(use_Lab==FALSE && start_cs == FALSE && LaborBenutzt == 0)
	{
	 return 1;
    };
};

func VOID PC_NoSleep_Info()
{
	AI_StopProcessInfos (self);
	self.aivar[AIV_INVINCIBLE]=FALSE;

	// Bedroll wieder zurücksetzen
	Bedroll_Used = 0;
	
	if (SchlafImSchlafsack == 1)
			{
			AI_StandUpQuick (hero);
			//B_FullStop (hero);
			};
	
		
};

//---------------------- morgens --------------------------------------

INSTANCE PC_SleepTime_Morning (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Morning_Condition;
	information		= PC_SleepTime_Morning_Info;
	important		= 0;
	permanent		= 1;
	description		= "Bis zum nächsten Morgen schlafen"; 
};

FUNC INT PC_SleepTime_Morning_Condition()
{		
	if(use_Lab==FALSE && start_cs == FALSE  && LaborBenutzt == 0)
	{
	 return 1;
    };
};

func void PC_SleepTime_Morning_Info ()
{
	PC_Sleep (8);	// SN: geändert, da um 7 Uhr noch keiner der NSCs wach ist!
	
	if (SchlafImSchlafsack == 1)
			{
			NaechtlicherUeberfall();
			};
};

//--------------------- mittags -----------------------------------------

INSTANCE PC_SleepTime_Noon (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Noon_Condition;
	information		= PC_SleepTime_Noon_Info;
	important		= 0;
	permanent		= 1;
	description		= "Bis Mittags schlafen"; 
};

FUNC INT PC_SleepTime_Noon_Condition()
{		
	if(use_Lab==FALSE && start_cs == FALSE  && LaborBenutzt == 0)
	{
	 return 1;
    };
};

func void PC_SleepTime_Noon_Info ()
{
	PC_Sleep (12);
	
	if (SchlafImSchlafsack == 1)
			{
			NaechtlicherUeberfall();
			};
};

//---------------------- abend --------------------------------------

INSTANCE PC_SleepTime_Evening (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Evening_Condition;
	information		= PC_SleepTime_Evening_Info;
	important		= 0;
	permanent		= 1;
	description		= "Bis zum nächsten Abend schlafen"; 
};

FUNC INT PC_SleepTime_Evening_Condition()
{		
	if(use_Lab==FALSE && start_cs == FALSE  && LaborBenutzt == 0)
	{
	 return 1;
    };
};

func void PC_SleepTime_Evening_Info ()
{
	PC_Sleep (19);
	
	if (SchlafImSchlafsack == 1)
			{
			NaechtlicherUeberfall();
			};
};

//------------------------ nacht -----------------------------------------

instance PC_SleepTime_Midnight (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_SleepTime_Midnight_Condition;
	information		= PC_SleepTime_Midnight_Info;
	important		= 0;
	permanent		= 1;
	description		= "Bis Mitternacht schlafen"; 
};

FUNC INT PC_SleepTime_Midnight_Condition()
{		
	if(use_Lab==FALSE && start_cs == FALSE  && LaborBenutzt == 0)
	{
	 return 1;
    };
};

func VOID PC_SleepTime_Midnight_Info()
{
	PC_Sleep (0);	
	
	if (SchlafImSchlafsack == 1)
			{
			NaechtlicherUeberfall();
			};
};