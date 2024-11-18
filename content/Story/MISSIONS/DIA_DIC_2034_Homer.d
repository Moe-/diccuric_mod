// ************************************************************
// 			  				   EXIT
// ************************************************************

INSTANCE DIA_DIC_Homer_EXIT (C_INFO)
	{
	npc			= DIC_2034_Homer;
	nr			= 999;
	condition	= DIA_DIC_Homer_EXIT_Condition;
	information	= DIA_DIC_Homer_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
	};

FUNC INT DIA_DIC_Homer_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_Homer_EXIT_Info()
	{
	AI_StopProcessInfos	(self);
	};

// --------------------------- Über Damm erzählen => Anspielung auf Gothic ----------------
instance DIA_DIC_Homer_Frueher (C_INFO)
	{
	npc = DIC_2034_Homer;
	nr = 1;
	condition = DIA_DIC_Homer_Frueher_Condition;
	information = DIA_DIC_Homer_Frueher_Info;
	permanent = 0;
	important = 0;
	description = "Wer bist du?";
	};

func int DIA_DIC_Homer_Frueher_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Homer_Frueher_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Frueher_Homer_15_00"); //Wer bist du? Und was machst du?
	AI_Output (self, other, "DIA_DIC_Frueher_Homer_02_01"); //Mein Name ist Homer und seit kurzem versuche ich, mich als Händler durchs Leben zu schlagen.
	AI_Output (other, self, "DIA_DIC_Frueher_Homer_15_02"); //Und früher? Was hast du da gemacht?
	AI_Output (self, other, "DIA_DIC_Frueher_Homer_02_03"); //Früher lebte ich in einem Lager zusammen mit einem Typen, der sich Lee nennt. Ich hatte dort einen Staudamm gebaut.
	AI_Output (other, self, "DIA_DIC_Frueher_Homer_15_04"); //Warum machst du das nicht mehr?
	AI_Output (self, other, "DIA_DIC_Frueher_Homer_02_05"); //Seitdem sich die Wege von Lee und mir trennten, bin ich bei Berengar gelandet. Naja, Berengar bleibt nie lange an einem Ort, so dass sich kein Damm mehr lohnt...
	
	B_LogEntry (BekanntePersonen, "Homer ist ein Händler.");
	};

// ---------------------- Beruf als Händler ------------------
instance DIA_DIC_Homer_Haendler (C_INFO)
	{
	npc = DIC_2034_Homer;
	nr = 2;
	condition = DIA_DIC_Homer_Haendler_Condition;
	information = DIA_DIC_Homer_Haendler_Info;
	permanent = 0;
	important = 0;
	description = "Was hast du als Händler gelernt?";
	};

func int DIA_DIC_Homer_Haendler_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Homer_Frueher))
		{
		return 1;
		};
	};

func void DIA_DIC_Homer_Haendler_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Haendler_Homer_15_00"); //Du bist ja jetzt schon einige Zeit Händler. Was hast du denn dabei gelernt?
	AI_Output (self, other, "DIA_DIC_Haendler_Homer_02_01"); //Man muss klein anfangen. Viele der Händler hier verkaufen einem erst etwas, wenn man ihnen gewisse Sachen anbietet.
	AI_Output (other, self, "DIA_DIC_Haendler_Homer_15_02"); //Zum Beispiel?
	AI_Output (self, other, "DIA_DIC_Haendler_Homer_02_03"); //Kennst du Fisk? Er verkauft nur ausgewählten Kunden etwas. Bringst du ihm aber ein Wolfsfell, wird er dir sein Angebot zeigen.
	AI_Output (other, self, "DIA_DIC_Haendler_Homer_15_04"); //Woher bekomme ich so ein Fell?
	AI_Output (self, other, "DIA_DIC_Haendler_Homer_02_05"); //Du hast Glück, ich habe zur Zeit welche da.
	
	Log_CreateTopic (HandelsQuest,  LOG_MISSION);
	Log_SetTopicStatus (HandelsQuest, LOG_RUNNING);
	B_LogEntry (HandelsQuest, "Homer hat mir gerade erklärt, warum ich so schwer Händler finde: Sie suchen immer seltene Gegenstände und gehen auf einen zu, wenn sie von mir abkaufen wollen. Fisk will zum Beispiel ein Wolfsfell.");
	};

// ---------------------- Weitere Händler ------------------
instance DIA_DIC_Homer_Weitere (C_INFO)
	{
	npc = DIC_2034_Homer;
	nr = 3;
	condition = DIA_DIC_Homer_Weitere_Condition;
	information = DIA_DIC_Homer_Weitere_Info;
	permanent = 0;
	important = 0;
	description = "Kennst du weitere Händler?";
	};

func int DIA_DIC_Homer_Weitere_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Homer_Haendler))
		{
		return 1;
		};
	};

func void DIA_DIC_Homer_Weitere_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Weitere_Homer_15_00"); //Kennst du noch weitere Händler?
	AI_Output (self, other, "DIA_DIC_Weitere_Homer_02_01"); //Wie gesagt, ich bin auch noch neu im Geschäft. Ich habe dir eigentlich schon zu viel verraten...
	AI_Output (other, self, "DIA_DIC_Weitere_Homer_15_02"); //Wie meinst du das?
	AI_Output (self, other, "DIA_DIC_Weitere_Homer_02_03"); //Ich muss doch auch von etwas leben. Wenn ich dir jetzt all meine Bezugsquellen nenne, gehst du doch dorthin!
	AI_Output (other, self, "DIA_DIC_Weitere_Homer_15_04"); //Also gibst du mir keine weiteren Tipps?
	AI_Output (self, other, "DIA_DIC_Weitere_Homer_02_05"); //Nur so viel: Solltest du die richtige Ware dabei haben, werden die anderen Händler dich ansprechen und versuchen, dir die Ware abzukaufen.
	};

// -------------------- Ich will was kaufen -------------------
instance DIA_DIC_Homer_Trade (C_INFO)
	{
	npc = DIC_2034_Homer;
	nr = 3;
	condition = DIA_DIC_Homer_Trade_Condition;
	information = DIA_DIC_Homer_Trade_Info;
	permanent = 1;
	important = 0;
	description = "Was hast du anzubieten?";
	trade 			= 1;
	};

func int DIA_DIC_Homer_Trade_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Homer_Weitere))
		{
		return 1;
		};
	};

func void DIA_DIC_Homer_Trade_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Trade_Homer_15_00"); //Was hast du anzubieten?
	};