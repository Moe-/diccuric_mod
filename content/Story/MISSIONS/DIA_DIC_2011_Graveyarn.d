//------------ ENDE -----------------
instance DIA_DIC_Graveyarn_Exit (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 999;
	condition = DIA_DIC_Graveyarn_Exit_Condition;
	information = DIA_DIC_Graveyarn_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Graveyarn_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Graveyarn_Exit_Info ()
	{
	AI_Output (self,other,"Graveyarn_Exit_Info_04_00"); //Bedenke: Es ist alles für was Gutes. Für Berengar.
	AI_StopProcessInfos (self);
	};

// ------------- Slade -------------
instance DIA_DIC_Graveyarn_Slade (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 3;
	condition = DIA_DIC_Graveyarn_Slade_Condition;
	information = DIA_DIC_Graveyarn_Slade_Info;
	permanent = 0;
	important = 1;
	description = "Fortschritt";
	};

func int DIA_DIC_Graveyarn_Slade_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Alwin_Slade) && !Npc_KnowsInfo(other, DIA_DIC_Slade_Exit)
		&& !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Briefe))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Slade_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Slade_04_00"); //Wie? kommst du mit meinen Aufträgen voran?
	AI_Output (other, self, "DIA_DIC_Graveyarn_Slade_15_01"); //Gut. Sehr gut. Kannst du mir helfen? Ich muß wissen wo sich Slade zur Zeit aufhält.
	AI_Output (self, other, "DIA_DIC_Graveyarn_Slade_04_02"); //Ich weiß zwar nicht, wie Slade dir bei den Aufträgen helfen kann, aber mich interessiert nur, was du erreichst, und nicht, wie du es erreichst. Also: Slade hat gerade das Lager verlassen. Er ist in südlicher Richtung aufgebrochen.

	B_LogEntry (PytQuest, "Graveyarn sagt das Slade erst vor kurzem in südlicher Richtung das Lager verlassen hat.");
	};

// ------------- Taliasan Prüfungen erledigt ------------
instance DIA_DIC_Graveyarn_Briefe (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 4;
	condition = DIA_DIC_Graveyarn_Briefe_Condition;
	information = DIA_DIC_Graveyarn_Briefe_Info;
	permanent = 0;
	important = 1;
	description = "Wie weit?";
	};

func int DIA_DIC_Graveyarn_Briefe_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Taliasan_DreiB)) // && (Npc_HasItems(other, ItArScrollControl) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Briefe_Info ()
	{
	AI_Output ( self, other, "DIA_DIC_Graveyarn_Briefe_04_00"); //Wie? weit? bist du mit meinem Auftrag? Du solltest dich langsam ein wenig sputen. Es stehen noch weitere Aufgaben für dich an. Dir steht langwierige Arbeit bevor.

	Npc_RemoveInvItem (hero, TalZauber);
 	//AI_UseItem (hero, TalZauber);
 	AI_PlayAni (hero,"T_PRACTICEMAGIC");
 	AI_PlayAni (self,"T_PRACTICEMAGIC3");
 	AI_Wait	(self,	3);
 	AI_StandUpQuick (hero);

	AI_Output ( self, other, "DIA_DIC_Graveyarn_Briefe_04_01"); //Du hast es geschafft, und alle meine Prüfungen bestanden. Du überraschst mich. Ich werde Berengar Bescheid geben. Schon morgen kannst du dich bei ihm melden. Von nun an wirst du deine Treue ihm unter Beweis stellen. 

	B_LogEntry (GY_PR_1, "Mit Taliasans Hilfe habe ich nun Graveyarn überzeugt, dass ich seine Prüfungen erledigt habe.");
	Log_SetTopicStatus(GY_PR_1, LOG_SUCCESS);
	B_LogEntry (TaliasansNeueAuftraege, "Ich habe mit Taliasans Hilfe Graveyarn von mir überzeugt und soll zu einem Gespräch mit Berengar");
	Log_SetTopicStatus	(TaliasansNeueAuftraege, LOG_SUCCESS);
	B_GiveXP (500);
	
	B_LogEntry (EintrittBurg, "Endlich ist es soweit. Ab morgen werde ich die Aufträge Berengars erledigen.");
	Log_SetTopicStatus	(EintrittBurg,	LOG_SUCCESS);
	GraveyarnTag = Wld_GetDay();
	UpgradeHaendlerA ();
	};

/* Funktion von Alex übernommen - siehe weiter unten
// --------------- Graveyarn will Junge prüfen -------------
// instance DIA_DIC_Graveyarn_Pruefen  (C_INFO)
//	{
//	npc = DIC_2011_Graveyarn;
//	nr = 1;
//	condition = DIA_DIC_Graveyarn_Pruefen_Condition;
//	information = DIA_DIC_Graveyarn_Pruefen_Info;
//	permanent = 0;
//	important = 1;
//	description = "Junge prüfen";
//	};
//
//func int DIA_DIC_Graveyarn_Pruefen_Condition ()
//	{
//	return 1;
//	};
//
//func void DIA_DIC_Graveyarn_Pruefen_Info ()
//	{
//	AI_Output (self, other, "DIA_DIC_Graveyarn_Pruefen_04_00"); //Ah. Da bist du ja. Ich habe dir einiges mitzuteilen, was dein Leben hier ändern wird. Bisher warst du ein kleines Licht bei uns. 
//	AI_Output (self, other, "DIA_DIC_Graveyarn_Pruefen_04_01"); //Du weißt nichts über Berengars Gemeinschaft.
//	AI_Output (self, other, "DIA_DIC_Graveyarn_Pruefen_04_02"); //Aber Berengar schenkt dir seine Aufmerksamkeit. Mir soll das recht sein. Auch wenn du eine Kröte wärst, würde ich das tun, was Berengar von mir verlangt. 
//	AI_Output (self, other, "DIA_DIC_Graveyarn_Pruefen_04_03"); //Also hör gut zu. Berengar will, das du für ihn einige Aufgaben erledigst. Wenn es dir gelingt, diese zu meistern, wirst du in die Geheimnisse unserer Vereinigung eingeweiht. 
//	AI_Output (self, other, "DIA_DIC_Graveyarn_Pruefen_04_04"); //Aber vorher werde ich dich prüfen. Du unterliegst jetzt meiner Aufsicht! Wenn du alles zu meiner Zufriedenheit erledigst, werde ich Berengar sagen, dass du einen ersten Beweis deiner Ergebenheit erbracht hast.
//	AI_Output (other, self, "DIA_DIC_Graveyarn_Pruefen_15_05"); //Ich werde tun, was für mich vorgesehen ist, und ich werde alles daransetzen, Berengar nicht zu enttäuschen.
//	AI_Output (self, other, "DIA_DIC_Graveyarn_Pruefen_04_06"); //Gut. Deine erste Aufgabe ist noch ein Kinderspiel: Die Förderrampe ist kaputt. Albros hat das zerschlissene Zahnrad wieder repariert. Also hol es dir bei ihm ab. Zwei Arbeiter warten auf dich. Mit ihnen wirst du die Winde reparieren und diese verdammte Rampe wieder zum Laufen bringen. 
//	AI_Output (other, self, "DIA_DIC_Graveyarn_Pruefen_15_07"); //OK.
//
//	B_LogEntry (GraveyarnsAuftraege, "1.Graveyarn hat mich beauftragt Prüfungen für ihn abzulegen, um später für Berengar arbeiten zu dürfen.");
//	B_LogEntry (GraveyarnsAuftraege, "2.Ich soll für Graveyarn die Anlieferungsrampe mit zwei Arbeitern reparieren. Dazu muß ich zuerst das Zahnrad vom Werkmeister abholen und danach mit den Arbeitern zur Rampe hochgehen.");
//	};
*/

