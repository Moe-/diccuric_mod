//------------ ENDE -----------------
instance DIA_DIC_Lagariman_Exit (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 999;
	condition = DIA_DIC_Lagariman_Exit_Condition;
	information = DIA_DIC_Lagariman_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Lagariman_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Lagariman_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------- Begrüßung ----------------
instance DIA_DIC_Lagariman_Hi (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 1;
	condition = DIA_DIC_Lagariman_Hi_Condition;
	information = DIA_DIC_Lagariman_Hi_Info;
	permanent = 0;
	important = 1;
	description = "Hallo";
	};

func int DIA_DIC_Lagariman_Hi_Condition ()
	{
	if (WappenBenutzt == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Hi_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Lagariman_Hi_07_00"); //Hallo Ardaric.
	};

// -------------- Wer bist du ---------------
instance DIA_DIC_Lagariman_Wer (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 2;
	condition = DIA_DIC_Lagariman_Wer_Condition;
	information = DIA_DIC_Lagariman_Wer_Info;
	permanent = 0;
	important = 0;
	description = "Wer bist du?";
	};

func int DIA_DIC_Lagariman_Wer_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Hi) || WappenBenutzt == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Wer_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Wer_15_00"); //Wer bist du?
	AI_Output (self, other, "DIA_DIC_Lagariman_Wer_07_01"); //Ich bin Lagariman, ein Freund deines Vaters.
	AI_Output (other, self, "DIA_DIC_Lagariman_Wer_15_02"); //Du kennst meinen Vater?
	AI_Output (self, other, "DIA_DIC_Lagariman_Wer_07_03"); //Ja, ich war sein Gefolgsmann, bevor er Etain verlassen hat, um dem König Gatyahs zu dienen. Als ich ihn vor ein paar Monaten in der Hauptstadt aufsuchte hörte ich, dass dein Vater angeblich die Stadt verlassen hat. Keiner wusste wo er hingezogen war. Ich ahnte was wirklich geschehen war.
	AI_Output (other, self, "DIA_DIC_Lagariman_Wer_15_04"); //Was taten die Magier einst in Etain, und warum war mein Vater früher hier ?
	AI_Output (self, other, "DIA_DIC_Lagariman_Wer_07_05"); //Bevor dieses Gebiet dem Erdboden gleichgemacht wurde, lebte hier der Orden der Madrimier. Dein Vater suchte hier nach Artefakten. Sie sollten helfen, das Bestehen des Guten in der Welt zu sichern. Er hoffte, mit ihnen den König zu unterstützen. Denn er ahnte Unheil, welches auf das Reich zukommen würde. 
	
	B_LogEntry (Vergangenheit, "Ich habe Lagariman beim Grab meines Vaters getroffen. Er scheint einiges über mich zu wissen.");
	};

// -------------- Was tust du hier ---------------
instance DIA_DIC_Lagariman_Was (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 3;
	condition = DIA_DIC_Lagariman_Was_Condition;
	information = DIA_DIC_Lagariman_Was_Info;
	permanent = 0;
	important = 0;
	description = "Was tust du hier?";
	};

func int DIA_DIC_Lagariman_Was_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Hi))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Was_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Was_15_00"); //Was tust du hier?
	AI_Output (self, other, "DIA_DIC_Lagariman_Was_07_01"); //Ich habe mich auf eine lange Reise begeben, um deinen Vater zu suchen. Meine Reise führte mich hierhin, an dieses Grab.
	AI_Output (other, self, "DIA_DIC_Lagariman_Was_15_02"); //Hier soll das Grab meines Vaters sein?
	AI_Output (self, other, "DIA_DIC_Lagariman_Was_07_03"); //Ja. Und es war Berengar, der ihn tötete!
	AI_Output (other, self, "DIA_DIC_Lagariman_Was_15_04"); //Dann ist es also wahr.
	AI_Output (self, other, "DIA_DIC_Lagariman_Was_07_05"); //Berengar hat einst ein Komplott gegen den König vorbereitet. Dein Vater berichtete dies dem Herrscher Gatyahs. Damals waren Berengar und der König noch Gefährten. Als der König merkte, dass sein Freund ihn töten will, entschloss er, ihn zu zwingen, das Reich für immer zu verlassen. Doch bevor Berengar das Königreich verlies, rächte er sich an deinem Vater.
	
	B_LogEntry (Vergangenheit, "Berengar soll sich an meinem Vater gerächt haben, weil er treu zum König stand. Ob ich DAS glauben kann?!?"); 
	};

// -------------- Was tust du hier ---------------
instance DIA_DIC_Lagariman_Landstreicher (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 4;
	condition = DIA_DIC_Lagariman_Landstreicher_Condition;
	information = DIA_DIC_Lagariman_Landstreicher_Info;
	permanent = 0;
	important = 0;
	description = "Du bist einer der Landstreicher.";
	};

