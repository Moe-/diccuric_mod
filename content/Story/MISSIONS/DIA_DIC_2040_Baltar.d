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

// ----------- Nachricht �ber Verschw�rung --------------
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
	AI_Output (other, self, "DIA_DIC_Baltar_Nachricht_15_00"); //Ich habe eine Nachricht gefunden die mich beunruhigt. Hier steht, dass es eine Verschw�rung gibt, mit dem Ziel euch zu ermorden.
	AI_Output (self, other, "DIA_DIC_Baltar_Nachricht_05_01"); //Ich wei� davon. Ibba der einzige Mitverschw�rer wird noch zur Rechenschaft gezogen. Noch steht er unter Beobachtung. Du solltest niemanden etwas dar�ber sagen.
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
	description = "Hast du einen neuen Auftrag f�r mich?";
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
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_00"); //Es sind schon ein paar Monate vergangen, Ardaric, als wir uns das letzte Mal sahen. Ich hatte alle H�nde voll zu tun, und das wird in Zukunft auch so bleiben. Trotz meiner Verpflichtungen habe ich mich bei Graveyarn immer �ber dein Wohlergehen erkundigt. 
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_01"); //Du hattest es nicht immer leicht. Die ersten Pr�fungen hast du bestanden, und damit gezeigt, wie ernst es dir ist in meine Dienste zu treten. Ich hoffe, du wirst meine Erwartungen nicht entt�uschen und auch die anstehenden Aufgaben bew�ltigen. 
	AI_Output (other, self, "DIA_DIC_Baltar_Auftrag_15_00"); //Hast du einen neuen Auftrag f�r mich?
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_01"); //Nein. Erst in ein paar Tagen. Einige Nachforschungen m�ssen noch abgeschlossen werden, bevor du mir in einer Angelegenheit von h�chster Wichtigkeit helfen wirst.
	AI_Output (other, self, "DIA_DIC_Baltar_Auftrag_15_02"); //Welche Nachforschungen?
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_03"); //Vor langer Zeit lebten hier, in Etain die zwei Magier-Orden Aciadan und Madrimier. Die Aciadan schlossen sich Madrimier an und zusammen gr�ndeten sie ein Zentrum f�r die magischen Wissenschaften. Alle hochrangigen Magier des Landes lebten dort und verfeinerten ihr magisches K�nnen.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_04"); //Wenn ich jemandem erz�hle, welche Kunstwerke der Spruchmagie aus den H�nden der Madrimier einst hervorgingen, man w�rde es f�r ein M�rchen halten. So m�chtig waren die Madrimier einst, dass sie keine Bedrohung f�rchteten.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_05"); //Wer sollte schon die gr��te Magiervereinigung des Landes angreifen? Doch die Orks taten es.  Eines Tages, brachen sie mit geballter Kraft ein. Armeen bedeckten das Land. Und in der Schlacht �berlebten nur wenige von den Magiern.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_06"); //Doch w�hrend der Kampf zwischen den Parteien w�tete, sind viele Sch�tze versteckt und vergraben worden.  
	AI_Output (self, other, "DIA_DIC_Baltar_Auftrag_05_07"); //In schwer zug�nglichen H�hlen, oder in Geheimkammern liegen jetzt magische Artefakte. Und genau danach suchen wir. 
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_02"); //Ardaric. Erst jetzt m�chte ich dich einweihen. Denn du wirst in kurzer Zeit einen Auftrag von mir erhalten, dessen Bedeutung f�r uns im Lager nicht zu �bersch�tzen ist. Es gibt hier in Etain drei Amulette von gro�er Wichtigkeit f�r mich.
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_03"); //Sie sind einst versteckt worden und alle meine bisherigen Versuche sie aufzusp�ren, scheiterten. Es sind die sogenannten Triramar-Amulette. Die Triramar sind eine Gruppe von drei Amuletten, die zueinander geh�ren. 
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_04"); //Vereint man ihre Kraft, gibt es kaum eine sterbliche Macht die ihnen Widerstand leisten k�nnte. F�r unsere Sache sind diese Artefakte deswegen von gr��ter Bedeutung.
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_05"); //Nur mit den Triramar, kann ich mir des Sieges �ber die Hauptstadt Gatyahs sicher sein und den Heuchler, der sich als K�nig ausgibt, von seinem Thron st�rzen. 
	
	Wld_SendTrigger ("WAFFENKISTEN");
	Wld_InsertNpc	(DIC_2041_Jaeger, "STADT_MITTE_023");
	Wld_InsertNpc	(DIC_2042_Jaeger, "STADT_MITTE_022");
	
	
	Log_CreateTopic (BerengarQuests,  LOG_MISSION);
	Log_SetTopicStatus (BerengarQuests, LOG_RUNNING);
	B_LogEntry (BerengarQuests, "Berengar hat erstmal nichts f�r mich zu tun. Daf�r hat er mir erz�hlt, dass er den K�nig st�rzen will.");
	};

