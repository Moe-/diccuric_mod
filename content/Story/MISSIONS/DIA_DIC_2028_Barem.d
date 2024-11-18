//------------ ENDE -----------------
instance DIA_DIC_Barem_Exit (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 999;
	condition = DIA_DIC_Barem_Exit_Condition;
	information = DIA_DIC_Barem_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Barem_Exit_Condition ()
	{
	return 1;
	};
func void DIA_DIC_Barem_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

//------------ Wer bist du -------------------
instance DIA_DIC_Barem_Wer (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 1;
	condition = DIA_DIC_Barem_Wer_Condition;
	information = DIA_DIC_Barem_Wer_Info;
	permanent = 0;
	description = "Wer bist du?";
	};

func int DIA_DIC_Barem_Wer_Condition ()
	{
	if (Npc_GetDistToWP(self,"WIESE02_04") < 2000)
	&& Npc_IsDead(JngWaran)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Wer_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Wer_15_00"); //Wer bist du? Was tust du hier?
	AI_Output (self, other, "DIA_DIC_Barem_Wer_02_01"); //Ah, auf dich habe ich schon gewartet.
	AI_Output (other, self, "DIA_DIC_Barem_Wer_15_02"); //Was, du kennst mich?
	AI_Output (self, other, "DIA_DIC_Barem_Wer_02_03"); //Nein. aber ich habe darauf gewartet, dass mich mal jemand besuchen kommt, der friedliche Absichten hegt. Im übrigen, mein Name ist Barem.
	AI_Output (other, self, "DIA_DIC_Barem_Wer_15_04"); //Woher weißt du, dass ich nicht geschickt worden bin, dich zu töten?
	AI_Output (self, other, "DIA_DIC_Barem_Wer_02_05"); //Erstmal, weil du noch ziemlich jung bist. Aber ich besitze die Fähigkeit, meine Umgebung und die Absichten der Lebewesen zu spüren. 
	if !Npc_KnowsInfo (hero, DIA_DIC_Alwin_Barem)
	{
		Log_CreateTopic (BaremQuest,  LOG_MISSION);
		Log_SetTopicStatus (BaremQuest, LOG_RUNNING);
		B_LogEntry (BaremQuest, "Ich traf einen Fremden in der Wildnis. Er heißt Barem und scheint friedlich zu sein.");
	}
	else
	{
		B_LogEntry (BaremQuest, "Der Fremde heißt Barem. Er scheint friedlich zu sein.");
	};
	
	
	
	
	Info_AddChoice(DIA_DIC_Barem_Wer, "Kannst du mir diese Fähigkeit beibringen?", DIA_DIC_Barem_Beibringen);
	Info_AddChoice(DIA_DIC_Barem_Wer, "Und was nutzt dir das?", DIA_DIC_Barem_Nutzen);
	BaremInfo = BaremInfo + 1;
	
	if (!Npc_KnowsInfo (other, DIA_DIC_Lagariman_Hi))
		{
		LagarimanKenntPerBaltar = 1;
		};
	
	};

func void DIA_DIC_Barem_Beibringen ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Beibringen_15_00"); //Kannst du mir diese Fähigkeit beibringen?
	AI_Output (self, other, "DIA_DIC_Barem_Beibringen_02_01"); //Wer weiß, vielleicht irgendwann einmal.
	};

func void DIA_DIC_Barem_Nutzen ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Nutzen_15_00"); //Und was nutzt dir das?
	AI_Output (self, other, "DIA_DIC_Barem_Nutzen_02_01"); //Ich wusste zum Beispiel, dass du mir nichts tun würdest.
	};

// ---------- Warane nicht angegriffen ---------------
instance DIA_DIC_Barem_Waran (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 2;
	condition = DIA_DIC_Barem_Waran_Condition;
	information = DIA_DIC_Barem_Waran_Info;
	permanent = 0;
	description = "Warum haben dich die Warane nicht angegriffen?";
	};

