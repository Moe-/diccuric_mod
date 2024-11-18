//------------ ENDE -----------------
instance DIA_DIC_Baltar_Exit (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 999;
	condition = DIA_DIC_Baltar_Exit_Condition;
	information = DIA_DIC_Baltar_Exit_Info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Baltar_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Baltar_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------- Nachricht über Verschwörung --------------
instance DIA_DIC_Baltar_Nachricht (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 1;
	condition = DIA_DIC_Baltar_Nachricht_Condition;
	information = DIA_DIC_Baltar_Nachricht_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe eine Nachricht gefunden die mich beunruhigt.";
	};

func int DIA_DIC_Baltar_Nachricht_Condition ()
	{
	if (Npc_HasItems(other, BaltarVerschwoerung) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Nachricht_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Nachricht_15_00"); //Ich habe eine Nachricht gefunden die mich beunruhigt. Hier steht, dass es eine Verschwörung gibt, mit dem Ziel euch zu ermorden.
	AI_Output (self, other, "DIA_DIC_Baltar_Nachricht_05_01"); //Ich weiß davon. Ibba der einzige Mitverschwörer wird noch zur Rechenschaft gezogen. Noch steht er unter Beobachtung. Du solltest niemanden etwas darüber sagen.
	AI_Output (self, other, "DIA_DIC_Baltar_Nachricht_05_02"); //Ich wusste von Anfang an, dass Gabb nicht nur Wein schmuggelt. Doch bevor ich dich ins Vertrauen ziehen konnte, musste ich erst wissen ob du es verdienst.
	};

// ------------- Auftrag da? ---------------
instance DIA_DIC_Baltar_Auftrag (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 2;
	condition = DIA_DIC_Baltar_Auftrag_Condition;
	information = DIA_DIC_Baltar_Auftrag_Info;
	permanent = 0;
	important = 1;
	description = "Hast du einen neuen Auftrag für mich?";
	};

func int DIA_DIC_Baltar_Auftrag_Condition ()
	{
	var int BaltarTag;
	BaltarTag = Wld_GetDay();
	if ((Npc_KnowsInfo (other, DIA_DIC_Graveyarn_Erzdrache) || Npc_KnowsInfo (other,DIA_DIC_Graveyarn_Briefe)) && GraveyarnTag < BaltarTag)
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Auftrag_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_00"); //Es sind schon ein paar Monate vergangen, Ardaric, als wir uns das letzte Mal sahen. Ich hatte alle Hände voll zu tun, und das wird in Zukunft auch so bleiben. Trotz meiner Verpflichtungen habe ich mich bei Graveyarn immer über dein Wohlergehen erkundigt. 
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_01"); //Du hattest es nicht immer leicht. Die ersten Prüfungen hast du bestanden, und damit gezeigt, wie ernst es dir ist in meine Dienste zu treten. Ich hoffe, du wirst meine Erwartungen nicht enttäuschen und auch die anstehenden Aufgaben bewältigen. 
	AI_Output (other, self, "DIA_DIC_Baltar_Auftrag_15_00"); //Hast du einen neuen Auftrag für mich?
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_01"); //Nein. Erst in ein paar Tagen. Einige Nachforschungen müssen noch abgeschlossen werden, bevor du mir in einer Angelegenheit von höchster Wichtigkeit helfen wirst.
	AI_Output (other, self, "DIA_DIC_Baltar_Auftrag_15_02"); //Welche Nachforschungen?
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_03"); //Vor langer Zeit lebten hier, in Etain die zwei Magier-Orden Aciadan und Madrimier. Die Aciadan schlossen sich Madrimier an und zusammen gründeten sie ein Zentrum für die magischen Wissenschaften. Alle hochrangigen Magier des Landes lebten dort und verfeinerten ihr magisches Können.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_04"); //Wenn ich jemandem erzähle, welche Kunstwerke der Spruchmagie aus den Händen der Madrimier einst hervorgingen, man würde es für ein Märchen halten. So mächtig waren die Madrimier einst, dass sie keine Bedrohung fürchteten.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_05"); //Wer sollte schon die größte Magiervereinigung des Landes angreifen? Doch die Orks taten es.  Eines Tages, brachen sie mit geballter Kraft ein. Armeen bedeckten das Land. Und in der Schlacht überlebten nur wenige von den Magiern.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_06"); //Doch während der Kampf zwischen den Parteien wütete, sind viele Schätze versteckt und vergraben worden.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_07"); //In schwer zugänglichen Höhlen, oder in Geheimkammern liegen jetzt magische Artefakte. Und genau danach suchen wir. 
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_02"); //Ardaric. Erst jetzt möchte ich dich einweihen. Denn du wirst in kurzer Zeit einen Auftrag von mir erhalten, dessen Bedeutung für uns im Lager nicht zu überschätzen ist. Es gibt hier in Etain drei Amulette von großer Wichtigkeit für mich.
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_03"); //Sie sind einst versteckt worden und alle meine bisherigen Versuche sie aufzuspüren, scheiterten. Es sind die sogenannten Triramar-Amulette. Die Triramar sind eine Gruppe von drei Amuletten, die zueinander gehören. 
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_04"); //Vereint man ihre Kraft, gibt es kaum eine sterbliche Macht die ihnen Widerstand leisten könnte. Für unsere Sache sind diese Artefakte deswegen von größter Bedeutung.
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_05"); //Nur mit den Triramar, kann ich mir des Sieges über die Hauptstadt Gatyahs sicher sein und den Heuchler, der sich als König ausgibt, von seinem Thron stürzen. 
	
	Wld_SendTrigger ("WAFFENKISTEN");
	Wld_InsertNpc	(DIC_2041_Jaeger, "STADT_MITTE_023");
	Wld_InsertNpc	(DIC_2042_Jaeger, "STADT_MITTE_022");
	
	
	Log_CreateTopic (BerengarQuests,  LOG_MISSION);
	Log_SetTopicStatus (BerengarQuests, LOG_RUNNING);
	B_LogEntry (BerengarQuests, "Berengar hat erstmal nichts für mich zu tun. Dafür hat er mir erzählt, dass er den König stürzen will.");
	};

// ------------ Magier nicht mächtig -----------
instance DIA_DIC_Baltar_Magier (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 3;
	condition = DIA_DIC_Baltar_Magier_Condition;
	information = DIA_DIC_Baltar_Magier_Info;
	permanent = 0;
	important = 0;
	description = "Waren die Magier dann überhaupt mächtig?";
	};

func int DIA_DIC_Baltar_Magier_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Auftrag))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Magier_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Magier_15_00"); //Wenn doch die mächtigsten Magier des Landes hier nichts gegen die Orks ausrichten konnten, dann waren sie doch nicht wirklich mächtig, oder?
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_01"); //Täusche dich nicht. Die Orks hatten für diesen Angriff alle Kräfte gesammelt. Einige Rauchsäulen am Horizont, einen Tag vor der Schlacht, waren die einzigen Hinweise auf den Überraschungsangriff. 
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_02"); //Es gab zwar Einzelne unter den Magiern die den Angriff vorausgesehen hatten, doch schenkte man ihnen keinen Glauben. Dass die Magier völlig überrascht wurden, war der große Vorteil der Orks. Ohne ihn hätten sie die Schlacht nicht gewonnen. 
	AI_Output (other, self, "DIA_DIC_Baltar_Magier_15_03"); //Dennoch, die Magier haben verloren. Dies wirft kein gutes Licht auf sie.
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_04"); //Hätten sie wirklich verloren, wäre Gatyah jetzt in der Hand der Orks. Im Gegenteil! Die Magier brachten den Ork-Armeen so hohe Verluste bei, dass die Orks ihr eigentliches Ziel aufgeben mussten.
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_05"); //Denn sie zogen nun geschwächt gegen die Hauptstadt und unterlagen schließlich den Rittern des Königs. Also unterschätze nicht den Einsatz der Magier, denen vor Jahrhunderten kein Opfer zu gering war, um den Orks den größtmöglichsten Schaden zuzufügen.
	};

