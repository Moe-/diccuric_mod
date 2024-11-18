//------------ ENDE -----------------
instance DIA_DIC_Fiebeler_Exit (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 999;
	condition = DIA_DIC_Fiebeler_Exit_Condition;
	information = DIA_DIC_Fiebeler_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Fiebeler_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Fiebeler_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

//----------- Junge will Buch holen -------
instance DIA_DIC_Fiebeler_RBuch (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 1;
	condition = DIA_DIC_Fiebeler_RBuch_Condition;
	information = DIA_DIC_Fiebeler_RBuch_Info;
	permanent = 0;
	description = "Du bist der Bibliothekar!";
	};

 func int DIA_DIC_Fiebeler_RBuch_Condition ()
 	{
 	if (Npc_KnowsInfo (other, DIA_DIC_Alwin_Rhetorik))
 		{
 		return 1;
 		};
 	};

 func void DIA_DIC_Fiebeler_RBuch_Info ()
 	{
 	AI_Output (other, self, "DIA_DIC_RBuch_15_00"); //Du bist der Bibliothekar!
 	AI_Output (self, other, "DIA_DIC_RBuch_08_01"); //Was kann ich f�r dich tun? B�cher kannst du dir hier nicht ausleihen, au�er du musst welche f�r Berengar besorgen.
 	};

// ---------- Junge gibt sich als Gesandter Balters aus ----------
instance DIA_DIC_Fiebeler_Lernen (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 2;
	condition = DIA_DIC_Fiebeler_WLernen_Condition;
	information = DIA_DIC_Fiebeler_Lernen_Info;
	permanent = 0;
	description = "Ja, genau, Berengar schickt mich.";
	};

func int DIA_DIC_Fiebeler_WLernen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Fiebeler_RBuch) & !Npc_KnowsInfo(other,DIA_DIC_Fiebeler_Suche))
		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Lernen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_WLernen_15_00"); //Ja, genau. Ich soll f�r Berengar ein Buch abholen.
	AI_Output (self, other, "DIA_DIC_WLernen_08_01"); //Was denn f�r eins?
	AI_Output (other, self, "DIA_DIC_WLernen_15_02"); //Also es war was mit "Sprechen und Kunst" im Titel, oder so.
	AI_Output (self, other, "DIA_DIC_WLernen_08_03"); //Hm, du bist nicht von Berengar geschickt worden, du Schlitzohr. Also, versuch nicht mich noch mal hereinzulegen.
	};

// ---------- Junge will Rhetorikbuch -----------
instance DIA_DIC_Fiebeler_Suche (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 3;
	condition = DIA_DIC_Fiebeler_Suche_Condition;
	information = DIA_DIC_Fiebeler_Suche_Info;
	permanent = 0;
	description = "Ich suche ein Rhetorikbuch.";
	};

func int DIA_DIC_Fiebeler_Suche_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Fiebeler_RBuch))
		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Suche_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Suche_15_00"); //Ich brauche dringend ein Buch �ber Rhetorik. Ich will lernen, wie man sich besser ausdr�ckt.
	AI_Output (self, other, "DIA_DIC_Suche_08_01"); //Hm, eigentlich darf ich es nicht. Aber ich war auch mal so jung und wissbegierig wie du. Allerdings musst du erst mal beweisen, ob dein Interesse f�r die Wissenschaft aufrichtig ist.
	AI_Output (other, self, "DIA_DIC_Suche_15_02"); //Was muss ich tun?
	AI_Output (self, other, "DIA_DIC_Suche_08_03"); //Ich stelle dir zwei R�tsel. Gelingt es dir eines richtig zu beantworten, schenke ich dir das Rhetorik-Buch.
	AI_Output (other, self, "DIA_DIC_Suche_15_04"); //OK. Was sind die R�tsel?
	AI_Output (self, other, "DIA_DIC_Suche_08_05"); //1. Literatur R�tsel
	AI_Output (self, other, "DIA_DIC_Suche_08_06"); //2. Allgemeines R�tsel
	AI_Output (self, other, "DIA_DIC_Suche_08_07"); //3. Philosophisches  R�tsel

	FiebelerRaetsel = 0;				//3 = richtig, 1-2 = Anzahl der Fehler, wobei 2 = chancen versiebt, 0 = nicht beantwortet
	B_LogEntry (RhetorikQuest, "Ich muss ein R�tsel l�sen, damit mir Fiebeler das Buch gibt.");
	};