func int DIA_DIC_Barem_Waran_Condition ()
	{
	if Npc_GetDistToWP(self,"WIESE02_04") < 2000
	&& Npc_KnowsInfo (hero, DIA_DIC_Barem_Wer)
	&& Npc_IsDead(JngWaran)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Waran_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Waran_15_00"); //Warum haben dich die Warane nicht angegriffen?
	AI_Output (self, other, "DIA_DIC_Barem_Waran_02_01"); //Die Warane wissen, dass ich ihnen nichts tue, und deswegen tun sie mir nichts.
	AI_Output (other, self, "DIA_DIC_Barem_Waran_15_02"); //Das ist doch unmöglich! Wie gelingt dir das? Ist es ein Zauber?
	AI_Output (self, other, "DIA_DIC_Barem_Waran_02_03"); //Nein. kein Zauber. Diese Tiere spüren, dass ich ihnen freundlich gesonnen bin. Im Gegensatz zu den Wölfen, die alles angreifen. Sie töten aus Freude am Töten. Gewöhnlich verhalten sich Tiere anders.
	AI_Output (other, self, "DIA_DIC_Barem_Waran_15_04"); //Sind es denn keine natürlichen Wölfe?
	AI_Output (self, other, "DIA_DIC_Barem_Waran_02_05"); //Die Orks haben sie gezüchtet und dafür gesorgt, dass jedes Tier von einem bösen Instinkt geleitet wird.
	AI_Output (other, self, "DIA_DIC_Barem_Waran_15_06"); //Woher weißt du das alles?
	AI_Output (self, other, "DIA_DIC_Barem_Waran_02_07"); //Das erzähle ich dir ein andermal. Wenn ich dich ein wenig kennengelernt habe.

	B_LogEntry (BaremQuest, "Seltsam. Die Warane greifen Barem nicht an...");
	BaremInfo = BaremInfo + 1;
	};

// ---------- nicht geholfen ---------------
instance DIA_DIC_Barem_NHilfe (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 3;
	condition = DIA_DIC_Barem_NHilfe_Condition;
	information = DIA_DIC_Barem_NHilfe_Info;
	permanent = 0;
	description = "Wieso hast du mir nicht geholfen?";
	};

func int DIA_DIC_Barem_NHilfe_Condition ()
	{
	if Npc_GetDistToWP(self,"WIESE02_04") < 2000
	&& Npc_KnowsInfo (hero, DIA_DIC_Barem_Wer)
	&& Npc_IsDead(JngWaran)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_NHilfe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_NHilfe_15_00"); //Ich wäre gerade fast getötet worden. Wieso hast du mir nicht geholfen?
	AI_Output (self, other, "DIA_DIC_Barem_NHilfe_02_01"); //Warane? Kampf? Ich war in Gedanken. Hab nichts mitbekommen.
	AI_Output (other, self, "DIA_DIC_Barem_NHilfe_15_02"); //Und das soll ich dir glauben?
	AI_Output (self, other, "DIA_DIC_Barem_NHilfe_02_03"); //Glaub das, was du für richtig hälst.	
	
	BaremInfo = BaremInfo + 1;
	};

// ---------- ich gehe jetzt lieber ---------------
instance DIA_DIC_Barem_Gehe (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 4;
	condition = DIA_DIC_Barem_Gehe_Condition;
	information = DIA_DIC_Barem_Gehe_Info;
	permanent = 0;
	description = "Ich glaube ich gehe jetzt lieber.";
	};

