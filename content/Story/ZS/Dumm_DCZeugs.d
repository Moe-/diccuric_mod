//-------------------------------------------------
// ZS_FollowBH() wie ZS_FollowPC() aber:
// NPC rennt im Abstand von 5m hinterher, da er ja
// aufdringlich sein soll :)
// Außerdem klettert der NPC die Leiter NICHT mehr 
// automatisch hoch, da er runterfällt, wenn SC zu nah
// an dieser steht!
//-------------------------------------------------
// *******************************************************************************************
//Das wichtigste ist in einen Scripttrigger (ruft Funktion HochstandWoelfe auf) abgewandert,
//da hier nicht jedes Mal alles geklappt hat. 
// Deswegen wird dieser TA nicht mehr verwendet *changes by Moe*
// *******************************************************************************************

func void ZS_FollowBH()
{
	
	PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowBH");

	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_FollowBH_AssessSC	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND		,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);			


};

func int ZS_FollowBH_Loop()
{
/*
	if(Npc_GetDistToWP(hero,"SEE_VOR_STADT_12")<=225 && !C_BodyStateContains(hero,BS_CLIMB))		//hero auf turm geklettert
	{
		//PrintScreen("Schnell wech!", -1,-1,"font_old_20_white.tga",3);
		Npc_ExchangeRoutine(sld_b,"RALF"); 
		Npc_ExchangeRoutine(self,"RAL");
		AI_Teleport(sld_b,"SEE_VOR_STADT_10");
		AI_Teleport(sld_a,"SEE_VOR_STADT_10");
		

		// Added by Moe: Ausgabe an Spieler, damit er ein wenig mit Inventar rumspielt
		AI_OutputSVM_Overlay (hero,hero,"TurmGefangen_15_00"); //So ein Mist. Da unten ist ein ganzes Wolfsrudel. Wenigstens hab ich ein wenig Fleisch zum Essen dabei und muss so nicht verhungern...
		AI_StandUpQuick (hero);
		
		//PrintScreen("Wölfe!", -1,-1,"font_old_20_white.tga",3);
		BH_WolfSpawn();		//hier, da sonst angriff auf wölfe! 
		return ;
	};
	

	AI_TurnToNpc		(self,hero);
	AI_Wait				(self,	0.5);	//weniger = besser?

*/

	PrintDebugNpc		(PD_TA_LOOP,	"ZS_FollowBH_Loop");
	PrintGlobals		(PD_MST_DETAIL);
	
	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > 300 ) // HAI_DIST_FOLLOWPC)
	&& !C_BodyStateContains(hero,BS_CLIMB)
	&& (Npc_GetDistToWP(hero,"SEE_VOR_STADT_12") > 400)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	hero);
	}
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
	if (Npc_CheckInfo(self,1))
	{
		Npc_SendSinglePerc ( hero, self,  PERC_ASSESSTALK); // wer nicht hören will muß fühlen -Harri
	};
	
	AI_Wait				(self,	0.5);
	return				LOOP_CONTINUE;




};

func void ZS_FollowBH_END()
{

	PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowBH_End");

	self.senses =		hero.senses;	
};


func void B_FollowBH_AssessSC()
{
	PrintDebugNpc		(PD_TA_FRAME,	"B_FollowBH_AssessSC");
	
	if (Npc_GetDistToNpc(self,hero) < 200)
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...SC-Meister jetzt nahe genug!");
		B_FullStop		(self);
	}

	if (Npc_CheckInfo(self,1))
	{
		PrintDebugNpc	(PD_TA_CHECK,	"...wichtige Info zu vergeben!");
		hero.aivar		[AIV_IMPORTANT] = TRUE; // Dialog KOMMT aufgrund einer Important-Info zustande
		B_FullStop		(other);
		B_FullStop		(self);
		AI_StartState	(self,	ZS_Talk, 0, "");
		return;
	};
};


// ************************************************************
// ZS_GoBH
// Nur für Tiere gedacht! Wölfe rennen zum BH und
// warten ab! Sehen sie den Spieler(soll einziger NPC in der
// Nähe sein) dann zum Angriff. Wenn Fleisch runtergeworfen wurde
// rennen sie dahin und beschäftigen sich ne Zeit lang damit.
// Wenn spezielle Scavs gesichtet werden: hinterher!
// ************************************************************