func int DIA_DIC_Lagariman_Landstreicher_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Hi) && !(Npc_KnowsInfo (other, DIA_DIC_Lagariman_Glaube)))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Landstreicher_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Landstreicher_15_00"); //Du bist einer der Landstreicher. Ich werde nicht darauf warten, bis du dein Messer ziehst. Kämpfe!
	AI_Output (self, other, "DIA_DIC_Lagariman_Landstreicher_07_01"); //Mein Name ist Lagariman und ich bin ein Freund deines Vaters.
	};

// -------------- Woher weißt du ---------------
instance DIA_DIC_Lagariman_Woher (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 5;
	condition = DIA_DIC_Lagariman_Woher_Condition;
	information = DIA_DIC_Lagariman_Woher_Info;
	permanent = 0;
	important = 0;
	description = "Woher weißt du, das ich Ardaric bin?";
	};

func int DIA_DIC_Lagariman_Woher_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Hi) && LagarimanKenntPerBaltar == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Woher_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Woher_15_00"); //Woher weißt du, dass ich Ardaric bin?
	AI_Output (self, other, "DIA_DIC_Lagariman_Woher_07_01"); //Barem sagte, dass er dich kennen gelernt hat. Ich versuchte dich zu treffen, doch das Lager Berengars war zu gut bewacht. Also sandte ich mit Hilfe der Magie einem Arbeiter, den ich draußen schlafend vorm Lager fand, einen Traum. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Woher_07_02"); //Als der Arbeiter erwachte, erinnerte er sich daran, dass er ein Gerücht gehört hatte. Ich wusste, dass das Gerücht um deinen Vater herumerzählt wird, und dass es irgendwann zu dir dringen würde. Und jetzt bist du hier. 
	
	B_LogEntry (BekanntePersonen, "Lagariman war angeblich ein Freund meines Vaters und ist einer von Barem. Ob ich ihm trauen kann?");
	};

// -------------- Kämpfe ---------------
instance DIA_DIC_Lagariman_Kampf (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 6;
	condition = DIA_DIC_Lagariman_Kampf_Condition;
	information = DIA_DIC_Lagariman_Kampf_Info;
	permanent = 0;
	important = 0;
	description = "Ich glaube dir nicht. Kämpfe!";
	};

func int DIA_DIC_Lagariman_Kampf_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Landstreicher) && !(Npc_KnowsInfo (other, DIA_DIC_Lagariman_Glaube)))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Kampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Kampf_15_00"); //Ich glaube dir.nicht. Kämpfe!
	Npc_SetTarget (self, hero);
	AI_Attack (self);
	AI_StopProcessInfos (self);
	};

// -------------- Mein Vater ist tot. ---------------
instance DIA_DIC_Lagariman_Tot (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 7;
	condition = DIA_DIC_Lagariman_Tot_Condition;
	information = DIA_DIC_Lagariman_Tot_Info;
	permanent = 0;
	important = 0;
	description = "Mein Vater ist tot.";
	};

func int DIA_DIC_Lagariman_Tot_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Landstreicher) && !Npc_KnowsInfo(other, DIA_DIC_Lagariman_Glaube))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Tot_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Tot_15_00"); //Mein Vater ist tot. Berengar ist mein neuer Vater.
	AI_Output (self, other, "DIA_DIC_Lagariman_Tot_07_01"); //Deine Worte sind, als wolltest du dich selbst mit einem Schwert verletzen. Hier, da liegt dein Vater! Genau vor dir.  Tot, in einem unwürdigen Grab verscharrt - Emmeran, dein Vater, von Berengar ermordet.
	
	B_LogEntry (Vergangenheit, "Als ich Lagariman sagte, dass Berengar mein neuer Vater ist, zeigte er zum Grab meines echten Vaters, der angeblich durch Berengar starb. Ich weiß nun wirklich nicht, ob ich ihm oder Berengar trauen soll...");
	};

// -------------- Ich will davon nichts wissen. ---------------
instance DIA_DIC_Lagariman_Nichts (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 8;
	condition = DIA_DIC_Lagariman_Nichts_Condition;
	information = DIA_DIC_Lagariman_Nichts_Info;
	permanent = 0;
	important = 0;
	description = "Ich will davon nichts wissen.";
	};

func int DIA_DIC_Lagariman_Nichts_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Tot) && !(Npc_KnowsInfo (other, DIA_DIC_Lagariman_Glaube)))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Nichts_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Nichts_15_00"); //Ich will davon nichts wissen.
	AI_StopProcessInfos (self);
	};


// -------------- Aber ich verstehe nicht ---------------
instance DIA_DIC_Lagariman_Ueberfuehrt (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 21;
	condition = DIA_DIC_Lagariman_Ueberfuehrt_Condition;
	information = DIA_DIC_Lagariman_Ueberfuehrt_Info;
	permanent = 0;
	important = 0;
	description = "Warum hat Berengar die Leiche mitgenommen?";
	};

