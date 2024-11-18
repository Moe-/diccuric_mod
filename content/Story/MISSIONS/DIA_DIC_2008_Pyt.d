//------------ ENDE -----------------
instance DIA_DIC_Pyt_Exit (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 999;
	condition = DIA_DIC_Pyt_Exit_Condition;
	information = DIA_DIC_Pyt_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Pyt_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Pyt_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------ Pyt helfen ------------------
instance DIA_DIC_Pyt_Helfen (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 1;
	condition = DIA_DIC_Pyt_Helfen_Condition;
	information = DIA_DIC_Pyt_Helfen_Info;
	permanent = 0;
	description = "Kann ich was f�r dich tun?";
	};

func int DIA_DIC_Pyt_Helfen_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Helfen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Helfen_15_00"); //Hey Pyt. Kann ich was f�r dich tun?
	AI_Output (self, other, "DIA_DIC_Pyt_Helfen_03_01"); //Kann ich dir was aufs Maul hauen?
	AI_Output (other, self, "DIA_DIC_Pyt_Helfen_15_02"); //Oh, hier hat einer schlechte Laune.
	AI_Output (self, other, "DIA_DIC_Pyt_Helfen_03_03"); //Meine Laune ist so schlecht, dass ich dir gut was antun k�nnte, wenn du nicht abhaust.
	AI_Output (other, self, "DIA_DIC_Pyt_Helfen_15_04"); //Hey. Ich suche nur Arbeit und keinen Streit.
	AI_Output (self, other, "DIA_DIC_Pyt_Helfen_03_05"); //Hau ab.
	
	Log_CreateTopic (PytQuest, LOG_MISSION);
	Log_SetTopicStatus (PytQuest, LOG_RUNNING);
	B_LogEntry (PytQuest, "Aus irgendeinem Grund ist Pyt m�chtig sauer und ich konnte nicht rausfinden, was los ist. Aber ich bin mir sicher, dass er mir den Brief schreibt, sobald ich sein Problem gel�st habe.");
	};

