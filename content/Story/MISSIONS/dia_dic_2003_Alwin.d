// -------------- Exit --------------
INSTANCE DIA_dic_Alwin_Exit (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 999;
	condition = DIA_dic_Alwin_Exit_Condition;
	information = DIA_dic_Alwin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_dic_Alwin_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_dic_Alwin_Exit_Info()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Alwin_Wappen))
		{
		AI_Output (other, self, "DIA_DIC_Alwin_Exit_15_00"); //Ich hoffe, wir sehen uns wieder!
		AI_Output (self, other, "DIA_DIC_Alwin_Exit_01_01"); //Ja das hoffe ich auch. Und lass dir von niemandem auf der Nase herumtanzen.
		};
	AI_StopProcessInfos	(self);
	};

// ----------------- Hi ---------------------

instance DIA_dic_Alwin_Hallo (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 3;
	condition = DIA_dic_Alwin_Hallo_Condition;
	information = DIA_dic_Alwin_Hallo_Info;
	permanent = 0;
	description = "Graveyarn hat mir einen Auftrag gegeben.";
	};

func int DIA_dic_Alwin_Hallo_Condition()
	{
	if (Npc_KnowsInfo(other, Graveyarn_Anerk) && !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_RepariertJa))
		{
		return 1;
		};
	};

func void DIA_dic_Alwin_Hallo_Info()
	{
	AI_Output (other, self, "DIA_dic_Alwin_15_00"); //Graveyarn hat mir einen ersten Auftrag gegeben. Ich muss meine Loyalität beweisen. 
	AI_Output (other, self, "DIA_dic_Alwin_15_01"); //Wenn ich seine Prüfungen bestehe, werde ich bald für Berengar arbeiten.
	AI_Output (self, other, "DIA_dic_Alwin_01_02"); //Ich hab es mir doch gedacht. Nicht mal einen Jugendlichen verschonen sie. Sei vorsichtig.
	AI_Output (other, self, "DIA_dic_Alwin_15_03"); //Mach dir keine Sorgen, ich soll bis jetzt nur eine kaputte Rampe reparieren.
	AI_Output (self, other, "DIA_dic_Alwin_01_04"); //Ja. Vielleicht jetzt noch... Ich... äh... Ach, vergiss es.
	AI_Output (other, self, "DIA_dic_Alwin_15_05"); //Was ist? Was wolltest du sagen?
	AI_Output (self, other, "DIA_dic_Alwin_01_06"); //Ach, ich dachte, ich kenne jemanden, der dir vielleicht helfen könnte... aber nein. Ausgeschlossen. 
	AI_Output (other, self, "DIA_dic_Alwin_15_07"); //Vielleicht ja doch. Wer ist es?
	AI_Output (self, other, "DIA_dic_Alwin_01_08"); //Taliasan. Ein Magier der Berengars Gunst verloren hat. Er lebt zurückgezogen, verlässt tagsüber seine Baracke so gut wie gar nicht. Und trotzdem soll er noch ein paar üblen Geschäften nachgehen.
	
	Log_CreateTopic (AlwinTaliasanHilfe,  LOG_MISSION);
	Log_SetTopicStatus (AlwinTaliasanHilfe, LOG_RUNNING);
	B_LogEntry (AlwinTaliasanHilfe, "Alwin hat sich versprochen und auf Nachfragen sagte er mir, dass Taliasan, ein Magier, mir vielleicht helfen könnte, die Prüfungen Graveyarns zu bestehen.");
	};

// -------- "Gunst verloren" -------

instance DIA_DIC_Alwin_Gunst (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 4;
	condition = DIA_DIC_Alwin_Gunst_Condition;
	information = DIA_DIC_Alwin_Gunst_Info;
	permanent = 0;
	important = 0;
	description = "Was meinst du mit 'Gunst verloren'?";
	};

func int DIA_DIC_Alwin_Gunst_Condition()
	{
	if (Npc_KnowsInfo(hero, DIA_Dic_Alwin_Hallo) && !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_RepariertJa))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Gunst_Info()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Gunst_15_00"); //Was meinst du mit "Gunst verloren"?
	AI_Output (self, other, "DIA_DIC_Alwin_Gunst_01_01"); //Es ist bekannt, dass der Erzmagier Maldive, der begabtere, größere Magier von beiden ist. 
	AI_Output (self, other, "DIA_DIC_Alwin_Gunst_01_02"); //Doch einige behaupten, dass Taliasan während einer Prüfung seiner Fähigkeiten beraubt wurde, und dass es Maldive war, der nur auf diesem Wege Erzmagier werden konnte.
	};


// ------- üble Geschäfte --------
instance DIA_DIC_Alwin_Geschaefte (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 5;
	condition = DIA_DIC_Alwin_Geschaefte_Condition;
	information = DIA_DIC_Alwin_Geschaefte_Info;
	permanent = 0;
	description = "Was für üble Geschäfte?";
	};

func int DIA_DIC_Alwin_Geschaefte_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_Dic_Alwin_Hallo) && !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_RepariertJa))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Geschaefte_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Geschaefte_15_00"); //Was für üble Geschäfte?
	AI_Output (self, other, "DIA_DIC_Alwin_Geschaefte_01_01"); //Taliasan nutzt sein magisches Wissen um mit Hilfe einiger Kräutern ein starkes Rauschmittel herzustellen. Dieses verkauft er dann unter den Lagerarbeitern.
	};


// ------- Taliasans Hilfe -------
instance DIA_DIC_Alwin_THilfe(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 6;
	condition = DIA_DIC_Alwin_THilfe_Condition;
	information = DIA_DIC_Alwin_THilfe_Info;
	permanent = 0;
	description = "Vielleicht kann er mir helfen...";
	};

func int DIA_DIC_Alwin_THilfe_Condition ()

	{
	if (Npc_KnowsInfo(hero, DIA_Dic_Alwin_Gunst) && Npc_KnowsInfo(hero, DIA_DIC_Alwin_Geschaefte)
		&& !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_RepariertJa))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_THilfe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_THilfe_15_00"); //Wer weiß, vielleicht kann er mir ja doch helfen.
	AI_Output (self, other, "DIA_DIC_Alwin_THilfe_01_01"); //Wenn du ihn fragst, sei auf der Hut. Er ist sehr misstrauisch und wenn er jemanden nicht mag, kann er hinterhältig sein. Du wärst nicht der erste, der es erst merkt, wenn es zu spät ist! 
	
	
	Log_CreateTopic (BekanntePersonen, LOG_MISSION);
	Log_SetTopicStatus (BekanntePersonen, LOG_OBSOLETE);
	B_LogEntry(BekanntePersonen, "Taliasan – Magier der früher für Berengar gearbeitet hatte. Durch einen Trick seines Konkurrenten verlor er seine Stellung.");
	};

// ----- Alwin gibt Jungen Hinweis ------
instance DIA_DIC_Alwin_Hinweis(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 7;
	condition = DIA_DIC_Alwin_Hinweis_Condition;
	information = DIA_DIC_Alwin_Hinweis_Info;
	permanent = 0;
	important = 1;
	description = "(Gerüchte)";
	};

func int DIA_DIC_Alwin_Hinweis_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen) || RampeRepariert == 5)
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Hinweis_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Alwin_Hinweis_01_00"); //Ich muss mit dir sprechen. Einige Gerüchte sind hier im Umlauf. Nach dem, was ich gehört habe, hat einer von den Lagerarbeitern etwas über deinen Vater in Erfahrung gebracht.

	Info_AddChoice(DIA_DIC_Alwin_Hinweis, "Wo ist der Arbeiter?", DIA_DIC_Alwin_Arbeiter);
	Info_AddChoice(DIA_DIC_Alwin_Hinweis, "Was interessiert mich mein Vater.", DIA_DIC_Alwin_Vater);
	DIA_DIC_Alwin_Hinweis.important = 0;
	};