Func void ZS_GoBH()
{
	// nur Spieler oder Scavs angreifen!
	
	
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE	,	B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSWARN		,	B_MM_AssessWarn		);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE	,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC	,	B_AssessMagic		);
	
	if (thrown_meat == -1) || (ScavHornStatus == 1)		//Wolf normal machen
	{
		Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	}
	else
	{
		Npc_PercEnable  	(self, 	PERC_ASSESSENEMY	,	B_GoBH_AssessENEMY	);
	};

};

Func void ZS_GoBH_Loop()
{

	
	if(Npc_GetDistToWP(self,"SEE_VOR_STADT_11")>200)  //Wölfe nicht am Turm
	&&(self.aivar[49] != 1)							//Abfrage nur zur Sicherheit
	{
		// if Anweisung Added by Markus
		// bei Probs nur else Klausel nehmen
		//if (Npc_GetDistToWP(hero,"SEE_VOR_STADT_11") <= 300)
		//	{
		//	Npc_SetTarget (self, hero);
		//	AI_Attack(self);
		//	return; //LOOP_CONTINUE;
		//	}
		//else
		//	{
			AI_SetWalkMode(self, NPC_RUN);
			AI_GotoWP(self, "SEE_VOR_STADT_11");
			return; //LOOP_CONTINUE;
		//	};
	}

	// +++++++++++++++++++ gar kein Fleisch muahhhhahaha :) +++++++++++++++++++++
	else if(self.aivar[49] != 1)
	// &&(Npc_GetDistToWP(self,"AM_HOCHSTAND_00")<=100)
	{
		// ------- Alles wegmachen ----------
		Npc_ClearAIQueue(V_Wolf2);
		Npc_ClearAIQueue(V_Wolf3);
		Npc_ClearAIQueue(V_Wolf4);

		//B_LogEntry (VER_MISSION, "Wölfe sollten jetzt rumstruenen");
		self.aivar[49] = 1;			//die anderen Wölfe spielen schicken ;)
		
		// ------- Percrange verringern, wegen BH stuff-------------------
		var C_NPC a_wolf;
		a_wolf = Hlp_GetNPC(self); a_wolf.aivar[AIV_MM_PercRange] = 800; a_wolf.wp = Npc_GetNearestWP(self);
		a_wolf = Hlp_GetNPC(V_Wolf2); a_wolf.aivar[AIV_MM_PercRange] = 800; a_wolf.wp = Npc_GetNearestWP(self);
		a_wolf = Hlp_GetNPC(V_Wolf3); a_wolf.aivar[AIV_MM_PercRange] = 800; a_wolf.wp = Npc_GetNearestWP(self);
		a_wolf = Hlp_GetNPC(V_Wolf4); a_wolf.aivar[AIV_MM_PercRange] = 800; a_wolf.wp = Npc_GetNearestWP(self);

		//AI_StartState(self, ZS_MM_Rtn_Roam, 0, "");
		AI_SetWalkMode(self, NPC_WALK);
		AI_StartState(V_Wolf2, ZS_MM_Rtn_Roam, 0, "");
		AI_StartState(V_Wolf3, ZS_MM_Rtn_Roam, 0, "");
		AI_StartState(V_Wolf4, ZS_MM_Rtn_Roam, 0, "");
	} 	
	// -----------------Fleischwnzenfleisch-----------------------------------------------------
	else if(Npc_GetDistToItem(self,ItAt_Meatbug_01)<800)	//Fleisch gerochen
		 &&(thrown_meat ==0) 								//wurde aber noch nicht registiert(vom Leitwolf)
		 //&& (Npc_CanSeeItem(self, ItAt_Meatbug_01)) // Damit Fleisch nicht oben liegen bleibt    ! und wenn es so blöde liegt das er es NIE sieht? -Harri
	{
		thrown_meat=1;							//Fleisch registrieren
		if(meat_taken != 1) {meat_taken=1;};	//zum sicheren Logeintrag(s.u.)	
		AI_GotoItem(self,ItAt_Meatbug_01);
		return ;//LOOP_CONTINUE;
	}
	// -----------------gebratenes Fleisch------------------------------------------------------	 
	else if(Npc_GetDistToItem(self,ItFoMutton)<800)	
		 &&(thrown_meat ==0) //&& (Npc_CanSeeItem(self, ItFoMutton))
	{
		thrown_meat=2;
		if(meat_taken != 1) {meat_taken=1;};
		AI_GotoItem(self,ItFoMutton);
		return; //LOOP_CONTINUE;
	}	
	// -----------------rohes Fleisch----------------------------------------------------------
	else if(Npc_GetDistToItem(self,ItFoMuttonRaw)<800)
		 &&(thrown_meat ==0) // && (Npc_CanSeeItem(self, ItFoMuttonRaw))
	{
		thrown_meat=3;
		if(meat_taken != 1) {meat_taken=1;};		
		AI_GotoItem(self,ItFoMuttonRaw);
		return; //LOOP_CONTINUE;
	}
	// -----------------Schinken---------------------------------------------------------------
	else if(Npc_GetDistToItem(self,ItFo_mutton_01)<800)
		 &&(thrown_meat ==0) //&& (Npc_CanSeeItem(self, ItFo_mutton_01))
	{
		thrown_meat=4;
		if(meat_taken != 1) {meat_taken=1;};
		AI_GotoItem(self,ItFo_mutton_01);
		return ;//LOOP_CONTINUE;
	}
	// -------------------Zum einmaligen(!) Eintrag ins Buch-------------------------------------
	if(meat_taken == 1) 
	{
		B_LogEntry (VER_MISSION, "Sehr gut! Die Wölfe wurden abgelenkt. Jetzt kann ich flüchten... schnell weg hier!");
		meat_taken = -1;
		//DC_1_Tower=3;   //die Mission ist geschafft, aber nur wenn er heil zurückkommt!	Kann horn nicht benutzen wenn wölfe fressen -Harri
		//return LOOP_END;
	};
	// -------------------andere Wölfe auf Fleisch reagieren lassen------------------------------
	if(thrown_meat != 0)      
	{
		// ------- Alles wegmachen ----------
		Npc_ClearAIQueue(self);
		Npc_ClearAIQueue(V_Wolf2);
		Npc_ClearAIQueue(V_Wolf3);
		Npc_ClearAIQueue(V_Wolf4);
		// ------- Percrange erhöhen, wegen BH stuff-------------------
		var C_NPC c_wolf;
		c_wolf = Hlp_GetNPC(V_Wolf2); c_wolf.aivar[AIV_MM_PercRange] = 1500;
		c_wolf = Hlp_GetNPC(V_Wolf3); c_wolf.aivar[AIV_MM_PercRange] = 1500;
		c_wolf = Hlp_GetNPC(V_Wolf4); c_wolf.aivar[AIV_MM_PercRange] = 1500;
		AI_StartState(V_Wolf2, ZS_MeatW, 0, "");
		AI_StartState(V_Wolf3, ZS_MeatW, 0, "");
		AI_StartState(V_Wolf4, ZS_MeatW, 0, "");
		self.aivar[49] = 0; //Reset, bevor MeatW, damit er auch zum Fleisch rennt!
		AI_StartState(self,	   ZS_MeatW, 0, "");
		if (DC_1_Tower < 3)
			{
			B_LogEntry (VER_MISSION, "Sehr gut! Die Wölfe wurden abgelenkt. Jetzt kann ich flüchten... schnell weg hier und zurück in die Stadt!");

			};
		meat_taken=-1;    //Sicherheitsreset
		
		return ;//LOOP_END;
				
	};
	// ------------------------wenn gar nix is, Roam simmulieren------     Harri
	
	if (Npc_GetDistToWP(self,"SEE_VOR_STADT_08") < 200)
	&& ScavHornStatus != 1  && (thrown_meat == 0)
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self, "SEE_VOR_STADT_11");
		return;			//LOOP_CONTINUE;
	}
	
	else if (Npc_GetDistToWP(self,"SEE_VOR_STADT_11") < 200)
	&& ScavHornStatus != 1  && (thrown_meat == 0)
	{
		AI_GotoWP(self, "SEE_VOR_STADT_08");
		return;			//LOOP_CONTINUE;
		
	};
	
	return;
};

