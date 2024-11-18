//------------ ENDE -----------------
instance DIA_DIC_Amalric_Exit (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 999;
	condition = DIA_DIC_Amalric_Exit_Condition;
	information = DIA_DIC_Amalric_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Amalric_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Amalric_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Freund -----------------
instance DIA_DIC_Amalric_Freund (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 1;
	condition = DIA_DIC_Amalric_Freund_Condition;
	information = DIA_DIC_Amalric_Freund_Info;
	permanent = 0;
	important = 1;
	description = "Freund";
	};

func int DIA_DIC_Amalric_Freund_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Freund_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Amalric_Freund_08_00"); //Täuschen mich meine Augen? Bist du ein Trugbild oder ein echter Mensch? 
	AI_Output (other, self, "DIA_DIC_Amalric_Freund_15_01"); //Ich bin ein Mensch. Mein Name ist Ardaric.
	AI_Output (self, other, "DIA_DIC_Amalric_Freund_08_02"); //Wie bist du hierher gekommen?
	AI_Output (other, self, "DIA_DIC_Amalric_Freund_15_03"); //Ich bin durch einen Hohlgang in den Berg gelangt.
	AI_Output (self, other, "DIA_DIC_Amalric_Freund_08_04"); //Was tust du hier?
	AI_Output (other, self, "DIA_DIC_Amalric_Freund_15_05"); //Ich habe die Aufgabe die Rune des Geistes zu finden. Lagariman mein Lehrmeister, verwies mich auf diese Höhle. Ich bin ein Schüler der magischen Wissenschaft und die Rune in meinen Besitz zu überführen ist Teil meiner Prüfungen.
	};
	
//------------ Was tust du hier? -----------------
instance DIA_DIC_Amalric_Hier (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 2;
	condition = DIA_DIC_Amalric_Hier_Condition;
	information = DIA_DIC_Amalric_Hier_Info;
	permanent = 0;
	important = 0;
	description = "Aber was tust du hier?";
	};

func int DIA_DIC_Amalric_Hier_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Amalric_Freund))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Hier_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Amalric_Hier_15_00"); //Aber was tust du hier? Du scheinst bei klarem Verstand zu sein, warum verlässt du die Höhle nicht.
	AI_Output (self, other, "DIA_DIC_Amalric_Hier_08_01"); //Ich habe keine Ahnung woher du so viel über diesen Ort weißt. Immerhin ist seit Jahrzehnten niemand aus der Außenwelt hier gewesen. Aber ich werde meine Neugierde im Zaum halten, und dir zuerst antworten. Alle Magier die du hier siehst gehörten einst dem Orden der Madrimier an. Doch Feordwin, der mächtigste Magier unter uns, ist in der langen Zeit dem Wahnsinn verfallen. 
	AI_Output (self, other, "DIA_DIC_Amalric_Hier_08_02"); //Auch andere Magier haben hier in langen Zeit die Klarheit ihres Geistes verloren, doch keiner ist so machthungrig wie Feordwin, der sich als unser Anführer aufspielt. Er befiehlt uns und wir müssen tun was er sagt. Sollten wir versuchen die Höhle zu verlassen, würde er uns töten.
	};
	
//------------ Hilfst du mir? -----------------
instance DIA_DIC_Amalric_Hilfe (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 3;
	condition = DIA_DIC_Amalric_Hilfe_Condition;
	information = DIA_DIC_Amalric_Hilfe_Info;
	permanent = 0;
	important = 0;
	description = "Hilfst du mir?";
	};

func int DIA_DIC_Amalric_Hilfe_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Amalric_Freund))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Hilfe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Amalric_Hilfe_15_00"); //Deswegen darf ich keine Zeit verschwenden. Hilfst du mir?
	AI_Output (self, other, "DIA_DIC_Amalric_Hilfe_08_01"); //Ich helfe dir! Der Träger der Rune ist Feordwin. Er ist umgeben von einer Leibgarde. Doch sie zu schlagen wird nicht einfach.  Es gibt hier noch eine Reihe von Magiern die dir helfen könnten. Ich weiß aber nicht wie gut ihre Geisteskraft noch erhalten ist. Du solltest auf alles gefasst sein, wenn du mit ihnen redest.
	AI_Output (self, other, "DIA_DIC_Amalric_Hilfe_08_02"); //Ihre Namen sind, Umfrey, Waleran, Herlewin, und Gamel. Bringe sie zu mir und dann werden wir gemeinsam gegen Feordwin antreten. Und versuche möglichst alle für dich zu gewinnen, wir können auf niemanden verzichten. 
	
	B_LogEntry (PruefungGeist, "Amalric wird mir helfen, die Rune zu bekommen. Allerdings soll ich noch die Magier Umfrey, Waleran, Herlewin, und Gamel überzeugen, mir zu helfen.");
	};
	