// ------------ Amulette finden -----------
instance DIA_DIC_Baltar_Amulette (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 4;
	condition = DIA_DIC_Baltar_Amulette_Condition;
	information = DIA_DIC_Baltar_Amulette_Info;
	permanent = 0;
	important = 0;
	description = "Dann soll ich die Amulette finden?";
	};

func int DIA_DIC_Baltar_Amulette_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Auftrag))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Amulette_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Amulette_15_00"); //Dann soll ich die Amulette finden?
	AI_Output (self, other, "DIA_DIC_Baltar_Amulette_05_01"); //Das wird deine Aufgabe sein. Und ich spüre eine magische Kraft in dir, die dir helfen wird diesen Auftrag auszuführen. Du bist wahrscheinlich besser als irgendjemand anderes im Lager dafür geeignet.
	AI_Output (other, self, "DIA_DIC_Baltar_Amulette_15_02"); //Wann kann ich anfangen?
	AI_Output (self, other, "DIA_DIC_Baltar_Amulette_05_03"); //Geduld. Graveyarn wird dich rufen lassen, wenn es soweit ist.
	
	B_LogEntry (BerengarQuests, "Ich werde für Berengar bald einige Amulette suchen. Graveyarn wird mir bescheid geben, wenn es so weit ist.");
	};

