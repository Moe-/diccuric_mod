// -------------- Exit --------------


INSTANCE DIA_DIC_Raffa_Exit (C_INFO)
	{
	npc = DIC_2004_Raffa;
	nr = 999;
	condition = DIA_dic_Raffa_Exit_Condition;
	information = DIA_dic_Raffa_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_dic_Raffa_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_dic_Raffa_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ----------------- Hi ---------------------

instance DIA_DIC_Raffa_Hallo (C_INFO)
	{
	npc = DIC_2004_Raffa;
	nr = 1;
	condition = DIA_DIC_Raffa_Hallo_Condition;
	information = DIA_DIC_Raffa_Hallo_Info;
	permanent = 0;
	description = "Kann ich etwas für dich tun?";
	};

func int DIA_DIC_Raffa_Hallo_Condition()
	{
	if (Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Raffa_Hallo_Info()
	{
	AI_Output (other, self, "DIA_DIC_Raffa_15_00"); //Kann ich etwas für dich tun?
	AI_Output (self, other, "DIA_DIC_Raffa_08_01"); //Was ist denn jetzt los? Wer bist du?
	AI_Output (other, self, "DIA_DIC_Raffa_15_02"); //Für das Können gibt es nur einen Beweis, das Tun, und deswegen suche ich Arbeit. 
	AI_Output (self, other, "DIA_DIC_Raffa_08_03"); //Normalerweise würde ich dich vor die Tür setzen, aber du hast Glück. Zufällig bin ich gerade in einer Notlage. Und du könntest mir helfen.
	AI_Output (other, self, "DIA_DIC_Raffa_15_04"); //Ich werde es versuchen. Nur, als Belohnung verlange ich, dass du Taliasan bei Berengar lobend erwähnst. Am geeignetsten wäre ein Schriftstück, dass ich Taliasan übergeben kann.
	AI_Output (self, other, "DIA_DIC_Raffa_08_05"); //Hm, du stehst wohl bei Taliasan in der Kreide? Aber gut, mich kostet es nichts, einen Brief zu schreiben. Wenn es dir gelingt, zu erledigen, was ich dir aufgebe, dann kriegst du die Lobeshymne.
	AI_Output (other, self, "DIA_DIC_Raffa_15_06"); //Also, was kann ich für dich tun?
	AI_Output (self, other, "DIA_DIC_Raffa_08_07"); //Vor der Burg hast du sicherlich schon einmal die Waschhäuser gesehen? Dort wo die Frauen arbeiten.
	AI_Output (other, self, "DIA_DIC_Raffa_15_08"); //Ja und?
	AI_Output (self, other, "DIA_DIC_Raffa_08_09"); //Ich möchte, dass du Lynn, eine Frau, die dort arbeitet, hier her zu mir bringst. Vielleicht hast du schon mitbekommen, dass Frauen ausschließlich Berengar zustehen. 
	AI_Output (self, other, "DIA_DIC_Raffa_08_10"); //Ständig will er sie unter seiner Aufsicht wissen. Die Frauen verlassen die Burg nur, um Wäsche zu waschen. Lynn und ich sind... Jedenfalls wirst du sie nicht ohne weiteres hierher bringen können. 
	AI_Output (other, self, "DIA_DIC_Raffa_15_11"); //Aber wie kommen die Frauen, überhaupt in die Burg?
	AI_Output (self, other, "DIA_DIC_Raffa_08_12"); //Morgens werden sie von einer Wache zu den Waschräumen gebracht, und abends werden sie abgeholt und zurück in die Burg geführt.
	AI_Output (other, self, "DIA_DIC_Raffa_15_13"); //Ich werde mir was überlegen, um dir zu helfen.
	AI_Output (self, other, "DIA_DIC_Raffa_08_14"); //Ich gehe jetzt in die Stadt. Du wirst mich schon finden.

	Log_CreateTopic (RaffasAufgabe,  LOG_MISSION);
	Log_SetTopicStatus (RaffasAufgabe, LOG_RUNNING);
	B_LogEntry (RaffasAufgabe, "Raffa will von mir, dass ich für ihn eine Frau aus den Waschräumen zu ihm bringe. Das Problem ist, dass die Frauen für Berengar bestimmt sind, d.h. dass jeder, der dabei erwischt wird diesen Frauen zu nahe zu kommen, sich ernste Probleme einhandelt.");

	TaliasanAuftraege = 2;
	
	Npc_ExchangeRoutine	(self,"STADT");
	};

// ----------------- Spieler bringt Lynn ---------------------

instance DIA_DIC_Raffa_Lynn (C_INFO)
	{
	npc = DIC_2004_Raffa;
	nr = 2;
	condition = DIA_DIC_Raffa_Lynn_Condition;
	information = DIA_DIC_Raffa_Lynn_Info;
	permanent = 0;
	important = 1;
	description = "Hier ist dein Brief!";
	};

func int DIA_DIC_Raffa_Lynn_Condition()
	{
	if (TaliasanAuftraege == 3)
		{
		return 1;
		};
	};

func void DIA_DIC_Raffa_Lynn_Info()
	{
	AI_Output (self, other, "DIA_DIC_Raffa_Lynn_08_01"); //Hier, dein Brief.

	CreateInvItem	(self, Ra_Empf);
	B_GiveInvItems(self, other,Ra_Empf,1);
	B_GiveXP			(500);
	AI_StopProcessInfos	(self);
	
	TaliasanAuftraege = 4;
	
	B_LogEntry (RaffasAufgabe, "Ich habe den Brief von Raffa erhalten.");
	Log_SetTopicStatus (RaffasAufgabe, LOG_SUCCESS);
	};