// ------------ Literatur R�tsel ---------
instance DIA_DIC_Fiebeler_Literatur (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 4;
	condition = DIA_DIC_Fiebeler_Literatur_Condition;
	information = DIA_DIC_Fiebeler_Literatur_Info;
	permanent = 0;
	description = "Literatur R�tsel";
	};

func int DIA_DIC_Fiebeler_Literatur_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Fiebeler_Suche) && (FiebelerRaetsel < 2))

		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Literatur_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Literatur_15_00"); //Literatur R�stel
	AI_Output (self, other, "DIA_DIC_Literatur_08_01"); //Was hat Wurzeln, die keiner sieht, ragt h�her als B�ume und Wipfels�ume, w�chst nie und treibt nicht und reicht doch ins Licht?

	Info_AddChoice (DIA_DIC_Fiebeler_Literatur,"Die Luft", DIA_DIC_Fiebeler_1A);
	Info_AddChoice (DIA_DIC_Fiebeler_Literatur,"Ein Gebirge", DIA_DIC_Fiebeler_1B);
	Info_AddChoice (DIA_DIC_Fiebeler_Literatur,"Ein Adler", DIA_DIC_Fiebeler_1C);
	};


func void DIA_DIC_Fiebeler_1A()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_1A_15_00"); //Die Luft
	AI_Output (self, other, "DIA_DIC_Fiebeler_1A_08_01"); //Die Luft. Hm. Interessante Antwort. Ich glaube das k�nnte auch eine Antwort auf diese Frage sein. Doch dar�ber muss ich erst mal eine Weile gr�beln. Deine Antwort ist in meinen Augen weder falsch noch richtig. Da du mich �berraschst hast, darfst du ein anderes R�tsel w�hlen.
	AI_Output (other, self, "DIA_DIC_Fiebeler_1A_15_02"); //Aber...
	Info_ClearChoices (DIA_DIC_Fiebeler_Literatur);
	};

func void DIA_DIC_Fiebeler_1B()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_1B_15_00"); //Ein Gebirge
	AI_Output (self, other, "DIA_DIC_Fiebeler_1B_08_01"); //Gut gemacht. Hier dein Buch!
	AI_Output (other, self, "DIA_DIC_Fiebeler_1B_15_02"); //Danke.
	FiebelerRaetsel = 3;
	CreateInvItem	(self, Rhetorik_Buch);
	B_GiveInvItems(self, other, Rhetorik_Buch, 1);
	Info_ClearChoices (DIA_DIC_Fiebeler_Literatur);
	};

func void DIA_DIC_Fiebeler_1C()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_1C_15_00"); //Ein Adler
	AI_Output (self, other, "DIA_DIC_Fiebeler_1C_08_01"); //Ein Adler? Wieso hat der denn Wurzeln die keiner sieht? Schade, aber dieses R�tsel hast du nicht bestanden.
	AI_Output (other, self, "DIA_DIC_Fiebeler_1C_15_02"); //Aber...n Adler ragt h�her als B�ume! Und reicht auch ins Licht!
	FiebelerRaetsel += 1;
	Info_ClearChoices (DIA_DIC_Fiebeler_Literatur);
	};

// ------------ Allgemeines R�tsel ---------
instance DIA_DIC_Fiebeler_Allgemein (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 5;
	condition = DIA_DIC_Fiebeler_Allgemein_Condition;
	information = DIA_DIC_Fiebeler_Allgemein_Info;
	permanent = 0;
	description = "Allgemeines R�tsel";
	};

