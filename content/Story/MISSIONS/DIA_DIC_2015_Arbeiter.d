//------------ ENDE -----------------
instance DIA_DIC_Arbeiter_2015_Exit (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 999;
	condition = DIA_DIC_Arbeiter_2015_Exit_Condition;
	information = DIA_DIC_Arbeiter_2015_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Arbeiter_2015_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Arbeiter_2015_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	ReparierenVor = Hlp_Random (16);
	if (RampeRepariert < 5)
		{
		RampeRepariert = 0;
		};
	};


// Alex Script

// ************************************************************
// 							Austauschplatzmission
// ************************************************************



// ---------------- Nachts nicht -------------------

INSTANCE DIA_2015_Arbeiter_RampeRepNacht (C_INFO)
{
	npc			= DIC_2015_Arbeiter;
	nr			= 2;
	condition	= DIA_2015_Arbeiter_RampeRepNacht_Condition;
	information	= DIA_2015_Arbeiter_RampeRepNacht_Info;
	permanent	= 0;
	description = "Rampe reparieren...";
};

FUNC INT DIA_2015_Arbeiter_RampeRepNacht_Condition()
{
	if (DC_3_AP)
	&& (Npc_HasItems(other,DC_GearWheel_AP)>=1)
	&& (!Npc_KnowsInfo(hero, ZR_59_GoZR))
	&& (Wld_IsTime(21,00,06,00))
	
	{

		return 1;
	};
};

FUNC VOID DIA_2015_Arbeiter_RampeRepNacht_Info()
{

	AI_Output (other,self,"ZR_59_GoZR_15_00"); //Bist du einer der Arbeiter die die Rampe reparieren sollen?
	AI_Output (self,other,"DIA_2015_Arbeiter_RampeRepNacht_09_01"); //Ja, aber im dunkeln machen wir das nicht. Komm am Tag wieder.
};



INSTANCE ZR_59_GoZR (C_INFO)
{
	npc			= DIC_2015_Arbeiter;
	nr			= 2;
	condition	= ZR_59_GoZR_Condition;
	information	= ZR_59_GoZR_Info;
	permanent	= 0;
	description = "Rampe reparieren...";
};

FUNC INT ZR_59_GoZR_Condition()
{
	if (DC_3_AP)
	&& (Npc_HasItems(other,DC_GearWheel_AP)>=1)
	&& (Wld_IsTime(06,00,21,00))
	
	{

		return 1;
	};
};

FUNC VOID ZR_59_GoZR_Info()
{
	var C_NPC Worker;
	Worker = Hlp_GetNpc(DIC_2016_ARBEITER);
	AI_GotoNpc(Worker,self);
	
	if (Npc_KnowsInfo(hero, DIA_2015_Arbeiter_RampeRepNacht))
		{
		AI_Output (other,self,"ZR_59_GoZRTag_15_00"); //Kann es nun los gehen?
		}
	else
		{	
		AI_Output (other,self,"ZR_59_GoZR_15_00"); //Bist du einer der Arbeiter die die Rampe reparieren sollen?
		};
		
	AI_Output (self,other,"ZR_59_GoZR_09_01"); //Ja. Mein Kumpel und ich sind dafür zuständig. Wie ich sehe hast du das Zahnrad schon abgeholt. Dann also los.

	if(Npc_KnowsInfo(hero,ZR_60_GoZR))  // Harri - war die falsche info
	{
		AI_Output (other,self,"ZR_59_GoZR_15_02"); //Aber dein Kumpel hat gesagt, er hat keine Lust?
		AI_Output (self,other,"ZR_59_GoZR_09_03"); //Er hat nie Lust. Glaub mir, er kommt mit, weil er weiß was sonst passiert...
	};

	//AI_Output (self,Worker,"ZR_59_GoZR_09_04"); //Los! Komm jetzt!
	//AI_Output (Worker,self,"ZR_59_GoZR_09_05"); //Jaja.. bin ja schon da...
	B_LogEntry (GY_PR_1, "Ich bin mit den Arbeitern los, um die Rampe zu reparieren.");
	                                        
	Npc_ExchangeRoutine	(Worker,"ZAHNRAD");
	AI_SetWalkmode 		(Worker, NPC_RUN);  
	ai_Continueroutine	(Worker);
	Npc_ExchangeRoutine	(self,"ZAHNRAD");
	AI_StopProcessInfos	(self);
	
};