// ------------ Magier nicht m�chtig -----------
instance DIA_DIC_Baltar_Magier (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 3;
	condition = DIA_DIC_Baltar_Magier_Condition;
	information = DIA_DIC_Baltar_Magier_Info;
	permanent = 0;
	important = 0;
	description = "Waren die Magier dann �berhaupt m�chtig?";
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
	AI_Output (other, self, "DIA_DIC_Baltar_Magier_15_00"); //Wenn doch die m�chtigsten Magier des Landes hier nichts gegen die Orks ausrichten konnten, dann waren sie doch nicht wirklich m�chtig, oder?
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_01"); //T�usche dich nicht. Die Orks hatten f�r diesen Angriff alle Kr�fte gesammelt. Einige Rauchs�ulen am Horizont, einen Tag vor der Schlacht, waren die einzigen Hinweise auf den �berraschungsangriff. 
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_02"); //Es gab zwar Einzelne unter den Magiern die den Angriff vorausgesehen hatten, doch schenkte man ihnen keinen Glauben. Dass die Magier v�llig �berrascht wurden, war der gro�e Vorteil der Orks. Ohne ihn h�tten sie die Schlacht nicht gewonnen. 
	AI_Output (other, self, "DIA_DIC_Baltar_Magier_15_03"); //Dennoch, die Magier haben verloren. Dies wirft kein gutes Licht auf sie.
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_04"); //H�tten sie wirklich verloren, w�re Gatyah jetzt in der Hand der Orks. Im Gegenteil! Die Magier brachten den Ork-Armeen so hohe Verluste bei, dass die Orks ihr eigentliches Ziel aufgeben mussten.
	AI_Output (self, other, "DIA_DIC_Baltar_Magier_05_05"); //Denn sie zogen nun geschw�cht gegen die Hauptstadt und unterlagen schlie�lich den Rittern des K�nigs. Also untersch�tze nicht den Einsatz der Magier, denen vor Jahrhunderten kein Opfer zu gering war, um den Orks den gr��tm�glichsten Schaden zuzuf�gen.
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
	AI_Output (self, other, "DIA_DIC_Baltar_Amulette_05_01"); //Das wird deine Aufgabe sein. Und ich sp�re eine magische Kraft in dir, die dir helfen wird diesen Auftrag auszuf�hren. Du bist wahrscheinlich besser als irgendjemand anderes im Lager daf�r geeignet.
	AI_Output (other, self, "DIA_DIC_Baltar_Amulette_15_02"); //Wann kann ich anfangen?
	AI_Output (self, other, "DIA_DIC_Baltar_Amulette_05_03"); //Geduld. Graveyarn wird dich rufen lassen, wenn es soweit ist.
	
	B_LogEntry (BerengarQuests, "Ich werde f�r Berengar bald einige Amulette suchen. Graveyarn wird mir bescheid geben, wenn es so weit ist.");
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
	description = "Hei�t das, dass ein Kampf gegen den K�nig, ohne die Artefakte schon verloren w�re.";
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
	AI_Output (other, self, "DIA_DIC_Baltar_Verlieren_15_00"); //Hei�t das, dass ein Kampf gegen den K�nig, ohne die Artefakte schon verloren w�re. 
	AI_Output (self, other, "DIA_DIC_Baltar_Verlieren_05_01"); //Nein. Wir sind in der Lage den K�nig auch ohne die Hilfe der Amulette zu besiegen. Doch geben uns die Triramar-Artefakte die Gewissheit, dass wir gewinnen, bevor wir in die Schlacht ziehen. 
	};
	

// ------------ Was f�r Amulette -----------
instance DIA_DIC_Baltar_Welche (C_INFO)
	{
	npc = DIC_2040_Baltar;
	nr = 5;
	condition = DIA_DIC_Baltar_Welche_Condition;
	information = DIA_DIC_Baltar_Welche_Info;
	permanent = 0;
	important = 0;
	description = "Was sind das f�r Amulette?";
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
	AI_Output (other, self, "DIA_DIC_Baltar_Welche_15_00"); //Was sind das f�r Amulette?
	AI_Output (self, other, "DIA_DIC_Baltar_Welche_05_01"); //Damals wurden die Amulette von den F�hrern des Ordens geschaffen. In ihnen ist ein Teil ihrer Kraft gespeichert.
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
	AI_Output (other, self, "DIA_DIC_Baltar_Zweikampf_15_00"); //Hast du eine Aufgabe f�r mich, mit der ich meine F�higkeiten im Schwertkampf verbessern kann?
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
	AI_Output (self, other, "DIA_DIC_Baltar_WerKoll_05_01"); //Wenn du dich nicht mehr an ihn erinnerst, so wirst du in den n�chsten Stunden Gelegenheit haben deine Erinnerung aufzufrischen.
	AI_Output (self, other, "DIA_DIC_Baltar_WerKoll_05_02"); //Graveyarn hat mir ausrichten lassen, dass Koll dich zu einem Zweikampf auffordert. Stelle dich seiner Herausforderung. Koll wartet auf dich in der Arena. Es gilt freie Waffenwahl. Ein Schiedsmann wird dort sein und mir berichten wer von euch beiden den Sieg heimtr�gt.

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
	AI_Output (self, other, "DIA_DIC_Baltar_KenneKoll_05_01"); //Graveyarn hat mir ausrichten lassen, dass Koll dich zu einem Zweikampf auffordert. Stelle dich seiner Herausforderung. Koll wartet auf dich in der Arena. Es gilt freie Waffenwahl. Ein Schiedsmann wird dort sein und mir berichten wer von euch beiden den Sieg heimtr�gt.

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
	AI_Output (self, other, "DIA_DIC_Baltar_Gewonnen_05_01"); //Gut, du hast gewonnen. Ich habe es nicht anders erwartet. Und jetzt geh zur�ck ins Lager und warte bis ich dich durch Graveyarn rufen lasse.
	
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
	AI_Output (self, other, "DIA_DIC_Baltar_Verloren_05_01"); //Das Koll der bessere K�mpfer ist, h�tte ich nicht erwartet. Geh jetzt Ardaric. 
	
	B_LogEntry (BerengarQuests, "Berengar war ziemlich entt�uscht, dass ich gegen Koll verloren habe.");
	Log_SetTopicStatus (BerengarQuests, LOG_FAILED);
	};
	