func int DIA_DIC_Barem_Gehe_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Barem_NHilfe) && Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Gehe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Gehe_15_00"); //Ich glaube ich gehe jetzt lieber.
	AI_Output (self, other, "DIA_DIC_Barem_Gehe_02_01"); //Warte. Aus welchem Grund bist du eigentlich in dieser Gegend?

	Info_AddChoice(DIA_DIC_Barem_Gehe, "Ich lebe in der Festung hier ganz in der Nähe", DIA_DIC_Barem_Festung);
	Info_AddChoice(DIA_DIC_Barem_Gehe, "Ich habe keine Zeit mehr...", DIA_DIC_Barem_KZeit);
	if BaremInfo == 0 && !Npc_KnowsInfo (hero, DIA_DIC_Alwin_Barem)
	{
		Log_CreateTopic (BaremQuest,  LOG_MISSION);
		Log_SetTopicStatus (BaremQuest, LOG_RUNNING);
	};	
	
	BaremInfo = BaremInfo + 1;
	};

func void DIA_DIC_Barem_Festung ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Festung_15_00"); //Ich lebe in der Festung Parthalan. Dort arbeite ich für den zukünftigen Herrscher Gatyahs.
	AI_Output (self, other, "DIA_DIC_Barem_Festung_02_01"); //Dann also "Gutes auf deinem Wege". Schau wieder vorbei, wenn die Zeit es dir erlaubt. 
	Info_ClearChoices (DIA_DIC_Barem_Gehe);
	AI_StopProcessInfos (self);
	};

func void DIA_DIC_Barem_KZeit ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_KZeit_15_00"); //Ich habe keine Zeit mehr zu reden, ich muss los.
	Info_ClearChoices (DIA_DIC_Barem_Gehe);
	AI_StopProcessInfos (self);
	};

// -------- Teil 2 Barem der Wanderer------------
instance DIA_DIC_Barem_Wanderer (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 5;
	condition = DIA_DIC_Barem_Wanderer_Condition;
	information = DIA_DIC_Barem_Wanderer_Info;
	permanent = 0;
	important = 1;
	description = "Ich würde gerne von dir wissen, wer jetzt oben in der Festung lebt.";
	};

func int DIA_DIC_Barem_Wanderer_Condition ()
	{
	if (BaremInfo == 4 && Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Wanderer_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Barem_Wanderer_02_00"); //Warte. Ich würde gerne erfahren, wer genau es ist, der in der Festung Parthalan lebt.
	AI_Output (other, self, "DIA_DIC_Barem_Wanderer_15_01"); //Eine Söldnertruppe lebt dort. Sie werden angeführt von einem Mann namens Berengar.
	AI_Output (self, other, "DIA_DIC_Barem_Wanderer_02_02"); //Ah ja. Ich habe gemerkt, dass Parthalan wieder bewohnt ist. Aber Berengar kenne ich nicht. Ihr arbeitet doch bestimmt für den König. 

	Info_AddChoice(DIA_DIC_Barem_Wanderer, "Wieso kommst du nicht mit?", DIA_DIC_Barem_Mitkommen);
	Info_AddChoice(DIA_DIC_Barem_Wanderer, "Was weißt du über die Burg?", DIA_DIC_Barem_Burg);
	Info_AddChoice(DIA_DIC_Barem_Wanderer, "Wir sind nicht vom König beauftragt!", DIA_DIC_Barem_Beauftragt);
	Info_AddChoice(DIA_DIC_Barem_Wanderer, "Was? Was hat der König geschafft?", DIA_DIC_Barem_Geschafft);
	};

func void DIA_DIC_Barem_Mitkommen()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Mitkommen_15_00"); //Wieso kommst du nicht mit? Vielleicht kannst du Berengar behilflich sein. Deine Fähigkeiten können unserer Sache helfen. 
	AI_Output (self, other, "DIA_DIC_Barem_Mitkommen_02_01"); //Nein. Ich will meine Ruhe haben. Und ich wäre dir dankbar, wenn du niemanden davon erzählst, dass ich hier lebe.
	};

func void DIA_DIC_Barem_Burg()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Burg_15_00"); //Was weißt du über Parthalan?
	AI_Output (self, other, "DIA_DIC_Barem_Burg_02_01"); //Die Festung ist von den Orks vor Jahrzehnten verwüstet worden. Der König konnte ihrem Vordringen irgendwann Einhalt gebieten, und man begann, Parthalan - zum Zeichen des Sieges - wieder aufzubauen. Aber man hat nur einen Teil aufgebaut, und... das erzähle ich dir ein andermal.
	};

