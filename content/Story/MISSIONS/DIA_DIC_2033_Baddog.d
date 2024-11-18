//------------ ENDE -----------------
instance DIA_DIC_Baddog_Exit (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 999;
	condition = DIA_DIC_Baddog_Exit_Condition;
	information = DIA_DIC_Baddog_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Baddog_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Baddog_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ---------- Hey ------------
instance DIA_DIC_Baddog_Hey (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 1;
	condition = DIA_DIC_Baddog_Hey_Condition;
	information = DIA_DIC_Baddog_Hey_Info;
	permanent = 0;
	important = 0;
	description = "Hey!";
	};

func int DIA_DIC_Baddog_Hey_Condition ()
	{
	if (!Npc_KnowsInfo(other, DIA_DIC_Baddog_Dieb))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Hey_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Hey_15_00"); //Hey!
	AI_Output (self, other, "DIA_DIC_Baddog_Hey_07_01"); //Verschwinde, Grünschnabel.
	AI_StopProcessInfos (self);
	};

// --------- Dieb ----------
instance DIA_DIC_Baddog_Dieb (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 2;
	condition = DIA_DIC_Baddog_Dieb_Condition;
	information = DIA_DIC_Baddog_Dieb_Info;
	permanent = 0;
	important = 0;
	description = "Du bist der Dieb!";
	};

func int DIA_DIC_Baddog_Dieb_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_StatueHolen))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Dieb_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Dieb_15_00"); //Du bist der Dieb!
	AI_Output (self, other, "DIA_DIC_Baddog_Dieb_07_01"); //Was? Wer bist du überhaupt?
	AI_Output (other, self, "DIA_DIC_Baddog_Dieb_15_02"); //Das kann dir im Moment ziemlich egal sein! Du bist derjenige, der die Statue geklaut hat! Oder etwa nicht?
	AI_Output (self, other, "DIA_DIC_Baddog_Dieb_07_03"); //Statue? Welche Statue?
	};

// --------- Du weist genau wovon ich rede! ----------
instance DIA_DIC_Baddog_Genau (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 3;
	condition = DIA_DIC_Baddog_Genau_Condition;
	information = DIA_DIC_Baddog_Genau_Info;
	permanent = 0;
	important = 0;
	description = "Du weist genau wovon ich rede!";
	};

func int DIA_DIC_Baddog_Genau_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Dieb))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Genau_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Genau_15_00"); //Du weist genau, wovon ich rede!
	AI_Output (self, other, "DIA_DIC_Baddog_Genau_07_01"); //Verdammt, Mann! Ich konnte nicht anders!

	B_LogEntry (BaddogHilfe, "Baddog hat zugegeben, dass er die Statue gestohlen hat.");
	};

// --------- Verwechseln ----------
instance DIA_DIC_Baddog_Verwechseln (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 4;
	condition = DIA_DIC_Baddog_Verwechseln_Condition;
	information = DIA_DIC_Baddog_Verwechseln_Info;
	permanent = 0;
	important = 0;
	description = "Oh, dann muss ich dich wohl mit jemanden verwechseln!";
	};

func int DIA_DIC_Baddog_Verwechseln_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Dieb) && !(Npc_KnowsInfo(other, DIA_DIC_Baddog_Genau)))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Verwechseln_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Verwechseln_15_00"); //Oh, dann muss ich dich wohl mit jemanden verwechseln! 
	AI_StopProcessInfos (self);
	};

// --------- Gib mir den Drachen oder stirb ----------
instance DIA_DIC_Baddog_Drachen (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 5;
	condition = DIA_DIC_Baddog_Drachen_Condition;
	information = DIA_DIC_Baddog_Drachen_Info;
	permanent = 0;
	important = 0;
	description = "Mir egal! Gib mir den Drachen oder stirb!";
	};