// ************************************************************
// 							Austauschplatz angekommen
// ************************************************************
//
//INSTANCE ZR_59_AP (C_INFO)
//{
//	npc			= DIC_2015_Arbeiter;
//	nr			= 3;
//	condition	= ZR_59_AP_Condition;
//	information	= ZR_59_AP_Info;
//	permanent	= 0;
//	important	= 1;
//	//description = "Aufzug reparieren...";
//};
//
//FUNC INT ZR_59_AP_Condition()
//{
//	if(DC_3_AP)
//	&&(Npc_GetDistToWP(self,"WP_INTRO_WI07")<300)
//	{
//		return 1;
//	};
//};
//
//FUNC VOID ZR_59_AP_Info()
//{
//
//	var C_NPC Worker2;
//	Worker2 = Hlp_GetNpc(DIC_2016_ARBEITER);
//
//	AI_GotoNpc(DIC_2016_ARBEITER,self);
//
//	AI_Output (self,other,"ZR_59_AP_04_00"); //Da die Welt und die scripts noch nicht soweit sind haben wir soebend den Aufzug repariert.
//	AI_Output (other,self,"ZR_59_AP_15_01"); //Und wie gehts jetzt weiter?
//	AI_Output (self,other,"ZR_59_AP_04_02"); //Naja, du bist bestimmt ganz schn muede.
//	AI_Output (self,other,"ZR_59_AP_04_03"); //Wir schlagen hier erstmal ein Nachtlager auf und morgen gehts weiter.
//	AI_Output (other,self,"ZR_59_AP_04_04"); //Nagut. Ihr werdet schon wissen, was zu tun ist.
//
//
//	// muï¿½raus!
//	Npc_RemoveInvItems(hero,DC_GEARWHEEL_AP,10);
//
//	//Aufgabe gelst
//	//DC_3_AP = 2;
//
//	//Npc_ExchangeRoutine(Worker2,"BACK");
//	//Npc_ExchangeRoutine(self,"BACK");
//	//Bild zeigen
//	//B_Kapitelwechsel(1);
//	//AI_StopProcessInfos(self);
//
//};
//
//INSTANCE ZR_59_NachtLager (C_INFO)
//{
//	npc			= DIC_2015_Arbeiter;
//	nr			= 4;
//	condition	= ZR_59_NachtLager_Condition;
//	information	= ZR_59_NachtLager_Info;
//	permanent	= 0;
//	important	= 0;
//	description = "Nachtlager aufschlagen...";
//};
//
//FUNC INT ZR_59_NachtLager_Condition()
//{
//	if(DC_3_AP)
//	//&&(Npc_KnowsInfo(hero,ZR_59_AP))
//	{
//		return 1;
//	};
//};
//
//FUNC VOID ZR_59_NachtLager_Info()
//{
//
//	var C_NPC Worker2;
//	Worker2 = Hlp_GetNpc(DIC_2016_ARBEITER);
//
//	//Leute schlafen legen
//	AI_PlayAni(hero,"T_STAND_2_SLEEPGROUND");
//	AI_PlayAni(DIC_2016_ARBEITER,"T_STAND_2_SIT");
//	AI_PlayAni(self,"T_STAND_2_SIT");
//
//	AI_Output (other,self,"ZR_59_NachtLager_Info_15_00"); //Test! Ich laber dich jetzt an!
//	AI_Output (other,self,"ZR_59_NachtLager_Info_15_01"); //HEHE Ja echt, ne?
//
//};

// Scripte von Markus Teil 2 und von mir -Harri

// --------------------- Der Andere fehlt - suchen gehen ----------------- der läst sich einfach nicht herteleportieren :(
instance DIA_DIC_2015_Arbeiter_alleine (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 1;
	condition = DIA_DIC_2015_Arbeiter_alleine_Condition;
	information = DIA_DIC_2015_Arbeiter_alleine_Info;
	permanent = 0;
	important = 1;
	};