func void DIA_DIC_Barem_Beauftragt()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Beauftragt_15_00"); //Wir sind nicht vom König beauftragt! Berengar glaubt, dass Gatyah im Moment keinen rechtmäßigen König hat.
	AI_Output (self, other, "DIA_DIC_Barem_Beauftragt_02_01"); //Ich kannte den König. Er ist im Grunde ein guter Mann.
	};

func void DIA_DIC_Barem_Geschafft()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Geschafft_15_00"); //Was weißt du noch über den König Gatyahs und dieses Land?
	AI_Output (self, other, "DIA_DIC_Barem_Geschafft_02_01"); //Das möchte ich dir noch nicht erzählen, du Naseweiß. Nur soviel: Es ist, als laste ein Fluch auf diesem Land, und der König tut nichts dagegen, obwohl es in seiner Macht stände. 
	};

// ----------- WolfAngriff -----------
instance DIA_DIC_Barem_Woelfe (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 6;
	condition = DIA_DIC_Barem_Woelfe_Condition;
	information = DIA_DIC_Barem_Woelfe_Info;
	permanent = 1;
	important = 1;
	description = "Gut, sowas passiert hier jeden Tag.";
	};

func int DIA_DIC_Barem_Woelfe_Condition ()
	{
	if (Npc_IsDead(Wolf_BQ) && Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Woelfe_Info ()
	{
	if (Npc_GetDistToNpc(self,Wolf_BQ)<500)				// wenn toter wolf rumliegt gabs auch ein kampft, sonst wieder welche einfügen  -Harri
	{
	AI_Output (self, other, "DIA_DIC_Barem_Woelfe_02_00"); //Gut, sowas passiert hier jeden Tag. Früher war das ein friedlicher Ort. Worüber sprachen wir?
	
	B_LogEntry (BaremQuest, "Zusammen mit Bareum habe ich einige Wölfe erledigt. Er sagte, dass die Wölfe früher noch nicht in der Gegend waren.");
	Log_SetTopicStatus (BaremQuest, LOG_SUCCESS);
	DIA_DIC_Barem_Woelfe.permanent = 0;
	DIA_DIC_Barem_Woelfe.important = 0;
	}
	else
	{
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	AI_StopProcessInfos(self);
	};
	};

//------------ Hast du das Horn -------------
instance DIA_DIC_Barem_Horn (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 7;
	condition = DIA_DIC_Barem_Horn_Condition;
	information = DIA_DIC_Barem_Horn_Info;
	permanent = 0;
	important = 0;
	description = "Ich suche ein Horn und brauche es dringend.";
	};

func int DIA_DIC_Barem_Horn_Condition ()
	{
	if ((Npc_HasItems(self, ScavHorn) >= 1) && Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Suchen) && (BaremInfo == 4))
		//&& Npc_GetDistToWP(self,"SPAWN_OW_FIREWARAN_BEACH_01") <= 300)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Horn_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Horn_15_00"); //Ich suche ein Scavenger Ruf Horn. Ich brauche es dringend. Hast du es vielleicht gefunden?
	AI_Output (self, other, "DIA_DIC_Barem_Horn_02_01"); //Gehört es dir?
	
	B_LogEntry (KarmakkHorn, "Barem hat das Horn.");
	};

// -------------- Besitzer wiederbringen --------------
instance DIA_DIC_Barem_WiedBringen (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 8;
	condition = DIA_DIC_Barem_WiedBringen_Condition;
	information = DIA_DIC_Barem_WiedBringen_Info;
	permanent = 0;
	important = 0;
	description = "Nein.";
	};

func int DIA_DIC_Barem_WiedBringen_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Barem_Horn) && !(Npc_KnowsInfo(hero, DIA_DIC_Barem_BBesitzer)) &&
		!(Npc_KnowsInfo(hero, DIA_DIC_Barem_Gewalt)) && Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_WiedBringen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_WiedBringen_15_00"); //Nein. Ich muss es seinem Besitzer wiederbringen.
	AI_Output (self, other, "DIA_DIC_Barem_WiedBringen_02_01"); //Ich habe das Horn auf einem meiner Streifzüge gefunden. Wenn ich mich recht erinnere war es auf einem Hochsitz. Hier. Auf dass es der Besitzer zurückerhält...
	AI_Output (other, self, "DIA_DIC_Barem_WiedBringen_15_02"); //Danke.

	B_GiveInvItems(self, other,ScavHorn,1);
	B_GiveXP (500);
	B_LogEntry (KarmakkHorn, "Barem hat mir das Horn gegeben, damit ich es seinem Besitzer bringe.");
	};