// ---- Arbeiter ----
func void DIA_DIC_Alwin_Arbeiter ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Arbeiter_15_00"); //Wo ist der Arbeiter? Ich werde ihn fragen.
	AI_Output (self, other, "DIA_DIC_Alwin_Arbeiter_01_01"); //Du kennst ihn nicht, und wenn du mit der Tür ins Haus fällst und ihm eine Reihe von Fragen stellst, wird er misstrauisch. Auch wenn er etwas über deinen Vater weiß, wird er es einem Unbekannten nicht sagen.
	AI_Output (other, self, "DIA_DIC_Alwin_Arbeiter_15_02"); //Also, was schlägst du vor? Was soll ich tun?
	AI_Output (self, other, "DIA_DIC_Alwin_Arbeiter_15_03"); //Am besten, du belauschst den Arbeiter. Schleich dich hoch zur Anlieferungsrampe und versuche, so nah wie möglich an ihn ranzukommen. Vielleicht gelingt es dir, ein Gespräch aufzuschnappen. 


	Log_CreateTopic (Vergangenheit,  LOG_MISSION);
	Log_SetTopicStatus (Vergangenheit, LOG_RUNNING);
	B_LogEntry (Vergangenheit, "Alwin rät mir zwei Arbeiter in der Nähe der Anlieferungsrampe zu belauschen. Einer von ihnen weiß etwas über meinen wirklichen Vater. - Am besten abends und ich sollte versuchen, nicht bemerkt zu werden.");

	Info_ClearChoices (DIA_DIC_Alwin_Hinweis);
	B_GiveXP (100);
	};


// --- Vater uninteressant ----
func void DIA_DIC_Alwin_Vater ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Vater_15_00"); //Ja und? Mein Vater ist tot. Was soll mich das interessieren? Berengar wird bald für mich wie ein richtiger Vater sein. 
	AI_Output (self, other, "DIA_DIC_Alwin_Vater_01_01"); //Ich rate dir trotzdem, allem nachzugehen, was dir etwas über deinen Vater sagen kann. Selbst diesen Gerüchten.
	AI_Output (other, self, "DIA_DIC_Alwin_Vater_15_02"); //Ich kann nicht. Ich bin in erster Linie Graveyarns Aufträgen verpflichtet. 

	Info_ClearChoices (DIA_DIC_Alwin_Hinweis);
	};

// ----- Gespräch über Lynn-Rettung ----

INSTANCE DIA_dic_Alwin_Lynn (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 8;
	condition = DIA_dic_Alwin_Lynn_Condition;
	information = DIA_dic_Alwin_Lynn_Info;
	permanent = 0;
	description = "Kannst du mir helfen?";
	};

FUNC int DIA_dic_Alwin_Lynn_Condition()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Raffa_Hallo) && !Npc_KnowsInfo(other, DIA_DIC_Raffa_Lynn))
		{
		return 1;
		};
	};

FUNC VOID DIA_dic_Alwin_Lynn_Info()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Lynn_15_00"); //Kannst du mir helfen? Ich soll für Raffa eine der Frauen aus den Waschhäusern zur Burg bringen.
	AI_Output (self, other, "DIA_DIC_Alwin_Lynn_01_01"); //Da hast du dir was vorgenommen. Die einzigen, die ins Waschhaus dürfen, sind die Wächter. Na ja, hochrangige Magier oder Krieger auch, allerdings werden die besseres zu tun haben, als dort hinzugehen.
	AI_Output (self, other, "DIA_DIC_Alwin_Lynn_01_02"); //Vielleicht hast du ja Glück, und es interessiert niemanden, was du im Waschhaus willst. Aber wie du eine Frau von dort zur Burg bringen willst... das weiß ich nicht
	
	B_LogEntry (RaffasAufgabe, "Alwin sagte, dass Magier und Krieger von den Wächtern an der Waschhüte durchgelassen werden. Ob mir das weiterhilft?");
	};

// ------------- Lurker Problem ----------------
INSTANCE DIA_DIC_Alwin_Lurker (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 9;
	condition = DIA_DIC_Alwin_Lurker_Condition;
	information = DIA_DIC_Alwin_Lurker_Info;
	permanent = 0;
	description = "Hast du was neues?";
	};

func int DIA_DIC_Alwin_Lurker_Condition ()
	{
	if  (NPC_KnowsInfo(hero, DIA_dic_Taliasan_Hallo))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Lurker_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Lurker_15_00"); //Alwin. Gibt's was neues?
	AI_Output (self, other, "DIA_DIC_Alwin_Lurker_01_01"); //Nichts neues, aber etwas ungewöhnliches. Ich habe in der Nähe der Burg einen Lurker brüten sehen. 
	AI_Output (other, self, "DIA_DIC_Alwin_Lurker_15_02"); //Das ist ungewöhnlich?
	AI_Output (self, other, "DIA_DIC_Alwin_Lurker_01_03"); //Aber ja! Nur innerhalb von vier Jahren brüten sie. Du solltest in dieser Zeit einem Lurker lieber nicht zu nahe kommen. Sie pflegen ihre Brut scharf zu bewachen und verteidigen sie bis aufs Blut. 
	AI_Output (other, self, "DIA_DIC_Alwin_Lurker_15_04"); //Werd ich mir merken.
	AI_Output (self, other, "DIA_DIC_Alwin_Lurker_01_05"); //Ich hab mal die Geschichte gehört, dass ein Vogel sich ein Lurkerei geschnappt hat. Zweitausend Fuß vom Brutplatz entfernt, hat die Lurkermutter den Vogel ausfindig gemacht, und sich das noch unversehrte Ei aus dem Nest geholt. Einen außerordentlichen Geruchssinn haben sie. Und von dem diebischen Vogel sind nur noch ein paar Federn übriggeblieben.

	Log_CreateTopic (LurkerWarnung,  LOG_NOTE);
	B_LogEntry (LurkerWarnung, "Alwin hat mich vor einem brütenden Lurker gewarnt. Besser ich meide die Höhlen in der Nähe der Burg.");

	Info_AddChoice (DIA_DIC_Alwin_Lurker, "Woher weißt du das?", DIA_DIC_Alwin_Lurker_Woher);
	Info_AddChoice (DIA_DIC_Alwin_Lurker, "Ich wusste gar nicht, das Lurker Bäume hochklettern können.", DIA_DIC_Alwin_Lurker_Baeume);
	};

func void DIA_DIC_Alwin_Lurker_Woher ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Lurker_Woher_15_00"); //Woher weißt du das?
	AI_Output (self, other, "DIA_DIC_Alwin_Lurker_Woher_01_01"); //Ach man hört sich so um ...
	};

func void DIA_DIC_Alwin_Lurker_Baeume ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Lurker_Baeume_15_00"); //Ich wusste gar nicht, dass Lurker Bäume hochklettern können.
	AI_Output (self, other, "DIA_DIC_Alwin_Lurker_Baeume_01_01"); //Wenn sie ihr Junges verteidigen, würd' es mich auch nicht wundern, wenn sie an senkrechten Felswänden hochklettern. 
	};

// ---------- Wo ist Slade ---------------
instance DIA_DIC_Alwin_Slade(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 10;
	condition = DIA_DIC_Alwin_Slade_Condition;
	information = DIA_DIC_Alwin_Slade_Info;
	permanent = 0;
	important = 0;
	description = "Wo ist Slade?";
	};

func int DIA_DIC_Alwin_Slade_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen) && !Npc_KnowsInfo(other, DIA_DIC_Slade_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Slade_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Slade_15_00"); //Weißt du, wo ich Slade finde?
	AI_Output (self, other, "DIA_DIC_Alwin_Slade_01_01"); //Nein. Er ist selten im Lager. Berengar schickt ihn in andere Länder, doch was er da tut, darüber weiß man nichts. Du hast aber Glück. Seit einer Woche soll er wieder hier sein. 
	};

// ----------- Mehr über Taliasan -----------
instance DIA_DIC_Alwin_TDetails(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 11;
	condition = DIA_DIC_Alwin_TDetails_Condition;
	information = DIA_DIC_Alwin_TDetails_Info;
	permanent = 0;
	important = 0;
	description = "Was weißt du noch über Taliasan?";
	};

func int DIA_DIC_Alwin_TDetails_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Taliasan_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_TDetails_Info ()
	{
	AI_Output (other, self, "DIA_DIC_TDetails_15_00"); //Was weißt du noch über Taliasan?
	AI_Output (self, other, "DIA_DIC_TDetails_01_01"); //Hab ich dir das nicht schon erzählt? Er soll dunkle Geschäfte betreiben. Er verändert die Wirkung von Kräuterpflanzen. Diese verkauft er, oder kocht aus ihnen einen Sud, den er in Flaschen abfüllt. Wenn sie nicht giftig wirken, führen seine Mittel zu starken Rauschzuständen! Es gibt hier irgendwo eine Gruppe von Leuten, die ihm seine Ware abnehmen. Aber Taliasan bietet nicht immer was an, das macht er nach Lust und Laune. 
	
	B_LogEntry (SladeQuest, "Ich habe von Alwin erfahren, dass Taliasan keine weiße Weste hat. Vielleicht hilft mir das weiter mit Slade.");
	};