Func void ZS_GoBH_End()
{
	//?	
};


//
		 
	
Func void B_GoBH_AssessENEMY()
{	
	if (Npc_GetDistToNpc(self,hero) < 400)		//Spieler soll ja net auffm Turm angegriffen werden...  / 200 zu wenig  - Harri
	&& (Npc_GetDistToWP(hero, "SEE_VOR_STADT_12") > 250) //Spieler ist nicht aufm Turm 
	&& (!thrown_meat)			//Spieler hat kein Fleisch runtergeworfen! (oder wieder aufgehoben)
	&& (!ScavHornUsed)			//Spieler hat auch nicht das ScavHorn benutzt!
	{
		// ------- Percrange erhöhen, wegen BH stuff-------------------
		var C_NPC a_wolf;
		a_wolf = Hlp_GetNPC(V_Wolf2); a_wolf.aivar[AIV_MM_PercRange] = 1500;
		a_wolf = Hlp_GetNPC(V_Wolf3); a_wolf.aivar[AIV_MM_PercRange] = 1500;
		a_wolf = Hlp_GetNPC(V_Wolf4); a_wolf.aivar[AIV_MM_PercRange] = 1500;


		AI_StartState   (self, ZS_MM_Attack, 0, ""); //Also: ANGRIFF!!!
		AI_StartState(V_Wolf2, ZS_MM_Attack, 0, "");
		AI_StartState(V_Wolf3, ZS_MM_Attack, 0, "");
		AI_StartState(V_Wolf4, ZS_MM_Attack, 0, "");
		return;
	}
	else if(!Npc_IsPlayer(other) && Npc_KnowsInfo(hero, Info_Grd1_MeetSchmied)) //Gegenüber ist nicht der Spieler!
	{
		// ------- Percrange erhöhen, wegen BH stuff-------------------
		var C_NPC b_wolf;
		b_wolf = Hlp_GetNPC(V_Wolf2); b_wolf.aivar[AIV_MM_PercRange] = 1500;
		b_wolf = Hlp_GetNPC(V_Wolf3); b_wolf.aivar[AIV_MM_PercRange] = 1500;
		b_wolf = Hlp_GetNPC(V_Wolf4); b_wolf.aivar[AIV_MM_PercRange] = 1500;

		AI_StartState   (self, ZS_MM_Attack, 0, ""); //Also: ANGRIFF!!!
		AI_StartState(V_Wolf2, ZS_MM_Attack, 0, "");
		AI_StartState(V_Wolf3, ZS_MM_Attack, 0, "");
		AI_StartState(V_Wolf4, ZS_MM_Attack, 0, "");
		return;
	};
};