// ----------------- Graveyarn gibt Jungen Amulette -------
instance DIA_DIC_Graveyarn_Amulette (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 5;
	condition = DIA_DIC_Graveyarn_Amulette_Condition;
	information = DIA_DIC_Graveyarn_Amulette_Info;
	permanent = 0;
	important = 0;
	description = "Graveyarn, ich habe zwei Jäger entdeckt.";
	};

func int DIA_DIC_Graveyarn_Amulette_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Jaeger_2020_Arbeit) || Npc_KnowsInfo (other, DIA_DIC_Jaeger_2021_Arbeit))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Amulette_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Amulette_15_00"); //Graveyarn. Zwei Jäger lungern herum und saufen, obwohl Narrow sie dringend braucht. Als ich mit ihnen redete, drohten sie mir. 
	AI_Output (self, other, "DIA_DIC_Graveyarn_Amulette_04_01"); //Hm, im Moment habe ich keine Zeit. Schade, ich hätte nicht übel Lust, die beiden öffentlich verprügeln zu lassen. Hm... Dann muss es so gehen!
	AI_Output (other, self, "DIA_DIC_Graveyarn_Amulette_15_02"); //Wie?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Amulette_04_03"); //Nimm diese Medaille. Geh zu den Jägern, zeig sie ihnen.
	AI_Output (other, self, "DIA_DIC_Graveyarn_Amulette_15_04"); //Aber was soll das denn bringen?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Amulette_04_05"); //Unterbrich mich nicht. Sie werden wissen, dass du in meinem Auftrag handelst. 
	AI_Output (other, self, "DIA_DIC_Graveyarn_Amulette_15_06"); //Okay.
	AI_Output (self, other, "DIA_DIC_Graveyarn_Amulette_04_07"); //Sag ihnen, wenn sie nicht allerkürzester Zeit ihren Posten aufsuchen, werde ich ihre Namen herausfinden. Und sag ihnen, dass ich gleich danach überprüfen lassen werde, ob die Dachtraufe des Turmes das Gewicht von zwei am Strick baumelnden Männern aushält. 
	AI_Output (other, self, "DIA_DIC_Graveyarn_Amulette_15_08"); //Ich bin auf dem Weg.
	AI_Output (self, other, "DIA_DIC_Graveyarn_Amulette_04_09"); //Meld dich bei mir wenn du das erledigt hast.

	CreateInvItem (self, Graveyarn_Erkennung);
	B_GiveInvItems(self, other, Graveyarn_Erkennung, 1);
	
	B_LogEntry (NarrowMission, "Graveyarn hat mir ein Amulette gegeben, mit dem ich die beiden Jäger überzeugen können sollte.");
	};

// ------ Junge zurück bei Graveyarn ---------
instance DIA_DIC_Graveyarn_Jaeger (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 6;
	condition = DIA_DIC_Graveyarn_Jaeger_Condition;
	information = DIA_DIC_Graveyarn_Jaeger_Info;
	permanent = 0;
	description = "Ich habe mich darum gekümmert. Sie sind auf dem Weg.";
	};

func int DIA_DIC_Graveyarn_Jaeger_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Jaeger_2020_Graveyarn) || Npc_KnowsInfo (other, DIA_DIC_Jaeger_2021_Graveyarn))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Jaeger_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Jaeger_15_00"); //Ich habe mich darum gekümmert. Sie sind auf dem Weg.
	AI_Output (self, other, "DIA_DIC_Graveyarn_Jaeger_04_01"); //Hm. Gut gemacht.
	AI_Output (other, self, "DIA_DIC_Graveyarn_Jaeger_15_02"); //Hier die Medaillie.

	B_GiveInvItems (other, self, Graveyarn_Erkennung, 1);
	B_GiveXP (250);
	
	B_LogEntry (NarrowMission, "Ich habe Graveyarn das Amulette zurückgegeben.");
	};

// Anfang Scripte von Alex
// ******************************************************************
//					erste Anerkennung von Grave
// ******************************************************************

INSTANCE Graveyarn_Anerk(C_INFO)
{
	npc			= DIC_2011_Graveyarn;
	nr			= 1;
	condition	= Graveyarn_Anerk_Condition;
	information	= Graveyarn_Anerk_Info;
	permanent	= 0;
	important   = 1;
	//description = "Vereiert von 2 Söldnern";
};

FUNC INT Graveyarn_Anerk_Condition()
{
	if(DC_2_Smith == 2)
	{
		return TRUE;
	};

};

