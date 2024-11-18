/********************************************
//Added TMonk: Werden momentan noch mißbraucht für die erste Vearschungsmission!!
********************************************/

// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Info_Sld_A_Exit (C_INFO)
{
	npc			= Sld_A;
	nr			= 999;
	condition	= Info_Sld_A_Exit_Condition;
	information	= Info_Sld_A_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Info_Sld_A_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_A_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************************
// 							Start(Trialog)
// *****************************************************************

INSTANCE Info_Sld_A_Verarsch1_1 (C_INFO)
{
	npc			= Sld_A;
	nr			= 1;
	condition	= Info_Sld_A_Verarsch1_1Condition;
	information	= Info_Sld_A_Verarsch1_1Info;
	important   = 1;
	permanent	= 0;
	description = " "; // egal, wird eh sofort angezeigt!
};

FUNC INT Info_Sld_A_Verarsch1_1Condition()
	{
	//if (Npc_KnowsInfo(other, DIA_DIC_Monolog))
	//	{
		return 1;
	//	};
	};

FUNC VOID Info_Sld_A_Verarsch1_1Info()
{
	AI_TurnToNpc(Sld_B,hero);
	AI_Output (self,other,"Info_Sld_A_Verarsch1_06_00"); //Ok, es läuft ab wie besprochen!
	get_away = Npc_GetDistToNpc(hero,self);              //wird gebraucht für "weg vom Fenster"
	Speak2me = 1;										 //Sld_A hat part1 des Gespräches beendet

	AI_StopProcessInfos(self);
    AI_StartState	(sld_b,	ZS_Talk, 0, "");
};


INSTANCE Info_Sld_A_Verarsch1_2 (C_INFO)
{
	npc			= Sld_A;
	nr			= 1;
	condition	= Info_Sld_A_Verarsch1_2Condition;
	information	= Info_Sld_A_Verarsch1_2Info;
	important   = 1;
	permanent	= 0;
	description = " "; // egal, wird eh sofort angezeigt!
};

FUNC INT Info_Sld_A_Verarsch1_2Condition()
{
    if(Npc_KnowsInfo(hero,ZW1_Sld_B_Start) //Sld_B hat seinen Part begonnen/ist mitten drin
	&& Speak2me==2)							//Sld_B hat seinen Part beendet
	{
	return 1;
	};
};

FUNC VOID Info_Sld_A_Verarsch1_2Info()
{
	AI_Output (self,other,"Info_Sld_A_Verarsch1_2_06_00"); //Und dann... erledigen unsere Bögen den Rest.
	AI_Output (other,self,"Info_Sld_A_Verarsch1_2_15_01"); //Ich werd' das schon machen.
	AI_Output (self,other,"Info_Sld_A_Verarsch1_2_06_02"); //Du kannst dir sicher sein, Berengar wird es gefallen!
	
	DC_1_Tower=0;						//erstmal alles geklärt!
	Npc_ExchangeRoutine(self,"FOLLOW");	//"Verfolge den hero, damit net wegrennt!

	// ---------- Logentries -----------------
	Log_CreateTopic (VER_MISSION,LOG_MISSION);
	Log_SetTopicStatus(VER_MISSION, LOG_RUNNING);
	B_LogEntry (VER_MISSION, "Zwei Söldner meinten, wenn ich ihnen helfe den Ocorel-Habicht zu erlegen, bekomme ich ein besseres Ansehen bei Berengar. Alles was ich dafür tun muß ist auf den Aussichtsturm zu klettern und dann zu rufen, wenn ich ihn sehe...");

	Log_CreateTopic (BekanntePersonen,LOG_NOTE);
	B_LogEntry		(BekanntePersonen,"Berengar : Lageranführer");
	AI_StopProcessInfos(self);

};

// ******************************************************************
//							Weg vom Fenster?
// ******************************************************************

INSTANCE Info_Sld_A_Verarsch1_Offroad(C_INFO)
{
	npc			= Sld_A;
	nr			= 2;
	condition	= Info_Sld_A_Verarsch1_Offroad_Condition;
	information	= Info_Sld_A_Verarsch1_Offroad_Info;
	permanent	= 0;
	important   = 1;
	//description = "Nein! Warum sollte ich?";
};

FUNC INT Info_Sld_A_Verarsch1_Offroad_Condition()
{
	if (Npc_GetDistToWP(hero, "AM_HOCHSTAND_00") > 900)				// edit -Harri
	&& DC_1_Tower == 0 	 //&& Npc_GetDistToWP(self,"SEE_VOR_STADT_10")<=500	- warumm? -Harri
	&& !C_BodyStateContains(hero,BS_CLIMB)
	&& Npc_KnowsInfo(hero, Info_Sld_A_Verarsch1_1)
	&& !(Npc_KnowsInfo(hero, Sld_B_NoWait))
	&& !(Npc_KnowsInfo(hero, Sld_A_Verarsch1_Back1))
	&& (Npc_GetDistToWP(hero,"SEE_VOR_STADT_12") > 400)
	{
	return 1;
	};
};

FUNC VOID Info_Sld_A_Verarsch1_Offroad_Info()
{
	AI_GotoNpc (self, hero);	//Damit die Ausgabe sichtbar ist...(beim lesen)
	AI_Output (self,other,"Info_Sld_A_Verarsch1_Offroad_06_00"); //Verdammt, wo rennst du hin? Ist dein Ehrgeiz schon verschwunden?

	Info_ClearChoices(Info_Sld_A_Verarsch1_Offroad);
	Info_AddChoice(Info_Sld_A_Verarsch1_Offroad,"Doch! Wollt mich nur mal umsehn...",Info_Sld_A_Verarsch1_Offroad_Yes);
	Info_AddChoice(Info_Sld_A_Verarsch1_Offroad,"Sehe ich aus wie ein Vogelfänger?",Info_Sld_A_Verarsch1_Offroad_No);

};

//Spieler macht weida
FUNC VOID Info_Sld_A_Verarsch1_Offroad_Yes()
{
	AI_Output (other,self,"Info_Sld_A_Verarsch1_Offroad_Yes_15_00"); //Doch! Wollt mich nur mal umsehn...
	AI_Output (self,other,"Info_Sld_A_Verarsch1_Offroad_Yes_06_01"); //Du gehst jetzt da hoch oder wir vergessen es, KLAR?

	// --------- storyvar setzen ---------
	DC_1_Tower=1;

	// --------- Entfernung setzen -------
	get_away=Npc_GetDistToNpc(hero,self);

	Info_ClearChoices	(Info_Sld_A_Verarsch1_Offroad);
	AI_StopProcessInfos(self);

};

FUNC VOID Info_Sld_A_Verarsch1_Offroad_No()
{
	AI_Output (other,self,"Info_Sld_A_Verarsch1_Offroad_No_15_00"); //Sehe ich aus wie ein Vogelfänger?
	AI_Output (self,other,"Info_Sld_A_Verarsch1_Offroad_No_06_01"); //Das heißt also du steigst aus?! Schade um den guten Ruf, den du dir verdient hättest...
	DC_1_Tower=-1;			     							//er machts net!
	get_away=0;												//reset, einfach nur so :)
	Info_ClearChoices	(Info_Sld_A_Verarsch1_Offroad);
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	
	//--- Da Quest fehlgeschlagen ist, gehen die Söldner -------
	Npc_ExchangeRoutine(sld_b,"RALF"); 
	Npc_ExchangeRoutine(sld_a,"RAL");
//	AI_ContinueRoutine(sld_a);			// unnötig und macht prob. -Harri
	AI_ContinueRoutine(sld_b);
	
	B_LogEntry (VER_MISSION, "Ich habe die Aufgabe hingeschmissen, denn irgendwas kam mir komisch vor.");
	Log_SetTopicStatus (VER_MISSION, LOG_FAILED);
	
	
};


// ******** Spieler rennt weiter weg! ****************

INSTANCE Info_Sld_A_Verarsch1_Offroad1(C_INFO)
{
	npc			= Sld_A;
	nr			= 1;
	condition	= Info_Sld_A_Verarsch1_Offroad1_Condition;
	information	= Info_Sld_A_Verarsch1_Offroad1_Info;
	permanent	= 0;					// edit -Harri
	important   = 1;
	//description = "Nein! Warum sollte ich?";
};

FUNC INT Info_Sld_A_Verarsch1_Offroad1_Condition()
{
	if (Npc_GetDistToWP(hero, "AM_HOCHSTAND_00") > 1600) 	// edit -Harri
	&& DC_1_Tower == 1
	&& !C_BodyStateContains(hero,BS_CLIMB) 
	&& (Npc_KnowsInfo(hero, Info_Sld_A_Verarsch1_Offroad))
	&& !(Npc_KnowsInfo(hero, Sld_B_NoWait))				// edit -Harri
	// Added by Markus
	&& (Npc_GetDistToWP(hero, "SEE_VOR_STADT_12") > 400)		// edit -Harri
	{
	return 1;
	};
};

FUNC VOID Info_Sld_A_Verarsch1_Offroad1_Info()
{
	AI_GotoNpc (self, hero);	//Damit die Ausgabe sichtbar ist...(beim lesen)
	AI_Output (self,other,"Info_Sld_A_Verarsch1_Offroad1_Info_06_00"); //Warum hörst du nicht auf mich? So wirst du es im Lager nie zu etwas bringen, Schwachkopf!
	DC_1_Tower=-1;

	//AI_GotoWP (hero, "SEE_VOR_STADT_11"); //Added by Markus, um Hero einzusperren
						// Wieder rausgenommen, da es VIEL zu lange dauert

	get_away=0;							 //reset, einfach mal so :)
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	
	//--- Da Quest fehlgeschlagen ist, gehen die Söldner -------
	Npc_ExchangeRoutine(sld_b,"RALF"); 
	Npc_ExchangeRoutine(sld_a,"RAL");
//	AI_ContinueRoutine(sld_a);				// unnötig und macht prob. -Harri
	AI_ContinueRoutine(sld_b);
	
	B_LogEntry (VER_MISSION, "Ich bin vom Hochstand weggegangen. Ich glaube nicht, dass die Söldner auf mich warten werden.");
	Log_SetTopicStatus (VER_MISSION, LOG_FAILED);
};


// ******************************************************************
//							Verarschung überstanden(Trialog)
// ******************************************************************

INSTANCE Sld_A_Verarsch1_Back1(C_INFO)
{
	npc			= Sld_A;
	nr			= 1;
	condition	= Sld_A_Verarsch1_Back1_Condition;
	information	= Sld_A_Verarsch1_Back1_Info;
	important   = 1;
	permanent = 0;
	//description = "Da waren überall Wölfe! Wo wart ihr auf einmal?";
};

FUNC INT Sld_A_Verarsch1_Back1_Condition ()
	{
	if (Npc_GetDistToWP(self,"BRUECKE_001") <= 500 && !(DC_1_Tower == -1))
		{
		return 1;
		};
	};

FUNC VOID Sld_A_Verarsch1_Back1_Info()
{
	AI_Output (other,self,"Sld_A_Verarsch1_Back_Info_15_00"); //Da waren überall Wölfe! Wo wart ihr auf einmal?
	AI_Output (self,other,"Sld_A_Verarsch1_Back_Info_06_01"); //Wölfe, wo?  Ich hab keine gesehen (lacht). Und jetzt hau ab Spitzbube, sonst zieh ich dir die Ohren lang. 

        //Speak2me = 1;     //SLD_A hat Dia beendet
	AI_StopProcessInfos(self);
	B_GiveXP (50);
};


// ******************************************************************
//							Verarschung Teil2(Brücke)
// ******************************************************************

INSTANCE Sld_A_Verarsch2(C_INFO)
{
	npc			= Sld_A;
	nr			= 1;
	condition	= Sld_A_Verarsch2_Condition;
	information	= Sld_A_Verarsch2_Info;
	permanent	= 0;
	important   = 1;
	//description = "Wen haben wir denn da?";
};

FUNC INT Sld_A_Verarsch2_Condition()
{
	if(DC_2_Smith && Npc_HasItems(other,DC_Rohstahlkiste) >= 1 && BrueckenEinbruch == 0
		&& !(DC_1_Tower == -1))
	{
		return TRUE;
	};

};

FUNC VOID Sld_A_Verarsch2_Info()
{
	AI_Output (self,other,"Sld_A_Verarsch2_Info_06_00"); //Wen haben wir denn da?
	AI_Output (other,self,"Sld_A_Verarsch2_Info_15_01"); //Oh, da bin ich aber beruhigt! Wenn ihr hier seit, sind wenigstens keine Wölfe in der Nähe.
	AI_Output (self,other,"Sld_A_Verarsch2_Info_06_02"); //Ach Junge, das mit den Wölfen... wir hatten ja keine Ahnung. Wir waren ... besorgt, als wir wegliefen. Kannst uns glauben!
	AI_Output (other,self,"Sld_A_Verarsch2_Info_15_03"); //Am besten jeder geht seiner Arbeit nach! Solange sich unsere Wege nicht kreuzen, kommen wir bestimmt gut miteinander aus!
	AI_Output (self,other,"Sld_A_Verarsch2_Info_06_04"); //Mann wie uns das Leid tat mit den Wölfen. 
	AI_Output (other,self,"Sld_A_Verarsch2_Info_15_06"); //Ich muss weiter, der Schmied wartet auf mich.
	AI_Output (self,other,"Sld_A_Verarsch2_Info_15_07"); //Dann wollen wir dich auch nicht weiter aufhalten.

	AI_StopProcessInfos(self);
};

/*
// -------------- Startdialog ----------------
instance DIA_DIC_Monolog (C_INFO)
	{
	npc = Sld_A;
	nr = 1;
	condition = DIA_DIC_Monolog_Condition;
	information = DIA_DIC_Monolog_Info;
	important = 1;
	permanent = 0;
	description = "Wie lange sind wir jetzt hier im Lager?";
	};

FUNC INT DIA_DIC_Monolog_Condition()
	{
	if (Npc_GetDistToNpc(self,hero) < 1000)
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Monolog_Info()
	{
	//Npc_ExchangeRoutine(self,"WAIT");	
	//AI_ContinueRoutine(self);	
		
	AI_Output (other, self, "DIA_DIC_Monolog_15_00"); //Wie lange sind wir jetzt hier im Lager? Zwei Monate, drei? Berengar habe ich in der ganzen Zeit nicht zu Gesicht bekommen. 
	AI_Output (other, self, "DIA_DIC_Monolog_15_01"); //Als ich ihm damals gefolgt bin, hätt' ich nie im Leben geglaubt, dass wir so weit reisen werden. Nun ja, fast sind wir wieder zurück in Gatyah. Obwohl, hier in der Festung Parthalan werden wir noch eine Weile bleiben.
	AI_Output (other, self, "DIA_DIC_Monolog_15_02"); //Für mich gibt es viel zu tun. Ich bin es leid, dass die Söldner mich wie einen schäbigen Laufburschen behandeln. Ich muss endlich im Lager ernst genommen werden.
	AI_Output (other, self, "DIA_DIC_Monolog_15_03"); //Und ich weiß, dass ich ein Krieger sein kann. Außerdem will ich ein Kämpfer an Berengars Seite werden. Spätestens dann sieht niemand mehr einen Dienstboten in mir. Berengar wird seinen verlorenen Ruhm zurückerkämpfen, und ich werde seine rechte Hand dabei sein.
	AI_Output (other, self, "DIA_DIC_Monolog_15_04"); //Wo ist eigentlich Alwin? Neben Berengar ist er der einzige, dem ich hier im Lager vertrauen kann. Egal...
	AI_Output (other, self, "DIA_DIC_Monolog_15_05"); //Zuerst helfe ich den Söldnern hier. Berengar sagte, er hat ein Auge auf mich geworfen, und er riet mir, im Lager zu helfen, wo immer ich kann.
	AI_Output (other, self, "DIA_DIC_Monolog_15_06"); //Ich weiß noch genau, was er zu mir sagte: "Der Tag wird kommen, an dem ich dich zu mir rufe. Wenn sich zeigt, dass du würdig bist in meine Dienste zu treten, kannst du mit deiner Ausbildung zum Krieger beginnen." Ja, und wenn dieser Tag kommt, werde ich bereit sein. 

	AI_StopProcessInfos(self);
	AI_GotoWP (hero, "SEE_VOR_STADT_10");
	};
*/