// ************************************************************
// ZS_StandBH
// Für einen(!) der beiden Söldner zum Anfang am BH.
// Ziel: Soll den Hero anquatschen, wenn in Reichweite.
// ACHTUNG: Nur solange der SpielStartpunkt nicht am BH ist,
//          denn dann quatschen die Söldner eh glei!
// ************************************************************

func void ZS_StandBH()
{
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	Npc_PercEnable  ( self, PERC_ASSESSTALK	,	B_AssessTalk);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_STAND"))
	{																	
		AI_GotoFP (self, "FP_STAND");
		AI_TurnToNpc	(self,hero);  //changed TMonk: sonst kommen die erst zu spät 
									  //               mit hero ins Gespräch
	}
	else
	{
		AI_TurnToNpc	(self,hero);  //siehe oben
	};
	
    AI_PlayAni (self,"T_STAND_2_LGUARD");
};

func void ZS_StandBH_loop()
{
	Loop_time = Npc_GetStateTime(self);

		var int zufall;
		zufall = Hlp_Random(100);
		if (zufall >= 95)
		{
			AI_TurnToNpc	(self,hero);
			AI_PlayAni (self,"T_LGUARD_2_STAND");
		}
		else if (zufall >= 90)
		{
			AI_TurnToNpc	(self,hero);
			AI_PlayAni (self,"T_LGUARD_SCRATCH");
		}
		else if (zufall >= 85)
		{
			AI_TurnToNpc	(self,hero);
			AI_PlayAni (self,"T_LGUARD_STRETCH");
		}
		else if (zufall >= 70)
		{
			AI_TurnToNpc	(self,hero);
			AI_PlayAni (self,"T_LGUARD_CHANGELEG");
		};
	
	AI_Wait		(self, 0.5);
};