// ------------ ohne Verloren? -----------
instance DIA_DIC_Baltar_Verlieren (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 4;
	condition = DIA_DIC_Baltar_Verlieren_Condition;
	information = DIA_DIC_Baltar_Verlieren_Info;
	permanent = 0;
	important = 0;
	description = "Heißt das, dass ein Kampf gegen den König, ohne die Artefakte schon verloren wäre.";
	};

func int DIA_DIC_Baltar_Verlieren_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Auftrag))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Verlieren_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Verlieren_15_00"); //Heißt das, dass ein Kampf gegen den König, ohne die Artefakte schon verloren wäre. 
	AI_Output (self, other, "DIA_DIC_Baltar_Verlieren_05_01"); //Nein. Wir sind in der Lage den König auch ohne die Hilfe der Amulette zu besiegen. Doch geben uns die Triramar-Artefakte die Gewissheit, dass wir gewinnen, bevor wir in die Schlacht ziehen. 
	};
	

// ------------ Was für Amulette -----------
instance DIA_DIC_Baltar_Welche (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 5;
	condition = DIA_DIC_Baltar_Welche_Condition;
	information = DIA_DIC_Baltar_Welche_Info;
	permanent = 0;
	important = 0;
	description = "Was sind das für Amulette?";
	};

func int DIA_DIC_Baltar_Welche_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Auftrag))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Welche_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Welche_15_00"); //Was sind das für Amulette?
	AI_Output (self, other, "DIA_DIC_Baltar_Welche_05_01"); //Damals wurden die Amulette von den Führern des Ordens geschaffen. In ihnen ist ein Teil ihrer Kraft gespeichert.
	AI_Output (self, other, "DIA_DIC_Baltar_Welche_05_02"); //Jedes Amulett ist durch eine Rune gekennzeichnet. Die Namen der Runen sind zugleich die Namen der drei Gottheiten: Graw, Asan und Ocied. 
	};

// ------------ Zweikampf ----------------
instance DIA_DIC_Baltar_Zweikampf (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 6;
	condition = DIA_DIC_Baltar_Zweikampf_Condition;
	information = DIA_DIC_Baltar_Zweikampf_Info;
	permanent = 0;
	important = 0;
	description = "Hast du eine Aufgabe zur Schwertkampfverbesserung?";
	};