func int DIA_DIC_Baddog_Drachen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Genau) && !(Npc_KnowsInfo(other, DIA_DIC_Baddog_Warum)))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Drachen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Drachen_15_00"); //Mir egal! Gib mir den Drachen oder stirb!
	AI_StopProcessInfos (self);
	
	B_LogEntry (BaddogHilfe, "Ich muss Baddog töten, um die Statue zu bekommen.");
	
	Npc_SetTarget (self, hero);
	AI_Attack(self);
	};


// --------- Warum hast du sie geklaut?  ----------
instance DIA_DIC_Baddog_Warum (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 6;
	condition = DIA_DIC_Baddog_Warum_Condition;
	information = DIA_DIC_Baddog_Warum_Info;
	permanent = 0;
	important = 0;
	description = "Warum hast du sie geklaut?";
	};

func int DIA_DIC_Baddog_Warum_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Genau) && !(Npc_KnowsInfo(other, DIA_DIC_Baddog_Drachen)))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Warum_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Warum_15_00"); //Warum hast du sie geklaut?
	AI_Output (self, other, "DIA_DIC_Baddog_Warum_07_01"); //Die Statue ist ein magisches Artefakt. Mit ihr hoffte ich die Wunden meines Hundes Wala heilen zu können.

	B_LogEntry (BaddogHilfe, "Es scheint so, als ob Baddog die Statue stahl, um seinem Hund zu helfen.");
	};

// -------- Was weißt du über die Statue? ------------
instance DIA_DIC_Baddog_Statue (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 7;
	condition = DIA_DIC_Baddog_Statue_Condition;
	information = DIA_DIC_Baddog_Statue_Info;
	permanent = 0;
	important = 0;
	description = "Was weißt du über die Statue?";
	};

func int DIA_DIC_Baddog_Statue_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Baddog_Warum) && !(Npc_KnowsInfo(other, DIA_DIC_Baddog_Ausfluechte)))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Statue_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Statue_15_00"); //Was weißt du über die Statue?
	AI_Output (self, other, "DIA_DIC_Baddog_Statue_07_01"); //Als ich hierher kam, suchte ich Unterschlupf in einer verlassenen Waldhütte. Dort fand ich ein altes Buch. Eine Zeichnung darin zeigte einen Drachen aus blauem Stein. Es hieß, er besäße magische Kräfte. Dann fand ich eine Karte. Scheinbar wurde die Statue vergraben, und in der Karte war genau eingezeichnet, wo ich den Drachen finden konnte. 
	AI_Output (self, other, "DIA_DIC_Baddog_Statue_07_02"); //Als ich die besagte Stelle aufsuchte, lungerte dort eine Gruppe von Söldnern. Aber aufgeben wollte ich nicht, und ersann einen Plan: Als Steinmetz war es ein Leichtes für mich, eine Statue in Form eines Drachen zu bauen.  Als sie fertiggestellt war, beobachtete ich das Lager so lange, bis an einem Abend die Wachen schliefen. Da schlug ich zu und tauschte die Drachen aus. 
	AI_Output (self, other, "DIA_DIC_Baddog_Statue_07_03"); //Aber auf meiner Flucht war ich zu hastig, ein Bogenschütze hörte und verwundete mich! Und zu allem Unglück habe ich herausgefunden, dass ich es nicht vermag, den Zauber des Drachens zu nutzen. Viel Hoffnung habe ich nicht mehr, wahrscheinlich wird der Boden, auf dem ich jetzt stehe, auch der Platz sein, an dem ich zugrunde gehe.
	};

// -------- Mir reichen deine Ausflüchte! ------------
instance DIA_DIC_Baddog_Ausfluechte (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 8;
	condition = DIA_DIC_Baddog_Ausfluechte_Condition;
	information = DIA_DIC_Baddog_Ausfluechte_Info;
	permanent = 0;
	important = 0;
	description = "Mir reichen deine Ausflüchte.";
	};