func void ZS_StandBH_end()
{
	//AI_PlayAni (self,"T_LGUARD_2_STAND");	
};


// ************************************************************
// ZS_FollowW
// Für die restlichen Wölfe! Rennen immer dem Leitwolf hinterher
// ************************************************************

FUNC VOID ZS_FollowW()
{
	
	if (thrown_meat == -1) || (ScavHornStatus == 1)		//Wölfe normal machen
	{
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE,		B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	};
	
	
};

FUNC INT ZS_FollowW_Loop()
{
	
	if ScavHornStatus == 1
	|| thrown_meat == -1
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self, ZS_MM_Rtn_Roam, 0, "");
		
	return				LOOP_CONTINUE;
	};
	
	if (Npc_GetDistToNpc(self,V_Wolf1)>40)
	&& ScavHornStatus != 1
	&& thrown_meat != -1
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	V_Wolf1);
	}
	else if ScavHornStatus != 1
	&& thrown_meat != -1
	{
		B_SmartTurnToNpc(self,	V_Wolf1);
	};
	
	//AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};

FUNC VOID ZS_FollowW_End()
{
};

// ************************************************************
// ZS_MeatW
// Das Große Fressen *g der andere Hinweis war irretierend Harri
// ************************************************************

FUNC VOID ZS_MeatW()
{
	PrintDebugNpc		(PD_MST_FRAME, "ZS_MeatW");
	Npc_SetPercTime (self,1);
	//----------Auf Schaden/Kampfgeräusche/andere Schaden reagieren------------- 
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage		);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, 	B_MM_ReactToOthersDamage);
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	
	AI_StandUpQuick(self);
	AI_SetWalkMode(self,NPC_RUN);
	
	if	(thrown_meat ==1)
	{
		AI_GotoItem(self, ItAt_Meatbug_01);
	}
	else if (thrown_meat ==2)
	{
		AI_GotoItem(self, ItFoMutton);
	}
	else if (thrown_meat ==3)
	{
		AI_GotoItem(self, ItFoMuttonRaw);
	}
	else if (thrown_meat ==4)
	{
		AI_GotoItem(self, ItFo_mutton_01);
	};
	
	AI_PlayAni(self,"T_STAND_2_EAT");

};

FUNC INT ZS_MeatW_Loop()
{
	PrintDebugNpc		(PD_MST_LOOP, "ZS_MeatW_Loop");
	
	var int L_Sek;					//Sekunden im Loop(Fleisch wurde gefressen)
	L_Sek = Npc_GetStateTime(self);	//Klar oder?

	if(thrown_meat == 3) && Npc_HasItems(hero, ItAt_Meatbug_01) && (Npc_GetDistToNPC(hero,V_Wolf1)<500)
	{
		PrintDebugNpc		(PD_MST_CHECK, "Wanzenfleisch wegg");
		thrown_meat = 0;							//WER HAT MIR DA FLEISCH WEGGENOMMEN ? ;)
		return LOOP_END;
	}
	else if(thrown_meat == 3) && Npc_HasItems(hero, ItFoMutton) && (Npc_GetDistToNPC(hero,V_Wolf1)<500)
	{
		PrintDebugNpc		(PD_MST_CHECK, "Braten wegg");
		thrown_meat = 0;							//WER HAT MIR DA FLEISCH WEGGENOMMEN ? ;)
		return LOOP_END;
	}
	else if(thrown_meat == 3) && Npc_HasItems(hero, ItFoMuttonRaw) && (Npc_GetDistToNPC(hero,V_Wolf1)<500)
	{
		PrintDebugNpc		(PD_MST_CHECK, "Fleisch wegg");
		thrown_meat = 0;							//WER HAT MIR DA FLEISCH WEGGENOMMEN ? ;)
		return LOOP_END;
	}
	else if(thrown_meat == 3) && Npc_HasItems(hero, ItFo_mutton_01) && (Npc_GetDistToNPC(hero,V_Wolf1)<500)
	{
		PrintDebugNpc		(PD_MST_CHECK, "Schinken wegg");
		thrown_meat = 0;							//WER HAT MIR DA FLEISCH WEGGENOMMEN ? ;)
		return LOOP_END;
	};
	
/*	


	var string ML_Status;
	ML_Status = IntToString(L_Sek);
	PrintScreen	(ML_Status, 70,60,"font_old_20_white.tga",3);
	
	var string M_Status;
	M_Status = IntToString(thrown_meat);
	PrintScreen	(M_Status, 80,60,"font_old_20_white.tga",3);
	
	PrintScreen("Das Große Fressen !", 40,60,"font_old_20_white.tga",3);

*/
	if(L_Sek > 50)		//Zeit is um!
	|| thrown_meat <= 0
	{
		return LOOP_END;
	};
	
	


};