func int DIA_DIC_Fiebeler_Allgemein_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Fiebeler_Suche) && (FiebelerRaetsel < 2))
		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Allgemein_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Allgemein_15_00"); //Allgemeines R�tsel
	AI_Output (self, other, "DIA_DIC_Allgemein_08_01"); //Was wurde mir gegeben, geh�rt mir nicht, verleihe es nicht, es wird aber von allen Menschen benutzt, die mich kennen?

	Info_AddChoice (DIA_DIC_Fiebeler_Allgemein,"Ein Familienerbst�ck", DIA_DIC_Fiebeler_2A);
	Info_AddChoice (DIA_DIC_Fiebeler_Allgemein,"Geldm�nzen", DIA_DIC_Fiebeler_2B);
	Info_AddChoice (DIA_DIC_Fiebeler_Allgemein,"Der eigene Name", DIA_DIC_Fiebeler_2C);
	};


func void DIA_DIC_Fiebeler_2A()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_2A_15_00"); //Ein Familienerbst�ck!
	AI_Output (self, other, "DIA_DIC_Fiebeler_2A_08_01"); //Nein, das ist total falsch.
	AI_Output (other, self, "DIA_DIC_Fiebeler_2A_15_02"); //Warum das denn?
	FiebelerRaetsel += 1;
	Info_ClearChoices (DIA_DIC_Fiebeler_Allgemein);
	};

func void DIA_DIC_Fiebeler_2B()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_2B_15_00"); //Silber
	AI_Output (self, other, "DIA_DIC_Fiebeler_2B_08_01"); //Dir wurde Silber gegeben? Wann und von wem? Nein, die Antwort ist falsch. Schade.
	AI_Output (other, self, "DIA_DIC_Fiebeler_2B_15_02"); //Nein, ich denke aber doch das die Antwort richtig ist. Du irrst dich!
	FiebelerRaetsel += 1;
	Info_ClearChoices (DIA_DIC_Fiebeler_Allgemein);
	};

func void DIA_DIC_Fiebeler_2C()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_2C_15_00"); //Der eigene Name
	AI_Output (self, other, "DIA_DIC_Fiebeler_2C_08_01"); //Sehr gut. Du hast das R�tsel gel�st. Hier das Buch. Es geh�rt dir.
	AI_Output (other, self, "DIA_DIC_Fiebeler_2C_15_02"); //Danke.
	FiebelerRaetsel = 3;
	CreateInvItem	(self, Rhetorik_Buch);
	B_GiveInvItems(self, other, Rhetorik_Buch, 1);
	Info_ClearChoices (DIA_DIC_Fiebeler_Allgemein);
	};

// ------- Philosophisches R�tsel --------
instance DIA_DIC_Fiebeler_Philosophisch (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 6;
	condition = DIA_DIC_Fiebeler_Philosophisch_Condition;
	information = DIA_DIC_Fiebeler_Philosophisch_Info;
	permanent = 0;
	description = "Philosophisches R�tsel";
	};

func int DIA_DIC_Fiebeler_Philosophisch_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Fiebeler_Suche) && (FiebelerRaetsel < 2))
		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Philosophisch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Philosophisch_15_00"); //Philosophisches R�tsel
	AI_Output (self, other, "DIA_DIC_Philosophisch_08_01"); //Es ist fremd den Bewohnern der Erde, von Wasser, von Luft und von Licht. Geschaffen wurd's nicht vom g�ttlichen Sein, Und wenn's Dir fehlt, ist alles Dein.

	Info_AddChoice (DIA_DIC_Fiebeler_Philosophisch,"Nichts", DIA_DIC_Fiebeler_3A);
	Info_AddChoice (DIA_DIC_Fiebeler_Philosophisch,"Das Teuflische", DIA_DIC_Fiebeler_3B);
	Info_AddChoice (DIA_DIC_Fiebeler_Philosophisch,"Das Weltall", DIA_DIC_Fiebeler_3C);
	};


func void DIA_DIC_Fiebeler_3A()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_3A_15_00"); //Nichts
	AI_Output (self, other, "DIA_DIC_Fiebeler_3A_08_01"); //Sehr gut. Du hast das R�tsel gel�st.
	AI_Output (other, self, "DIA_DIC_Fiebeler_3A_15_02"); //Danke.
	FiebelerRaetsel = 3;
	CreateInvItem	(self, Rhetorik_Buch);
	B_GiveInvItems(self, other, Rhetorik_Buch, 1);
	Info_ClearChoices (DIA_DIC_Fiebeler_Philosophisch);
	};