func int DIA_DIC_Lagariman_Ueberfuehrt_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Tot) || Npc_KnowsInfo(other, DIA_DIC_Lagariman_Was))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Ueberfuehrt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Ueberfuehrt_15_00"); //Aber ich verstehe nicht warum Berengar die Leiche hier nach Etain mitgenommen hat.
	AI_Output (self, other, "DIA_DIC_Lagariman_Ueberfuehrt_07_01"); //Der Tod deines Vaters hätte den König erzürnt. Berengar wäre verfolgt worden, und die Garde des Königs hätte binnen weniger Tage Berengar gefunden und gerichtet. Doch ohne die Leiche deines Vaters, weiß niemand, was geschehen ist.
	AI_Output (self, other, "DIA_DIC_Lagariman_Ueberfuehrt_07_02"); //Als ich nach Gatyah kam, galt dein Vater als verschwunden, aber nicht als tot. Ich vermute aber, dass es noch einen anderen Grund dafür gibt, dass Berengar den Leichnam deines Vaters nach Etain überführt hat. Doch bin ich mir noch nicht sicher genug, um darüber etwas zu sagen.
	};
	
// -------------- Ich glaube dir. ---------------
instance DIA_DIC_Lagariman_Glaube (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 9;
	condition = DIA_DIC_Lagariman_Glaube_Condition;
	information = DIA_DIC_Lagariman_Glaube_Info;
	permanent = 0;
	important = 0;
	description = "Ich glaube dir.";
	};

func int DIA_DIC_Lagariman_Glaube_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Tot) || Npc_KnowsInfo(other, DIA_DIC_Lagariman_Was))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Glaube_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Glaube_15_00"); //Ich glaube dir. Aber was soll ich jetzt tun?
	AI_Output (self, other, "DIA_DIC_Lagariman_Glaube_07_01"); //Du hast deine Heimat verloren und deine Familie. Berengar, an den du glaubtest, hat dich hintergangen. Ich fühle mich dazu berufen, dir beizustehen. Deshalb will ich dich den Weg lehren, den dein Vater beschritten hat. Ich werde dich leiten und dir bei den Prüfungen beistehen. Den Prüfungen, die dir deine wahre Stärke offenbaren werden: die Kraft der Magie.
	AI_Output (other, self, "DIA_DIC_Lagariman_Glaube_15_02"); //Was muss ich tun?
	AI_Output (self, other, "DIA_DIC_Lagariman_Glaube_07_03"); //Du wirst drei Prüfungen bestehen müssen. Die Prüfung des Körpers, des Geistes und der Seele. In jeder dieser Prüfung kannst du genau das verlieren was du zu gewinnen suchst.
	AI_Output (self, other, "DIA_DIC_Lagariman_Glaube_07_04"); //Willst du dich diesen Gefahren aussetzen? Oder willst du dir vielleicht noch etwas Zeit lassen für diese Herausforderungen? Wenn du dich aber entscheidest gibt es kein zurück mehr.
	B_LogEntry (Vergangenheit, "Ich glaube Lagariman.");
	Log_SetTopicStatus (Vergangenheit, LOG_SUCCESS);
	B_GiveXP (250);
	
	Log_CreateTopic (LagarimansAufgaben,  LOG_MISSION);
	Log_SetTopicStatus (LagarimansAufgaben, LOG_RUNNING);
	B_LogEntry (LagarimansAufgaben, "Er wird mir nun helfen, mich mit der Magie vertraut zu machen, damit ich mich Berengar stellen kann. Dazu muss ich ersteinmal drei Aufgaben lösen.");
	};

// -------------- Anfangen ---------------
instance DIA_DIC_Lagariman_Anfangen (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 10;
	condition = DIA_DIC_Lagariman_Anfangen_Condition;
	information = DIA_DIC_Lagariman_Anfangen_Info;
	permanent = 0;
	important = 0;
	description = "Ja! Ich will die Prüfungen beginnen!";
	};

func int DIA_DIC_Lagariman_Anfangen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Glaube))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Anfangen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Anfangen_15_00"); //Ja!
	AI_Output (self, other, "DIA_DIC_Lagariman_Anfangen_07_01"); //Gut dann beginnen wir mit der Prüfung des Körpers.
	AI_Output (other, self, "DIA_DIC_Lagariman_Anfangen_15_02"); //Was muss ich tun?
	AI_Output (self, other, "DIA_DIC_Lagariman_Anfangen_07_03"); //Zwei Dinge sind zu tun, um diese Prüfung zu bestehen. Du musst einen Leitwolf und einen Ork töten.  Für diese Aufgabe ist es dir erlaubt zwei magische Hilfsmittel zu verwenden. Aber du darfst keinerlei Waffen wie Schwerter, Messer, Speere, gebrauchen.
	B_LogEntry (LagarimansAufgaben, "Als erstes soll ich einen Leitwolf und einen Ork töten - und dass ohne Waffen.");
	
	Wld_InsertNpc			(PruefungOrk, "GT_HUETT_01");
	Wld_InsertNpc			(Leitwolf, "GT_05");
	};

