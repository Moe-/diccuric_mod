//------------ ENDE -----------------
instance DIA_DIC_Benchol_Exit (C_INFO)
	{
	npc = DIC_2013_Benchol;
	nr = 999;
	condition = DIA_DIC_Benchol_Exit_Condition;
	information = DIA_DIC_Benchol_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Benchol_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Benchol_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------- Noch kein Wein ---------
instance DIA_DIC_Benchol_Wein (C_INFO)
	{
	npc = DIC_2013_Benchol;
	nr = 1;
	condition = DIA_DIC_Benchol_Wein_Condition;
	information = DIA_DIC_Benchol_Wein_Info;
	permanent = 0;
	description = "Hast du keinen Wein bekommen?";
	};

func int DIA_DIC_Benchol_Wein_Condition  ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Alwin_TDetails))
		{
		return 1;
		};
	};

func void DIA_DIC_Benchol_Wein_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Benchol_Wein_15_00"); //Hast du immer noch keinen Wein bekommen?
	AI_Output (self, other, "DIA_DIC_Benchol_Wein_07_01"); //Verdammt nein. Ich suche hier bei den Jungs nach etwas anderem.
	AI_Output (other, self, "DIA_DIC_Benchol_Wein_15_02"); //Zeugs von Taliasan?
	AI_Output (self, other, "DIA_DIC_Benchol_Wein_07_03"); //Ja. Aber der beliefert gerade nicht. Du kennst Taliasan gut?
	AI_Output (other, self, "DIA_DIC_Benchol_Wein_15_04"); //Ja, ich bin sein Schüler.
	AI_Output (self, other, "DIA_DIC_Benchol_Wein_07_05"); //Vielleicht kannst du ihn ja fragen, ob er was für uns hat.
	AI_Output (other, self, "DIA_DIC_Benchol_Wein_15_06"); //Ja, vielleicht.
	
	B_LogEntry (SladeQuest, "Taliasan hat Benchol noch nicht beliedert. Vielleicht kann ich da ja was machen.");
	};

// --------------- Bist du Benchol -------------
instance DIA_DIC_Benchol_Bist ( C_INFO)
	{
	npc = DIC_2013_Benchol;
	nr = 2;
	condition = DIA_DIC_Benchol_Bist_Condition;
	information = DIA_DIC_Benchol_Bist_Info;
	permanent = 0;
	description = "Bist du Benchol?";
	};

func int DIA_DIC_Benchol_Bist_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Benchol_Bist_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Benchol_Bist_15_00"); //Benchol, bist du es?
	AI_Output (self, other, "DIA_DIC_Benchol_Bist_07_01"); //hicks ....

	AI_StopProcessInfos (self);
	};

// -------- Wer ist bei dir -------------
instance DIA_DIC_Benchol_Heute (C_INFO)
	{
	npc = DIC_2013_Benchol;
	nr = 3;
	condition = DIA_DIC_Benchol_Heute_Condition;
	information = DIA_DIC_Benchol_Heute_Info;
	permanent = 0;
	important = 0;
	description = "Hey Benchol. Heute Spaßtag?";
	};

func int DIA_DIC_Benchol_Heute_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Narrow_Info))
		{
		return 1;
		};
	};

func void DIA_DIC_Benchol_Heute_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Benchol_Heute_15_00"); //Hey Benchol. Heute Spaßtag?
	AI_Output (self, other, "DIA_DIC_Benchol_Heute_07_01"); //Ein Tag wie jeder andere.
	AI_Output (other, self, "DIA_DIC_Benchol_Heute_15_02"); //Was sagt Berengar eigentlich dazu?
	AI_Output (self, other, "DIA_DIC_Benchol_Heute_07_03"); //Gar nichts. Wenn sich mal jemand um uns kümmert, dann Graveyarn. Und der drückt uns meistens einen Schwamm in die Hand, und schickt uns in den Turm zum Boden wienern.
	AI_Output (other, self, "DIA_DIC_Benchol_Heute_15_04"); //Oh.
	AI_Output (self, other, "DIA_DIC_Benchol_Heute_07_05"); //Setz dich trink einen mit uns.
	AI_Output (other, self, "DIA_DIC_Benchol_Heute_15_06"); //Jetzt nicht. Ein andern mal. Wer sind denn die anderen? 
	AI_Output (self, other, "DIA_DIC_Benchol_Heute_07_07"); //Arbeiter und zwei Jäger.

	Info_AddChoice (DIA_DIC_Benchol_Heute, "Aha. Arbeitsverweigerung?", DIA_DIC_Benchol_Erwischen);
	Info_AddChoice (DIA_DIC_Benchol_Heute, "Zwei Jäger?", DIA_DIC_Benchol_Jaeger);
	};

func void DIA_DIC_Benchol_Erwischen()
	{
	AI_Output (other, self, "DIA_DIC_Benchol_Erwischen_15_00"); //Verweigert ihr euren Dienst? Lasst euch nicht erwischen.
	AI_Output (self, other, "DIA_DIC_Benchol_Erwischen_07_01"); //Prost!
	};

func void DIA_DIC_Benchol_Jaeger()
	{
	AI_Output (other, self, "DIA_DIC_Benchol_Jaeger_15_00"); //Zwei Jäger?
	AI_Output (self, other, "DIA_DIC_Benchol_Jaeger_07_01"); //Ja die sind gerade erst zu uns gestoßen. 
	};