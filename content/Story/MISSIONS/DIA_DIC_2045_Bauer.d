//------------ ENDE -----------------
instance DIA_DIC_2045_Bauer_Exit (C_INFO)
	{
	npc = DIC_2045_Bauer;
	nr = 999;
	condition = DIA_DIC_2045_Bauer_Exit_Condition;
	information = DIA_DIC_2045_Bauer_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2045_Bauer_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2045_Bauer_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------ Auftrag -----------------
instance DIA_DIC_2045_Bauer_Auftrag (C_INFO)
	{
	npc = DIC_2045_Bauer;
	nr = 1;
	condition = DIA_DIC_2045_Bauer_Auftag_Condition;
	information = DIA_DIC_2045_Bauer_Auftrag_Info;
	permanent = 0;
	important = 0;
	description = "Hast du Arbeit für mich?";
	};

func int DIA_DIC_2045_Bauer_Auftag_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2045_Bauer_Auftrag_Info ()
	{
	AI_Output (other, self, "DIA_DIC_2045_Bauer_Auftrag_15_00"); //Hast du Arbeit für mich?
	AI_Output (self, other, "DIA_DIC_2045_Bauer_Auftrag_09_01"); //Meine Frau sprach von Ungeziefer drüben in der Scheune...sie kann dir sicher mehr sagen
	};

// ------------- Überleben ---------------
instance DIA_DIC_Bauer_HierUeberleben (C_INFO)
	{
	npc = DIC_2045_Bauer;
	nr = 2;
	condition = DIA_DIC_Bauer_HierUeberleben_Condition;
	information = DIA_DIC_Bauer_HierUeberleben_Info;
	permanent = 0;
	important = 0;
	description = "Wie könnt ihr hier überleben?";
	};

func int DIA_DIC_Bauer_HierUeberleben_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Bauer_HierUeberleben_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Bauer_HierUeberleben_15_00"); //Wie könnt ihr hier draußen überleben?
	AI_Output (self, other, "DIA_DIC_Bauer_HierUeberleben_09_01"); //Wir leben hier draußen mit ein paar Söldner. Sie beschützen uns und wir versorgen sie mit Nahrung.
	AI_Output (other, self, "DIA_DIC_Bauer_HierUeberleben_15_02"); //Ich habe oben im Lager noch nie etwas von euren Waren gesehen!
	AI_Output (self, other, "DIA_DIC_Bauer_HierUeberleben_09_03"); //Ich sagte auch nicht, dass Berengar uns schützt. Nicht weit von hier ist eine kleine Burg. DORT findest du unsere Freunde.
	};

// ------------ Genauer Ort -------------
instance DIA_DIC_Bauer_Beschuetzer (C_INFO)
	{
	npc = DIC_2045_Bauer;
	nr = 3;
	condition = DIA_DIC_Bauer_Beschueter_Condition;
	information = DIA_DIC_Bauer_Beschuetzer_Info;
	permanent = 0;
	important = 0;
	description = "Wo genau finde ich diese Burg?";
	};

func int DIA_DIC_Bauer_Beschueter_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Bauer_HierUeberleben))
		{
		return 1;
		};
	};

func void DIA_DIC_Bauer_Beschuetzer_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Bauer_Beschuetzer_15_00"); //Wo genau finde ich die Burg?
	AI_Output (self, other, "DIA_DIC_Bauer_Beschuetzer_09_01"); //Du folgst dem Weg draußen zum Reisfeld. Dabei kommst du über eine Steinbrücke, kurz danach zweigen an einem Punkt zwei Wege nach rechts ab. Dem Hinteren der Beiden folgst du.
	AI_Output (self, other, "DIA_DIC_Bauer_Beschuetzer_09_02"); //An Der Stelle, an der sich der Weg gabelt, folgst du dem linken Weg. Links siehst du dann recht bald viele Farnpflanzen. Dort gehst du bis zum Berg und gehst du rechts daran vorbei und versuchst auf ihn zu gelangen.
	AI_Output (self, other, "DIA_DIC_Bauer_Beschuetzer_09_03"); //Aber du musst sehr vorsichtig sein. Der Weg dorthin ist sehr gefährlich.

	Log_CreateTopic(FarmSchutz, LOG_NOTE);
	Log_AddEntry (FarmSchutz, "Es gibt eine kleine Burg, die die Farm beschützt.");
	Log_AddEntry (FarmSchutz, "Um zu ihr gelangen, muss ich von der Farm aus in Richtung Reisfeld gehen. Nach der Steinbrücke zweigen zwei Wege an einer Stelle ab, den hinteren nehme ich. Bei der Weggabelung gehe ich den rechten Weg und biege bei den Farnpflanzen links ab. Beim Berg gehe ich rechts und versuche, auf ihn zu gelangen.");
	};