FUNC VOID Graveyarn_Anerk_Info()
{
	AI_Output (self,other,"Graveyarn_Anerk_Info_04_00"); //Ah. Da bist du ja. Ich habe dir einiges zu sagen, was dein Leben hier ändern könnte.
	AI_Output (self,other,"Graveyarn_Anerk_Info_04_01"); //Berengar hat seltsamerweise ein Auge auf dich geworfen. Und auch wenn du eine Kröte wärst, würde ich tun was Berengar verlangt.
	AI_Output (self,other,"Graveyarn_Anerk_Info_04_02"); //Hör zu. Berengar will das du für ihn arbeitest. Wenn es dir gelingt die Gunst Berengars zu erwerben, dann wirst du in die Geheimnisse unserer Gemeinschaft eingeweiht.
	AI_Output (self,other,"Graveyarn_Anerk_Info_04_03"); //Aber vorher unterliegst du meiner Obhut und ich werde dich prüfen. Wenn du die Prüfungen bestehst, werde ich Berengar ausrichten, dass du einen ersten, kleinen Beweis deiner Loyalität erbracht hast.
	AI_Output (other,self,"Graveyarn_Anerk_Info_15_04"); //Ich werde tun was für mich vorgesehen ist und ich werde alles daransetzen meinen ... äh ..Berengar nicht zu enttäuschen.
	AI_Output (self,other,"Graveyarn_Anerk_Info_04_05"); //Gut. Dann hier deine erste Prüfung: Hole dir beim Schmied ein Zahnrad. Dort warten bereits zwei Arbeiter. Mit ihnen gehst du hoch zur Anlieferungsrampe. Die Winde ist kaputt und bisher ist es niemandem gelungen diese wieder herzurichten.
	AI_Output (other,self,"Graveyarn_Anerk_Info_15_06"); //OK. Dann soll ich also die Winde raperien.
	AI_Output (self,other,"Graveyarn_Anerk_Info_04_07"); //Kluges Kerlchen, genau...

	// Logeinträge
	Log_CreateTopic (GY_PR_1,LOG_MISSION);
	Log_SetTopicStatus(GY_PR_1, LOG_RUNNING);
	B_LogEntry (GY_PR_1, "Graveyarn hat mich beauftragt Prüfungen für ihn abzulegen, um später für Berengar arbeiten zu dürfen.");
	B_LogEntry (GY_PR_1, "Ich soll für Graveyarn die Anlieferungsrampe mit zwei Arbeitern reparieren. Dazu muss ich zuerst das Zahnrad vom Schmied abholen und danach mit den Arbeitern zur Rampe hochgehen.");

	B_LogEntry		(BekanntePersonen,"Graveyarn : Rechte Hand Berengars.");
	// Mission startet
	DC_3_AP = 1;
	AI_StopProcessInfos(self);
	
	Wld_InsertItem	(Schmied_Schreiben, "FP_STADTSCHMIEDE_NOTIZ");

	//Alwin zurückholen => Alternative Story, added my Moe
	Npc_ExchangeRoutine(DIC_2003_ALWIN, "START");
};

// ************************************************************
// 								Wo ist Werksmeister?
// ************************************************************

INSTANCE Graveyarn_WhereW (C_INFO)
{
	npc			= DIC_2011_Graveyarn;
	nr			= 2;
	condition	= Graveyarn_WhereW_Condition;
	information	= Graveyarn_WhereW_Info;
	permanent	= 0;
	description = "Wo ist der Werksmeister?";
};

FUNC INT Graveyarn_WhereW_Condition()
{
	if(DC_3_AP && !Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen) 
		&& !Npc_KnowsInfo(hero, Werksmeister_ZR))
	{
		return 1;
	};
};

FUNC VOID Graveyarn_WhereW_Info()
{
	AI_Output (other,self,"Graveyarn_WhereW_Info_15_00"); //Wo ist der Werksmeister?
	AI_Output (self,other,"Graveyarn_WhereW_Info_04_01"); //Er ist in seiner Hütte vor dem Marktplatz.

	B_LogEntry(BekanntePersonen, "Der Werksmeister – Er ist in seiner Hütte vor dem Marktplatz.");
};

// --------------- Scripte von Markus Teil 2 -------------------

// -------------------- Rampe ist repariert? --------------------
instance DIA_DIC_Graveyarn_Repariert (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 13;
	condition = DIA_DIC_Graveyarn_Repariert_Condition;
	information = DIA_DIC_Graveyarn_Repariert_Info;
	permanent = 1;
	important = 1;
	description = "Hast du es geschafft die Rampe zu reparieren?";
	};

func int DIA_DIC_Graveyarn_Repariert_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Arbeiter_2015_Angekommen) && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen))
	&& Npc_RefuseTalk(self)==FALSE && !(Npc_KnowsInfo (other, DIA_DIC_Arbeiter_Repariert)))
	|| (Npc_IsInState(self, ZS_Talk) && Npc_KnowsInfo (other, DIA_DIC_Arbeiter_2015_Angekommen)
	&& !Npc_KnowsInfo (other, DIA_DIC_Graveyarn_RepariertJa) && !Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Repariert_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Repariert_04_00"); //Hast du es geschafft die Rampe zu reparieren?
	GraveyarnNerve = 1;
	Npc_SetRefuseTalk(self, 30);
	};

// -------------------- Hab nicht repariert --------------------
instance DIA_DIC_Graveyarn_RepariertNein (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 13;
	condition = DIA_DIC_Graveyarn_RepariertNein_Condition;
	information = DIA_DIC_Graveyarn_RepariertNein_Info;
	permanent = 1;
	important = 0;
	description = "Nein, noch nicht.";
	};