func int DIA_DIC_Baddog_Ausfluechte_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Baddog_Warum) && !Npc_KnowsInfo(other, DIA_DIC_Baddog_Helfen)
		&& !Npc_KnowsInfo(other, DIA_DIC_Baddog_Kraefte) && !Npc_KnowsInfo(other, DIA_DIC_Baddog_Hund))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Ausfluechte_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Ausfluechte_15_00"); //Mir reichen deine Mitleidsgeschichten!

	B_LogEntry (BaddogHilfe, "Ich muss Baddog töten, um die Statue zu bekommen.");
	
	AI_StopProcessInfos (self);
	Npc_SetTarget (self, hero);
	AI_Attack(self);
	};

// -------- Welche magischen Kräfte besitzt die Statue? ------------
instance DIA_DIC_Baddog_Kraefte (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 9;
	condition = DIA_DIC_Baddog_Kraefte_Condition;
	information = DIA_DIC_Baddog_Kraefte_Info;
	permanent = 0;
	important = 0;
	description = "Welche magischen Kräfte besitzt die Statue?";
	};

func int DIA_DIC_Baddog_Kraefte_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Baddog_Warum) && !Npc_KnowsInfo(other, DIA_DIC_Baddog_Ausfluechte))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Kraefte_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Kraefte_15_00"); //Welche magischen Kräfte besitzt die Statue?
	AI_Output (self, other, "DIA_DIC_Baddog_Kraefte_07_01"); //Mit der Statue kann man einen Heil-Zauber sprechen.

	B_LogEntry (BaddogHilfe, "Langsam kommen wir der Sache näher. Mit der Statue soll ein Heilzauber möglich sein.");
	};

// -------- Du setzt dein Leben aufs Spiel für einen Hund? ------------
instance DIA_DIC_Baddog_Hund (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 10;
	condition = DIA_DIC_Baddog_Hund_Condition;
	information = DIA_DIC_Baddog_Hund_Info;
	permanent = 0;
	important = 0;
	description = "Du setzt dein Leben aufs Spiel für einen Hund?";
	};

func int DIA_DIC_Baddog_Hund_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Baddog_Warum) && !Npc_KnowsInfo(other, DIA_DIC_Baddog_Ausfluechte))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Hund_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Hund_15_00"); //Du setzt dein Leben aufs Spiel für einen Hund? Was bist du für ein Dummkopf!
	AI_Output (self, other, "DIA_DIC_Baddog_Hund_07_01"); //Wenn dir mal ein Tier das Leben rettest, wirst du anders darüber denken.
	};

// ------------- Wie bist du hierher gekommen? ---------------
instance DIA_DIC_Baddog_Hierher (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 11;
	condition = DIA_DIC_Baddog_Hierher_Condition;
	information = DIA_DIC_Baddog_Hierher_Info;
	permanent = 0;
	important = 0;
	description = "Wie bist du hierher gekommen?";
	};

func int DIA_DIC_Baddog_Hierher_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Statue)	&& Npc_KnowsInfo(other, DIA_DIC_Baddog_Kraefte)
		&& Npc_KnowsInfo(other, DIA_DIC_Baddog_Hund) && !Npc_KnowsInfo(other, DIA_DIC_Baddog_Reichen))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Hierher_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Hierher_15_00"); //Wie bist du hierher gekommen?
	AI_Output (self, other, "DIA_DIC_Baddog_Hierher_07_01"); //Aus meinem Heimatland musste ich fliehen. Kein Ort schien mir sicherer als dieser hier. Mein Name ist Baddog, von Beruf bin ich Steinmetz. Der Grund für meine Flucht war der Herzog Rhima: Ein Strohkopf, den man nicht alle Tage trifft. Von ihm bekam ich den Auftrag, eine Statue von seiner Frau anzufertigen. 
	AI_Output (self, other, "DIA_DIC_Baddog_Hierher_07_02"); //Doch nach Fertigstellung des Kunstwerks, hielt Rhima meinen Lohn zurück! Aus Wut zerschlug ich die Statue und floh! Ich dachte, Etain, dieses herrenlose Gebiet wäre genau das richtige für mich. Hierhin würde mir niemand folgen. Mein Hund Walla und ich haben im Wald dann die leere Hütte gefunden.
	};