func int DIA_DIC_2015_Arbeiter_alleine_Condition ()
	{
	if (Npc_GetDistToWP(self,"RAMPE_02")<400)
	&& (Npc_GetDistToNpc(self, DIC_2016_ARBEITER) > 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_2015_Arbeiter_alleine_Info ()
	{
	AI_Output (self, other, "DIA_DIC_2015_Arbeiter_alleine_09_00"); //Wo ist eigentlich der Andere abgeblieben?
	AI_Output (other, self, "STT_301_IAN_GEAR_RUN_Info_13_02"); //Ämm? Keine Ahnung.
	AI_Output (self, other, "DIA_DIC_2015_Arbeiter_alleine_09_02"); //Dann geh ihn suchen. Zu Zweit schaffen wir das nicht!
	};


// --------------------- An der Rampe angekommen -----------------
instance DIA_DIC_Arbeiter_2015_Angekommen (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 3;
	condition = DIA_DIC_Arbeiter_Angekommen_Condition;
	information = DIA_DIC_Arbeiter_Angekommen_Info;
	permanent = 0;
	important = 0;
	description = "Komm, wir reparieren jetzt die Rampe!";
	};

func int DIA_DIC_Arbeiter_Angekommen_Condition ()
	{
	if (Npc_GetDistToWP(self,"RAMPE_02")<400)
	&& (Npc_GetDistToNpc(self, DIC_2016_ARBEITER) < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Arbeiter_Angekommen_Info ()
	{
	AI_SetWalkmode 		(self,NPC_RUN);
	Npc_ExchangeRoutine	(DIC_2016_ARBEITER,"Rampe");
	ai_Continueroutine	(DIC_2016_ARBEITER);
	AI_Output (other, self, "DIA_DIC_Arbeiter_Angekommen_15_00"); //Das hier scheint die Rampe zu sein.
	AI_Output (self, other, "DIA_DIC_Arbeiter_Angekommen_09_01"); //Schlaues Bürschchen. Wir sind jetzt da.
	AI_Output (other, self, "DIA_DIC_Arbeiter_Angekommen_15_02"); //Okay, fangen wir an, die Rampe zu reparieren.
	AI_Output (self, other, "DIA_DIC_Arbeiter_Angekommen_09_03"); //Kleiner, du scheinst sehr motiviert zu sein. Gib mal das Zahnrad her. Ich werde es gleich einsetzen.
	B_GiveInvItems(other, self, DC_GEARWHEEL_AP, 1);
	AI_AlignToWP	(hero);
	AI_TurnToNpc	(hero,DIC_2015_ARBEITER);
	AI_GotoWP (self, "RAMPE_11");
	AI_TurnToNpc	(hero,DIC_2015_ARBEITER);
	AI_Wait	( self, 3 );
	
	B_LogEntry (GY_PR_1, "Wir sind an der Rampe. Nun sollten wir beginnen, sie zu reparieren.");
	
	Npc_ExchangeRoutine(self,"Rampe");	
	ReparierenVor = Hlp_Random(16);
	AI_StopProcessInfos (self);
	};
	
// --------------------- Auf die  Rampe -----------------
instance DIA_DIC_2015_Arbeiter_aufdieRampe (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 3;
	condition = DIA_DIC_2015_Arbeiter_aufdieRampe_Condition;
	information = DIA_DIC_2015_Arbeiter_aufdieRampe_Info;
	permanent = 0;
	important = 1;
	description = "Komm, wir reparieren jetzt die Rampe!";
	};

func int DIA_DIC_2015_Arbeiter_aufdieRampe_Condition ()
	{
	if(Npc_KnowsInfo(hero, DIA_DIC_Arbeiter_2015_Angekommen) && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
	{
		return 1;
		};
	};

func void DIA_DIC_2015_Arbeiter_aufdieRampe_Info ()
	{	
	AI_Output (self, other, "dia_dic_arbeiter_angekommen_09_04"); //Hmmm. Das Zahnrad war es nicht. Aber das Alte lassen wir hier, wir müssen dass nicht unnötig mit uns herumtragen.
	AI_Output (other, self, "dia_dic_arbeiter_angekommen_15_05"); //Wenn wir erfolglos zurückkehren, bekommen wir bestimmt Ärger mit Graveyarn...
	AI_Output (self, other, "dia_dic_arbeiter_angekommen_09_06"); //Du hast recht. Lass uns etwas anderes ausprobieren. Pass auf, wir gehen hoch zur Rampe und versuchen an den Ketten zu ziehen. Komm mit und sag mir, wenn du dazu bereit bist!
	AI_SetWalkmode 	(self, NPC_RUN); 
	AI_StopProcessInfos (self);
	B_GiveXP (125);
	
	// ---------------- 3 Befehle, die das testen erleichtern ---------------
	
	/*
	var string testArb;
	testArb = IntToString(ReparierenVor);
	PrintScreen	(testArb, -1,-1,"font_old_20_white.tga",3);
	*/
	
	};

// ------------------- Rampe reparieren ----------------------
instance DIA_DIC_Arbeiter_Seile (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 3;
	condition = DIA_DIC_Arbeiter_Seile_Condition;
	information = DIA_DIC_Arbeiter_Seile_Info;
	permanent = 0;
	important = 0;
	description = "Okay, wir können jetzt versuchen, die Rampe zu reparieren.";
	};

func int DIA_DIC_Arbeiter_Seile_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Arbeiter_2015_Angekommen) && RampeRepariert == 0)
	&& (Npc_GetDistToWp(self, "RAMPE_05") < 200) && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen))
	&& (Npc_GetDistToWP(DIC_2016_ARBEITER,"RAMPE_07")<200)
	
		{
		return 1;
		};
	};