// -------------- Ich brauche noch Zeit.... ---------------
instance DIA_DIC_Lagariman_Zeit (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 11;
	condition = DIA_DIC_Lagariman_Zeit_Condition;
	information = DIA_DIC_Lagariman_Zeit_Info;
	permanent = 0;
	important = 0;
	description = "Ich brauche noch Zeit....";
	};

func int DIA_DIC_Lagariman_Zeit_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Glaube) && !Npc_KnowsInfo(other, DIA_DIC_Lagariman_Anfangen))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Zeit_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Zeit_15_00"); //Ich brauche noch Zeit.... es mir zu überlegen.
	AI_Output (self, other, "DIA_DIC_Lagariman_Zeit_07_01"); //Dann komme wieder wenn du bereit bist. Ich werde hier noch einige Zeit verweilen. Wirst du aber binnen eines Monats nicht wieder hier erscheinen, so nehme ich dies als Zeichen, dass du dich für einen anderen Weg entschieden hast. 
	AI_StopProcessInfos (self);
	};

// -------------- Was kann ich durch diesen Prüfungen erlernen? ---------------
instance DIA_DIC_Lagariman_Lernen (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 12;
	condition = DIA_DIC_Lagariman_Lernen_Condition;
	information = DIA_DIC_Lagariman_Lernen_Info;
	permanent = 0;
	important = 0;
	description = "Was kann ich durch diese Prüfungen erlernen?";
	};

func int DIA_DIC_Lagariman_Lernen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Glaube))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Lernen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Lernen_15_00"); //Was kann ich durch diese Prüfungen lernen? Ich haben einen Körper, einen Geist und eine Seele. Warum also sollte ich erwerben, was ich schon mein Eigen nenne?
	AI_Output (self, other, "DIA_DIC_Lagariman_Lernen_07_01"); //Was du dein Eigen nennst, würde ein Weiser nicht eine Sekunde lang besitzen wollen.
	AI_Output (self, other, "DIA_DIC_Lagariman_Lernen_07_02"); //Mit Bestehen der Prüfungen kannst du die Vergangenheit dieses Landes erfahren, und du wirst wissen, wer dein Vater ist. Du wirst lernen, wer du selber bist: All das ist Vorraussetzung dafür, dass du Magier werden kannst.  
	};

// -------------- Wo finde ich die Wölfe? ---------------
instance DIA_DIC_Lagariman_Woelfe (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 13;
	condition = DIA_DIC_Lagariman_Woelfe_Condition;
	information = DIA_DIC_Lagariman_Woelfe_Info;
	permanent = 0;
	important = 0;
	description = "Wo finde ich die Wölfe?";
	};

func int DIA_DIC_Lagariman_Woelfe_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Anfangen) && !Npc_IsDead(Leitwolf))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Woelfe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Woelfe_15_00"); //Wo finde ich die Wölfe?
	AI_Output (self, other, "DIA_DIC_Lagariman_Woelfe_07_01"); //Sie haben sich in einer Ansiedlung niedergelassen. Seitdem die Siedlung von Menschen verlassen wurde, wird sie von den Wölfen bewohnt.
	
	B_LogEntry (LagarimansAufgaben, "Die Wölfe sind in einer ehemaligen Siedlung.");
	};

// -------------- Wo finde ich den Ork? ---------------
instance DIA_DIC_Lagariman_Ork (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 13;
	condition = DIA_DIC_Lagariman_Ork_Condition;
	information = DIA_DIC_Lagariman_Ork_Info;
	permanent = 0;
	important = 0;
	description = "Wo finde ich den Ork?";
	};

func int DIA_DIC_Lagariman_Ork_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Anfangen) && !Npc_IsDead(PruefungOrk))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Ork_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Ork_15_00"); //Wo finde ich den Ork?
	AI_Output (self, other, "DIA_DIC_Lagariman_Ork_07_01"); //In der Nähe der Siedlung die jetzt von Wölfen bewohnt ist.
	B_LogEntry (LagarimansAufgaben, "Der Ork ist in der Nähe des Wolfs, den ich erledigen soll.");
	};

// -------------- Bestanden ---------------
instance DIA_DIC_Lagariman_Bestanden (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 14;
	condition = DIA_DIC_Lagariman_Bestanden_Condition;
	information = DIA_DIC_Lagariman_Bestanden_Info;
	permanent = 0;
	important = 1;
	description = "PRUEFUNG BEENDEN";
	};