func int DIA_DIC_Baltar_Zweikampf_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Alwin_KAufBaltar) && !Npc_IsDead(DIC_2031_Koll))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Zweikampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Zweikampf_15_00"); //Hast du eine Aufgabe für mich, mit der ich meine Fähigkeiten im Schwertkampf verbessern kann?
	AI_Output (self, other, "DIA_DIC_Baltar_Zweikampf_05_01"); //Ja. Du bist doch schon einmal gegen Koll in einem Wettlauf angetreten?
	
	B_LogEntry (BerengarQuests, "Berengar hat mir einen Kampf mit Koll als Mission aufgetragen.");
	};

// ----------- Wer ist Koll --------------
instance DIA_DIC_Baltar_WerKoll (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 7;
	condition = DIA_DIC_Baltar_WerKoll_Condition;
	information = DIA_DIC_Baltar_WerKoll_Info;
	permanent = 0;
	important = 0;
	description = "Koll? Wer ist das?";
	};

func int DIA_DIC_Baltar_WerKoll_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Zweikampf) && !Npc_KnowsInfo(other, DIA_DIC_Baltar_KenneKoll)
		&& Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Karte))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_WerKoll_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_WerKoll_15_00"); //Koll? Wer ist das?
	AI_Output (self, other, "DIA_DIC_Baltar_WerKoll_05_01"); //Wenn du dich nicht mehr an ihn erinnerst, so wirst du in den nächsten Stunden Gelegenheit haben deine Erinnerung aufzufrischen.
	AI_Output (self, other, "DIA_DIC_Baltar_WerKoll_05_02"); //Graveyarn hat mir ausrichten lassen, dass Koll dich zu einem Zweikampf auffordert. Stelle dich seiner Herausforderung. Koll wartet auf dich in der Arena. Es gilt freie Waffenwahl. Ein Schiedsmann wird dort sein und mir berichten wer von euch beiden den Sieg heimträgt.

	Npc_ExchangeRoutine	(DIC_2031_Koll,"ARENA");
	CreateInvItem (DIC_2031_Koll, KollsAmulette);
	};

//------------ Ich kenne Koll-------------
instance DIA_DIC_Baltar_KenneKoll (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 7;
	condition = DIA_DIC_Baltar_KenneKoll_Condition;
	information = DIA_DIC_Baltar_KenneKoll_Info;
	permanent = 0;
	important = 0;
	description = "Ja, ich kenne ihn.";
	};

func int DIA_DIC_Baltar_KenneKoll_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Zweikampf) && !Npc_KnowsInfo(other, DIA_DIC_Baltar_WerKoll))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_KenneKoll_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_KenneKoll_15_00"); //Ja, ich kenne ihn.
	AI_Output (self, other, "DIA_DIC_Baltar_KenneKoll_05_01"); //Graveyarn hat mir ausrichten lassen, dass Koll dich zu einem Zweikampf auffordert. Stelle dich seiner Herausforderung. Koll wartet auf dich in der Arena. Es gilt freie Waffenwahl. Ein Schiedsmann wird dort sein und mir berichten wer von euch beiden den Sieg heimträgt.

	Npc_ExchangeRoutine	(DIC_2031_Koll,"ARENA");
	};

//----------- Kampf mit Koll gewonnen ------------
instance DIA_DIC_Baltar_Gewonnen (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 8;
	condition = DIA_DIC_Baltar_Gewonnen_Condition;
	information = DIA_DIC_Baltar_Gewonnen_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe gewonnen!";
	};