func void DIA_DIC_Arbeiter_Seile_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Arbeiter_Seile_15_00"); //Okay, ich bin so weit. Wir können jetzt versuchen, die Rampe zu reparieren.
	AI_Output (self, other, "DIA_DIC_Arbeiter_Seile_09_01"); //Dann gehen wir jetzt zu den Ketten. Du gibst uns dann das Komando, ob wir links oder rechts ziehen sollen.
	Npc_ExchangeRoutine	(self,"REPARIEREN");
	Npc_ExchangeRoutine	(DIC_2016_ARBEITER,"REPARIEREN");
	ai_Continueroutine	(DIC_2016_ARBEITER);

	RampeRepariert = 1;
	RampDiagPerm = 1;
	AI_StopProcessInfos (self);
	
	};

//-------------- Nochmal versuchen -------------------------

instance DIA_DIC_2015_Arbeiter_Seileweiter (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 3;
	condition = DIA_DIC_2015_Arbeiter_Seileweiter_Condition;
	information = DIA_DIC_2015_Arbeiter_Seileweiter_Info;
	permanent = 1;
	important = 0;
	description = "Nochmal probieren.";
	};

func int DIA_DIC_2015_Arbeiter_Seileweiter_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Arbeiter_Seile) && RampeRepariert == 0)
	&& (Npc_GetDistToWp(self, "RAMPE_08") < 200 && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
	
		{
		return 1;
		};
	};

func void DIA_DIC_2015_Arbeiter_Seileweiter_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Arbeiter_Seile_15_00"); //Okay, ich bin so weit. Wir können jetzt versuchen, die Rampe zu reparieren.
	//AI_Output (other, self, "DIA_DIC_2015_Arbeiter_Seileweiter_15_00"); //Lass es uns nochmal versuchen.
	//AI_Output (self, other, "DIA_DIC_2015_Arbeiter_Seileweiter_09_01"); //In Ordnung. Wo sollen wir ziehen?
	RampeRepariert = 1;
	RampDiagPerm = 1;
	};




// ------------------- Links ziehen -------------------------
instance DIA_DIC_Arbeiter_Links (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 4;
	condition = DIA_DIC_Arbeiter_Links_Condition;
	information = DIA_DIC_Arbeiter_Links_Info;
	permanent = 1;
	important = 0;
	description = "Links.";
	};