FUNC VOID ZS_MeatW_End()
{
		PrintDebugNpc		(PD_MST_FRAME, "ZS_MeatW_End");
		AI_PlayAni			(self,	"T_EAT_2_STAND");
		AI_SetWalkMode(self,NPC_WALK);
		thrown_meat = -1;
		DC_1_Tower=3;   //die Mission ist geschafft, aber nur wenn er heil zurückkommt!
		WolfTA ();
};


// ************************************************************
// ZS_GetBH
// Nur für Tiere gedacht! Scavenger rennen zum BH und
// treffen dort auf Wölfe! Sind sie in Attackreichweite werden 
// die Wölfe und Scvas gegeneinander gehetzt, damit Hero 
// fliehen kann.
// 
// ************************************************************

func void ZS_GetBH()
{
	
	if (thrown_meat == -1) || (ScavHornStatus == 1)	// Reagieren wie "normale" Scavenger	
	{
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE,		B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	};
};

func int ZS_GetBH_Loop()
{
	if(Npc_GetDistToWP(self,"SEE_VOR_STADT_06")<700)  //wurde gerade eingefügt!
	&&(DC_1_Tower != 3)							//Auftrag1 noch am laufen!
	&&(ScavHornStatus != 1)							//Horn wurde noch nicht benutzt!
	{
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"SEE_VOR_STADT_09");
		return				LOOP_CONTINUE;
	}
	else if (Npc_GetDistToWP(self,"SEE_VOR_STADT_09") < 300)
	&& (Npc_GetDistToWP(V_Wolf1,"AM_HOCHSTAND_00") < 800)		// unbedingt wegglocken wenn wölfe da sind  -Harri
	&& (ScavHornStatus != 1)
							// && (DC_1_Tower != 3)	edit  -Harri
	{
		
		AI_SetWalkMode(V_Scav1,NPC_RUN);
		AI_SetWalkMode(V_Scav2,NPC_RUN);
		AI_SetWalkMode(V_Scav3,NPC_RUN);
		AI_SetWalkMode(V_Scav4,NPC_RUN);

		//jeder bekommt sein target
/*		
		
		Npc_SetTarget(V_Wolf1,V_Scav1);			// macht nun kein sinn mehr -Harri
		Npc_SetTarget(V_Wolf2,V_Scav2);
		Npc_SetTarget(V_Wolf3,V_Scav3);
		Npc_SetTarget(V_Wolf4,V_Scav4);

*/

		//--------------Dorthin locken, wo sie herkommen!-----------------------
		
		//11_08 = Tunneleingang. Damit sind sie auf jeden Fall außer Sichtweite!
		
		ScavHornStatus = 1;

		AI_GotoWP(V_Scav1,"FOREST01_11");
		AI_GotoWP(V_Scav2, "FOREST01_11");
		AI_GotoWP(V_Scav3, "FOREST01_11");
		AI_GotoWP(V_Scav4, "FOREST01_11");
		
              
                   
                 AI_SetWalkMode(V_Wolf1,NPC_RUN);
		 AI_SetWalkMode(V_Wolf2,NPC_RUN);
                 AI_SetWalkMode(V_Wolf3,NPC_RUN);
		 AI_SetWalkMode(V_Wolf4,NPC_RUN);

		// --Auch wenn die Wölfe gerade am fressen sind, weil Frischfleich schmeckt besser! :)----
		
									
/*		AI_StartState(V_Wolf1, ZS_MM_Attack, 0, "");		// AI_GotoWP ist sicherer - edit Harri		
		AI_StartState(V_Wolf2, ZS_MM_Attack, 0, "");
		AI_StartState(V_Wolf3, ZS_MM_Attack, 0, "");
		AI_StartState(V_Wolf4, ZS_MM_Attack, 0, "");
*/		
		AI_GotoWP(V_Wolf1,"FOREST01_11");
		AI_GotoWP(V_Wolf2, "FOREST01_11");
		AI_GotoWP(V_Wolf3, "FOREST01_11");
		AI_GotoWP(V_Wolf4, "FOREST01_11");
		
		// ---------------------Fleisch wurde schon geworfen-------------------------------------
		if(meat_taken != 1) 
		{
			B_LogEntry (VER_MISSION, "Aha! Das Horn kann also Scavenger beschwören, oder zumindest zu mir locken. Wie dem auch sei, ich sollte mich jetzt schleunigst hier wegbewegen! Immerhin haben die Wölfe jetzt ne andere Beschäftigung... Ich sollte versuchen, zurück in die Stadt zu kommen.");
		}
		// --------------------Fleisch nicht geworfen--------------------------------------------
		else 
		{
			B_LogEntry (VER_MISSION, "Aha! Das Horn kann also Scavenger beschwören, oder zumindest zu mir locken. Scheinbar mögen die Wölfe frisches Fleisch lieber, diese Feinschmecker! Wie dem auch sei, ich sollte mich jetzt schleunigst hier wegbewegen. Immerhin haben die Wölfe jetzt ne andere Beschäftigung... Ich sollte versuchen, zurück in die Stadt zu kommen.");
		};
		meat_taken=-1;    //Sicherheitsreset
		DC_1_Tower=3;   //die Mission ist geschafft, aber nur wenn er heil zurückkommt!
	}
	else if(ScavHornStatus == 1)
	{
		AI_GotoWP(self,"SEE_VOR_STADT_06");	
	}
	

	else if(DC_1_Tower == 3) || (DC_1_Tower == -1 && thrown_meat < 1)   //Ist der erste Auftrag erledigt?      soll auch funzen wenn Wölfe gerade fressen -Harri                       	  	
	{
		if(!ScavHornStatus) 
		{		
		AI_SetWalkMode(self,NPC_WALK);
		AI_StartState(self, ZS_MM_AllScheduler, 0, ""); //mach den Scav-Standard wieda!
		return				LOOP_CONTINUE;
		};
	};
	
	if ScavHornStatus ==1
	{
		return				LOOP_END;
	};	
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};