// -------- Was weißt du über Slade ---------
instance DIA_DIC_Alwin_SDetails(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 12;
	condition = DIA_DIC_Alwin_SDetails_Condition;
	information = DIA_DIC_Alwin_SDetails_Info;
	permanent = 0;
	important = 0;
	description = "Was weißt du über Slade?";
	};

func int DIA_DIC_Alwin_SDetails_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Taliasan_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_SDetails_Info ()
	{
	AI_Output (other, self, "DIA_DIC_SDetails_15_00"); //Was weißt du über Slade?
	AI_Output (self, other, "DIA_DIC_SDetails_01_01"); //Er ist ein Halunke und Gauner. Nur für Berengar spart er sich seine Treue auf. Mit allen anderen führt er höchstens noch Geschäfte.
	};

// -------- Rhetorik Quest ----------
instance DIA_DIC_Alwin_Rhetorik(C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 13;
	condition = DIA_DIC_Alwin_Rhetorik_Condition;
	information = DIA_DIC_Alwin_Rhetorik_Info;
	permanent = 0;
	important = 0;
	description = "Wie kann ich mich besser ausdrücken?";
	};

func int DIA_DIC_Alwin_Rhetorik_Condition ()
	{
	if (Npc_KnowsInfo ( other, DIA_dic_Taliasan_Annehmen) || Npc_KnowsInfo (other, DIA_dic_Alwin_GraveRhet))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Rhetorik_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Rhetorik_15_00"); //Sag mal Alwin, kannst du mir helfen, meine Redegewandtheit zu verbessern? 
	AI_Output (self, other, "DIA_DIC_Rhetorik_01_01"); //Ich hatte mal ein Rhetorikbuch. Aber das ist längst wieder in der Bibliothek, bei Fiebeler. 
	AI_Output (other, self, "DIA_DIC_Rhetorik_15_02"); //Kannst du es nicht holen?
	AI_Output (self, other, "DIA_DIC_Rhetorik_01_03"); //Das geht nicht. Fiebeler will zur Zeit nichts mit mir zu tun haben... das ist eine andere Geschichte.
	AI_Output (other, self, "DIA_DIC_Rhetorik_15_04"); //Aber wenn ich das Buch beschaffe, hilfst du mir, oder?
	AI_Output (self, other, "DIA_DIC_Rhetorik_01_05"); //Sicher. Aber Fiebeler, das ist ein Sonderling, der rückt das Buch nicht so schnell raus.
	
	Log_CreateTopic (RhetorikQuest,  LOG_MISSION);
	Log_SetTopicStatus (RhetorikQuest, LOG_RUNNING);
	B_LogEntry (RhetorikQuest, "Alwin wollte mich lehren, redegewandter zu werden. Allerdings braucht er dazu ein Rhetorikbuch, dass Fiebeler haben sollte. Vielleicht kann ich es holen.");
	};

// ----------- Junge bringt Rhetorikbuch ----------
instance DIA_DIC_Alwin_Lernen (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 14;
	condition = DIA_DIC_Alwin_Lernen_Condition;
	information = DIA_DIC_Alwin_Lernen_Info;
	permanent = 0;
	important = 0;
	description = "Hier ist das Buch. Fiebeler hat es mir gegeben.";
	};