func int DIA_DIC_Arbeiter_Links_Condition ()
	{
	if (RampeRepariert >= 1 && RampeRepariert < 5 && RampDiagPerm == 1 && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
		{
		return 1;
		};
	};

func void DIA_DIC_Arbeiter_Links_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Arbeiter_Links_15_00"); //Links.
	AI_AlignToWP	(self);
	AI_PlayAni (DIC_2015_Arbeiter,"T_ZIEHSEIL");
	AI_WaitTillEnd (hero, self);
	AI_TurnToNpc (self, hero);

	//Kleine Lsung fr das nun folgende Rï¿½sel: Binär von 0 bis 15 zï¿½len und dann 0=links und 1=rechts, Zahl zufällig erstellt
	// 4. mal richtig
	if (RampeRepariert == 4 && (ReparierenVor == 0 || ReparierenVor == 2 || ReparierenVor == 4 || ReparierenVor == 6
		|| ReparierenVor == 8 || ReparierenVor == 10 || ReparierenVor == 12 || ReparierenVor == 14))
		{
		RampeRepariert = RampeRepariert + 1;
		RampDiagPerm = 0;
		}
	// 4. mal falsch
	else if (RampeRepariert == 4 && (ReparierenVor == 1 || ReparierenVor == 3 || ReparierenVor == 5 || ReparierenVor == 7
		|| ReparierenVor == 9 || ReparierenVor == 11 || ReparierenVor == 13 || ReparierenVor == 15))
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Links_09_04"); //Sie klemmt immer noch.
		RampDiagPerm = 0;
		};

	// 3. mal richtig
	if (RampeRepariert == 3 && (ReparierenVor <= 1 || (ReparierenVor >= 4 && ReparierenVor <=5)
		|| (ReparierenVor >= 8 && ReparierenVor <=9) || (ReparierenVor >= 12 && ReparierenVor <=13)))
		{
		RampeRepariert = RampeRepariert + 1;
		}
	// 3. mal falsch
	else if (RampeRepariert == 3 && (ReparierenVor >= 14 || (ReparierenVor >= 2 && ReparierenVor <=3)
		|| (ReparierenVor >= 6 && ReparierenVor <=7) || (ReparierenVor >= 10 && ReparierenVor <=11)))
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Links_09_03"); //Auch jetzt rührt sich nichts.  
		RampDiagPerm = 0;
		};

	// 2. mal richtig
	if (RampeRepariert == 2 && (ReparierenVor <= 3 || (ReparierenVor >= 8 && ReparierenVor <=11)))
		{
		RampeRepariert = RampeRepariert + 1;
		}
	// 2. mal falsch
	else if (RampeRepariert == 2 && (ReparierenVor >= 12 || (ReparierenVor >= 4 && ReparierenVor <=7)))
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Links_09_02"); //Nein, die Kette bewegt sich kein Stück.
		RampDiagPerm = 0;
		};

	// 1. mal richten
	if (RampeRepariert == 1 && ReparierenVor <= 7)
		{
		RampeRepariert = RampeRepariert + 1;
		}
	// 1. mal falsch
	else if (RampeRepariert == 1 && ReparierenVor >= 8)
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Links_09_01"); //Die Kette hat sich verklemmt...
		RampDiagPerm = 0;
		};
	};

// ------------------- Rechts ziehen -------------------------
instance DIA_DIC_Arbeiter_Rechts (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 5;
	condition = DIA_DIC_Arbeiter_Rechts_Condition;
	information = DIA_DIC_Arbeiter_Rechts_Info;
	permanent = 1;
	important = 0;
	description = "Rechts.";
	};