func void DIA_DIC_Fiebeler_3B()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_3B_15_00"); //Das Teuflische
	AI_Output (self, other, "DIA_DIC_Fiebeler_3B_08_01"); //Das w�re sch�n, wenn den Bewohnern der Erde das teuflische fremd w�re. Wirklich sch�n.
	AI_Output (other, self, "DIA_DIC_Fiebeler_3B_15_02"); //Aber...
	FiebelerRaetsel += 1;
	Info_ClearChoices (DIA_DIC_Fiebeler_Philosophisch);
	};

func void DIA_DIC_Fiebeler_3C()
	{
	AI_Output (other, self, "DIA_DIC_Fiebeler_3C_15_00"); //Das Weltall
	AI_Output (self, other, "DIA_DIC_Fiebeler_3C_08_01"); //Nein, das ist total falsch. Wenn dir das Weltall fehlt, ist alles dein? Wie kommst du denn auf so was?
	AI_Output (other, self, "DIA_DIC_Fiebeler_3C_15_02"); //Naja, hm, stimmt, irgednwie ist das wohl wirklich falsch.
	FiebelerRaetsel += 1;
	Info_ClearChoices (DIA_DIC_Fiebeler_Philosophisch);
	};

// ------------- Raetsel falsch geloest -----------
instance DIA_DIC_Fiebeler_Falsch (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 7;
	condition = DIA_DIC_Fiebeler_Falsch_Condition;
	information = DIA_DIC_Fiebeler_Falsch_Info;
	permanent = 0;
	important = 1;
	description = "(Alternative)";
	};

func int DIA_DIC_Fiebeler_Falsch_Condition ()
	{
	if (FiebelerRaetsel == 2)
		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Falsch_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Falsch_08_00"); //Also ich gebe dir noch eine andere Chance. Gabb hat einen Schl�ssel von mir. Er hatte wohl keine Zeit, ihn zur�ckzubringen.
	AI_Output (self, other, "DIA_DIC_Fiebeler_Falsch_08_01"); //Hol ihn ab und bring ihn mir. Dann kriegst du das Buch. Ich sch�tze mal, du sollst das Buch f�r jemanden besorgen, und brauchst es gar nicht selbst. Schade. Naja. Hol mir einfach den Schl�ssel.
	
	B_LogEntry (RhetorikQuest, "Da ich es nicht geschafft habe, Fiebelers R�tsel zu l�sen, soll ich seinen Schl�ssel von Gabb holen.");
	};

// ----------- Junge bringt Schl�ssel ----------
instance DIA_DIC_Fiebeler_Bringen (C_INFO)
	{
	npc = DIC_2025_Fiebeler;
	nr = 8;
	condition = DIA_DIC_Fiebeler_Bringen_Condition;
	information = DIA_DIC_Fiebeler_Bringen_Info;
	permanent = 0;
	important = 0;
	description = "Hier der Schl�ssel.";
	};

func int DIA_DIC_Fiebeler_Bringen_Condition ()
	{
	if (Npc_HasItems (other, Fi_Key) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Fiebeler_Bringen_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Fiebeler_Bringen_15_00"); //Hier der Schl�ssel.
	AI_Output (self, other, "DIA_DIC_Fiebeler_Bringen_08_01"); //Da ist dein Buch. Bring es deinem Auftraggeber.Und ich hatte gehofft, du w�rdest dich wirklich f�r die Wissenschaft der Rhetorik interessieren.

	B_GiveInvItems (other, self, Fi_Key,1);
	CreateInvItem  (self, Rhetorik_Buch);
	B_GiveInvItems (self, other, Rhetorik_Buch, 1);
	
	B_GiveXP (250);
	
	B_LogEntry (RhetorikQuest, "Ich habe den Schl�ssel gegen das Buch getauscht.");
	};