FUNC VOID ZS_GetBH_End()
{
	//Standard Scavengerroutinen wieder herstellen!(Falls sie überleben *g)
	AI_SetWalkMode(self,NPC_WALK);
	
	AI_StartState(self, ZS_MM_AllScheduler, 0, ""); //mach den Scav-Standard wieda!
	
	WolfTA ();			// Standardroutinen zuweisen


};


// ************************************************************
// ZS_RunAL
// Söldner rennen zum Marktplatz im AL
// ************************************************************
FUNC VOID ZS_RunAL()
{
	
	self.aivar[49] = 0;		//reset zum erneuten benutzen
	self.aivar[48] = 0;
};

FUNC INT ZS_RunAL_Loop()
{
	if(Npc_GetDistToWP(self,"BRUECKE_001")<=180)
	{
		//Npc_ExchangeRoutine(self,"ENDBH");
		return LOOP_END;
	};
	AI_SetWalkMode(self, NPC_RUN);
	AI_GotoWP(self,"BRUECKE_001");
	return LOOP_CONTINUE;
};

FUNC VOID ZS_RunAL_End()
{
	AI_SetWalkMode(self, NPC_WALK);
	Npc_ExchangeRoutine(self,"ENDBH");
	AI_Teleport (self, "BRUECKE_001");
	
};

// ************************************************************
// ZS_GuardDC
// Söldner rennen zum Marktplatz im AL
// ************************************************************
//////////////////////////////////////////////////////////////////////////
//	modified ZS_Guard
//	========
//	Dieser Tagesablauf wird allen NSCs gegeben, die einfach nur
//	imposant herumstehen und Wache halten sollen.
//  Mod: Prüft, ob hero auf der Brücke ist!
//
//	Es passiert folgendes:
//	1.	Wie in allen Wachzuständen werden nette Posen und Zufalls-
//		Animationen abgespielt.
//////////////////////////////////////////////////////////////////////////
func void ZS_GuardDC ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_GuardDC");
	
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	self.aivar[49] = 0;
	  
};