func int DIA_DIC_Alwin_Lernen_Condition ()
	{
	if (Npc_HasItems (hero, Rhetorik_Buch) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Lernen_Info ()
	{
	B_GiveInvItems (other, self, Rhetorik_Buch, 1);

	AI_Output (other, self, "DIA_DIC_Alwin_Lernen_15_00"); //Hier ist das Buch. Fiebeler hat es mir gegeben.
	AI_Output (self, other, "DIA_DIC_Alwin_Lernen_01_01"); //Erstaunlich. Der ist sonst viel zu streng um so etwas zu tun. 
	AI_Output (other, self, "DIA_DIC_Alwin_Lernen_15_02"); //Unterweist du mich nun in die Grundregeln der Rhetorik?
	AI_Output (self, other, "DIA_DIC_Alwin_Lernen_01_03"); //Ja. Doch Graveyarn hat mir gerade einen Auftrag erteilt. Wenn du mir 100 Silber besorgst, kann ich jemand anderen damit "überreden", die Arbeit an meiner Stelle zu tun. Dann hätte ich Zeit für dich.
	
	B_LogEntry (RhetorikQuest, "Ich habe Alwin das Rhetorikbuch gebracht. Allerdings kann er mir erst helfen, wenn ich ihm 100 Siler bringe und er damit jemanden beauftragen kann, seine Aufgaben zu übernehmen.");
	
	B_GiveXP (250);
	};

// ----------- Junge bringt Erz ----------
instance DIA_DIC_Alwin_Erz (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 15;
	condition = DIA_DIC_Alwin_Erz_Condition;
	information = DIA_DIC_Alwin_Erz_Info;
	permanent = 0;
	important = 0;
	description = "O.K. Hier ist das Silber.";
	};

func int DIA_DIC_Alwin_Erz_Condition ()
	{
	if (Npc_HasItems (other, ItMiNugget) >= 100 && Npc_KnowsInfo(other, DIA_DIC_Alwin_Lernen))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Erz_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Erz_15_00"); //Hier ist das Silber. 
	AI_Output (self, other, "DIA_DIC_Alwin_Erz_01_01"); //Gut. Also in der Rhetorik musst du 5 Dinge beachten.
	AI_Output (self, other, "DIA_DIC_Alwin_Erz_01_02"); //1. Sprich verständlich. Vereinfache Sachverhalte, die verschachtelt sind !
	AI_Output (self, other, "DIA_DIC_Alwin_Erz_01_03"); //2. Bedenke, dass auch dein Körper spricht. Lass Mimik und Gestik sich natürlich entfalten.
	AI_Output (self, other, "DIA_DIC_Alwin_Erz_01_04"); //3. Passe deine Rede deinem Gesprächspartner an. Bedenke, was der Zuhörer voraussetzt und erwartet. 
	AI_Output (self, other, "DIA_DIC_Alwin_Erz_01_05"); //4.Achte darauf, dass deine Argumente durchdacht sind und einen hohen Gehalt mit sich bringen.
	AI_Output (self, other, "DIA_DIC_Alwin_Erz_01_06"); //5.Ein überzeugender Schlusspunkt kann oftmals den Eindruck über die ganze Rede umkehren.
	AI_Output (other, self, "DIA_DIC_Alwin_Erz_15_07"); //Auf was man alles beim Sprechen achten kann... Ich habe mir alles gemerkt. Vielleicht werde ich aufgrund meiner Aussprache mir jetzt leichter gehör verschaffen können. Danke für deine Hilfe.
	
	B_LogEntry (RhetorikQuest, "Alwin hat mir beigebracht, mich besser auszudrücken.");
	Log_SetTopicStatus (RhetorikQuest, LOG_SUCCESS);
	
	B_GiveXP (150);
	};

// ---------- Kennst du Barem? ----------------
instance DIA_DIC_Alwin_Barem (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 16;
	condition = DIA_DIC_Alwin_Barem_Condition;
	information = DIA_DIC_Alwin_Barem_Info;
	permanent = 0;
	important = 1;
	description = "Hast du den Alten gesehen?";
	};

func int DIA_DIC_Alwin_Barem_Condition ()
	{
	if (Npc_KnowsInfo (other, Graveyarn_Anerk))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Barem_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Alwin_Barem_01_00"); //Hast du zufällig diesen merkwürdigen Alten außerhalb des Lagers gesehen?
	if (BaremInfo >= 1)
		{
		AI_Output (other, self, "DIA_DIC_Alwin_Barem_15_01"); //Ich habe ihn getroffen. Ich glaube, er ist ein Wanderer. Sein Name ist Barem. Er ist friedlich und scheint starke Zauberkräfte zu besitzen.
		AI_Output (self, other, "DIA_DIC_Alwin_Barem_01_02"); //Klingt nach einem außerordentlichen Charakter. Bei nächster Gelegenheit werde ich nach ihm suchen. 
		B_LogEntry (BaremQuest, "Alwin hat mir von einem Fremden erzählt, der alleine in der Wildnis lebt. Ich glaube er meint Barem.");
		}
	else
		{
		AI_Output (other, self, "DIA_DIC_Alwin_Barem_15_03"); //Da draußen ist es sehr gefährlich. Viel bin ich noch nicht rumgekommen
		AI_Output (self, other, "DIA_DIC_Alwin_Barem_01_04"); //Ist vielleicht auch besser so. Aber falls dir dieser Alte mal über den Weg läuft, sprich mal mit ihm.  Es würde mich sehr interessieren wer er ist.
		
		Log_CreateTopic (BaremQuest,  LOG_MISSION);
		Log_SetTopicStatus (BaremQuest, LOG_RUNNING);
		B_LogEntry (BaremQuest, "Alwin hat mir von einem Fremden erzählt, der alleine in der Wildnis lebt. Wenn ich Zeit habe, werde ich ihn besuchen gehen.");
		};
	};

// ----------- Horn Quest -----------
instance DIA_DIC_Alwin_Horn (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 1;
	condition = DIA_DIC_Alwin_Horn_Condition;
	information = DIA_DIC_Alwin_Horn_Info;
	permanent = 0;
	important = 1;
	description = "Hey, du suchst doch ständig nach Arbeit?";
	};

func int DIA_DIC_Alwin_Horn_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Alwin_Horn_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Alwin_Horn_01_00"); //Hey, du suchst doch ständig nach Arbeit? Ich habe vielleicht etwas für dich.
	AI_Output (other, self, "DIA_DIC_Alwin_Horn_15_01"); //Was denn?
	AI_Output (self, other, "DIA_DIC_Alwin_Horn_01_02"); //Karmakk sucht ein spezielles Horn, mit dem man Scavenger herbeirufen kann. Wenn du es ihm beschaffst, wird er sich sicherlich erkenntlich zeigen.

	if !Npc_KnowsInfo (other,Info_Sld_Alwin_Tauch)
	{
		Npc_ExchangeRoutine(self, "HAUS");
	};
	Npc_ExchangeRoutine(DIC_2028_Barem, "BAUM");
	AI_ContinueRoutine	(DIC_2028_Barem);
	Wld_RemoveItem (ScavHorn);
	if !Npc_HasItems(hero,ScavHorn) >= 1
	&& 	!Npc_HasItems(Schmied,ScavHorn) >= 1
	&& 	!Npc_HasItems(DIC_2028_Barem,ScavHorn) >= 1		// sicherheitshalber! -Harri
	{
		CreateInvItem	(DIC_2028_Barem, ScavHorn);
	};	
	
	Log_CreateTopic (KarmakkHorn,  LOG_MISSION);
	Log_SetTopicStatus (KarmakkHorn, LOG_RUNNING);
	B_LogEntry (KarmakkHorn, "Karmakk sucht nach einem Horn, das Scavenger rufen kann.");
	};

// Alex Scripte
// ******************************************************************
//							Bericht über Vorfall
// ******************************************************************

INSTANCE Alwin_Vorfall(C_INFO)
{
	npc			= DIC_2003_Alwin;
	nr			= 2;
	condition	= Alwin_Vorfall_Condition;
	information	= Alwin_Vorfall_Info;
	permanent	= 0;
	important   = 0;
	description = "Zwei Söldner haben versucht, mich zu töten!";
};

FUNC INT Alwin_Vorfall_Condition()
{
	return TRUE;

};

FUNC VOID Alwin_Vorfall_Info()
{
	AI_Output (other,self,"Alwin_Vorfall_Info_15_00"); //Hey Alwin. 
	AI_Output (self,other,"Alwin_Vorfall_Info_01_01"); //Was ist los?
	AI_Output (other,self,"Alwin_Vorfall_Info_15_02"); //Heute habe ich zwei Söldnern bei ihrer Suche nach dem Ocorel-Habicht geholfen. Plötzlich tauchte ein Wolfsrudel auf. Die Söldner sind sofort weg. Ich befürchte, das war eine Falle.
	AI_Output (self,other,"Alwin_Vorfall_Info_01_03"); //Die meisten hier sind nur Berengar treu. Allem anderen fühlen sie sich zu nichts verpflichtet. 
	AI_Output (other,self,"Alwin_Vorfall_Info_15_04"); //Wollten die mich umbringen? Dann werden sie es doch wieder versuchen...
	AI_Output (self,other,"Alwin_Vorfall_Info_01_05"); //Nein. bestimmt nicht. Die wussten selbst nichts von den Wölfen. 
	AI_Output (self,other,"Alwin_Vorfall_Info_01_06"); //Die wollten nur den Habicht als Trophäe. Aber pass auf, wenn du einen neuen Auftrag bekommst.

	B_LogEntry(BekanntePersonen,"Alwin : freundlich gesinnter Söldner");

};

/*
// ******************************************************************
//							Horn gefunden
// ******************************************************************

INSTANCE Alwin_ScavHorn(C_INFO)
{
	npc			= DIC_2003_Alwin;
	nr			= 2;
	condition	= Alwin_ScavHorn_Condition;
	information	= Alwin_ScavHorn_Info;
	permanent	= 0;
	important   = 0;
	description = "Ich hab ein Horn gefunden...";
};

FUNC INT Alwin_ScavHorn_Condition()
{
	if(Npc_HasItems(other,ScavHorn)>=1)
	{
		return TRUE;
	};

};

FUNC VOID Alwin_ScavHorn_Info()
{
	AI_Output (other,self,"Alwin_ScavHorn_Info_15_00"); //Ich habe ein Horn gefunden.
	AI_Output (self,other,"Alwin_ScavHorn_Info_01_01"); //Das ist wertvoll. Zeig es lieber nicht rum, ansonsten wird es dich überraschen, wie viele Besitzer sich melden. 
	Npc_ExchangeRoutine(DIC_2028_Barem, "BAUM");
	AI_ContinueRoutine	(DIC_2028_Barem);
	Wld_RemoveItem (ScavHorn);
};
*/

// ************************************************************
// 							MISSION2.1 (Tauchgang)
// ************************************************************
INSTANCE Info_Sld_Alwin_Tauch (C_INFO)
{
	npc			= DIC_2003_Alwin;
	nr			= 2;
	condition	= Info_Sld_Alwin_Tauch_Condition;
	information	= Info_Sld_Alwin_Tauch_Info;
	important   = 1;
	permanent	= 0;
	//description = " ";
};

FUNC INT Info_Sld_Alwin_Tauch_Condition()
{
	if(DC_2_Smith == 1 && Npc_GetDistToWP(hero, "SCHMIED_01") >= 750)
	{
		return 1;
	};
};

FUNC VOID Info_Sld_Alwin_Tauch_Info()
{
	AI_Output (self,other,"Info_Sld_Alwin_Tauch_01_00"); //Ardaric. Hast du Zeit?
	Info_ClearChoices(Info_Sld_Alwin_Tauch);
	Info_AddChoice(Info_Sld_Alwin_Tauch,"Ja...",Info_Sld_Alwin_Tauch_Yes);
	Info_AddChoice(Info_Sld_Alwin_Tauch,"Nein...",Info_Sld_Alwin_Tauch_No);

};

FUNC VOID Info_Sld_Alwin_Tauch_Yes()
{
	AI_Output (other,self,"Info_Sld_Alwin_Tauch_Yes_15_00"); //Ich muss zwar noch was erledigen, aber das kann ich auch später machen.
	//AI_Output (self,other,"Info_Sld_Alwin_Tauch_Yes_01_01"); //Gut. Ich suche nämlich gerade nach einer seltenen Pflanze. Hornkraut. Ich könnte etwas Hilfe gebrauchen. Es wird nicht gefährlich.
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_14"); //Wie gesagt, es soll hier eine seltene Unterwasserpflanze geben - das Hornkraut. Richtig verarbeitet erwirkt sie Schutz vor Krankheiten, und eine starke Heilwirkung bei schweren Wunden.
	AI_Output (other,self,"Info_Sld_Alwin_Tauch_Yes_15_02"); //Klar! Ich bin dabei.
	AI_Output (self,other,"Info_Sld_Alwin_Tauch_Yes_01_03"); //Komm mit, hier gehts lang...
	
	Log_CreateTopic (NL_TAUCHGANG,LOG_MISSION);
	Log_SetTopicStatus(NL_TAUCHGANG, LOG_RUNNING);
	B_LogEntry (NL_TAUCHGANG, "Alwin, mein wahrscheinlich einziger Freund, sucht nach einer seltenen Wasserpflanze. Obwohl ich für Albros den Schmied noch eine Truhe holen soll werde ich Alwin helfen. Immerhin geht nichts über gute Freundschaft!");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Info_ClearChoices(Info_Sld_Alwin_Tauch);
	Npc_ExchangeRoutine(self,"GUIDETAUCH");
	AI_StopProcessInfos(self);
};

FUNC VOID Info_Sld_Alwin_Tauch_No()
{
	AI_Output (other,self,"Info_Sld_Alwin_Tauch_No_15_00"); //Nein. Ich bin beschäftigt. Ich muss was für den Schmied erledigen.
	AI_Output (self,other,"Info_Sld_Alwin_Tauch_No_01_01"); //Hast du wirklich keine Lust? Es dauert nicht lange....
	
};



// ************************************************************
// 							Ist angekommen
// ************************************************************
INSTANCE Info_Sld_Alwin_TauchDa (C_INFO)
{
	npc			= DIC_2003_Alwin;

	nr			= 1;
	condition	= Info_Sld_Alwin_TauchDa_Condition;
	information	= Info_Sld_Alwin_TauchDa_Info;
	important   = 1;
	permanent	= 0;
	description = " "; // egal, wird eh sofort angezeigt!
};

FUNC INT Info_Sld_Alwin_TauchDa_Condition()
{
	if(Npc_GetDistToWP(self,"SEE_UB_26")<500)
	{
		return 1;
	};
};

FUNC VOID Info_Sld_Alwin_TauchDa_Info()
{
	Alwin_count = 0;  //init hier weil bringts....
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_00"); //Seit wann ziehst du schon mit Berengar und seiner Truppe durch die Länder?
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_01"); //Es sind jetzt fünf Jahre.
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_02"); //Ich arbeite nur wegen des Silbers für Berengar. Dir bedeutet es etwas mehr hier zu sein... oder?
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_03"); //Ja das stimmt.
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_04"); //Ich hab gehört, Berengar hat dir dein Leben gerettet.
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_05"); //Wäre er nicht gewesen, dann wäre ich von den Soldaten des Königs getötet worden. 
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_06"); //Verstehe.
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_07"); //Wie hast du Berengar kennen gelernt?
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_08"); //Er hat in einer Stadt - weit entfernt von hier - Söldner angeworben. Und da seine Bezahlung gut war, entschloss ich mich, für ihn zu arbeiten. Das liegt jetzt etwa ein Jahr zurück. Allerdings weiß ich bis heute nicht, welche Ziele er genau verfolgt. 
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_09"); //Wieso ?
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_10"); //Er weiht in seine Vorhaben nur diejenigen ein, denen er volles Vertrauen schenkt. Er prüft viele von uns. Ich denke, junger Mann, auch du wirst bald auf die Probe gestellt.
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_11"); //Dann werde ich im Lager wenigstens nicht mehr wie Luft behandelt.
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_12"); //Ja, aber erst wenn du die Prüfungen bestanden hast. 
	AI_Output (other, self, "Info_Sld_Alwin_TauchDa_15_13"); //Was machen wir am See?
	AI_Output (self, other, "Info_Sld_Alwin_TauchDa_01_14"); //Wie gesagt, es soll hier eine seltene Unterwasserpflanze geben - das Hornkraut. Richtig verarbeitet erwirkt sie Schutz vor Krankheiten, und eine starke Heilwirkung bei schweren Wunden.
    Info_ClearChoices(Info_Sld_Alwin_TauchDa);
	Info_AddChoice(Info_Sld_Alwin_TauchDa,"Hast du keine Aufgaben im Lager?",Sld_Alwin_holiday);
	Info_AddChoice(Info_Sld_Alwin_TauchDa,"Warum suchst du eine Unterwasserpflanze?",Sld_Alwin_reason);
};

FUNC VOID Sld_Alwin_holiday()
{
	AI_Output (other,self,"Sld_Alwin_holiday_15_00"); //Merkt niemand von den Wachen, dass du deine Zeit dazu nutzt, nach Pflanzen zu suchen?
	AI_Output (self,other,"Sld_Alwin_holiday_01_01"); //An manchen Tagen gibt es wenig zu tun.
	Alwin_count = Alwin_count + 1;
	if(Alwin_count == 2)
	{
		Info_ClearChoices(Info_Sld_Alwin_TauchDa);
		Info_AddChoice(Info_Sld_Alwin_TauchDa,"Woher kennst du die Pflanze?",Sld_Alwin_Wirkung);
		//Info_AddChoice(Info_Sld_Alwin_TauchDa,"Wieso gehn wir nicht zum Boot?",Sld_Alwin_boat);
	};
};

FUNC VOID Sld_Alwin_reason()
{
	AI_Output (other,self,"Sld_Alwin_reason_15_00"); //Wie bist du darauf gekommen nach einer Unterwasserpflanze zu suchen?
	AI_Output (self,other,"Sld_Alwin_reason_01_01"); //Ich habe in der Nähe der Festung ein kleines Boot entdeckt. Als ich einmal rausgefahren bin, habe ich das Hornkraut auf dem Seeboden wachsen sehen.
	Alwin_count = Alwin_count + 1;
	if(Alwin_count == 2)
	{
		Info_ClearChoices(Info_Sld_Alwin_TauchDa);
		Info_AddChoice(Info_Sld_Alwin_TauchDa,"Woher kennst du die Pflanze?",Sld_Alwin_Wirkung);
		//Info_AddChoice(Info_Sld_Alwin_TauchDa,"Wieso gehn wir nicht zum Boot?",Sld_Alwin_boat);
	};
};

FUNC VOID Sld_Alwin_Wirkung()
{
	AI_Output (other,self,"Sld_Alwin_Wirkung_15_00"); //Und woher weißt du, dass diese Pflanze diese Kräfte hat?
	AI_Output (self,other,"Sld_Alwin_Wirkung_01_01"); //In Parthalan ist eine Bibliothek. Ich hatte einmal das Glück, mich dort umzusehen. Da habe ich in einem Buch über Pflanzen nachgeschlagen, und das Hornkraut wiedererkannt.
};
/*
FUNC VOID Sld_Alwin_boat()
{
	AI_Output (other,self,"Sld_Alwin_boat_15_00"); //Wieso ?gehen wir nicht zu deinem Boot?
	AI_Output (self,other,"Sld_Alwin_boat_01_01"); //Derzeit sind dort ein paar von Berengars Patrouillen.
	AI_Output (other,self,"Sld_Alwin_boat_15_02"); //Kann ich das Boot später auch mal benutzen? 
	AI_Output (self,other,"Sld_Alwin_boat_01_03"); //Ja. Es liegt nördöstlich vom Lager. Aber nun zu unserer Aufgabe. Tauch du zuerst. Such den Grund nach einer grünen, borstigen Pflanze ab - das ist das Hornkraut.
};
*/


// ******************************************************************
//							Suchen an Ufernähe
// ******************************************************************

INSTANCE Alwin_Search_Ufer(C_INFO)
{
	npc			= DIC_2003_Alwin;
	nr			= 1;
	condition	= Alwin_Search_Ufer_Condition;
	information	= Alwin_Search_Ufer_Info;
	permanent	= 0;
	important   = 1;
	//description = "Ich hab ein Horn gefunden...";
};

FUNC INT Alwin_Search_Ufer_Condition()
{
	if(Npc_KnowsInfo(other,Info_Sld_Alwin_TauchDa))
	&&(Alwin_count == 2)
	{
		return TRUE;
	};

};

/* In EventsDiccuric über Scripttrigger und Funktion gerutscht *Moe*
func void SoeldnerTeleportieren()
	{
	AI_Teleport(Sld_61_Remember,"ZUM_REISFELD_16");
	//AI_Wait(Sld_61_Remember, 240);
	Npc_ExchangeRoutine(Sld_61_Remember,"SEE");
	AI_ContinueRoutine	(Sld_61_Remember);
	Npc_SetStateTime (Sld_61_Remember, 0);
	};
*/

FUNC VOID Alwin_Search_Ufer_Info()
{
	AI_Output (self,other,"Alwin_Search_Ufer_Info_01_00"); //Nun zu unserer Aufgabe. Tauch du zuerst! Such den Grund des Sees nach einer grünen, borstigen Pflanze ab - das ist das Hornkraut. Ich werde das Ufer abgehen und zusehen, dass ich ein Exemplar aufspüre.
	AI_Output (other,self,"Alwin_Search_Ufer_Info_15_01"); //Gut, mal schaun, ob ich sie finden kann...

	Npc_ExchangeRoutine(self,"SUCHE");
	//SoeldnerTeleportieren();
	if (!Npc_KnowsInfo(other, Schmied_Gib_Kiste))
		{
		Wld_SendTrigger ("NPCSPAWNTAUCHQUEST");
		};

	B_LogEntry (NL_TAUCHGANG, "Ich werde nun nach der Pflanze für Alwin tauchen. Er sucht inzwischen am Ufer. Mal sehen, wer schneller was findet.");
};

// ------------- Junge findet 1. falsche Pflanze --------------------
instance DIA_DIC_Alwin_FalschePflanzeA (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 1;
	condition = DIA_DIC_Alwin_FalschePflanzeA_Condition;
	information = DIA_DIC_Alwin_FalschePflanzeA_Info;
	permanent = 0;
	important = 0;
	description = "Ist das hier die Pflanze?";
	};

func int DIA_DIC_Alwin_FalschePflanzeA_Condition ()
	{
	if (Npc_HasItems(other, PflanzeAlwinA) >= 1 && !Npc_KnowsInfo(other, DIA_DIC_Alwin_Gefunden)
			&& !Npc_KnowsInfo(other,Sld_Rem_Makeit))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_FalschePflanzeA_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_FalschePflanzeA_15_00"); //Ist das hier die Pflanze?

	B_GiveInvItems(other, self,PflanzeAlwinA,1);

	AI_Output (self, other, "DIA_DIC_Alwin_FalschePflanzeA_01_01"); //Nein.
	AI_Output (other, self, "DIA_DIC_Alwin_FalschePflanzeA_15_03"); //Dann schau ich, ob ich sie vielleicht noch finde. Die hier kam mir auch schon bekannt vor...
	AI_Output (self, other, "DIA_DIC_Alwin_FalschePflanzeA_01_04"); //Danke!
	B_GiveXP (100);
	};

// ------------- Junge findet 2. falsche Pflanze --------------------
instance DIA_DIC_Alwin_FalschePflanzeB (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 2;
	condition = DIA_DIC_Alwin_FalschePflanzeB_Condition;
	information = DIA_DIC_Alwin_FalschePflanzeB_Info;
	permanent = 0;
	important = 0;
	description = "Was sagst du zu dieser Pflanze?";
	};

func int DIA_DIC_Alwin_FalschePflanzeB_Condition ()
	{
	if (Npc_HasItems(other, PflanzeAlwinB) >= 1 && !Npc_KnowsInfo(other, DIA_DIC_Alwin_Gefunden)
			&& !Npc_KnowsInfo(other,Sld_Rem_Makeit))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_FalschePflanzeB_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_FalschePflanzeB_15_00"); //Was sagst du zu dieser Pflanze?
	AI_Output (self, other, "DIA_DIC_Alwin_FalschePflanzeB_01_01"); //Das ist sie auch nicht.
	AI_Output (other, self, "DIA_DIC_Alwin_FalschePflanzeB_15_03"); //Einmal werde ich es noch versuchen. Aber meine Zeit wird knapp. Ich muss danach die Erzkiste holen!
	AI_Output (self, other, "DIA_DIC_Alwin_FalschePflanzeB_01_04"); //Falls ich die Pflanze vor dir finde, gebe ich dir bescheid!

	B_GiveInvItems(other, self,PflanzeAlwinB,1);
	B_GiveXP (100);
	};


// ------------- Junge findet Pflanze --------------------
instance DIA_DIC_Alwin_Gefunden (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 3;
	condition = DIA_DIC_Alwin_Gefunden_Condition;
	information = DIA_DIC_Alwin_Gefunden_Info;
	permanent = 0;
	important = 0;
	description = "Ich glaube, ich habe die Pflanze!";
	};

func int DIA_DIC_Alwin_Gefunden_Condition ()
	{
	if (Npc_HasItems(other, PflanzeAlwinC) >= 1 && !Npc_KnowsInfo(other,Sld_Rem_Makeit))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Gefunden_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Gefunden_15_00"); //Schau mal! Ich glaube, dass ist das Hornkraut!
	AI_Output (self, other, "DIA_DIC_Alwin_Gefunden_01_01"); //JA! Das ist es! Danke!
	AI_Output (self, other, "DIA_DIC_Alwin_Gefunden_01_02"); //Hier, ich habe was für dich! So als kleines Dankeschön. Damit wirst du auch in der Wildnis übernachten können. Mögen wir für immer Freunde bleiben!

	B_GiveInvItems(self,other,DC_Bedroll,1);
	
	if (Npc_KnowsInfo(other, M_Worker_Kiste))
		{
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"HAUS");	
		}
	else
		{
		AI_Output (other, self, "DIA_DIC_Alwin_Gefunden_15_03"); //Ich muss aber jetzt dringend zur Mine...sonst bekomme ich noch Ärger.
		AI_Output (self, other, "DIA_DIC_Alwin_Gefunden_01_04"); //Ich komme mit dir und helfe dir. 
	
		B_GiveInvItems(other, self,PflanzeAlwinC,1);
		AlwinDabei = 1;
		Npc_ExchangeRoutine(self,"FOLGE");
		Npc_ExchangeRoutine(Sld_61_Remember,"START");
		AI_ContinueRoutine	(Sld_61_Remember);
	
		B_LogEntry (NL_TAUCHGANG, "Ich habe die Pflanze gefunden, die Alwin sucht.");
		Log_SetTopicStatus(NL_TAUCHGANG, LOG_SUCCESS);
		B_LogEntry (OM_MISSION1, "Alwin hilft mir, die Kiste bei der Mine abzuholen.");
		B_GiveXP (250);
		};
	};