// -------------------- Bin Besitzer ------------------
instance DIA_DIC_Barem_BBesitzer (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 9;
	condition = DIA_DIC_Barem_BBesitzer_Condition;
	information = DIA_DIC_Barem_BBesitzer_Info;
	permanent = 0;
	important = 0;
	description = "Ja.";
	};

func int DIA_DIC_Barem_BBesitzer_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Barem_Horn) && !(Npc_KnowsInfo(hero, DIA_DIC_Barem_WiedBringen)) &&
		!(Npc_KnowsInfo(hero, DIA_DIC_Barem_Gewalt)) && Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_BBesitzer_Info ()
	{
	AI_Output (other, self, "DIA_Caine_Hallo_Ja_15_00"); //Ja.
	AI_Output (self, other, "DIA_DIC_Barem_BBesitzer_02_01"); //Hm. Ich glaube dir nicht. Das Horn ist wertvoll und außerdem siehst du nicht aus wie ein Jäger. Also, wie bist du an das Horn gekommen?
	AI_Output (other, self, "DIA_DIC_Barem_BBesitzer_15_02"); //Ich bin Jäger... doch, doch, ganz bestimmt. Das Horn habe ich ... gekauft, denke ich, ist schon lange her, äh.
	AI_Output (self, other, "DIA_DIC_Barem_BBesitzer_02_03"); //Auch wenn ich glaube, dass du mich anschwindelst, hier hast du es. Ich brauche es nicht. Dass du mich angelogen hast, betrübt mich. Es gibt schon so, viele Betrüger auf dieser Welt. 

	B_GiveInvItems(self, other,ScavHorn,1);
	B_GiveXP (150);
	B_LogEntry (KarmakkHorn, "Barem war zwar etwas betrübt, weil ich ihn angelogen habe, aber er hat mir trotzdem das Horn gegeben.");
	};

// --------------- Horn mit Gewalt holen --------------
instance DIA_DIC_Barem_Gewalt (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 10;
	condition = DIA_DIC_Barem_Gewalt_Condition;
	information = DIA_DIC_Barem_Gewalt_Info;
	permanent = 0;
	important = 0;
	description = "Mir wird hier zu viel geredet...";
	};

func int DIA_DIC_Barem_Gewalt_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Barem_Horn) && !(Npc_KnowsInfo(hero, DIA_DIC_Barem_BBesitzer)) &&
		!(Npc_KnowsInfo(hero, DIA_DIC_Barem_WiedBringen)) &&
		Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Gewalt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Barem_Gewalt_15_00"); //Mir werden hier zu viele Worte gewechselt! Gib mir das Horn oder stirb.
	AI_StopProcessInfos(self);
	self.flags = 0;
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	B_LogEntry (KarmakkHorn, "Mir war das Gerede mit Barem zu viel. Also habe ich begonnen, mit ihm darum zu kämpfen.");
	};

// --------------- Junge wurde umgehauen --------------
instance DIA_DIC_Barem_Gekaempft (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 11;
	condition = DIA_DIC_Barem_Gekaempft_Condition;
	information = DIA_DIC_Barem_Gekaempft_Info;
	permanent = 0;
	important = 1;
	description = "Na? Ich wollte nicht kämpfen.";
	};