func int DIA_DIC_Lagariman_Bestanden_Condition ()
	{
	if (Npc_IsDead(Leitwolf) && Npc_IsDead(PruefungOrk))
	&& Npc_KnowsInfo(other,DIA_DIC_Lagariman_Anfangen)
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Bestanden_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestanden_07_00"); //Du hast die Prüfung bestanden! Ich freue mich über dein Können.
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestanden_07_01"); //Du hast sicherlich gemerkt das du stärker geworden bist. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestanden_07_02"); //Mit Bestehen jeder Prüfung, wird etwas von deiner magischen Kraft freigesetzt, die noch ungenutzt in dir liegt.

	//B_GiveInvItems(self, other, VerwandlungsRing,1);
	//Mdl_SetVisualBody (hero,"hum_body_Naked0",	2,			1,			"Hum_Head_Pony",	7, 			0,			-1);	
	//B_Scale (hero);
	
	B_GiveXP (500);
	AI_Output (other, self, "DIA_DIC_Lagariman_Bestanden_15_03"); //Welche Prüfung steht mir als nächstes bevor?
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestanden_07_04"); //Es ist die Prüfung des Geistes. Du musst vorsichtig vorgehen. Bestehst du sie nicht, wirst du deinen Verstand verlieren. Auf deinem Weg wirst du auf Menschen treffen, die es zu prüfen gilt. Über jeden musst du ein Urteil fällen. Von manchen wirst du erkennen, dass sie dir nach dem Leben trachten.
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestanden_07_05"); //Doch bevor du zur Tat schreitest, lass uns eine kleine Pause machen. (kramt) Wo ist es denn, hm...,das? Pfui, das fault ja schon seit Wochen vor sich hin... weg damit! ...Ahhh, hier, da ist es. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestanden_07_06"); //Völlig unversehrt... Sumpf-Helmkraut, sehr selten, sehr schwer zu kriegen, sehr köstlich! Lange Zeit habe ich es aufbewahrt, und für diesen Anlass ist es gerade gut genug. Hier! Nimm was von diesem erlesenen Tabak, und setz dich zu mir. Lass uns für einen Moment die Ruhe genießen. 

	CreateInvItems (self, ItMiJoint_3, 6);
	B_GiveInvItems(self, other, ItMiJoint_3, 3);

	//AI_PlayAniBS (self, "T_STAND_2_SIT", BS_SIT);
	//AI_PlayAniBS (hero, "T_STAND_2_SIT", BS_SIT);
	B_ChooseJoint		(self);
	B_ChooseJoint		(hero);
	
	B_LogEntry (LagarimansAufgaben, "Ich habe Lagarimans erste Aufgabe erledigt. Mit jeder bestandenen Prüfung wird ein Teil der in mir liegenden magischen Kraft freigesetzt.");
	B_LogEntry (LagarimansAufgaben, "Meine nächste Prüfung wird nun nach dem Körper den Geist fordern, doch wir haben zuerst gemeinsam am Feuer geseßen und eine Pause gemacht.");

	//DiccuricBeenden();
	//PlayVideo ("Diccuric\spaeter.bik");
	//Wld_SetTime(10,00);
	//AI_StandUp (hero);
	UpgradeHaendlerB ();
	};

// -------------- Prüfung des Geistes ---------------
instance DIA_DIC_Lagariman_Geistes (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 16;
	condition = DIA_DIC_Lagariman_Geistes_Condition;
	information = DIA_DIC_Lagariman_Geistes_Info;
	permanent = 0;
	important = 0;
	description = "Du sprachst von der Prüfung des Geistes.";
	};