// ******************************************************************
//							Gespräch nach Anpfiff
// ******************************************************************

INSTANCE Alwin_Anpfiff(C_INFO)
{
	npc			= DIC_2003_Alwin;
	nr			= 1;
	condition	= Alwin_Anpfiff_Condition;
	information	= Alwin_Anpfiff_Info;
	permanent	= 0;
	important   = 1;
	//description = "Verdammt, das die Wache uns an dieser entlegenen Stelle findet, hätte ich nicht gedacht.";
};

FUNC INT Alwin_Anpfiff_Condition()
{
	if(Npc_KnowsInfo(other,Sld_Rem_Makeit))
	//&&(Npc_GetDistToNpc(self,hero)<150)
	{
		return TRUE;
	};

};

FUNC VOID Alwin_Anpfiff_Info()
{
	AI_Output (self,other,"Alwin_Anpfiff_Info_01_00"); //Verdammt, dass die Wache uns hier aufspürt, damit hab ich nicht gerechnet.
	//AI_Output (self,other,"Alwin_Anpfiff_Info_01_01"); //Hier, ich habe was für dich! Damit wirst du auch in der Wildnis übernachten können.
	AI_Output (self, other, "DIA_DIC_Alwin_Gefunden_01_02"); //Hier, ich habe was für dich! So als kleines Dankeschön. Damit wirst du auch in der Wildnis übernachten können. Mögen wir für immer Freunde bleiben!
	B_GiveInvItems(self,other,DC_Bedroll,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"SUCHE");
	
	B_LogEntry (NL_TAUCHGANG, "Ich habe die Pflanze nicht gefunden, die Alwin sucht. Ich wurde stattdessen von einem Söldner erwischt, dass ich hier tauche und nicht meine Aufgaben erledige. Ich gehe also lieber und erledige meine Aufgaben.");
	Log_SetTopicStatus(NL_TAUCHGANG, LOG_FAILED);
};