func int DIA_DIC_Arbeiter_Rechts_Condition ()
	{
	if (RampeRepariert >= 1 && RampeRepariert < 5  && RampDiagPerm == 1 && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
		{
		return 1;
		};
	};

func void DIA_DIC_Arbeiter_Rechts_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Arbeiter_Rechts_15_00"); //Rechts.
	AI_AlignToWP	(DIC_2016_ARBEITER);
	AI_PlayAni (DIC_2016_ARBEITER,"T_ZIEHSEIL");
	AI_WaitTillEnd (hero,DIC_2016_ARBEITER);
	AI_TurnToNpc (self, hero);

	//Kleine Lsung fr das nun folgende Rï¿½sel: Binï¿½ von 0 bis 15 zählen und dann 0=links und 1=rechts, Zahl zufällig erstellt

	// 4. mal richtig
	if (RampeRepariert == 4 && (ReparierenVor == 1 || ReparierenVor == 3 || ReparierenVor == 5 || ReparierenVor == 7
		|| ReparierenVor == 9 || ReparierenVor == 11 || ReparierenVor == 13 || ReparierenVor == 15))
		{
		RampeRepariert = RampeRepariert + 1;
		RampDiagPerm = 0;
		}
	// 4. mal falsch
	else if (RampeRepariert == 4 && (ReparierenVor == 0 || ReparierenVor == 2 || ReparierenVor == 4 || ReparierenVor == 6
		|| ReparierenVor == 8 || ReparierenVor == 10 || ReparierenVor == 12 || ReparierenVor == 14))
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Rechts_09_04"); //Sie klemmt immer noch.
		RampDiagPerm = 0;
		};

	// 3. mal richtig
	if (RampeRepariert == 3 && (ReparierenVor >= 14 || (ReparierenVor >= 2 && ReparierenVor <=3)
		|| (ReparierenVor >= 6 && ReparierenVor <=7) || (ReparierenVor >= 10 && ReparierenVor <=11)))
		{
		RampeRepariert = RampeRepariert + 1;
		}
	// 3. mal falsch
	else if (RampeRepariert == 3 && (ReparierenVor <= 1 || (ReparierenVor >= 4 && ReparierenVor <=5)
		|| (ReparierenVor >= 8 && ReparierenVor <=9) || (ReparierenVor >= 12 && ReparierenVor <=13)))
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Rechts_09_03"); //Auch jetzt rührt sich nichts.  
		RampDiagPerm = 0;
		};

	// 2. mal richtig
	if (RampeRepariert == 2 && (ReparierenVor >= 12 || (ReparierenVor >= 4 && ReparierenVor <=7)))
		{
		RampeRepariert = RampeRepariert + 1;
		}
	// 2. mal falsch
	else if (RampeRepariert == 2 && (ReparierenVor <= 3 || (ReparierenVor >= 8 && ReparierenVor <=11)))
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Rechts_09_02"); //Nein, die Kette bewegt sich kein Stück.
		RampDiagPerm = 0;
		};

	// 1. mal richten
	if (RampeRepariert == 1 && ReparierenVor >= 8)
		{
		RampeRepariert = RampeRepariert + 1;
		}
	// 1. mal falsch
	else if (RampeRepariert == 1 && ReparierenVor <= 7)
		{
		RampeRepariert = 0;
		AI_Output (self, other, "DIA_DIC_Arbeiter_Rechts_09_01"); //Die Kette hat sich verklemmt...
		RampDiagPerm = 0;
		};
	};

// ----------------------------- Rampe ist repariert -------------------
instance DIA_DIC_Arbeiter_Repariert (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 6;
	condition = DIA_DIC_Arbeiter_Repariert_Condition;
	information = DIA_DIC_Arbeiter_Repariert_Info;
	permanent = 0;
	important = 0;
	description = "Probier mal, ob die Rampe jetzt wieder funktioniert.";
	};