// ------------ Warum überlässt du dem Hund nicht einfach seinem Schicksal? ----------
instance DIA_DIC_Baddog_Schicksal (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 12;
	condition = DIA_DIC_Baddog_Schicksal_Condition;
	information = DIA_DIC_Baddog_Schicksal_Info;
	permanent = 0;
	important = 0;
	description = "Warum überlässt du dem Hund nicht einfach seinem Schicksal?";
	};

func int DIA_DIC_Baddog_Schicksal_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Statue)	&& Npc_KnowsInfo(other, DIA_DIC_Baddog_Kraefte)
		&& Npc_KnowsInfo(other, DIA_DIC_Baddog_Hund) && !Npc_KnowsInfo(other, DIA_DIC_Baddog_Reichen))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Schicksal_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Schicksal_15_00"); //Warum überlässt du dem Hund nicht einfach seinem Schicksal?
	AI_Output (self, other, "DIA_DIC_Baddog_Schicksal_07_01"); //Das kann ich nicht. Zudem habe ich keine Zeit für Erklärungen. Für Walla zählt jetzt jede Minute. 
	};

// ------------ Mir reichen deine Ausflüchte. ----------
instance DIA_DIC_Baddog_Reichen (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 13;
	condition = DIA_DIC_Baddog_Reichen_Condition;
	information = DIA_DIC_Baddog_Reichen_Info;
	permanent = 0;
	important = 0;
	description = "Mir reichen deine Ausflüchte.";
	};

func int DIA_DIC_Baddog_Reichen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Statue)	&& Npc_KnowsInfo(other, DIA_DIC_Baddog_Kraefte)
		&& Npc_KnowsInfo(other, DIA_DIC_Baddog_Hund) && Npc_KnowsInfo(other, DIA_DIC_Baddog_Hierher)
		&& !Npc_KnowsInfo(other, DIA_DIC_Baddog_Schicksal))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Reichen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Reichen_15_00"); //Mir reichen deine Ausflüchte.

	B_LogEntry (BaddogHilfe, "Ich muss Baddog töten, um die Statue zu bekommen.");
	
	AI_StopProcessInfos (self);
	Npc_SetTarget (self, hero);
	AI_Attack(self);
	};

// -------------- Mach mir nichts vor. --------------
instance DIA_DIC_Baddog_Vormachen (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 14;
	condition = DIA_DIC_Baddog_Vormachen_Condition;
	information = DIA_DIC_Baddog_Vormachen_Info;
	permanent = 0;
	important = 0;
	description = "Mach mir nichts vor.";
	};

func int DIA_DIC_Baddog_Vormachen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Hierher) && Npc_KnowsInfo(other, DIA_DIC_Baddog_Schicksal)
		&& !Npc_KnowsInfo(other, DIA_DIC_Baddog_Helfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Vormachen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Vormachen_15_00"); //Mach mir nichts vor. Wahrscheinlich wartest du nur darauf, dass ich dir den Rücken zudrehe, und dann zückst du dein Messer! Stirb Dieb! 

	B_LogEntry (BaddogHilfe, "Ich muss Baddog töten, um die Statue zu bekommen.");
	
	AI_StopProcessInfos (self);
	Npc_SetTarget (self, hero);
	AI_Attack(self);
	};

// ------------- Ich kann dir helfen. ----------
instance DIA_DIC_Baddog_Helfen (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 15;
	condition = DIA_DIC_Baddog_Helfen_Condition;
	information = DIA_DIC_Baddog_Helfen_Info;
	permanent = 0;
	important = 0;
	description = "Ich kann dir helfen.";
	};