func int ZS_GuardDC_Loop ()
{
	PrintDebugNpc	(PD_TA_LOOP,"ZS_GuardDC_Loop");
	
		
	if(Npc_GetDistToWP(self,"BRUECKE_002")<=100)
	&&(self.aivar[49] != 600)
	{
		//--- 10 min warten! -----
		self.aivar[49] = self.aivar[49] +1;	
	//	AI_PlayAni (self,"T_PLUNDER");
		AI_GotoWP(self,"BRUECKE_001");
	//	return LOOP_CONTINUE;
	}
	else if(Npc_GetDistToWP(self,"BRUECKE_002")>100)
	{
		AI_GotoWP(self,"BRUECKE_002");
	//	return LOOP_CONTINUE;
	};	
	AI_Wait(self,1);
	//return LOOP_END;
};

func void ZS_GuardDC_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Guard_End");
	Npc_ExchangeRoutine(self,"WORK");
	
};


// ***************************************************************************
// ZS_SearchDC
// modifizierte Reissuche, aber nur am Baum, da auch gleich dannach ein
// Söldner kommt und den hero zurecht stuzt! Eigentlich nur für Alwin gedacht,
// kann aber an jedem beliebigen Ort mit SMALLTALK FPs' benutzt werden!
// *************************************************************************** 

func void ZS_SearchDC () 
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_SearchDC");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	
	if (!Npc_IsOnFP(self,"FP_SEARCHDC_DIC_SEE"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};	
	
	if (Wld_IsFPAvailable (self, "FP_SEARCHDC_DIC_SEE"))
		{
		AI_GotoFP (self,"FP_SEARCHDC_DIC_SEE");
		AI_AlignToFP( self );				//Richte Dich aus
		};
	
	
	self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
};

func void ZS_SearchDC_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_SearchDC_Loop");
	
	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(2)))
	&& (Wld_IsTime(18,00,06,00) != TRUE)
	{
	    PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken mit Platzwechsel");
		if (Npc_IsOnFP(self,"FP_SEARCHDC_DIC_SEE")) && (Wld_IsFPAvailable (self, "FP_SEARCHDC_DIC_SEE"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 1");
			AI_GotoNextFP (self, "FP_SEARCHDC_DIC_SEE");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		};
		
		AI_SetWalkmode (self,NPC_WALK);
	}	
	else if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
		 && (Wld_IsTime(18,00,06,00) != TRUE)
	{
	    PrintDebugNpc(PD_TA_DETAIL,"SearchDC Bücken");
		if (Npc_IsOnFP(self,"FP_SEARCHDC_DIC_SEE"))
		{
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		};
		AI_SetWalkmode (self,NPC_WALK);	
	}
	else if(Wld_IsTime(18,00,06,00) == TRUE)
		 && (self.id == 50)
	{
		Npc_ExchangeRoutine(self,"START");
	};
	if (!Npc_IsOnFP(self,"FP_SEARCHDC_DIC_SEE") && Wld_IsFPAvailable (self, "FP_SEARCHDC_DIC_SEE"))
	{
	    AI_GotoFP (self, "FP_SEARCHDC_DIC_SEE");
	};
	AI_Wait(self,1);
};

func void ZS_SearchDC_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_SearchDC_End");
};

// ************************************************************
// ZS_Normal
// Ein TA_ROAM bei Tieren mit TA's
// ************************************************************

func void ZS_Normal()
{
 	PrintDebugNpc		(PD_TA_FRAME,"ZS_Normal");
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE,		B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
};

func int ZS_Normal_Loop()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_Normal_Loop");
    AI_SetWalkmode 		(self, NPC_WALK);
    	
	if (Hlp_Random(100) <= 20)
	{
		if (Wld_IsNextFPAvailable(self,	"FP_ROAM"))	
		{											
			AI_GotoNextFP	(self,	"FP_ROAM");
		}
		else // WPs benutzen
		{														
			AI_GotoWP	(self,	Npc_GetNearestWP (self));						
			AI_GotoWP	(self,	Npc_GetNextWP (self));						
		};
	}
	else
	{
		var int randomMove;
		randomMove = Hlp_Random(2);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
};

func void ZS_Normal_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Normal_End");
};