//----------- einen Auftrag �bernimmst ------------
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
	AI_Output (self, other, "DIA_DIC_Baltar_AuftragA_05_01"); //Du hattest es nicht immer leicht. Die ersten Pr�fungen hast du bestanden, und damit gezeigt, wie ernst es dir ist in meine Dienste zu treten. Ich hoffe, du wirst meine Erwartungen nicht entt�uschen und auch die anstehenden Aufgaben bew�ltigen. 
	//AI_Output (self, other, "DIA_DIC_Baltar_Uebernehmen_05_00"); //So, Ardaric. Nun ist es an der Zeit, das du f�r mich einen Auftrag �bernimmst,  dessen Wichtigkeit nicht zu �bersch�tzen ist.
	
	Log_CreateTopic (BerengarJob,  LOG_MISSION);
	Log_SetTopicStatus (BerengarJob, LOG_RUNNING);
	B_LogEntry (BerengarJob, "Ich soll von Berengar eine wichtige Aufgabe �bernehmen. Was das wohl sein mag?");
	
	Info_AddChoice(DIA_DIC_Baltar_Uebernehmen, "Was ist zu tun?", DIA_DIC_Berengar_Tun);
	Info_AddChoice(DIA_DIC_Baltar_Uebernehmen, "Werdet ihr mich begleiten?", DIA_DIC_Berengar_Begleiten);
	};
	
func void DIA_DIC_Berengar_Tun ()
	{
	AI_Output (other, self, "DIA_DIC_Berengar_Tun_15_00"); //Was ist zu tun?
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_01"); //Ich erz�hlte dir bereits von den Triramar Amuletten. Eines davon ist jetzt in einer Mine gefunden worden.
	AI_Output (other, self, "DIA_DIC_Berengar_Tun_15_02"); //Soll ich das gefundene Amulett abholen, und sicher zu euch bringen?
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_03"); //So einfach ist es nicht. Das Amulett ist von Modares gefunden worden. Einen S�ldner den ich vor zwei Jahren anheuerte. Doch seine Untreue hat sich erst jetzt gezeigt. 
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_04"); //Modares hat einige der Minenarbeiter aufgewiegelt und will mit dem Asan Amulett Etain verlassen. Nat�rlich haben die M�nner die treu zu mir stehen die Mine verbarrikadiert. 
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_05"); //Doch ich bef�rchte das Modares einen unerforschten Stollen findet und so aus der Mine fliehen kann.
	AI_Output (other, self, "DIA_DIC_Berengar_Tun_15_06"); //Dann werde ich versuchen Modares das Amulett abzunehmen.
	AI_Output (self, other, "DIA_DIC_Berengar_Tun_05_07"); //Gut. Gehe zu Graveyarn, er f�hrt dich zur Mine. Er leitet die S�ldnereinheit die gegen Modares vorgehen.
	
	B_LogEntry (BerengarJob, "Ich soll zur Mine und dem S�ldner Modares ein Triramar Amulette abnehmen. Graveyarn wird mich zur Mine f�hren.");
	
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
	AI_Output (other, self, "DIA_DIC_Berengar_Begleiten_15_00"); //Darf ich mir die Frage erlauben? Werdet ihr mich begleiten? Denn eine so wichtige Aufgabe erfordert doch sicher die Aufmerksamkeit des gr��ten K�mpfers in diesem Land.
	AI_Output (self, other, "DIA_DIC_Berengar_Begleiten_05_01"); //Magische Arbeit die langwierig und nur mit h�chster Aufmerksamkeit bew�ltigt werden kann, zwingt mich hier im Turm zu bleiben.	
	
	B_LogEntry (BerengarJob, "Berengar wird mich nicht begleiten.");
	};