func int DIA_DIC_Baddog_Helfen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baddog_Hierher) && Npc_KnowsInfo(other, DIA_DIC_Baddog_Schicksal)
		&& !Npc_KnowsInfo(other, DIA_DIC_Baddog_Vormachen))
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Helfen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baddog_Helfen_15_00"); //Ich kann dir helfen. Ich bin magisch begabt und wahrscheinlich kann ich mit der Kraft der Statue deinen Hund heilen. Doch wenn ich dir helfe, musst du mir die Statue überlassen. Sie ist nicht für mich, sondern für meinen Auftraggeber.
	AI_Output (self, other, "DIA_DIC_Baddog_Helfen_07_01"); //Du scheinst eine gute Seele zu haben! Ich brauche die Statue nicht, wenn du Wala heilst, sollst du sie behalten. 
	AI_Output (other, self, "DIA_DIC_Baddog_Helfen_15_02"); //Wo ist die Hütte in der ich deinen Hund finde?
	AI_Output (self, other, "DIA_DIC_Baddog_Helfen_07_03"); //Sie ist hier ganz in der Nähe. Folge mir.
	

	B_GiveInvItems(self, other,Erzdrache,1);
	//AI_GotoNPC (self, Wala);
	Npc_ExchangeRoutine	(self,"WALA");

	B_LogEntry (BaddogHilfe, "Wenn ich Baddog helfe, seinen Hund zu heilen, bekomme ich die Statue.");
	};

/* Durch funktionierenden Gegenstand unnötig geworden (Moe)
// ---------- Hund Wala heilen ------------
instance DIA_DIC_Baddog_WalaHeilen (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 15;
	condition = DIA_DIC_Baddog_WalaHeilen_Condition;
	information = DIA_DIC_Baddog_WalaHeilen_Info;
	permanent = 0;
	important = 0;
	description = "(Hund Heilen)";
	};

func int DIA_DIC_Baddog_WalaHeilen_Condition ()
	{
	if (WalaZustand == 0 && (Npc_GetDistToNpc(self,Wala) < 300) && Npc_HasItems(other, Erzdrache) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_WalaHeilen_Info ()
	{
	CreateInvItem	(self, ItArScrollHeal);
	AI_UseItem (hero, ItArScrollHeal);
	AI_Wait	(self,	2);
	PrintScreen	("Du hast Wala geheilt!", -1,-1,"font_old_20_white.tga",3);
	WalaZustand = 1;
	};
*/

// ------------- Hund geheilt ----------
instance DIA_DIC_Baddog_Geheilt (C_INFO)
	{
	npc = DIC_2033_Baddog;
	nr = 16;
	condition = DIA_DIC_Baddog_Geheilt_Condition;
	information = DIA_DIC_Baddog_Geheilt_Info;
	permanent = 0;
	important = 0;
	description = "Dein Hund ist wieder munter.";
	};

func int DIA_DIC_Baddog_Geheilt_Condition ()
	{
	if (WalaZustand == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Baddog_Geheilt_Info ()
	{
	WalaZustand = 2;
	AI_ContinueRoutine (Wala);
	AI_Output (other, self, "DIA_DIC_Baddog_Geheilt_15_00"); //Dein Hund ist wieder munter.
	AI_Output (self, other, "DIA_DIC_Baddog_Geheilt_07_01"); //Vielen Dank mein Freund! Das Silber und die Felle sind für dich, und der Drache natürlich. Vielleicht sehen wir uns ja einmal wieder, wer weiß das schon? Ich jedenfalls werde Etain verlassen. Mir ist es hier zu gefährlich.

	CreateInvItems	(self, ItMiNugget,250);
	B_GiveInvItems(self, other,ItMiNugget,250);
	//Npc_ExchangeRoutine	(self,"START");
	
	B_GiveXP (750);
	
	Npc_ExchangeRoutine	(self,"GEHEILT");

	B_LogEntry (BaddogHilfe, "Ich habe Baddogs Hund mit Hilfe der Statue geheilt. Baddog war so glücklich, dass er mir gleich noch ein paar Sachen gab, die über unsere Abmachung hinausgehen. Er scheint ganz in Ordnung zu sein.");
	};