// ---------- alle Männer versammelt ---------------
instance DIA_DIC_Amalric_Versammelt (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 4;
	condition = DIA_DIC_Amalric_Versammelt_Condition;
	information = DIA_DIC_Amalric_Versammelt_Info;
	permanent = 0;
	important = 1;
	description = "Versammelt";
	};

func int DIA_DIC_Amalric_Versammelt_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Waleran_Geben) && Npc_KnowsInfo(other, DIA_DIC_Umfrey_Geben)
			&& Npc_KnowsInfo(other, DIA_DIC_Herlewin_Geben) && Npc_KnowsInfo(other, DIA_DIC_Gamel_Geben))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Versammelt_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Amalric_Versammelt_08_00"); //Jetzt sind alle Männer versammelt deren Geist und Kampfeswille noch frisch sind. Wenn das jahrzehntelange Leben in diesem klammem Felsen uns nicht töten konnte, so wird uns Feordwin auch nichts mehr anhaben können. Ardaric, wir warten auf dein Zeichen. 
	};
	
// ---------- Auf! ---------------
instance DIA_DIC_Amalric_Los (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 5;
	condition = DIA_DIC_Amalric_Los_Condition;
	information = DIA_DIC_Amalric_Los_Info;
	permanent = 0;
	important = 0;
	description = "Auf!";
	};

func int DIA_DIC_Amalric_Los_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Amalric_Versammelt))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Los_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Amalric_Los_15_00"); //Auf!
	
	Wld_SetGuildAttitude (GIL_KdF, ATT_NEUTRAL, GIL_KdW);
	Npc_SetTrueGuild(hero, GIL_KdW);
	Npc_ExchangeRoutine(DIC_2063_Amalric,"FOLGE");
	//AI_ContinueRoutine	(DIC_2063_Amalric);
	Npc_ExchangeRoutine(DIC_2064_Umfrey,"FOLGE");
	AI_ContinueRoutine	(DIC_2064_Umfrey);
	Npc_ExchangeRoutine(DIC_2065_Waleran,"FOLGE");
	AI_ContinueRoutine	(DIC_2065_Waleran);
	Npc_ExchangeRoutine(DIC_2066_Herlewin,"FOLGE");
	AI_ContinueRoutine	(DIC_2066_Herlewin);
	Npc_ExchangeRoutine(DIC_2067_Gamel,"FOLGE");
	AI_ContinueRoutine	(DIC_2067_Gamel);
	DIC_2063_Amalric.aivar[AIV_PARTYMEMBER] = TRUE;
	DIC_2064_Umfrey.aivar[AIV_PARTYMEMBER] = TRUE;
	DIC_2065_Waleran.aivar[AIV_PARTYMEMBER] = TRUE;
	DIC_2066_Herlewin.aivar[AIV_PARTYMEMBER] = TRUE;
	DIC_2067_Gamel.aivar[AIV_PARTYMEMBER] = TRUE;
	
	AI_StopProcessInfos (self);
	};
	
// ---------- Einen Moment noch! ---------------
instance DIA_DIC_Amalric_Moment (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 6;
	condition = DIA_DIC_Amalric_Moment_Condition;
	information = DIA_DIC_Amalric_Moment_Info;
	permanent = 0;
	important = 0;
	description = "Einen Moment noch!";
	};

func int DIA_DIC_Amalric_Moment_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Amalric_Versammelt) &&
			!Npc_KnowsInfo(other, DIA_DIC_Amalric_Los))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Moment_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Amalric_Moment_15_00"); //Einen Moment noch!
	
	AI_StopProcessInfos (self);
	};
	

// ---------- Feordwin Dialog ---------------
instance DIA_DIC_Amalric_FeordwinA (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 7;
	condition = DIA_DIC_Amalric_FeordwinA_Condition;
	information = DIA_DIC_Amalric_FeordwinA_Info;
	permanent = 0;
	important = 1;
	description = "FeordwinA";
	};

func int DIA_DIC_Amalric_FeordwinA_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Feordwin_Bedeuten))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_FeordwinA_Info ()
	{
	AI_Output (self, hero, "DIA_DIC_Feordwin_Bedeuten_08_01"); //Feordwin, deine Herrschaft ist zuende. Im Namen der Madrimier, schließe ich dich aus der Bruderschaft aus. Gib uns die „Rune des Geistes“ und behellige uns nicht, wenn wir diesen Ort ewiger Dunkelheit verlassen. 	
	};
	