func int DIA_DIC_Baltar_Gewonnen_Condition ()
	{
	var C_NPC DicKoll; 	
	DicKoll = Hlp_GetNpc(DIC_2031_Koll);
	DicKoll.aivar[AIV_WASDEFEATEDBYSC] ;
	
	/*if (DicKoll.aivar[AIV_WASDEFEATEDBYSC] == TRUE
	//if ((Npc_WasInState(DIC_2031_Koll, ZS_Unconscious) || NPC_IsDead(DIC_2031_Koll)) //alt: (Npc_HasItems(other, KollsAmulette) >= 1)
			 && Npc_KnowsInfo(other, DIA_DIC_Koll_Zweikampf) 
			 && !Npc_KnowsInfo(other, DIA_DIC_Baltar_Verloren)) */
	if (KampfMitKoll == 1)
		{
		return 1;
		};
	return 0;
	};

func void DIA_DIC_Baltar_Gewonnen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Gewonnen_15_00"); //Ich habe gewonnen!
	AI_Output (self, other, "DIA_DIC_Baltar_Gewonnen_05_01"); //Gut, du hast gewonnen. Ich habe es nicht anders erwartet. Und jetzt geh zurück ins Lager und warte bis ich dich durch Graveyarn rufen lasse.
	
	B_LogEntry (BerengarQuests, "Ich habe Koll besiegt und soll nun auf meinen Auftrag warten.");
	Log_SetTopicStatus (BerengarQuests, LOG_SUCCESS);
	B_GiveXP (250);
	};

//----------- Kampf mit Koll verloren ------------
instance DIA_DIC_Baltar_Verloren (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 9;
	condition = DIA_DIC_Baltar_Verloren_Condition;
	information = DIA_DIC_Baltar_Verloren_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe verloren...";
	};

func int DIA_DIC_Baltar_Verloren_Condition ()
	{
	var C_NPC DicKoll; 	
	DicKoll = Hlp_GetNpc(DIC_2031_Koll);
	DicKoll.aivar[AIV_WASDEFEATEDBYSC] ;
	
	/* //if (!(Npc_HasItems(other, KollsAmulette) >= 1)
	if ((DicKoll.aivar[AIV_WASDEFEATEDBYSC] == FALSE)
		 && Npc_KnowsInfo(other, DIA_DIC_Koll_Zweikampf) 
		 && !Npc_KnowsInfo(other, DIA_DIC_Baltar_Gewonnen)) */
	if (KampfMitKoll == 2)
		{
		return 1;
		};
	return 0;
	};

func void DIA_DIC_Baltar_Verloren_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baltar_Verloren_15_00"); //Ich habe gegen Koll verloren...
	AI_Output (self, other, "DIA_DIC_Baltar_Verloren_05_01"); //Das Koll der bessere Kämpfer ist, hätte ich nicht erwartet. Geh jetzt Ardaric. 
	
	B_LogEntry (BerengarQuests, "Berengar war ziemlich enttäuscht, dass ich gegen Koll verloren habe.");
	Log_SetTopicStatus (BerengarQuests, LOG_FAILED);
	};
	
//----------- einen Auftrag übernimmst ------------
instance DIA_DIC_Baltar_Uebernehmen (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 10;
	condition = DIA_DIC_Baltar_Uebernehmen_Condition;
	information = DIA_DIC_Baltar_Uebernehmen_Info;
	permanent = 0;
	important = 1;
	description = "Auftrag";
	};

func int DIA_DIC_Baltar_Uebernehmen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Lagariman_Bringt))
		{
		return 1;
		};
	};

func void DIA_DIC_Baltar_Uebernehmen_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_01"); //Du hattest es nicht immer leicht. Die ersten Prüfungen hast du bestanden, und damit gezeigt, wie ernst es dir ist in meine Dienste zu treten. Ich hoffe, du wirst meine Erwartungen nicht enttäuschen und auch die anstehenden Aufgaben bewältigen. 
	//AI_Output (self, other, "DIA_DIC_Baltar_Uebernehmen_05_00"); //So, Ardaric. Nun ist es an der Zeit, das du für mich einen Auftrag übernimmst,  dessen Wichtigkeit nicht zu überschätzen ist.
	
	Log_CreateTopic (BerengarJob,  LOG_MISSION);
	Log_SetTopicStatus (BerengarJob, LOG_RUNNING);
	B_LogEntry (BerengarJob, "Ich soll von Berengar eine wichtige Aufgabe übernehmen. Was das wohl sein mag?");
	
	Info_AddChoice(DIA_DIC_Baltar_Uebernehmen, "Was ist zu tun?", DIA_DIC_Berengar_Tun);
	Info_AddChoice(DIA_DIC_Baltar_Uebernehmen, "Werdet ihr mich begleiten?", DIA_DIC_Berengar_Begleiten);
	};
	