// --------------- Was weißt du über Graveyarn? ---------------
instance DIA_DIC_Alwin_WasWeisst(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 1;
	condition = DIA_DIC_Alwin_WasWeisst_Condition;
	information = DIA_DIC_Alwin_WasWeisst_Info;
	permanent = 0;
	important = 0;
	description = "Was weißt du über Graveyarn?";
	};

func int DIA_DIC_Alwin_WasWeisst_Condition ()
	{
	if (Npc_KnowsInfo(hero, Alwin_Anpfiff))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_WasWeisst_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_WasWeisst_01_00"); //Was weißt du über Graveyarn?
	AI_Output (self, other, "DIA_DIC_Alwin_WasWeisst_15_01"); //Das, was alle im Lager über ihn wissen. Graveyarn ist die rechte Hand Berengars. Ein harter Knochen. Dass er einen Verräter zur Abschreckung aufgeknüpft hat, hast du ja selbst miterlebt...
	};

// --------------- Ich werde mich besser beeilen. ---------------
instance DIA_DIC_Alwin_Beeilen(C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 2;
	condition = DIA_DIC_Alwin_Beeilen_Condition;
	information = DIA_DIC_Alwin_Beeilen_Info;
	permanent = 0;
	important = 0;
	description = "Ich werde mich besser beeilen.";
	};