// ---------- Feordwin Dialog ---------------
instance DIA_DIC_Amalric_FeordwinB (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 8;
	condition = DIA_DIC_Amalric_FeordwinB_Condition;
	information = DIA_DIC_Amalric_FeordwinB_Info;
	permanent = 0;
	important = 1;
	description = "FeordwinB";
	};

func int DIA_DIC_Amalric_FeordwinB_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Feordwin_Glaubst))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_FeordwinB_Info ()
	{
	AI_Output (DIC_2063_Amalric, hero, "DIA_DIC_Feordwin_Bedeuten_08_03"); //Deine Worte sind verlogen. Gib uns die Rune, oder bereite dich auf dein Ende vor.
		
	Wld_SetGuildAttitude (GIL_KdF, ATT_HOSTILE, GIL_KdW);
	//Npc_SetTarget (DIC_2063_Amalric, DIC_2068_Feordwin);
	//AI_Attack (DIC_2063_Amalric);
	
	Npc_ExchangeRoutine(DIC_2063_Amalric,"ANGRIFF");
	//AI_ContinueRoutine	(DIC_2063_Amalric);
	Npc_ExchangeRoutine(DIC_2064_Umfrey,"ANGRIFF");
	AI_ContinueRoutine	(DIC_2064_Umfrey);
	Npc_ExchangeRoutine(DIC_2065_Waleran,"ANGRIFF");
	AI_ContinueRoutine	(DIC_2065_Waleran);
	Npc_ExchangeRoutine(DIC_2066_Herlewin,"ANGRIFF");
	AI_ContinueRoutine	(DIC_2066_Herlewin);
	Npc_ExchangeRoutine(DIC_2067_Gamel,"ANGRIFF");
	AI_ContinueRoutine	(DIC_2067_Gamel);
	
	DIC_2068_Feordwin.flags = 0;
	
	AI_StopProcessInfos (self);	
	};

// ---------- Feordwin ist besiegt. ---------------
instance DIA_DIC_Amalric_Besiegt (C_INFO)
	{
	npc = DIC_2063_Amalric;
	nr = 9;
	condition = DIA_DIC_Amalric_Besiegt_Condition;
	information = DIA_DIC_Amalric_Besiegt_Info;
	permanent = 0;
	important = 1;
	description = "Feordwin ist besiegt.";
	};

func int DIA_DIC_Amalric_Besiegt_Condition ()
	{
	if (Npc_IsDead (DIC_2068_Feordwin) && Npc_IsDead (DIC_2069_Waechter)
		 && Npc_IsDead (DIC_2070_Waechter)  && Npc_IsDead (DIC_2071_Waechter)
		 && Npc_IsDead (DIC_2072_Waechter)  && Npc_IsDead (DIC_2073_Waechter)
		 && Npc_IsDead (DIC_2074_Waechter)  && Npc_IsDead (DIC_2075_Waechter))
		{
		return 1;
		};
	};

func void DIA_DIC_Amalric_Besiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Amalric_Besiegt_15_00"); //Feordwin ist besiegt. Danke Ardaric, ohne deine Hilfe, hätten wir es nicht geschafft!
	AI_Output (self, other, "DIA_DIC_Amalric_Besiegt_08_01"); //Kommt mit mir. Ich führe euch zu Lagariman, meinem Lehrmeister!
	B_LogEntry (PruefungGeist, "Feordwin ist besiegt und ich soll nun die Magier zu Lagariman bringen.");
	
	Npc_SetTrueGuild(hero, GIL_NONE);
	
	AI_StopProcessInfos (self);
	
	DIC_2063_Amalric.aivar[AIV_PARTYMEMBER] = FALSE;
	DIC_2064_Umfrey.aivar[AIV_PARTYMEMBER] = FALSE;
	DIC_2065_Waleran.aivar[AIV_PARTYMEMBER] = FALSE;
	DIC_2066_Herlewin.aivar[AIV_PARTYMEMBER] = FALSE;
	DIC_2067_Gamel.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	
//------------ ENDE -----------------
instance DIA_DIC_2076_Amalric_Exit (C_INFO)
	{
	npc = DIC_2076_Amalric;
	nr = 999;
	condition = DIA_DIC_2076_Amalric_Exit_Condition;
	information = DIA_DIC_2076_Amalric_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2076_Amalric_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2076_Amalric_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};