func int DIA_DIC_Graveyarn_RepariertNein_Condition ()
	{
	if (GraveyarnNerve == 1 && !(Npc_KnowsInfo (other, DIA_DIC_Graveyarn_RepariertJa))
		&& !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_RepariertNein_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_RepariertJa_15_00"); //Nein.
	AI_Output (self, other, "DIA_DIC_Graveyarn_RepariertJa_04_01"); //Dann versuch es weiter. Es geht hier nicht darum solange auf einen Auftrag zu warten, bis einer kommt der dir passt.
	AI_Output (other, self, "DIA_DIC_Graveyarn_RepariertJa_15_02"); //Ok. Ich mach mich auf den Weg.

	if (Npc_HasItems(other, ItArScrollControl) >= 1 && !(Npc_KnowsInfo(hero, DIA_DIC_Graveyarn_RepariertNein)))
		{
		AI_Output (self, other, "DIA_DIC_Graveyarn_RepariertJa_04_03"); //Warte. Du brauchst eine Waffe. Hier. Ein Dolch, der dir nützlich sein wird.

		CreateInvItem	(self, ItMw_1H_Sword_Short_05);
		B_GiveInvItems(self, other,ItMw_1H_Sword_Short_05,1);
		};

	//AI_Wait(self, 120);
	Npc_SetRefuseTalk(self, 30);
	AI_StopProcessInfos (self);
	};

// -------------------- Hab repariert --------------------
instance DIA_DIC_Graveyarn_RepariertJa (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 13;
	condition = DIA_DIC_Graveyarn_RepariertJa_Condition;
	information = DIA_DIC_Graveyarn_RepariertJa_Info;
	permanent = 0;
	important = 0;
	description = "Ja, ich habe die Rampe repariert.";
	};

func int DIA_DIC_Graveyarn_RepariertJa_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Arbeiter_Repariert) && !Npc_KnowsInfo(other, DIA_dic_Taliasan_Annehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_RepariertJa_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_RepariertNein_15_00"); //Ja, ich habe die Rampe repariert. Es war kein Problem.
	AI_Output (self, other, "DIA_DIC_Graveyarn_RepariertNein_04_01"); //Gut. Die erste kleine Probe deiner Geschicklichkeit hast du bestanden. Der nächste Auftrag wird schwieriger. Einer meiner Männer wird dich zu einer Horde von Scavengern führen. Töte von ihnen so viele, wie du kannst, und bring das Fleisch ins Lager. 
	AI_Output (other, self, "DIA_DIC_Graveyarn_RepariertNein_15_02"); //Scavenger?
	AI_Output (self, other, "DIA_DIC_Graveyarn_RepariertNein_04_03"); //Genau. Die Söldner werden sich freuen, wenn sie hören, dass du ihnen das Abendessen beschafft hast. Und mich wird es freuen, wenn du meine Geduld nicht weiter strapazierst und endlich aufbrichst. 

	DIA_DIC_Graveyarn_Repariert.permanent = 0;
	DIA_DIC_Graveyarn_RepariertNein.permanent = 0;
	Npc_ExchangeRoutine	(DIC_2030_Soeldner,"SCAVS");
	AI_ContinueRoutine	(DIC_2030_Soeldner);
	DIC_2030_Soeldner.name = "Scavengerführer";
	Npc_SetRefuseTalk(self, 90);
	AI_StopProcessInfos (self);
	
	B_LogEntry (GY_PR_1, "Ich habe Graveyarn erzählt, dass wir die Rampe gerichtet haben.");
	Log_SetTopicStatus(GY_PR_1, LOG_SUCCESS);
	B_GiveXP (250);
	
	Log_CreateTopic (ScavJagd,  LOG_MISSION);
	Log_SetTopicStatus (ScavJagd, LOG_RUNNING);
	B_LogEntry (ScavJagd, "Ich soll für Söldner Fleisch besorgen. Einer von ihnen wird mich zu einer Scavenger Herde führen.");
	//AI_Wait(self, 120);
	};

// --------------- Scavenger erledigt? ----------------------
instance DIA_DIC_Graveyarn_Scav (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 13;
	condition = DIA_DIC_Graveyarn_Scav_Condition;
	information = DIA_DIC_Graveyarn_Scav_Info;
	permanent = 1;
	important = 1;
	description = "Was ist mit den Scavs?";
	};

func int DIA_DIC_Graveyarn_Scav_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Graveyarn_RepariertJa) && (Npc_RefuseTalk(self)==FALSE)
		&& !(Npc_KnowsInfo (hero, DIA_DIC_Graveyarn_GenugFleisch)) && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Scav_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Scav_04_00"); //Und? Was ist mit den Scavengern. Diese Huhnbiester hast du doch erledigt, oder?
	GraveyarnNerve = 2;
	};

// ------------- Zu wenig Fleisch ---------------
instance DIA_DIC_Graveyarn_KeinFleisch (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 14;
	condition = DIA_DIC_Graveyarn_KeinFleisch_Condition;
	information = DIA_DIC_Graveyarn_KeinFleisch_Info;
	permanent = 1;
	important = 0;
	description = "Ich habe es noch nicht geschafft.";
	};

func int DIA_DIC_Graveyarn_KeinFleisch_Condition ()
	{
	if GraveyarnNerve == 2
	// && Npc_HasItems(other, ItFoMuttonRaw) < 10			// er muß auch lügen dürfen wenn er will -harri
	&& !Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)
	
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_KeinFleisch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_KeinFleisch_15_00"); //Ich habe es noch nicht geschafft.
	AI_Output (self, other, "DIA_DIC_Graveyarn_KeinFleisch_04_01"); //Was willst du hier, wenn du den Auftrag noch nicht erledigt hast? Wenigstens zehn Scavenger solltest du auftischen.  Worauf wartest du noch?

	Npc_SetRefuseTalk(self, 90);
	AI_StopProcessInfos (self);
	//AI_Wait(self, 120);
	};

// ------------ Hat mind. 10 Fleisch -------------
instance DIA_DIC_Graveyarn_GenugFleisch (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 15;
	condition = DIA_DIC_Graveyarn_GenugFleisch_Condition;
	information = DIA_DIC_Graveyarn_GenugFleisch_Info;
	permanent = 0;
	important = 0;
	description = "Ja, ich habe den Auftrag erfüllt.";
	};