/* Der komplette Block wurde mehr oder weniger Taylor "�bertragen"
	sollte das Quest von Taylor Mist sein, damm einfach hier wieder das alte freigeben
		(Anm. v. Markus)
// ------------ �ber Ort ------------------
instance DIA_DIC_Pyt_Ort (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 2;
	condition = DIA_DIC_Pyt_Ort_Condition;
	information = DIA_DIC_Pyt_Ort_Info;
	permanent = 0;
	description = "Was wei�t du �ber diesen Ort?";
	};

func int DIA_DIC_Pyt_Ort_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Pyt_Helfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Ort_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Ort_15_00"); //Was wei�t du �ber diesen Ort? Was ist hier geschehen?
	AI_Output (self, other, "DIA_DIC_Pyt_Ort_03_01"); //Ehrlich gesagt wei� ich auch nur Ger�chte. Ich werde es dir vielleicht erz�hlen, wenn unsere... Zusammenarbeit klappt.
	};

// ------------ Was soll ich tun ------------------
instance DIA_DIC_Pyt_Tun (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 3;
	condition = DIA_DIC_Pyt_Tun_Condition;
	information = DIA_DIC_Pyt_Tun_Info;
	permanent = 0;
	description = "Was soll ich tun?";
	};

func int DIA_DIC_Pyt_Tun_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Pyt_Helfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Tun_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Tun_15_00"); //Was soll ich tun?
	AI_Output (self, other, "DIA_DIC_Pyt_Tun_03_01"); //Der S�ldner steht alleine in der N�he der Orkarena Wache. Das ist sein st�ndiger Posten. Versuche ihm irgendwie das Schwert abzunehmen. Ich denke wenn du so gut verhandeln kannst, schwatz es ihm ab, kauf es ihm ab oder tausch es mit was ein... Dann bring mir das Schwert - es hei�t Gl�cksbringer. Danach werde ICH mal, einen kleinen �berfall starten.
	};

// ------------ Woher wei�t du das ------------------
instance DIA_DIC_Pyt_Wissen (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 4;
	condition = DIA_DIC_Pyt_Wissen_Condition;
	information = DIA_DIC_Pyt_Wissen_Info;
	permanent = 0;
	description = "Woher wei�t du, das er es war?";
	};

func int DIA_DIC_Pyt_Wissen_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Pyt_Helfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Wissen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Wissen_15_00"); //Woher wei�t du, das er es war?
	AI_Output (self, other, "DIA_DIC_Pyt_Wissen_03_01"); //Ich habe gegen ihn beim Kartenspiel gewonnen und ihm den Erzverdienst von einem Monat abgeluchst. Naja und dann hab ich n Fehler gemacht, ich hab rumerz�hlt das er die dreckigsten Fleischwanzen gegessen hat, um etwas zum Bei�en zu haben. Es kann nur er gewesen sein, denn mein Schwert hat ihn auch immer interessiert.
	};

// ------------ Wieso gehst du nicht ------------------
instance DIA_DIC_Pyt_Kaempfen (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 5;
	condition = DIA_DIC_Pyt_Kaempfen_Condition;
	information = DIA_DIC_Pyt_Kaempfen_Info;
	permanent = 0;
	description = "Wieso gehst du nicht hin und machst ihn platt?";
	};

func int DIA_DIC_Pyt_Kaempfen_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Pyt_Helfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Kaempfen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Kaempfen_15_00"); //Wieso gehst du nicht hin und machst ihn platt?
	AI_Output (self, other, "DIA_DIC_Pyt_Kaempfen_03_01"); //Ich pflege dazu meine -MEINE- Waffe zu benutzen.
	};

// ------------ Annehmen + Bezahlung ------------
instance DIA_DIC_Pyt_Annehmen (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 6;
	condition = DIA_DIC_Pyt_Annehmen_Condition;
	information = DIA_DIC_Pyt_Annehmen_Info;
	permanent = 0;
	description = "Ok...meine Bezahlung...";
	};

func int DIA_DIC_Pyt_Annehmen_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Pyt_Ort)
	   && Npc_KnowsInfo(hero, DIA_DIC_Pyt_Tun)
	   && Npc_KnowsInfo(hero, DIA_DIC_Pyt_Wissen)
	   && Npc_KnowsInfo(hero, DIA_DIC_Pyt_Kaempfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Annehmen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Annehmen_15_00"); //Ok. Ich werde sehen, was ich ausrichten kann. Ach so... meine Bezahlung
	AI_Output (self, other, "DIA_DIC_Pyt_Annehmen_03_01"); //Ja?
	AI_Output (other, self, "DIA_DIC_Pyt_Annehmen_15_02"); //Ich habe noch eine offene Rechnung bei Taliasan. Wenn du mich bezahlst, dann indem du einen Brief an Berengar schreibst in welchem du Taliasans F�higkeiten lobend erw�hnst.
	AI_Output (self, other, "DIA_DIC_Pyt_Annehmen_03_03"); //Hehe. Ich dachte mir schon das Taliasan sich nicht verkriecht. Naja, er hat etwas �hnliches durchgemacht wie ich. Das mit dem Brief geht in Ordnung.
	AI_Output (other, self, "DIA_DIC_Pyt_Annehmen_15_04"); //Ich werde sehen was ich erreichen kann.

	B_LogEntry (TaliasansNeueAuftraege, "Pyt glaubt das er bestohlen wurde. Ich soll von dem Dieb versuchen das Schwert wiederzubeschaffen. Der angebliche Dieb ist ein W�chter und istzum Zugang zur Orkarena zu finden.");

	TaliasanAuftraege = 5;
	};
Eventuell die Variable TaliasanAuftrage anderweitig erh�hen, wenn sie nochmal ben�tigt wird.
Solange mir nicht einf�llt, wozu, wird sie nicht anderweitig umgeschrieben
hier endet auskommentierter Block (Taylors Jobzuweisung)
*/

// -------------- Spieler hat Schwert -------------
instance DIA_DIC_Pyt_Schwert (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 7;
	condition = DIA_DIC_Pyt_Schwert_Condition;
	information = DIA_DIC_Pyt_Schwert_Info;
	permanent = 0;
	description = "Hier ist das Schwert.";
	};