func int DIA_DIC_Lagariman_Geistes_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Bestanden))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Geistes_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Geistes_15_00"); //Du sprachst von der Prüfung des Geistes. Was habe ich zu tun?
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_01"); //Ich werde dich gleich zu einem Berg führen. Der erste Teil deiner Aufgabe ist es, einen Eingang zu finden, der dir einen Weg ins Innere weist. In der Höhle wirst du nach einer magischen Rune suchen. Die Rune des Geistes. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_02"); //Aber zuvor höre dir die Vorgeschichte an: Die Höhle ist seit langer Zeit bewohnt, in ihr leben eine Gruppe von Magiern, die von deinem Kommen nichts ahnen. Diese Magier sind seit langer Zeit dort in der Höhle eingeschlossen. 
	
	AI_Output (other, self, "DIA_DIC_Lagariman_Geistes_15_03"); //Wer sind diese Magier?
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_04"); //Sie gehören zum Orden der Madrimier. Ihre Stadt fiel einst dem gewaltigen Orkangriff zum Opfer, von dem ich dir bereits erzählte. An dem Tag der Schlacht flüchtete sich diese Gruppe der Magier in die Höhle. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_05"); //Doch später lies eine Explosion einen Steinschlag herabregnen und der Eingang wurde verschüttet. Und so gab es für die Magier kein Entkommen. Die Felswände waren zu stark, kein Zauber konnte diese Steinmassen zum Bersten bringen. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_06"); //Die Magier hofften darauf, dass ihre Brüder nach ihnen suchen und sie befreien würden. Doch niemand kam. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_07"); //Nach einigen Jahren nutzten sie ihre restlichen Kräfte um einen Zauber zu schaffen der ihr Leben verlängert.  
	
	AI_Output (other, self, "DIA_DIC_Lagariman_Geistes_15_08"); //Was geschah im Laufe der Zeit mit den Magiern?
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_09"); //Erst lebten sie friedlich zusammen. Doch dann stellten sie fest, dass einige von ihnen geistig nicht mehr klar denken konnten. Teilweise verfielen sie dem Wahnsinn. Es kam soweit, dass einige der Magier sich gegenseitig töteten. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_10"); //Einer unter ihnen, Eustace zog sich zurück und erschuf eine Rune, die die Gesundheit des Verstandes wieder herstellen sollte. Die "Rune des Geistes". Als die Rune fertiggestellt war, wurde Eustace getötet. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_11"); //In der Höhle stellte sich dann der Magier Feordwin als Anführer über all jene die noch bei Sinnen waren. Soweit ich es jetzt beobachten konnte, geht er seit Jahren einigen Studien der schwarzen Magie nach. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Geistes_07_12"); //Er ist aber selbst wahnsinnig und dem Bösen verfallen. Du musst ihm die "Rune des Geistes" abnehmen. Alle Gutgesinnten die du in der Höhle antriffst, solltest dann du zu mir führen. 
	
	Log_CreateTopic (PruefungGeist,  LOG_MISSION);
	Log_SetTopicStatus (PruefungGeist, LOG_RUNNING);
	B_LogEntry (PruefungGeist, "Ich soll den Weg in eine Höhle finden, einem verrückten Magier die Runde des Geistes abnehmen, alle gutgesinnten Magier befreien und zu Lagariman zurückkehren - klingt nach einem Haufen Arbeit.");
	
	//Info_AddChoice(DIA_DIC_Lagariman_Geistes, "Warum soll ich sie zu dir bringen?", DIA_DIC_Lagariman_Bringen);
	Info_AddChoice(DIA_DIC_Lagariman_Geistes, "Woher weißt du das alles?", DIA_DIC_Lagariman_Weisst);
	Info_AddChoice(DIA_DIC_Lagariman_Geistes, "Wenn es einen Eingang gibt, warum nutzten die Magier diesen Weg nicht, um nach draußen zu gelangen?", DIA_DIC_Lagariman_Draussen);
	Info_AddChoice(DIA_DIC_Lagariman_Geistes, "Was habe ich genau zu tun, um die Prüfung zu bestehen?", DIA_DIC_Lagariman_Bestehen);
	Info_AddChoice(DIA_DIC_Lagariman_Geistes, "Welchen Rat kannst du mir geben, um die Prüfung zu meistern?", DIA_DIC_Lagariman_Meistern);
	};
	
func void DIA_DIC_Lagariman_Bringen()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Bringen_15_00"); //Warum soll ich sie zu dir bringen?
	AI_Output (self, other, "DIA_DIC_Lagariman_Bringen_07_01"); //Ich habe erfahren das meine Aufgabe darüber hinausgeht dich auszubilden, junger Ardaric. Mein Entschluss steht fest. Mein Ziel ist es Berengar zu töten! Der Anschlag auf den König darf niemals ausgeführt werden. Ich werde bald aufbrechen und einige Freunde aufsuchen. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Bringen_07_02"); //Von ihnen erhoffe ich mir Mithilfe. Und selbst wenn ich keine Magier finde, die mir beistehen, so versuche ich, jeden kampffähigen Mann für mich zu gewinnen. Ich werde sie von der heiligen Aufgabe überzeugen, die jedes Menschen Pflicht ist.
	AI_Output (self, other, "DIA_DIC_Lagariman_Bringen_07_03"); // Denn wer im Angesicht des Bösen nicht zur Waffe greift, den ereilt schon bald die dunkle Macht und  fortan wäre sein Leben nichts anderes mehr, als ein elender Schatten. 
	AI_Output (self, other, "DIA_DIC_Lagariman_Bringen_07_04"); //Wenn du die Magier zu mir bringst, so hoffe ich, dass einige von ihnen mir helfen werden und ich hoffe auch, dass du mir zur Seite stehen wirst. Doch ich möchte dich zu nichts zwingen, ich gebe dir Zeit, um deinen Entscheidung zu bedenken.
	
	B_LogEntry (PruefungGeist, "Lagariman will Berengar töten - wenn ich ihm weiterhin helfe, dann werde ich mich gegen Berengar stellen müssen.");
	};
	