func int DIA_DIC_Arbeiter_Repariert_Condition ()
	{
	if (((RampeRepariert == 5)||(RampeRepariert == 6)) && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
		{
		return 1;
		};
	};

func void DIA_DIC_Arbeiter_Repariert_Info ()
	{
	AI_TurnToNpc	(hero,DIC_2015_ARBEITER);
	AI_Output (other, self, "DIA_DIC_Arbeiter_Repariert_15_00"); //Probiert mal, ob die Rampe jetzt wieder funktioniert.
	AI_TurnToNpc	(hero,self);
	AI_GotoWP (self, "RAMPE_06");
	AI_AlignToWP	(self);
	AI_UseMob	(DIC_2015_Arbeiter,"VWHEEL",1);
	AI_UseMob	(DIC_2015_Arbeiter,"VWHEEL",-1);
	AI_TurnToNpc	(hero,self);
	AI_TurnToNpc 	(self, hero);
	AI_Output (self, other, "DIA_DIC_Arbeiter_Repariert_09_01"); //Tatsächlich! Sie funktioniert wieder! Danke Kleiner!

	B_GiveXP (500);
	Npc_ExchangeRoutine(DIC_2016_ARBEITER,"Rampe");
	ai_Continueroutine	(DIC_2016_ARBEITER);
	Npc_ExchangeRoutine(self,"Rampe");
	
	B_LogEntry (GY_PR_1, "Die Rampe ist repariert. Jetzt muss ich nur noch Graveyarn davon berichten.");
	
	AI_StopProcessInfos (self);
	};
	
// --------------- Geschichte vom Vater -------------
instance DIA_DIC_Arbeiter_Vater (C_INFO)
	{
	npc = DIC_2015_Arbeiter;
	nr = 1;
	condition = DIA_DIC_Arbeiter_Vater_Condition;
	information = DIA_DIC_Arbeiter_Vater_Info;
	permanent = 0;
	important = 1;
	};

func int DIA_DIC_Arbeiter_Vater_Condition ()
	{

	if (RampeRepariert == 6)

		{
		return 1;
		};
	};

func void DIA_DIC_Arbeiter_Vater_Info ()
{
	var C_NPC Worker;
	Worker = Hlp_GetNpc(DIC_2016_ARBEITER);
	
	Wld_SendTrigger ("CAMERA_RAMPE");
	AI_TurnToNpc (self, Worker);
	AI_TurnToNpc (Worker, self);
	AI_WaitTillEnd (Worker, self);
	AI_WaitTillEnd (self, Worker);
	AI_Output (Worker, Null, "DIA_DIC_Arbeiter_Vater_04_00"); //Jetzt brauchen wir kein Holz mehr herschleppen. Die Rampe ist ja wieder repariert. 
	AI_WaitTillEnd (self, Worker);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_01"); //Na und? Dummkopf! Hast du Graveyarn nicht gehört? Gleich morgen müssen wir schleppen, was von der Rampe gefördert wird!
	AI_WaitTillEnd (Worker, self);
	AI_Output (Worker, Null, "DIA_DIC_Arbeiter_Vater_04_02"); //Ach, halts Maul!                                                             (kurze Pause)
	AI_WaitTillEnd (self, Worker);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_03"); //Sag mal, ist der Junge hier noch irgendwo in der Nähe? 
	AI_WaitTillEnd (Worker, self);
	AI_Output (Worker, Null, "DIA_DIC_Arbeiter_Vater_04_04"); //Nein. Hab ihn nicht mehr gesehen. 
	AI_WaitTillEnd (self, Worker);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_05"); //Ich hab Gerüchte über ihn gehört. ....Verdammt! ...... Der Kerl kann einem Leid tun. Kennst du seine Geschichte? 
	AI_WaitTillEnd (Worker, self);
	AI_Output (Worker, Null, "DIA_DIC_Arbeiter_Vater_04_06"); //Nein. Aber da du ja alles weißt, und alles rumerzählst, krieg ich sie bestimmt gleich zu hören. 
	AI_WaitTillEnd (self, Worker);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_07"); //Dir vergeht noch das Lachen. Es heißt Berengar hat Ardarics Vater getötet und die Leiche in einer Gebirgshöhle verscharrt.
	AI_WaitTillEnd (Worker, self);
	AI_Output (Worker, Null, "DIA_DIC_Arbeiter_Vater_04_08"); //Was sagst du da? Warum das alles?
	AI_WaitTillEnd (self, Worker);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_09"); //Das weiß ich nicht.
	AI_WaitTillEnd (Worker, self);
	AI_Output (Worker, Null, "DIA_DIC_Arbeiter_Vater_04_10"); //Aber wenn das stimmt, dann muss Ardaric Berengar doch hassen
	AI_WaitTillEnd (self, Worker);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_11"); //Nein. Er weiß nichts davon. Während des Überfalls ist er niedergeschlagen worden. Und von 
	AI_WaitTillEnd (Worker, self);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_12"); //Berengar hat er eine ganz andere Geschichte gehört.  Ardaric glaubt, Berengar hätte versucht, seinen Vater zu retten.  -
	AI_WaitTillEnd (Worker, self);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_13"); //Er denkt, dass die Mörder Soldaten des Königs waren. Aber pass auf! Kein Wort zu jemandem. 
	AI_WaitTillEnd (Worker, self);
	AI_Output (self, hero, "DIA_DIC_Arbeiter_Vater_09_14"); //Wenn Berengar erfährt, dass ich geplaudert habe, geht's mir dreckig. Psst, ich glaube  ich höhr da was...
	AI_WaitTillEnd (Worker, self);
	AI_StopProcessInfos (self);
	B_LogEntry (Vergangenheit, "Ich konnte die Arbeiter belauschen und habe erfahren, dass angeblich Berengar meinen Vater getötet haben soll.");
	B_GiveXP (750);

};