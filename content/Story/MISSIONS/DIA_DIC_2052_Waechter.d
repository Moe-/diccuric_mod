//------------ ENDE -----------------
instance DIA_DIC_2052_Waechter_Exit (C_INFO)
	{
	npc = DIC_2052_Waechter;
	nr = 999;
	condition = DIA_DIC_2052_Waechter_Exit_Condition;
	information = DIA_DIC_2052_Waechter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2052_Waechter_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2052_Waechter_Exit_Info ()
	{		
	AI_StopProcessInfos (self);
	};

// -------------- Kein Durchgang ---------------
instance DIA_DIC_2052_Waechter_Stop (C_INFO)
	{
		npc = DIC_2052_Waechter;
		nr = 1;
		condition = DIA_DIC_2052_Waechter_Stop_Condition;
		information = DIA_DIC_2052_Waechter_Stop_Info;
		permanent = 1;
		important = 1;
		description = "Was willst du?";
	};
	
func int DIA_DIC_2052_Waechter_Stop_Condition ()
	{
	if (!Npc_KnowsInfo (other, DIA_DIC_Graveyarn_Erzdrache) && !Npc_KnowsInfo (other,DIA_DIC_Graveyarn_Briefe))
		{
			return 1;
		};
	};

func void DIA_DIC_2052_Waechter_Stop_Info ()
	{
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Stop_06_00"); //Was willst du? hier?
		
		if (Npc_KnowsInfo (other, Info_Grd1_MeetSchmied))
			{
				Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Ich will zum Schmied", DIA_DIC_2052_Waechter_Schmied);
			};
			
		if (Npc_KnowsInfo (other, DIA_dic_Alwin_Hallo))
			{
				Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Ich will zu Graveyarn", DIA_DIC_2052_Waechter_Graveyarn);
			};
			
		if (Npc_KnowsInfo (other, DIA_dic_Taliasan_Annehmen))
			{
				Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Ich will zu Raffa", DIA_DIC_2052_Waechter_Raffa);
			};
			
		if (Npc_KnowsInfo (other, Graveyarn_Anerk))
			{
				Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Ich will zum Werksmeister", DIA_DIC_2052_Waechter_Werksmeister);
			};
		if (Npc_HasItems(other,DC_Rohstahlkiste) >= 1)
			{
				Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Ich bringe die Kiste für den Schmied", DIA_DIC_2052_Waechter_Kiste);			
			};
		if (DC_2_Smith && BrueckenEinbruch == 1)
			{
				Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Ich habe die Kiste für den Schmied verloren", DIA_DIC_2052_Waechter_Verloren);
			};
			
		Info_AddChoice (DIA_DIC_2052_Waechter_Stop, "Nichts", DIA_DIC_2052_Waechter_Nichts);
		
	Log_CreateTopic (EintrittBurg,  LOG_MISSION);
	Log_SetTopicStatus (EintrittBurg, LOG_RUNNING);
	B_LogEntry (EintrittBurg, "Ich darf nicht in die Burg, doch Berengar ist dort. Irgendwie muss ich versuchen, zu ihn zu gelangen.");
	};
	
// ---------- Wo ist der Schmied --------	
func void DIA_DIC_2052_Waechter_Schmied ()
	{
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Schmied_15_01"); //Ich will zum Schmied!
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Schmied_06_02"); //Der kommt öfters in die Stadt zu seinem Lehrling. Da triffst du ihn sicherlich an.
	};

// ------------ Wo ist Graveyarn ---------
func void DIA_DIC_2052_Waechter_Graveyarn ()
	{
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Graveyarn_15_01"); //Ich will zu Graveyarn!
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Graveyarn_06_02"); //Graveyarn ist zur Zeit tagsüber in der Stadt unterwegs. Suche ihn dort!
	};

// ---------------- Wo ist Raffa ------------	
func void DIA_DIC_2052_Waechter_Raffa ()
	{
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Raffa_15_01"); //Ich will Raffa sprechen!
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Raffa_06_02"); //Der treibt sich hier vor der Burgmauer rum...geh doch einfach zu ihm.
	};
	
// --------- Wo ist der Werksmeister ---------
func void DIA_DIC_2052_Waechter_Werksmeister ()
	{
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Werksmeister_15_01"); //Wo ist der Werksmeister?
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Werksmeister_06_02"); //Du findest ihn noch heute in der Stadt bei seinem Lehrling.
	};
	
// -------- Will nix ------------
func void DIA_DIC_2052_Waechter_Nichts ()
	{
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Nichts_15_01"); //Nichts.
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Nichts_06_02"); //Dann verschwinde! Du weißt, dass du nichts in der Burg zu suchen hast!
		Info_ClearChoices (DIA_DIC_2052_Waechter_Stop);
		AI_GotoWP(hero, "BRUECKE_003");
		AI_WaitTillEnd (self, hero);
		AI_StopProcessInfos (self);
	};
	
// -------- Bringe Kiste -----------
func void DIA_DIC_2052_Waechter_Kiste ()
	{
		DC_2_Smith = 2;
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Kiste_15_00"); //Ich bringe die Kiste für den Schmied.
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Kiste_06_01"); //Gib sie mir. Ich bringe sie dann nacher zum Schmied.
		B_GiveInvItems(other,self,DC_Rohstahlkiste,1);
	};
	
// -------- Kiste verloren ----------
func void DIA_DIC_2052_Waechter_Verloren ()
	{
		AI_Output (other, self, "DIA_DIC_2052_Waechter_Verloren_15_00"); //Ich habe die Kiste für den Schmied verloren.
		AI_Output (self, other, "DIA_DIC_2052_Waechter_Verloren_06_01"); //Interessieren mich solche Probleme? Albros ist öfters in der Stadt bei seinem Lehrling. Erkläre es ihm doch selber.
	};