func int DIA_DIC_Alwin_Beeilen_Condition ()
	{
	if (Npc_KnowsInfo(hero, Alwin_Anpfiff))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Beeilen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Beeilen_01_00"); //Ich werde mich besser beeilen.
	AI_Output (self, other, "DIA_DIC_Alwin_Gefunden_01_04"); //Ich komme mit und helfe dir.

	Info_AddChoice(DIA_DIC_Alwin_Beeilen,"Gut. Danke für deine Hilfe.",DIA_DIC_Alwin_HelfeMir);
	Info_AddChoice(DIA_DIC_Alwin_Beeilen,"Das muss ich alleine machen.",DIA_DIC_Alwin_GeheLager);

	};

func void DIA_DIC_Alwin_HelfeMir ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_HelfeMir_15_00"); //Gut. Danke für deine Hilfe.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AlwinDabei = 1;
	Npc_ExchangeRoutine(self,"FOLGE");

	Info_ClearChoices(DIA_DIC_Alwin_Beeilen);
	B_LogEntry (OM_MISSION1, "Alwin hilft mir, die Kiste abzuholen.");
	};

func void DIA_DIC_Alwin_GeheLager ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_GeheLager_15_00"); //Das muss ich alleine machen. Graveyarn würde das nicht gerne sehen, wenn ich mir helfen lasse.
	AI_Output (self, other, "DIA_DIC_Alwin_GeheLager_01_01"); //Ok. Wir sehen uns im Lager.

	Npc_ExchangeRoutine(self,"HAUS");

	Info_ClearChoices(DIA_DIC_Alwin_Beeilen);
	B_LogEntry (OM_MISSION1, "Ich gehe ohne Alwin die Kiste abholen.");
	};



// ******************************************************************
//							Auftrag Belauschen
// ******************************************************************
//
//INSTANCE Alwin_Lausch(C_INFO)
//{
//	npc			= DIC_2003_Alwin;
//	nr			= 2;
//	condition	= Alwin_Lausch_Condition;
//	information	= Alwin_Lausch_Info;
//	permanent	= 0;
//	important   = 0;
//	description = "mysteriöses Gespräch der Abreiter";
//};
//
//FUNC INT Alwin_Lausch_Condition()
//{
//	if(Npc_KnowsInfo(self,ZR_59_NachtLager))
//	{
//		return TRUE;
//	};
//
//};
//
//FUNC VOID Alwin_Lausch_Info()
//{
//	AI_Output (other,self,"Alwin_Lausch_Info_15_00"); //Einer der Arbeiter hat sich verplappert. Er redete über Berengar, doch als er mich sah, tat er so, als wüßte er nicht mehr was er sagen wollte. Weißt du worum es geht?
//	AI_Output (self,other,"Alwin_Lausch_Info_01_01"); //Nein. So gut kenne ich ihn auch nicht *lacht. Vielleicht solltest du ihnen mal nachspionieren. Ich würde es Abends machen, wenn es dunkel ist.
//	DC_4_Lausch = TRUE;
//};

// ************************************************************
// 								TESTINTG
// ************************************************************
//
//INSTANCE Info_Sld_Alwin_Test (C_INFO)
//{
//	npc			= DIC_2003_Alwin;
//	nr			= 10;
//	condition	= Info_Sld_Alwin_Test_Condition;
//	information	= Info_Sld_Alwin_Test_Info;
//	permanent	= 1;
//	description = "Mission 3 starten";
//};
//
//FUNC INT Info_Sld_Alwin_Test_Condition()
//{
//	return 1;
//};
//
//FUNC VOID Info_Sld_Alwin_Test_Info()
//{
//	DC_1_Tower = 3;
//	DC_2_Smith = 2;
//	Npc_ExchangeRoutine(Schmied,"WORK");
//	DC_2_2	   = 2;
//	AI_StopProcessInfos(self);
//};

//------- Rohstahlkiste vor der Bruecke ---------
instance DIA_DIC_Alwin_Stahlkiste (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 1;
	condition = DIA_DIC_Alwin_Stahlkiste_Condition;
	information = DIA_DIC_Alwin_Stahlkiste_Info;
	permanent = 0;
	important = 1;
	description = "Ab hier übernimmst du besser.";
	};

func int DIA_DIC_Alwin_Stahlkiste_Condition ()
	{
	if (Npc_HasItems (self, DC_Rohstahlkiste) >= 1 && (Npc_GetDistToWP(self,"STADT_WEG_004")<=200))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Stahlkiste_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Alwin_Stahlkiste_01_00"); //Ab hier übernimmst du besser. Besser die Wachen sehen nicht das ich dir helfe. Das macht keinen guten Eindruck.

	B_GiveInvItems(self,other,DC_Rohstahlkiste,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"HAUS");

	Info_AddChoice(DIA_DIC_Alwin_Stahlkiste,"Ok.",DIA_DIC_Alwin_Okay);
	Info_AddChoice(DIA_DIC_Alwin_Stahlkiste,"Was meintest du eben mit besonderen Gewächsen?",DIA_DIC_Alwin_Gewaechsen);

	Log_AddEntry (OM_MISSION1, "Alwin hat mir die Kiste zurückgegeben, damit ich alleine die Kiste abliefere.");
	};

func void DIA_DIC_Alwin_Okay ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Okay_15_00"); //Ok.

	Info_ClearChoices(DIA_DIC_Alwin_Stahlkiste);
	};

func void DIA_DIC_Alwin_Gewaechsen ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Gewaechsen_15_00"); //Was meintest du eben mit besonderen Gewächsen?
	AI_Output (self, other, "DIA_DIC_Alwin_Gewaechsen_01_01"); //Erzähl ich dir ein anderes Mal...

	Info_ClearChoices(DIA_DIC_Alwin_Stahlkiste);
	};

// -------------------- Trialog mit Arbeiter, wegen Dialogbschränkung aufgeteilt...
INSTANCE DIA_DIC_Alwin_Worker_2 (C_INFO)
	{
	npc			= DIC_2003_Alwin;
	nr			= 15;
	condition	= DIA_DIC_Alwin_Worker_2_Condition;
	information	= DIA_DIC_Alwin_Worker_2_Info;
	permanent	= 0;
	important	= 1;
	description = "";
	};

FUNC INT DIA_DIC_Alwin_Worker_2_Condition()
	{
	if (MinenDialog == 1)
		{
		return 1;
		};
	};

FUNC void DIA_DIC_Alwin_Worker_2_Info()
	{
	AI_TurnToNpc	(Mine_Worker_2034,self);
	AI_TurnToNpc	(self,Mine_Worker_2034);
	AI_Output (DIC_2003_Alwin,hero, "M_Worker_Kiste_Info_15_01"); //Weiß Graveyarn eigentlich von deiner Vorliebe für nennen wir sie mal besondere Gewächse?
	MinenDialog = MinenDialog + 1;
	AI_GotoNpc (hero, Mine_Worker_2034);
	AI_WaitTillEnd(self, hero);
	AI_StopProcessInfos(self);
	};

INSTANCE DIA_DIC_Alwin_Worker_4 (C_INFO)
	{
	npc			= DIC_2003_Alwin;
	nr			= 15;
	condition	= DIA_DIC_Alwin_Worker_4_Condition;
	information	= DIA_DIC_Alwin_Worker_4_Info;
	permanent	= 0;
	important	= 1;
	description = "";
	};

FUNC INT DIA_DIC_Alwin_Worker_4_Condition()
	{
	if (MinenDialog == 3)
		{
		return 1;
		};
	};

FUNC void DIA_DIC_Alwin_Worker_4_Info()
	{
	AI_TurnToNpc	(Mine_Worker_2034,self);
	AI_TurnToNpc	(self,Mine_Worker_2034);
	AI_Output (DIC_2003_Alwin,hero, "M_Worker_Kiste_Info_15_03"); //Gern gesehen wird es aber auch nicht.
	MinenDialog = MinenDialog + 1;
	AI_GotoNpc (hero, Mine_Worker_2034);
	AI_WaitTillEnd(self, hero);
	AI_StopProcessInfos(self);
	};

INSTANCE DIA_DIC_Alwin_Worker_6 (C_INFO)
	{
	npc			= DIC_2003_Alwin;
	nr			= 15;
	condition	= DIA_DIC_Alwin_Worker_6_Condition;
	information	= DIA_DIC_Alwin_Worker_6_Info;
	permanent	= 0;
	important	= 1;
	description = "";
	};

FUNC INT DIA_DIC_Alwin_Worker_6_Condition()
	{
	if (MinenDialog == 5)
		{
		return 1;
		};
	};