func void DIA_DIC_Berengar_Tun ()
	{
	AI_Output (other, self, "DIA_DIC_Berengar_Tun_15_00"); //Was ist zu tun?
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_01"); //Ich erzählte dir bereits von den Triramar Amuletten. Eines davon ist jetzt in einer Mine gefunden worden.
	AI_Output (other, self, "DIA_DIC_Berengar_Tun_15_02"); //Soll ich das gefundene Amulett abholen, und sicher zu euch bringen?
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_03"); //So einfach ist es nicht. Das Amulett ist von Modares gefunden worden. Einen Söldner den ich vor zwei Jahren anheuerte. Doch seine Untreue hat sich erst jetzt gezeigt. 
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_04"); //Modares hat einige der Minenarbeiter aufgewiegelt und will mit dem Asan Amulett Etain verlassen. Natürlich haben die Männer die treu zu mir stehen die Mine verbarrikadiert. 
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_05"); //Doch ich befürchte das Modares einen unerforschten Stollen findet und so aus der Mine fliehen kann.
	AI_Output (other, self, "DIA_DIC_Berengar_Tun_15_06"); //Dann werde ich versuchen Modares das Amulett abzunehmen.
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_07"); //Gut. Gehe zu Graveyarn, er führt dich zur Mine. Er leitet die Söldnereinheit die gegen Modares vorgehen.
	
	B_LogEntry (BerengarJob, "Ich soll zur Mine und dem Söldner Modares ein Triramar Amulette abnehmen. Graveyarn wird mich zur Mine führen.");
	
	Info_ClearChoices (DIA_DIC_Baltar_Uebernehmen);
	Npc_ExchangeRoutine(self,"THRONSAAL");
	
	Npc_ExchangeRoutine(DIC_2327_Soeldner,"MINE");
	AI_ContinueRoutine(DIC_2327_Soeldner);
	Npc_ExchangeRoutine(DIC_2328_Soeldner,"MINE");
	AI_ContinueRoutine(DIC_2328_Soeldner);
	Npc_ExchangeRoutine(DIC_2329_Soeldner,"MINE");
	AI_ContinueRoutine(DIC_2329_Soeldner);
	Npc_ExchangeRoutine(DIC_2330_Soeldner,"MINE");
	AI_ContinueRoutine(DIC_2330_Soeldner);
	Npc_ExchangeRoutine(DIC_2331_Soeldner,"MINE");
	AI_ContinueRoutine(DIC_2331_Soeldner);
	Npc_ExchangeRoutine(DIC_2332_Soeldner,"MINE");
	AI_ContinueRoutine(DIC_2332_Soeldner);
	};
	
func void DIA_DIC_Berengar_Begleiten ()
	{
	AI_Output (other, self, "DIA_DIC_Berengar_Begleiten_15_00"); //Darf ich mir die Frage erlauben? Werdet ihr mich begleiten? Denn eine so wichtige Aufgabe erfordert doch sicher die Aufmerksamkeit des größten Kämpfers in diesem Land.
	AI_Output (self, other, "DIA_DIC_Berengar_Begleiten_05_01"); //Magische Arbeit die langwierig und nur mit höchster Aufmerksamkeit bewältigt werden kann, zwingt mich hier im Turm zu bleiben.	
	
	B_LogEntry (BerengarJob, "Berengar wird mich nicht begleiten.");
	};