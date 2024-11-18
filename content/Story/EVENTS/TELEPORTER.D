// ------- Teleporterscripte für Diccurice -------------- 
	
func void MP_FREE () 
{ 
	Wld_SendUnTrigger ("MP01_GUARD");
	Wld_SendUnTrigger ("MP02_GUARD");
	Wld_SendUnTrigger ("MP03_GUARD");
	Wld_SendUnTrigger ("MP04_GUARD");
	Wld_SendUnTrigger ("MP05_GUARD");
	Wld_SendUnTrigger ("MP06_GUARD");
	MPPATH = 0;
};

func void MP_NOTFREE ()
{
	Wld_SendTrigger ("MP01_GUARD");
	Wld_SendTrigger ("MP02_GUARD");
	Wld_SendTrigger ("MP03_GUARD");
	Wld_SendTrigger ("MP04_GUARD");
	Wld_SendTrigger ("MP05_GUARD");
	Wld_SendTrigger ("MP06_GUARD");
	Snd_Play 	("DEM_AMBIENT_A2");
};

func void CLOSED_PATH ()
	{
		MP_NOTFREE ();
		if MPPATH < (self.attribute [ATR_HITPOINTS] + 10)
		&& ((MP_CONT & 2) != 2)
			{
			//PrintScreen	("Vorsicht", -1,-1,"font_old_20_white.tga",3);
			MP_CONT = MP_CONT | 1;
			MPPATH = self.attribute [ATR_HITPOINTS] + 10;
			}
		else if (MP_CONT & 2) != 2
			{
			//PrintScreen	("auaaa", -1,-1,"font_old_20_white.tga",3);
			MP_CONT = MP_CONT | 2;
			MPPATH = 0;
			};
	};


func void MP01 () 
{ 
	if (Npc_HasItems(self,Amulett_Leo)>=1)
		{
		MP_FREE ();
		MPPATH=1;
		}
	else
		{
		CLOSED_PATH ();
		};
};              
                
func void MP02 () 
{               
	if (Npc_HasItems(self,Amulett_Capricorn)>=1)
		{
		MP_FREE ();	
		MPPATH=2;
		}
	else
		{
		CLOSED_PATH();
		};
};


func void MP03 () 
{               
	if (Npc_HasItems(self,Amulett_Gemini)>=1)
		{
		MP_FREE ();	
		MPPATH=3;
		}
	else
		{
		CLOSED_PATH ();
		};
};


func void MP04 () 
{               
	if (Npc_HasItems(self,Amulett_Tarus)>=1)
		{
		MP_FREE ();	
		MPPATH=4;
		}
	else
		{
		CLOSED_PATH ();
		};
};


func void MP05 () 
{               
	if (Npc_HasItems(self,Amulett_Pisces)>=1)
		{
		MP_FREE ();	
		MPPATH=5;
		}
	else
		{
		CLOSED_PATH ();
		};
};


func void MP06 () 
{               
	if (Npc_HasItems(self,Amulett_Aquarius)>=1)
		{
		MP_FREE ();	
		MPPATH=6;
		}
	else
		{
		CLOSED_PATH ();
		};
};




func void MAGICPORTER () 
{ 

	if (MPPATH > 0)
	&& (MPPATH < 11)
	&& ((MP_CONT & 32) !=32)
		{
		MP_CONT = MP_CONT | 4;
		};
		
	if (MPPATH ==1)
	{ 
		MPPATH=0;
		AI_Teleport	(self, "FP_MP01");
		Snd_Play 	("DROWN");
	};
	
	if (MPPATH ==2)
	{ 
		MPPATH=0;
		AI_Teleport	(self, "FP_MP02");
		Snd_Play 	("DROWN");
	};
	
	if (MPPATH ==3)
	{ 
		MPPATH=0;
		AI_Teleport	(self, "FP_MP03");
		Snd_Play 	("DROWN");
	};
	
	if (MPPATH ==4)
	{ 
		MPPATH=0;
		AI_Teleport	(self, "FP_MP04");
		Snd_Play 	("DROWN");
	};
	
	if (MPPATH ==5)
	{ 
		MPPATH=0;
		AI_Teleport	(self, "FP_MP05");
		Snd_Play 	("DROWN");
	};
	
	if (MPPATH ==6)
	{ 
		MPPATH=0;
		AI_Teleport	(self, "FP_MP06");
		Snd_Play 	("DROWN");
	};
		
};