func int DIA_DIC_Graveyarn_GenugFleisch_Condition ()
	{
	if Npc_HasItems(other, ItFoMuttonRaw) >= 10
	&& !Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)
	&& Npc_KnowsInfo(hero, DIA_DIC_2030_Soeldner_Scavs)			// sonst kann er es erfüllen ohne zu den scavs zu gehen  -Harri
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_GenugFleisch_Info()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_GenugFleisch_15_00"); //Ja, ich habe den Auftrag erfüllt.
	AI_Output (self, other, "DIA_DIC_Graveyarn_GenugFleisch_04_01"); //Deine nächste Prüfung ist ein Wettkampf.  Du und Koll, ihr tretet gegeneinander an. Aber nicht einzig Muskelkraft entscheidet. 
	AI_Output (self, other, "DIA_DIC_Graveyarn_GenugFleisch_04_02"); //Eure Aufgabe ist es, einen Kartenzeichner aufzuspüren, der seinen Dienst im östlichen Waldgebiet tut. Wenn ihr ihn findet wird der Zeichner euch die Karte ohne weiteres aushändigen. Wer mir die Karte überreicht, gewinnt. 

	DIA_DIC_Graveyarn_Scav.permanent = 0;
	DIA_DIC_Graveyarn_KeinFleisch.permanent = 0;
	
	// -------- Söldner von Scavjagd beenden, falls man ihn nicht trifft -------
	Npc_ExchangeRoutine(DIC_2030_Soeldner, "WALD");
	AI_ContinueRoutine	(DIC_2030_Soeldner);

	B_GiveInvItems(other, self, ItFoMuttonRaw, 10);
	Npc_ExchangeRoutine(self,"WALD");
	Npc_ExchangeRoutine(DIC_2031_Koll, "WALD");
	AI_ContinueRoutine	(DIC_2031_Koll);
	GraveyarnNerve = 3;
	B_GiveXP (350);
	
	B_LogEntry (ScavJagd, "Ich habe Graveyarn das Fleisch gebracht und eine neue Aufgabe erhalten.");
	Log_SetTopicStatus(ScavJagd, LOG_SUCCESS);
	
	Log_CreateTopic (DerKartenzeichner,  LOG_MISSION);
	Log_SetTopicStatus (DerKartenzeichner, LOG_RUNNING);
	B_LogEntry (DerKartenzeichner, "Ich soll gegen Koll ein Rennen bestreiten und einen Kartenzeichner zuerst finden.");
	};

// ---------------- Kartensuchquest ---------------
instance DIA_DIC_Graveyarn_Karte (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 16;
	condition = DIA_DIC_Graveyarn_Karte_Condition;
	information = DIA_DIC_Graveyarn_Karte_Info;
	permanent = 0;
	important = 1;
	description = "So. Hier ist es.";
	};

func int DIA_DIC_Graveyarn_Karte_Condition ()
	{
	if (Npc_GetDistToWP(self,"STADT_WEG_184")<300 && Npc_GetDistToNpc(self, DIC_2031_Koll) < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Karte_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Karte_04_00"); //So. Hier ist es. Der Wettkampf beginnt jetzt.

	Npc_ExchangeRoutine(self,"START");
	NPC_ExchangeRoutine(DIC_2031_Koll, "RUNA");
	AI_ContinueRoutine	(DIC_2031_Koll);
	AI_SetWalkMode(DIC_2031_Koll, NPC_RUN);
	KollTag = Wld_GetDay();
	B_LogEntry (DerKartenzeichner, "Der Wettkampf hat begonnen.");
	};

// -------------- Hast du die Karte ----------
instance DIA_DIC_Graveyarn_KarteDabei (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 17;
	condition = DIA_DIC_Graveyarn_KarteDabei_Condition;
	information = DIA_DIC_Graveyarn_KarteDabei_Info;
	permanent = 0;
	important = 1;
	description = "Hast du die Karte?";
	};

func int DIA_DIC_Graveyarn_KarteDabei_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_2032_Waechter_Junge))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_KarteDabei_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_KarteDabei_04_00"); //Hast du die Karte?
	CreateInvItem (Dic_2034_Homer, Graveyarn_Karte);
	if (Npc_HasItems (other, Graveyarn_Karte) >= 1)
		{
		Info_AddChoice (DIA_DIC_Graveyarn_KarteDabei, "Ja, hier.", DIA_DIC_Graveyarn_KarteGeben);
		}
	else
		{
		Info_AddChoice (DIA_DIC_Graveyarn_KarteDabei, "Nein. Koll war schneller.", DIA_DIC_Graveyarn_KarteNichtDa);
		};
	};

func void DIA_DIC_Graveyarn_KarteGeben ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_KarteGeben_15_00"); //Ja, hier.
	AI_Output (self, other, "DIA_DIC_Graveyarn_KarteGeben_04_01"); //Gut. Weiter so und du wirst schon in wenigen Wochen mit Berengar über deinen neuen Rang sprechen können.
	GraveyarnKarteHolen = 1;
	B_GiveInvItems(other, self, Graveyarn_Karte, 1);
	Info_ClearChoices(DIA_DIC_Graveyarn_KarteDabei);
	
	B_LogEntry (DerKartenzeichner, "Ich habe Graveyarn die Karte gebracht.");
	Log_SetTopicStatus (DerKartenzeichner, LOG_SUCCESS);
	B_GiveXP (450);
	};

