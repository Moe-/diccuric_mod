//------------ ENDE -----------------
instance DIA_DIC_Slap_Exit (C_INFO)
	{
	npc = DIC_2043_Slap;
	nr = 999;
	condition = DIA_DIC_Slap_Exit_Condition;
	information = DIA_DIC_Slap_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Slap_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Slap_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

//------------ Spint geflohen -----------------
instance DIA_DIC_Slap_Spint (C_INFO)
	{
	npc = DIC_2043_Slap;
	nr = 1;
	condition = DIA_DIC_Slap_Spint_Condition;
	information = DIA_DIC_Slap_Spint_Info;
	permanent = 0;
	important = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Slap_Spint_Condition ()
	{
	if (WappenBenutzt == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Slap_Spint_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_00"); //Kannst du mir helfen?
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_01"); //Was ist los, wer bist du denn?
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_02"); //Ich bin Slap! Wir kennen uns doch ! Weißt du nicht mehr?
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_03"); //Nein.
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_04"); //Ach, was solls! Wo du es gerade sagst, ich weiß es auch nicht mehr so genau. Egal! Kannst du mir helfen?
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_05"); //Ja, wobei?
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_06"); //Ich hab für Pyt einen Spint gefangen.
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_07"); //Und?
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_08"); //Der Spint ist ausgerissen.
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_09"); //Hm?
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_10"); //Ich dachte du könntest mir helfen ihn wieder einzufangen? Ich krieg sonst Ärger, wenn die Schnorchelnase nicht wieder auftaucht.
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_11"); //Ich glaub das schaffst du schon selbst. Spints sind ja nicht so gefährlich.
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_12"); //Doch, ich befürchte doch.
	AI_Output (other, self, "DIA_DIC_Slap_Spint_15_13"); //Wieso?
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_14"); //Als ich gestern den Käfig vom Spint säuberte, kam Pyt. Da hab ich mein Talia-Kraut schnell in den Fressnapf gestopft. Pyt meinte, ich solle sofort ein Dutzend Lanzen putzen, und als ich wieder zurück zum Käfig kam, hatte der Spint mein ganzes Rauchkraut weggefressen. 
	AI_Output (self, other, "DIA_DIC_Slap_Spint_04_15"); //Nachts muss das Biest dann irgendwie aus dem Käfig geschlüpft sein. Der Spint ist jetzt wie von Sinnen, und vollkommen aufgedreht, alleine kann ich den nicht einfangen.

	Wld_InsertNpc (Spint, "B_36");
	Log_CreateTopic (SlapHilfe,  LOG_MISSION);
	Log_SetTopicStatus (SlapHilfe, LOG_RUNNING);
	B_LogEntry (SlapHilfe, "Slap ist ein Spint ausgerissen. Ich soll ihm beim fangen helfen.");
	};

//------------ Spint erledigt -----------------
instance DIA_DIC_Slap_Erledigt (C_INFO)
	{
	npc = DIC_2043_Slap;
	nr = 2;
	condition = DIA_DIC_Slap_Erledigt_Condition;
	information = DIA_DIC_Slap_Erledigt_Info;
	permanent = 0;
	important = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Slap_Erledigt_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Slap_Spint) && Npc_IsDead(Spint))
		{
		return 1;
		};
	};

func void DIA_DIC_Slap_Erledigt_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Slap_Erledigt_04_00"); //Danke! Du hast ihn bewusstlos geschlagen. Ich kümmere mich darum, dass er wieder eingesperrt wird!
	B_LogEntry (SlapHilfe, "Slap kümmert sich um den bewusstlosen Spint.");
	Log_SetTopicStatus (SlapHilfe, LOG_SUCCESS);
	B_GiveXP (250);
	};