func int DIA_DIC_Barem_Gekaempft_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Barem_Gewalt) && (Npc_HasItems(self, ScavHorn) >= 1)
		&& Npc_GetDistToWP(self,"WIESE02_04") < 2000)
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Gekaempft_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Barem_Gekaempft_02_00"); //Na? Ich wollte nicht kämpfen. Aber ich verzeihe dir deine ungestüme Jugend.
	AI_Output (other, self, "DIA_DIC_Barem_Gekaempft_15_01"); //Das Horn gehört mir, und ich will es wiederhaben.
	AI_Output (self, other, "DIA_DIC_Barem_Gekaempft_02_02"); //Auch wenn ich glaube, dass du mich anschwindelst, hier hast du es. Ich brauche es sowieso nicht. Dass du mich angelogen hast, betrübt mich. Es gibt schon so, viele Betrüger auf dieser Welt. 

	B_GiveInvItems(self, other,ScavHorn,1);
	B_GiveXP (50);
	B_LogEntry (KarmakkHorn, "Barem hat mich zwar im Kampf besiegt. Er hat mir aber trotzdem das Horn gegeben. Er scheint nicht sehr nachtragend zu sein.");
	};
	
	
	// --------------- Junge greift Barem gleich anfangs an --------------
instance DIA_DIC_Barem_Angriff (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 1;
	condition = DIA_DIC_Barem_Angriff_Condition;
	information = DIA_DIC_Barem_Angriff_Info;
	permanent = 1;
	important = 1;
//	description = "Na? Ich wollte nicht kämpfen.";
	};

func int DIA_DIC_Barem_Angriff_Condition ()
	{
	if BaremInfo < 4 && self.aivar[AIV_MISSION1] == 1
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Angriff_Info ()
	{
		B_Say		(self,	hero,	"$DieMortalEnemy");
		self.aivar[AIV_MISSION1] = 2;
		AI_StopProcessInfos(self);
		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude (self, ATT_HOSTILE);
		Npc_SetTarget (self,other);
		AI_StartState (self,ZS_ATTACK,1,"");
	};
	
	// --------------- Barem verzeiht hero, in sofern er es geschaft hat zuvor zu fiehen --------------
instance DIA_DIC_Barem_Verzeiht (C_INFO)
	{
	npc = DIC_2028_Barem;
	nr = 1;
	condition = DIA_DIC_Barem_Verzeiht_Condition;
	information = DIA_DIC_Barem_Verzeiht_Info;
	permanent = 1;
	important = 1;
	description = "Na? Ich wollte nicht kämpfen.";
	};

func int DIA_DIC_Barem_Verzeiht_Condition ()
	{
	if BaremInfo < 4 && self.aivar[AIV_MISSION1] > 1
	&& Npc_GetDistToNpc(self,hero) < 400
	&& !(Npc_IsInFightMode(hero, FMODE_FAR ) || Npc_IsInFightMode(hero, FMODE_MAGIC) ||Npc_IsInFightMode (hero,FMODE_MELEE ) || Npc_IsInFightMode (hero,FMODE_FIST ))
	
		{
		return 1;
		};
	};

func void DIA_DIC_Barem_Verzeiht_Info ()
	{
		self.aivar[AIV_MISSION1] = 0;
		Npc_SetTempAttitude (self, ATT_NEUTRAL);	
		Npc_SetPermAttitude (self, ATT_NEUTRAL);
		self.npctype 		= NPCTYPE_FRIEND;
		AI_SetWalkmode		(self, NPC_RUN);
		AI_GotoNpc			(self, other);
		AI_Output (self, other, "DIA_DIC_Barem_Gekaempft_02_00"); //Na? Ich wollte nicht kämpfen. Aber ich verzeihe dir deine ungestüme Jugend.
		AI_SetWalkmode		(self, NPC_WALK);
	};