func void DIA_DIC_Graveyarn_KarteNichtDa ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_KarteNichtDa_15_00"); //Nein. Koll war schneller.
	AI_Output (self, other, "DIA_DIC_Graveyarn_KarteNichtDa_04_01"); //Du hast es also nicht geschafft. Hmm. Sowas mache ich eigentlich nicht, aber ich gebe dir noch eine zweite Chance. Immerhin kommt es nicht oft vor, dass Berengar sein Augenmerk auf einen Knirps richtet.
	AI_Output (other, self, "DIA_DIC_Graveyarn_KarteNichtDa_15_02"); //Danke. Was soll ich tun?
	AI_Output (self, other, "DIA_DIC_Graveyarn_KarteNichtDa_04_03"); //Westlich von hier, im nahegelegenen Wald, lebt ein Rudel Wölfe. Westlich, was rede ich da? Überall sind diese verdammten Bestien. Das ist kein Land mehr, sondern ein Wolfskäfig. 
	AI_Output (self, other, "DIA_DIC_Graveyarn_KarteNichtDa_04_03B"); //Aber mein Schwert hat noch lange nicht den letzten Hieb gegen diese Raubtiere geführt. Ahh, worum es geht: Einer meiner Späher liegt zerfetzt im westlichen Wald. Ein Wolfsrudel hat ihn so zugerichtet. 
	AI_Output (other, self, "DIA_DIC_Graveyarn_KarteNichtDa_15_04"); //Was soll ich tun?
	AI_Output (self, other, "DIA_DIC_Graveyarn_KarteNichtDa_04_05"); //Hör zu - der Späher sollte den Tierbestand an Wölfen zählen. Seine Aufzeichnungen führt er in einem kleinen Notizbuch mit sich. Wenn du es schaffst, zu der Leiche zu kommen und das Notizbuch zu holen, werde ich über dein Versagen beim Wettlauf hinwegsehen.
	AI_Output (other, self, "DIA_DIC_Graveyarn_KarteNichtDa_15_06"); //Ich übernehme den Auftrag.
	Info_ClearChoices(DIA_DIC_Graveyarn_KarteDabei);
	B_LogEntry (DerKartenzeichner, "Ich habe Graveyarn nicht die Karte gebracht, aber er gibt mir trotzdem nochmal eine Chance. Ich soll jetzt für ihn einen Notizblock finden, denn ein Späher beim Wölfezählen mit sich führte.");
	};

// ------- Junge hat Notizblock ----------
instance DIA_DIC_Graveyarn_Notizblock (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 18;
	condition = DIA_DIC_Graveyarn_Notizblock_Condition;
	information = DIA_DIC_Graveyarn_Notizblock_Info;
	permanent = 0;
	important = 0;
	description = "Hier ist das Notizbuch.";
	};

func int DIA_DIC_Graveyarn_Notizblock_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Graveyarn_KarteDabei) && Npc_HasItems (other, Notizblock) >= 1
		&& !(Npc_HasItems (self, Graveyarn_Karte) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Notizblock_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Notizblock_15_00"); //Ich habe es geschafft. Hier ist das Notizbuch.
	AI_Output (self, other, "DIA_DIC_Graveyarn_Notizblock_04_01"); //Hätte Berengar mir nicht gesagt, dass er bei dir ein besonderes Geschick vermutet, wäre ich jetzt beeindruckt.
	B_GiveInvItems(other, self, Notizblock, 1);
	Info_AddChoice (DIA_DIC_Graveyarn_Notizblock, "Hat er das wirklich über mich gesagt?", DIA_DIC_Graveyarn_Wirklich);
	GraveyarnKarteHolen = 1;
	B_GiveXP (350);
	
	B_LogEntry (DerKartenzeichner, "Ich habe Graveyarn den Notizblock bebracht.");
	Log_SetTopicStatus (DerKartenzeichner, LOG_SUCCESS);
	};

func void DIA_DIC_Graveyarn_Wirklich()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Wirklich_15_00"); //Hat er das wirklich über mich gesagt?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Wirklich_04_01"); //Und wenn schon. Ruh dich niemals auf deinem Ruf aus. Dafür wirst du auch keine Zeit haben. Dein nächster Auftrag steht schon an:
	};

// ------- Steinmetz und Hund ----------
instance DIA_DIC_Graveyarn_Steinmetz (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 19;
	condition = DIA_DIC_Graveyarn_Steinmetz_Condition;
	information = DIA_DIC_Graveyarn_Steinmetz_Info;
	permanent = 0;
	important = 0;
	description = "Was muss ich als nächstes tun?";
	};

func int DIA_DIC_Graveyarn_Steinmetz_Condition ()
	{
	if (GraveyarnKarteHolen == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Steinmetz_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Steinmetz_15_00"); //Was muss ich als nächstes tun?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Steinmetz_04_01"); //Seitdem wir in Etain unser Lager aufgeschlagen haben, führen wir im Umland einige Ausgrabungen durch. Wenn man mal die Dutzenden Gerippe beiseite lässt, die wir ausgebuddelt haben, so waren doch viele Kostbarkeiten darunter. Doch letzte Nacht ist uns eine Statue gestohlen worden!  
	
	Log_CreateTopic (BaddogHilfe,  LOG_MISSION);
	Log_SetTopicStatus (BaddogHilfe, LOG_RUNNING);
	B_LogEntry (BaddogHilfe, "Graveyarn sagte, dass eine Statue, die bei Ausgrabungen gefunden wurde, gestohlen wurde.");
	};

// ------- Ausgrabungen --------
instance DIA_DIC_Graveyarn_Ausgrabungen (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 20;
	condition = DIA_DIC_Graveyarn_Ausgrabungen_Condition;
	information = DIA_DIC_Graveyarn_Ausgrabungen_Info;
	permanent = 0;
	important = 0;
	description = "Warum macht ihr Ausgrabungen?";
	};

func int DIA_DIC_Graveyarn_Ausgrabungen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Steinmetz))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Ausgrabungen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Ausgrabungen_15_00"); //Warum macht ihr Ausgrabungen?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Ausgrabungen_04_01"); //Es gibt hier einiges zu finden in dieser Gegend. Und außer uns traut sich doch niemand hier hin.

	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Statuen) && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Lager))
		{
		AI_Output (self, other, "DIA_DIC_Graveyarn_Lager_04_02"); //Sehr seltsam war aber, dass er die Statue nicht nur gestohlen hat, sondern er hat die echte durch eine gefälschte Statue ausgetauscht!  Fast wären wir darauf reingefallen! Er muss seine Tat gut geplant haben.
		};
	};

// ------- Statuen --------
instance DIA_DIC_Graveyarn_Statuen (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 21;
	condition = DIA_DIC_Graveyarn_Statuen_Condition;
	information = DIA_DIC_Graveyarn_Statuen_Info;
	permanent = 0;
	important = 0;
	description = "Was für eine Statue?";
	};