func void DIA_DIC_Lagariman_Weisst()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Weisst_15_00"); //Woher weißt du das alles?
	AI_Output (self, other, "DIA_DIC_Lagariman_Weisst_07_01"); //Über die Zauber die mich sehend machen, kann ich noch nicht sprechen. Erst später, wenn dein Geist würdig ist, kann ich darüber reden.
	};
	
func void DIA_DIC_Lagariman_Draussen()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Draussen_15_00"); //Wenn es einen Eingang gibt, warum nutzten die Magier diesen Weg nicht, um nach draußen zu gelangen? 
	AI_Output (self, other, "DIA_DIC_Lagariman_Draussen_07_01"); //Eine Frage deren Antwort du wahrscheinlich im Verlauf deiner Prüfung finden wirst, Ardaric.
	};
	
func void DIA_DIC_Lagariman_Bestehen()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Bestehen_15_00"); //Was habe ich genau zu tun, um die Prüfung zu bestehen?
	AI_Output (self, other, "DIA_DIC_Lagariman_Bestehen_07_01"); //Du musst in der Höhle, die "Rune des Geistes" finden, an dich nehmen und zu mir bringen. 
	};
	
func void DIA_DIC_Lagariman_Meistern()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Meistern_15_00"); //Welchen Rat kannst du mir geben, um die Prüfung zu meistern?
	AI_Output (self, other, "DIA_DIC_Lagariman_Meistern_07_01"); //Du solltest die Höhle nicht betreten, ohne dich vorher mit mächtigen Zaubern auszustatten. An deiner Stelle würde ich alle Spruchrollen erwerben die du erwerben kannst. 
	
	B_LogEntry (PruefungGeist, "Lagariman empfahl mir, mich mit Zaubern auszustatten, bevor ich in die Höhle gehe. Was wird mich dort erwarten?");
	};
	
// -------------- Zur Höhle ---------------
instance DIA_DIC_Lagariman_Losgehen (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 17;
	condition = DIA_DIC_Lagariman_Losgehen_Condition;
	information = DIA_DIC_Lagariman_Losgehen_Info;
	permanent = 0;
	important = 0;
	description = "LOSGEHEN";
	};

func int DIA_DIC_Lagariman_Losgehen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Geistes))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Losgehen_Info ()
	{
	Npc_ExchangeRoutine (self, "FUEHREN");
	AI_StopProcessInfos (self);
	};
	
// -------------- Bei der Höhle ---------------
instance DIA_DIC_Lagariman_Ankunft (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 18;
	condition = DIA_DIC_Lagariman_Ankunft_Condition;
	information = DIA_DIC_Lagariman_Ankunft_Info;
	permanent = 0;
	important = 1;
	description = "angekommen";
	};

func int DIA_DIC_Lagariman_Ankunft_Condition ()
	{
	if (Npc_GetDistToWP(self, "ZUR_H06_16") <= 500)
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Ankunft_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Lagariman_Ankunft_07_00"); //So, da sind wir. Den Rest musst du nun alleine erledigen.
	
	Wld_InsertNpc				(DiccuricZombie,"SF_H06_12");
	
	Npc_ExchangeRoutine (self, "QUEST");
	AI_StopProcessInfos (self);
	};
		
// -------------- Junge bringt Magier ---------------
instance DIA_DIC_Lagariman_Bringt (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 19;
	condition = DIA_DIC_Lagariman_Bringt_Condition;
	information = DIA_DIC_Lagariman_Bringt_Info;
	permanent = 0;
	important = 1;
	description = "magier gebracht";
	};