func int DIA_DIC_Pyt_Schwert_Condition ()
	{
	if (Npc_HasItems(other, Gluecksbringer) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Schwert_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_00"); //Hey Pyt!
	AI_Output (self, other, "DIA_DIC_Pyt_Schwert_03_01"); //Hey Alwin, wirf doch mal einen der Holzscheite r�ber. Ich muss hier mal jemanden verpr�geln. 
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_02"); //Taylor hat mir erz�hlt was passiert ist. Ich habe dir das Schwert wiederbeschafft!!
	AI_Output (self, other, "DIA_DIC_Pyt_Schwert_03_03"); //Nein. Das ist nicht wahr! Das ist tats�chlich... "GL�CKSBRINGER!" Woher hast du es?
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_04"); //Von Rotrou. Ich habe es durch einen "Tauschhandel" an mich gebracht. Ich habe es dir ja schon versucht zu sagen: Ich suche Arbeit. 
	AI_Output (self, other, "DIA_DIC_Pyt_Schwert_03_05"); //Unglaublich. Gut. Ich will dich belohnen, und Arbeit werde ich dir auch beschaffen!
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_06"); //Also eine Belohnung w�rde mir f�r den Anfang reichen.
	AI_Output (self, other, "DIA_DIC_Pyt_Schwert_03_07"); //Wieviel Silber willst du haben?
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_08"); //Zur Zeit arbeite ich f�r Taliasan. Silber brauche ich nicht. Aber einen Brief k�nnte w�re mir von Nutzen. Ein Brief in dem du die magische Begabung Taliasans lobend hervorhebst.
	AI_Output (self, other, "DIA_DIC_Pyt_Schwert_03_09"); //Du hast sehr viel f�r mich getan. Aber warum sollte ich Taliasan helfen? Er hat mir das Schwert nicht zur�ckgebracht.
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_10"); //Ich bin sein Sch�ler. Ohne seine Hilfe l�ge das Schwert jetzt nicht in deinen H�nden.
	AI_Output (self, other, "DIA_DIC_Pyt_Schwert_03_11"); //Gut. Dann schreibe ich dir den Brief. .... Hier.
	AI_Output (other, self, "DIA_DIC_Pyt_Schwert_15_12"); //Danke.

	B_LogEntry (PytQuest, "Ich habe Pyt das Schwert gegeben. Jetzt muss ich nur noch den Brief holen.");
	B_GiveInvItems(other, self,Gluecksbringer,1);
	
	};

// -------------- Brief ---------------
instance DIA_DIC_Pyt_Brief (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 8;
	condition = DIA_DIC_Pyt_Brief_Condition;
	information = DIA_DIC_Pyt_Brief_Info;
	permanent = 0;
	description = "Was ist mit dem Brief?";
	};

func int DIA_DIC_Pyt_Brief_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Pyt_Schwert))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Brief_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Brief_15_00"); //Was ist mit dem Brief?
	AI_Output (self, other, "DIA_DIC_Pyt_Brief_03_01"); //Den habe ich fertig. Hier.
	B_GiveInvItems(self, other,Py_Empf,1);
	B_GiveXP (250);
	
	B_LogEntry (PytQuest, "Na also, ich habe den Brief von Pyt erhalten.");
	Log_SetTopicStatus (PytQuest, LOG_SUCCESS);
	};

/*
// --------------- Ort ----------------
instance DIA_DIC_Pyt_Location (C_INFO)
	{
	npc = DIC_2008_Pyt;
	nr = 9;
	condition = DIA_DIC_Pyt_Location_Condition;
	information = DIA_DIC_Pyt_Location_Info;
	permanent = 0;
	description = "Bevor du gehst...";
	};

func int DIA_DIC_Pyt_Location_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Pyt_Schwert))
		{
		return 1;
		};
	};

func void DIA_DIC_Pyt_Location_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Pyt_Location_15_00"); //Ach so bevor du gehst... Du wolltest mir noch erz�hlen was du �ber diesen Ort wei�t.
	AI_Output (self, other, "DIA_DIC_Pyt_Location_03_01"); //Ok. Also ich wei� nicht viel. Nur habe ich geh�rt, das fr�her schreckliches hier geschehen sein soll. Der Landstrich wurde verw�stet. Und der K�nig selbst hat ein Gesetz erlassen, das dieser Landstrich nicht besiedelt werden darf.
	};
*/