func int DIA_DIC_Graveyarn_Statuen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Steinmetz))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Statuen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Statuen_15_00"); //Was für eine Statue?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Statuen_04_01"); //Ein Drache aus Erz.
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Ausgrabungen) && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Lager))
		{
		AI_Output (self, other, "DIA_DIC_Graveyarn_Lager_04_02"); //Sehr seltsam war aber, dass er die Statue nicht nur gestohlen hat, sondern er hat die echte durch eine gefälschte Statue ausgetauscht!  Fast wären wir darauf reingefallen! Er muss seine Tat gut geplant haben.
		};
	B_LogEntry (BaddogHilfe, "Die Statue ist ein Drache aus Erz.");
	};

// ------- Lager --------
instance DIA_DIC_Graveyarn_Lager (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 22;
	condition = DIA_DIC_Graveyarn_Lager_Condition;
	information = DIA_DIC_Graveyarn_Lager_Info;
	permanent = 0;
	important = 0;
	description = "Hat jemand aus dem Lager sie gestohlen?";
	};

func int DIA_DIC_Graveyarn_Lager_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Steinmetz))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Lager_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Lager_15_00"); //Hat jemand aus dem Lager sie gestohlen?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Lager_04_01"); //Nein. Ein Fremder hat sich  eingeschlichen. Wahrscheinlich waren die Wachen wieder besoffen! Der Dieb hat sich die Statue geschnappt und ist weg. Aber einer der Schützen hat ihn noch erwischt. Einen Pfeil hat er ihm auf jeden Fall verpasst. 
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Statuen) && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Ausgrabungen))
		{
		AI_Output (self, other, "DIA_DIC_Graveyarn_Lager_04_02"); //Aber eines ist seltsam. Der Dieb hat die Statue nicht einfach gestohlen, sondern er hat die echte durch eine gefälschte Statue ausgetauscht!  Fast wären wir darauf reingefallen. Er muss seine Tat gut geplant haben.
		};
	B_LogEntry (BaddogHilfe, "Der Täter scheint auch nicht aus dem Lager zu sein.");
	};

// ----------- Statue holen -----------
instance DIA_DIC_Graveyarn_StatueHolen (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 23;
	condition = DIA_DIC_Graveyarn_StatueHolen_Condition;
	information = DIA_DIC_Graveyarn_StatueHolen_Info;
	permanent = 0;
	important = 0;
	description = "Ich soll den Typen finden?";
	};

func int DIA_DIC_Graveyarn_StatueHolen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Statuen) && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Ausgrabungen)
		&& Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Lager))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_StatueHolen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_StatueHolen_15_00"); //Lass mich raten: Ich soll den DIeb finden, und die richtige Statue holen, richtig?
	AI_Output (self, other, "DIA_DIC_Graveyarn_StatueHolen_04_01"); //Richtig! Zeig dem Kerl, dass mit uns nicht zu spaßen ist!
	AI_Output (other, self, "DIA_DIC_Graveyarn_StatueHolen_15_02"); //Soll das heißen, ich soll ihn töten?
	AI_Output (self, other, "DIA_DIC_Graveyarn_StatueHolen_04_03"); //Mach mit ihm, was du willst. Mich interessiert nur die Statue!
	AI_Output (other, self, "DIA_DIC_Graveyarn_StatueHolen_15_04"); //Einverstanden, ich hole die Statue!  
	AI_Output (self, other, "DIA_DIC_Graveyarn_StatueHolen_04_05"); //Gut. Der Dieb ist von der Ausgrabungsstätte in den Wald gelaufen. Mehr weiß ich nicht. Du musst einfach den Wald nach ihm absuchen. Hier. Vielleicht wirst du das brauchen. 

	CreateInvItem (self, ItFo_Potion_Health_02);
	B_GiveInvItems (self, other,ItFo_Potion_Health_02,1);

	B_LogEntry (BaddogHilfe, "Ich soll eine kleine Statue finden, die gestohlen wurde.");
	};

// ----------- Landstreicher -----------
instance DIA_DIC_Graveyarn_Landstreicher (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 24;
	condition = DIA_DIC_Graveyarn_Landstreicher_Condition;
	information = DIA_DIC_Graveyarn_Landstreicher_Info;
	permanent = 0;
	important = 0;
	description = "Dann ist das aber nicht nur irgendein Landstreicher?";
	};

func int DIA_DIC_Graveyarn_Landstreicher_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Statuen) && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Ausgrabungen)
		&& Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Lager))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Landstreicher_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Landstreicher_15_00"); //Dann ist das aber nicht nur irgendein Landstreicher?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Landstreicher_04_01"); //Davon sollte man ausgehen. Immerhin hat er die Statue erstaunlich gut nachgebaut.
	};

// ----------- Warum traut sich denn niemand hier hin? -----------
instance DIA_DIC_Graveyarn_Niemand (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 25;
	condition = DIA_DIC_Graveyarn_Niemand_Condition;
	information = DIA_DIC_Graveyarn_Niemand_Info;
	permanent = 0;
	important = 0;
	description = "Warum traut sich denn niemand hier hin?";
	};

func int DIA_DIC_Graveyarn_Niemand_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Statuen) && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Ausgrabungen)
		&& Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Lager))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Niemand_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Niemand_15_00"); //Warum traut sich denn niemand hier hin?
	AI_Output (self, other, "DIA_DIC_Graveyarn_Niemand_04_01"); //Das hat mehrere Gründe. Das Volk Gatyahs fürchtet sich vor dieser Gegend. Und sollte doch mal jemand den Mut haben, nach Etain zu reisen, ist da noch das Gesetz des Königs. Eine lange Gefängnisstrafe droht jedem, der seinen Fuß auf diesen Boden setzt. 
	};

// ---------------- Junge bringt Statue -----------------
instance DIA_DIC_Graveyarn_Erzdrache (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 26;
	condition = DIA_DIC_Graveyarn_Erzdrache_Condition;
	information = DIA_DIC_Graveyarn_Erzdrache_Info;
	permanent = 0;
	important = 1;
	description = "Wie weit bist du mit meinem Auftrag?";
	};