FUNC void DIA_DIC_Alwin_Worker_6_Info()
	{
	AI_GotoNpc(self, Mine_Worker_2034);
	AI_GotoNpc(self, hero);
	AI_Output (DIC_2003_Alwin,hero, "M_Worker_Kiste_Info_15_05"); //Komm, folge mir. Ich nehme die Kiste und führe dich zurück zum Lager!
	//Npc_ExchangeRoutine(DIC_2003_Alwin,"WALD");
	Npc_ExchangeRoutine(self,"BRUECKE");
	AI_StopProcessInfos(self);
	
	Log_AddEntry (OM_MISSION1, "Alwin nimmt mir die Kiste ein Stück lang ab. So muss ich nicht ganz so viel schleppen.");
	};

/*
//------- Rohstahlkiste im Wald ---------
instance DIA_DIC_Alwin_Wald (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 1;
	condition = DIA_DIC_Alwin_Wald_Condition;
	information = DIA_DIC_Alwin_Wald_Info;
	permanent = 0;
	important = 1;
	description = "Na komm schon!";
	};

func int DIA_DIC_Alwin_Wald_Condition ()
	{
	if (Npc_HasItems (self, DC_Rohstahlkiste) >= 1 && (Npc_GetDistToWP(self,"STADT_PATH02_02")<=200))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Wald_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Alwin_Wald_01_00"); //Na komm schon! Wir sind gleich da!

	Npc_ExchangeRoutine(self,"BRUECKE");
	};
*/

//------- Kein Auftrag von Berengar ---------
instance DIA_DIC_Alwin_KAufBaltar (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 16;
	condition = DIA_DIC_Alwin_KAufBaltar_Condition;
	information = DIA_DIC_Alwin_KAufBaltar_Info;
	permanent = 0;
	important = 0;
	description = "Obwohl ich jetzt im Dienst Berengars stehe, habe ich nichts zu tun.";
	};

func int DIA_DIC_Alwin_KAufBaltar_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Auftrag))
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_KAufBaltar_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_KAufBaltar_15_00"); //Obwohl ich jetzt im Dienst Berengars stehe, habe ich nichts zu tun. Berengar selbst hatte nur wenig Zeit mit mir zu reden.
	AI_Output (self, other, "DIA_DIC_Alwin_KAufBaltar_01_01"); //Bedenke dass Berengar bald das gesamte Lager in eine Schlacht gegen den König führt. Berengar hat keine Zeit weil er unseren Überfall plant und du solltest darüber froh sein:
	AI_Output (self, other, "DIA_DIC_Alwin_KAufBaltar_01_02"); //Oder willst du etwa bei einem Angriff dabei sein, der den sicheren Untergang bedeutet, nur weil der Kampfplan nicht ausgefeilt war?
	};

// ------------ Ardaric hat Wappen benutzt -----------
instance DIA_DIC_Alwin_Wappen (C_INFO)
	{
	npc = DIC_2003_Alwin;
	nr = 17;
	condition = DIA_DIC_Alwin_Wappen_Condition;
	information = DIA_DIC_Alwin_Wappen_Info;
	permanent = 0;
	important = 1;
	description = "Gut dass ich dich treffe, Ardaric.";
	};

func int DIA_DIC_Alwin_Wappen_Condition ()
	{
	if (WappenBenutzt == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Alwin_Wappen_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Alwin_Wappen_01_00"); //Gut dass ich dich treffe, Ardaric. Ich werde bald das Lager für mehrere Wochen verlassen. Graveyarn hat mich für eine Außenmission eingeteilt. Wir werden uns erst mal nicht mehr sehen. Ich wollte mich verabschieden. Man kann ja nie wissen.

	Info_AddChoice(DIA_DIC_Alwin_Wappen, "Unter den Waffen auf dem Marktplatz war ein Schild.", DIA_DIC_Alwin_Schild);
	Info_AddChoice(DIA_DIC_Alwin_Wappen, "Auch ich verlasse das Lager, aber nur für kurze Zeit.", DIA_DIC_Alwin_GeheAuch);
	Info_AddChoice(DIA_DIC_Alwin_Wappen, "Wohin gehst du?", DIA_DIC_Alwin_WohinGehst);
	};

func void DIA_DIC_Alwin_Schild ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_Schild_15_00"); //Unter den Waffen auf dem Marktplatz, war ein Schild. Ein ähnliches sah ich im Haus meines Vaters. Was waren das noch für Gerüchte, von denen du sprachst?
	AI_Output (self, other, "DIA_DIC_Alwin_Schild_01_01"); //Ja. Dein Vater. Du arbeitest doch jetzt für Berengar. Das ist eine große Ehre. Du solltest dich entscheiden. Dein Vater ist tot, das ist wahr. Und wenn du versuchst, mehr über diesen Tod herauszufinden, läufst du vielleicht Gefahr, das Schicksal deines Vaters zu teilen.
	AI_Output (self, other, "DIA_DIC_Alwin_Schild_01_02"); //Also bedenke deine Schritte gut. Ich bin mir nicht mehr sicher, ob es gut war, dir zu raten, den Gerüchten über deinen Vater nachzugehen.
	};

func void DIA_DIC_Alwin_GeheAuch ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_GeheAuch_15_00"); //Auch ich verlasse das Lager, aber nur für kurze Zeit.  Ich mache mich auf Schatzsuche. In den Höhlen hier in der Umgebung soll es ja eine Menge zu finden geben.
	AI_Output (self, other, "DIA_DIC_Alwin_GeheAuch_01_01"); //Du riskierst dabei dein Leben. In den Gebirgshöhlen lauern Geschöpfe deren Namen du nicht einmal kennst. Von den Wölfen will ich gar nicht reden. Es gab hier schon ein paar wagemutige Einzelgänger, die versucht haben, wertvolles aufzustöbern, doch niemand von ihnen kehrte zurück.
	AI_Output (self, other, "DIA_DIC_Alwin_GeheAuch_01_02"); //Von zwei Leuten fand man die Überreste. Die meisten ihrer Knochen waren zersplittert. Das Tier das sie so zugerichtet hat, möchte ich nicht begegnen.
	};

func void DIA_DIC_Alwin_WohinGehst ()
	{
	AI_Output (other, self, "DIA_DIC_Alwin_WohinGehst_15_00"); //Wohin gehst du?
	AI_Output (self, other, "DIA_DIC_Alwin_WohinGehst_01_01"); //Ich arbeite jetzt als Späher. Zu sechst werden wir von den östlichen Gebieten eine Karte anfertigen. Begehbare Wege aufzeichnen, Landstriche vermerken die von den Wölfen bevölkert werden. Und allgemein halten wir Ausschau nach Eindringlingen jeder Art, Orks oder Menschen. 
	AI_Output (other, self, "DIA_DIC_Alwin_WohinGehst_15_02"); //Viel Glück. Ich hoffe wir sehen uns wieder.
	};
	
// ----------------- Rhetorik Quest (Graveyarnweg) ---------------------
instance DIA_dic_Alwin_GraveRhet (C_INFO)
	{
	npc = dic_2003_Alwin;
	nr = 3;
	condition = DIA_dic_Alwin_GraveRhet_Condition;
	information = DIA_dic_Alwin_GraveRhet_Info;
	permanent = 0;
	important = 1;
	description = "Graveyarn hat mir einen Auftrag gegen.";
	};

func int DIA_dic_Alwin_GraveRhet_Condition()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Graveyarn_Erzdrache))
		{
		return 1;
		};
	};

func void DIA_dic_Alwin_GraveRhet_Info()
	{
	AI_Output (self, other, "DIA_dic_Alwin_GraveRhet_15_00"); //Ich weiss das du für Berengar arbeiten willst. Lass dir etwas gesagt sein das viele nicht wissen.
	AI_Output (self, other, "DIA_dic_Alwin_GraveRhet_15_01"); //Berengar schätzt es wenn jemand der Sprache Herr ist. Für ihn ist das ein Zeichen eines klaren Verstandes.
	AI_Output (self, other, "DIA_dic_Alwin_GraveRhet_01_02"); //Und er achtet jene die einen klaren Verstand haben und die nicht nur auf Muskelkraft setzen, wenn sie im Kampf ihr Schwert führen.
	
	Log_CreateTopic (RhetorikQuest,  LOG_MISSION);
	Log_SetTopicStatus (RhetorikQuest, LOG_RUNNING);
	B_LogEntry (RhetorikQuest, "Alwin hat mir erzählt, dass Berengar lieber intelligente Krieger hat.");
	};