func int DIA_DIC_Lagariman_Bringt_Condition ()
	{
	if (Npc_HasItems(other,RuneDesGeistes) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Bringt_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Lagariman_Bringt_07_00"); //Ardaric, du hast es geschafft! Die Prüfung des Geistes hast du bestanden!
	//AI_Output (self, other, "DIA_DIC_Lagariman_Bringt_07_01"); //Ich werde mit den Alten des Madrimier Ordens reden und sie in Kenntnis darüber setzen, was während ihrer Abwesenheit sich in Etain verändert hat.  
	
	Npc_ExchangeRoutine(DIC_2076_Amalric,"ENDE");
	AI_ContinueRoutine	(DIC_2076_Amalric);
	Npc_ExchangeRoutine(DIC_2077_Umfrey,"ENDE");
	AI_ContinueRoutine	(DIC_2077_Umfrey);
	Npc_ExchangeRoutine(DIC_2078_Waleran,"ENDE");
	AI_ContinueRoutine	(DIC_2078_Waleran);
	Npc_ExchangeRoutine(DIC_2079_Herlewin,"ENDE");
	AI_ContinueRoutine	(DIC_2079_Herlewin);
	Npc_ExchangeRoutine(DIC_2080_Gamel,"ENDE");
	AI_ContinueRoutine	(DIC_2080_Gamel);
	
	Npc_ExchangeRoutine(DIC_2003_Alwin,"GEGANGEN");
	AI_ContinueRoutine	(DIC_2003_Alwin);
	AI_Teleport (DIC_2003_Alwin, "UNTERWORLD");
	
	B_LogEntry (PruefungGeist, "Die Magier sind nun bei Lagariman.");
	Log_SetTopicStatus (PruefungGeist, LOG_SUCCESS);
	B_GiveXP (1000);
	};
	
// -------------- Kann ich etwas für dich tun? ---------------
instance DIA_DIC_Lagariman_FuerDich (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 20;
	condition = DIA_DIC_Lagariman_FuerDich_Condition;
	information = DIA_DIC_Lagariman_FuerDich_Info;
	permanent = 0;
	important = 0;
	description = "Kann ich etwas für dich tun?";
	};

func int DIA_DIC_Lagariman_FuerDich_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Bringt))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_FuerDich_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_FuerDich_15_00"); //Kann ich etwas für dich tun?
	AI_Output (self, other, "DIA_DIC_Lagariman_FuerDich_07_01"); //Wir können uns hier nicht lange versteckt halten. Gerade schon habe ich eine Wache aus Berengars Lager hier in der Nähe patrouillieren gesehen. Es wäre eine große Hilfe, wenn du einen Ort für uns findest an dem wir einige Zeit leben könnten, ohne von Berengars Spähern entdeckt zu werden.
	AI_Output (self, other, "DIA_DIC_Lagariman_FuerDich_07_02"); //Nach den Aufzeichnungen die ich über Etain studiert habe, gibt es hier mehrere verlassene Siedlungen. Versuche eine der früheren Madrimier Siedlungen zu finden. Je versteckter die Siedlung liegt, umso besser. 
	
	B_LogEntry (LagarimansAufgaben, "Ich soll für Lagariman nach einem neuen Unterschlupf suchen.");
	
	
	Info_AddChoice(DIA_DIC_Lagariman_FuerDich, "Gut ich werde nach der Siedlung suchen.", DIA_DIC_Lagariman_Siedlung);
	Info_AddChoice(DIA_DIC_Lagariman_FuerDich, "Im Moment habe ich keine Zeit um diesen Auftrag auszuführen.", DIA_DIC_Lagariman_KeineZeit);
	Info_AddChoice(DIA_DIC_Lagariman_FuerDich, "Ein Späher von Berengar war hier in der Nähe?", DIA_DIC_Lagariman_Spaeher);
	};
	
func void DIA_DIC_Lagariman_Siedlung ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Siedlung_15_00"); //Gut ich werde nach der Siedlung suchen.
	B_LogEntry (LagarimansAufgaben, "Anmerkung der Autoren: Die Suche nach dem neuen Unterschlupf wird erst als Quest in Diccuric 2 verfügbar sein!");
	Info_ClearChoices(DIA_DIC_Lagariman_FuerDich);
	};
	
func void DIA_DIC_Lagariman_KeineZeit ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_KeineZeit_15_00"); //Im Moment habe ich keine Zeit um diesen Auftrag auszuführen.
	B_LogEntry (LagarimansAufgaben, "Anmerkung der Autoren: Die Suche nach dem neuen Unterschlupf wird erst als Quest in Diccuric 2 verfügbar sein!");
	Info_ClearChoices(DIA_DIC_Lagariman_FuerDich);
	};
	
func void DIA_DIC_Lagariman_Spaeher ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Spaeher_15_00"); //Ein Späher von Berengar war hier in der Nähe? 
	AI_Output (self, other, "DIA_DIC_Lagariman_Spaeher_07_01"); //Ja. Es könnte sein, dass er nach dir gesucht hat. Immerhin hast du dich bei Berengar einige Zeit nicht blicken lassen. Du solltest wieder ins Lager gehen und dort den Anschein erwecken, dass du Berengar immer noch die Treue hälst. 

	};
// -------------- Welche Prüfung steht jetzt für mich an? ---------------
instance DIA_DIC_Lagariman_Seele (C_INFO)
	{
	npc = DIC_2044_Lagariman;
	nr = 21;
	condition = DIA_DIC_Lagariman_Seele_Condition;
	information = DIA_DIC_Lagariman_Seele_Info;
	permanent = 0;
	important = 0;
	description = "Welche Prüfung steht jetzt für mich an?";
	};

func int DIA_DIC_Lagariman_Seele_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Bringt))
		{
		return 1;
		};
	};

func void DIA_DIC_Lagariman_Seele_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lagariman_Seele_15_00"); //Welche Prüfung steht jetzt für mich an?
	AI_Output (self, other, "DIA_DIC_Lagariman_Seele_07_01"); //Die Prüfung der Seele. Aber noch ist die Zeit nicht reif dafür. Ich werde dir sagen, wann es soweit ist.
	};