func int DIA_DIC_Graveyarn_Erzdrache_Condition ()
	{
	if (Npc_HasItems (other, Erzdrache) >= 1 && Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Steinmetz))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Erzdrache_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Erzdrache_04_00"); //Wie? weit? bist du mit meinem Auftrag? Du solltest dich langsam ein wenig sputen.
	AI_Output (other, self, "DIA_DIC_Graveyarn_Erzdrache_15_01"); //Hier ist der Drache!
	AI_Output (self, other, "DIA_DIC_Graveyarn_Erzdrache_04_02"); //Du hast es geschafft. Ich hätte es kaum für möglich gehalten. Dies war die letzte Aufgabe, die du für mich erfüllen musstest. Ich werde Berengar Bescheid geben. Und schon morgen kannst du dich bei ihm melden. 

	B_LogEntry (BaddogHilfe, "Ich habe den Erzdrachen zu Graveyarn gebracht. Als nächstes soll ich zu Berengar gehen.");
	Log_SetTopicStatus	(BaddogHilfe,	LOG_SUCCESS);
	B_GiveXP (750);
	
	B_LogEntry (EintrittBurg, "Endlich ist es soweit. Ab morgen werde ich die Aufträge Berengars erledigen.");
	Log_SetTopicStatus	(EintrittBurg,	LOG_SUCCESS);
	GraveyarnTag = Wld_GetDay();
	UpgradeHaendlerA ();
	};
	
// ------------- melde dich -------------
instance DIA_DIC_Graveyarn_MeldeDich (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 27;
	condition = DIA_DIC_Graveyarn_MeldeDich_Condition;
	information = DIA_DIC_Graveyarn_MeldeDich_Info;
	permanent = 0;
	important = 1;
	description = "Fortschritt";
	};

func int DIA_DIC_Graveyarn_MeldeDich_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Bringt) && !Npc_KnowsInfo(other, DIA_DIC_Baltar_Uebernehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_MeldeDich_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_MeldeDich_04_00"); //Ardaric, melde dich bei Berengar!
	};
	
// ------------- melde dich -------------
instance DIA_DIC_Graveyarn_Endlich (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 27;
	condition = DIA_DIC_Graveyarn_Endlich_Condition;
	information = DIA_DIC_Graveyarn_Endlich_Info;
	permanent = 0;
	important = 1;
	description = "Fortschritt";
	};

func int DIA_DIC_Graveyarn_Endlich_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Uebernehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Endlich_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Endlich_04_00"); //Endlich! Noch ein paar Minuten und ich wäre ohne dich losgegangen. Wir sollten und sputen. Hier geht’s lang. 
	Wld_SendTrigger ("GATE_MINE");
	Npc_ExchangeRoutine(self,"MINE");
	};
	
// ------------- melde dich -------------
instance DIA_DIC_Graveyarn_Stollen (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 27;
	condition = DIA_DIC_Graveyarn_Stollen_Condition;
	information = DIA_DIC_Graveyarn_Stollen_Info;
	permanent = 0;
	important = 1;
	description = "Fortschritt";
	};

func int DIA_DIC_Graveyarn_Stollen_Condition ()
	{
	if (Npc_GetDistToWP(self,"ABANDONEDMINE_OUT1")<1500)
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Stollen_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Graveyarn_Stollen_04_00"); //So Modares hat sich in einen der Stollen zurückgezogen. Doch da kommt er nicht mehr raus. Ein paar von meinen Leuten sind schon gefallen! Die anderen haben sich hierhin zurückgezogen,um auf mein Eintreffen zu warten. 
	AI_Output (self, other, "DIA_DIC_Graveyarn_Stollen_04_01"); //Ich werde jetzt noch mal die Taktik mit meinen Kämpfern durchgehen und dann greifen wir an. 
	AI_Output (other, self, "DIA_DIC_Graveyarn_Stollen_15_02"); //Gut.
	AI_Output (self, other, "DIA_DIC_Graveyarn_Stollen_04_03"); //Und eins sag ich dir: Noch heute wird Modares enthauptet! Ein so schneller Tod ist noch zu gut für diesen Verräter. 
	Npc_ExchangeRoutine(self,"FRONT");
	};
	
// ------------- Amulette Gefunden -------------
instance DIA_DIC_Graveyarn_Brauchbarem (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 28;
	condition = DIA_DIC_Graveyarn_Brauchbarem_Condition;
	information = DIA_DIC_Graveyarn_Brauchbarem_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe das Amulett gefunden!";
	};

func int DIA_DIC_Graveyarn_Brauchbarem_Condition ()
	{
	if (Npc_HasItems(other, TriramarAmulette) >= 1 && Npc_KnowsInfo (other, DIA_DIC_Baltar_Uebernehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Brauchbarem_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Graveyarn_Brauchbarem_15_00"); //Ich habe das Amulett gefunden!
	AI_Output (self, other, "DIA_DIC_Graveyarn_Brauchbarem_04_01"); //Gut. gib es mir! Ich werde es Berengar bringen und ihm von deinem Erfolg erzählen. Wenn du willst kannst du die Leichen der Gefallenen Verräter nach Brauchbarem untersuchen. 
	AI_Output (self, other, "DIA_DIC_Graveyarn_Brauchbarem_04_02"); //Es gehört dir. Aber jemand der so gut und gründlich arbeitet wie du, hat das wohl schon erledigt. Ha, ha, du gehörst wahrhaftig zu uns!

	Npc_GiveItem(hero, TriramarAmulette, self);
	//AI_StopProcessInfos (self);
	};
	
// ------------- Diccuric Beenden -------------
instance DIA_DIC_Graveyarn_Beenden (C_INFO)
	{
	npc = DIC_2011_Graveyarn;
	nr = 28;
	condition = DIA_DIC_Graveyarn_Beenden_Condition;
	information = DIA_DIC_Graveyarn_Beenden_Info;
	permanent = 0;
	important = 0;
	description = "DICCURIC BEENDEN";
	};

func int DIA_DIC_Graveyarn_Beenden_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Graveyarn_Brauchbarem))
		{
		return 1;
		};
	};

func void DIA_DIC_Graveyarn_Beenden_Info ()
	{
	DiccuricBeenden();
	};
	