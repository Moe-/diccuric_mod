//------------ ENDE -----------------
instance DIA_DIC_Narrow_2018_Exit (C_INFO)
	{
	npc = DIC_2018_Narrow;
	nr = 999;
	condition = DIA_DIC_Narrow_2018_Exit_Condition;
	information = DIA_DIC_Narrow_2018_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Narrow_2018_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Narrow_2018_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------- Junge trifft auf Frontline -----------
instance DIA_DIC_Narrow_Info (C_INFO)
	{
	npc = DIC_2018_Narrow;
	nr = 1;
	condition = DIA_DIC_Narrow_Info_Condition;
	information = DIA_DIC_Narrow_Info_Info;
	permanent = 0;
	important = 1;
	// description = "Was ist hier los?";
	};

func int DIA_DIC_Narrow_Info_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Narrow_Info_Info ()
	{
	//AI_Output (hero, self, "DIA_DIC_Narrow_Info_15_00"); //Was? ist hier los?
	AI_Output (self, hero, "DIA_DIC_Narrow_Info_07_00"); //Vorsicht. Deckung!
	AI_Output (hero, self, "DIA_DIC_Narrow_Info_15_01"); //Was?
	AI_Output (self, hero, "DIA_DIC_Narrow_Info_07_02"); //Wölfe! Wir belagern sie, und sie belagern uns. Das ganze geht schon seit ein paar Stunden.
	AI_Output (hero, self, "DIA_DIC_Narrow_Info_15_03"); //Wieso erledigt ihr sie nicht? Ihr seid gut gerüstet. Allein dein Bogen sieht aus, als trifft jeder Pfeil. 
	AI_Output (self, hero, "DIA_DIC_Narrow_Info_07_04"); //Das kann schon sein. Aber was hast du davon, wenn du einen Wolf erlegst aber im nächsten Moment zwei andere Wölfe nach deiner Kehle schnappen? Da sind einfach zu viele. Einen Mann haben wir schon verloren.
	AI_Output (hero, self, "DIA_DIC_Narrow_Info_15_05"); //Wieso schickt Berengar euch keine zusätzlichen Jäger? 
	AI_Output (self, hero, "DIA_DIC_Narrow_Info_07_06"); //Die anderen sind im Einsatz. Wir haben unseren Trupp schon aufgeteilt. Zwei von uns sollten das Wolfsrudel umgehen und ihnen von hinten zusetzen. Doch irgendetwas muss ihnen zugestoßen sein.
	AI_Output (hero, self, "DIA_DIC_Narrow_Info_15_07"); //Vielleicht finde ich im Lager jemanden, der euch hilft.
	AI_Output (self, hero, "DIA_DIC_Narrow_Info_07_08"); //Versuche jemanden aufzutreiben.  Schnell. 
	Log_CreateTopic (NarrowMission,  LOG_MISSION);
	Log_SetTopicStatus (NarrowMission, LOG_RUNNING);
	B_LogEntry (NarrowMission, "Narrow steht an der Front und braucht dringend Hilfe. Ich sollte dringend im Lager jemanden finden, der Narrow hilft.");
	AI_StopProcessInfos (self);
	WolfAngriff = 1;
	};

	

// ---------------- Kampf an der Frontline -------------
instance DIA_DIC_Narrow_Kampf (C_INFO)
	{
	npc = DIC_2018_Narrow;
	nr = 2;
	condition = DIA_DIC_Narrow_Kampf_Condition;
	information = DIA_DIC_Narrow_Kampf_Info;
	permanent = 0;
	important = 1;
//	description = "Jetzt aber los!";	- Harri, bei important = 1 nicht notwendig
	};

func int DIA_DIC_Narrow_Kampf_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Jaeger_2020_Graveyarn) || Npc_KnowsInfo(hero, DIA_DIC_Jaeger_2021_Graveyarn))
	&& (Wld_IsTime(06,00,20,00))
		{
		return 1;
		};
	};

func void DIA_DIC_Narrow_Kampf_Info ()
	{
	AI_Output (self, hero, "DIA_DIC_Narrow_Kampf_07_00"); //Ah gut. Wir werden jetzt einen Vorstoß wagen. Aber wenn du glaubst, dass es zu gefährlich für dich ist:
	AI_Output (self, hero, "DIA_DIC_Narrow_Kampf_07_01"); //Du hast uns schon geholfen. Von einem Burchen deines Alters will ich nicht verlangen, dein Leben aufs Spiel zu setzen. Das musst du selbst entscheiden.
	B_LogEntry (NarrowMission, "Die Söldner rund um Narrow greifen nun die Wölfe an.");
		
	//danach stürmen die Jäger gegen die Wölfe vor.        
	
	if (Npc_GetDistToNpc( self, DIC_2019_Jaeger) > 300) 	// - Harri, Damit er eventuell nicht zuweit zurückbleibt
		{
		AI_SetWalkmode		(self,	NPC_RUN);
		};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DIC_2019_Jaeger.aivar[AIV_PARTYMEMBER] = TRUE;
//	DIC_2020_Jaeger.aivar[AIV_PARTYMEMBER] = TRUE;		// Harri - So leicht sollen die XP doch nicht verdient werden ? - oder doch?
//	DIC_2021_Jaeger.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"KAMPF");
	Npc_ExchangeRoutine	(DIC_2019_Jaeger,"KAMPF");
	Npc_ExchangeRoutine	(DIC_2020_Jaeger,"KAMPF");
	Npc_ExchangeRoutine	(DIC_2021_Jaeger,"KAMPF");
	ai_Continueroutine	(DIC_2019_Jaeger);
	ai_Continueroutine	(DIC_2020_Jaeger);
	ai_Continueroutine	(DIC_2021_Jaeger);
	B_LogEntry (NarrowMission, "Narrow hat nun durch mich dei Unterstützung zweier Jäger und ist nun bereit die Wölfe anzugreifen.");
	
	AI_StopProcessInfos (self);
	B_GiveXP (100);
	};

// ---------------- Kampf an der Frontline - - Harri- Nachts nicht ------------
instance DIA_DIC_Narrow_Kampfnacht (C_INFO)
	{
	npc = DIC_2018_Narrow;
	nr = 2;
	condition = DIA_DIC_Narrow_Kampfnacht_Condition;
	information = DIA_DIC_Narrow_Kampfnacht_Info;
	permanent = 0;
	important = 0;
	description = "Jetzt aber los!";
	};

func int DIA_DIC_Narrow_Kampfnacht_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Jaeger_2020_Graveyarn) || Npc_KnowsInfo(hero, DIA_DIC_Jaeger_2021_Graveyarn))
	&& (!Npc_KnowsInfo(hero, DIA_DIC_Narrow_Kampf))
	&& (Wld_IsTime(20,00,06,00))
		{
		return 1;
		};
	};

func void DIA_DIC_Narrow_Kampfnacht_Info ()
	{
	AI_Output (hero, self, "DIA_DIC_Narrow_Kampfnacht_07_00"); //Nun seit ihr aber genug, um ein Vorstoß zu wagen.
	AI_Output (self, hero, "DIA_DIC_Narrow_Kampfnacht_07_01"); //Ja, aber nicht bei Nacht.
	Snd_Play 	("WOLFJAUL1");
	AI_Output (self, hero, "DIA_DIC_Narrow_Kampfnacht_07_0"); //Hörst du sie nicht? Nein, um die Zeit wäre es unklug.
	AI_Output (self, hero, "DIA_DIC_Narrow_Kampfnacht_07_03"); //Setz dich ein bischen mit her und schau in die Nacht.      In der Frühe werden wir dann zuschlagen.
	B_LogEntry (NarrowMission, "Narrow meint es ist unklug Nachts anzugreifen. Ich werde tagsüber noch mal vorbeikommen.");
	Info_AddChoice(DIA_DIC_Narrow_Kampfnacht, "ich muß weiter", DIA_DIC_Narrow_Kampfnacht_weiter);
	Info_AddChoice(DIA_DIC_Narrow_Kampfnacht, "hinsetzen", DIA_DIC_Narrow_Kampfnacht_sitz);
		};
	
func void DIA_DIC_Narrow_Kampfnacht_weiter ()
	{
	Info_ClearChoices (DIA_DIC_Narrow_Kampfnacht);
	AI_Output (hero, self, "DIA_DIC_Narrow_Kampfnacht_07_04"); //Nein ich muss weiter.
	AI_Output (self, hero, "DIA_DIC_Narrow_Kampfnacht_07_05"); //Naugut, dann komm wieder wenn's hell ist. Dann werden wir losschlagen.
	AI_StopProcessInfos (self);
	};
	
func void DIA_DIC_Narrow_Kampfnacht_sitz ()
	{
	Info_ClearChoices (DIA_DIC_Narrow_Kampfnacht);
	AI_Output (hero, self, "DIA_DIC_Narrow_Kampfnacht_07_06"); //Ja, warum nicht? Könnte vielleicht interesannt werden.
	AI_PlayAni (hero, "T_STAND_2_SIT" );
	AI_StopProcessInfos (self);
	Wld_SendTrigger ("TL_WOLFNACHT");
	};
	
// --------- Wölfe sind besiegt --------------------
instance DIA_DIC_Narrow_Sieg (C_INFO)
	{
	npc = DIC_2018_Narrow;
	nr = 3;
	condition = DIA_DIC_Narrow_Sieg_Condition;
	information = DIA_DIC_Narrow_Sieg_Info;
	permanent = 0;
	important = 1;
	description = "Kein Problem.";
	};

func int DIA_DIC_Narrow_Sieg_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Narrow_Kampf) && Npc_IsDead(Wolf_GE) && Npc_IsDead(Wolf_GZ))
		{
		return 1;
		};
	};

func void DIA_DIC_Narrow_Sieg_Info ()
	{
	AI_RemoveWeapon 	(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DIC_2019_Jaeger.aivar[AIV_PARTYMEMBER] = FALSE;
//	DIC_2020_Jaeger.aivar[AIV_PARTYMEMBER] = FALSE;
//	DIC_2021_Jaeger.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_Output (self, hero, "DIA_DIC_Narrow_Sieg_07_00"); //Wir haben dir zu danken. Die Verstärkung war dringend notwendig. Wenigstens haben wir sie in die Flucht geschlagen.
	AI_Output (hero, self, "DIA_DIC_Narrow_Sieg_15_01"); //Gut.
	AI_Output (self, hero, "DIA_DIC_Narrow_Sieg_07_02"); //Aber ich will dich belohnen. Ich biete dir an, von nun an dein Ausbilder im Schwertkampf und Bogenschießen zu sein. Jemand, der sich für das Leben meiner Leute einsetzt, für den setze ich mich ein!
	AI_Output (hero, self, "DIA_DIC_Narrow_Sieg_15_03"); //Danke. Dein Wissen und deine Hilfe werde ich sicherlich gut gebrauchen können.
	AI_SetWalkmode		(self,	NPC_WALK);
	B_LogEntry (NarrowMission, "Narrow hat es endlich geschafft, die Wölfe zu besiegen. Da ich ihm geholfen habe, trainiert er mich mit dem Schwert und Bogen.");
	Log_SetTopicStatus	(NarrowMission,	LOG_SUCCESS);

	B_LogEntry(BekanntePersonen, "Narrow - Ich habe Narrow an der Front geholfen und dafür lehrt er mich Kampftechniken.");
	
	Npc_ExchangeRoutine	(self,"START");
	Npc_ExchangeRoutine	(DIC_2019_Jaeger,"START");
	Npc_ExchangeRoutine	(DIC_2020_Jaeger,"FRONT");
	Npc_ExchangeRoutine	(DIC_2021_Jaeger,"FRONT");
	ai_Continueroutine	(DIC_2019_Jaeger);
	ai_Continueroutine	(DIC_2020_Jaeger);
	ai_Continueroutine	(DIC_2021_Jaeger);
	
	B_GiveXP (300);
	};

// ---------------- Ausbildung in Einhänder und Bogen ---------------
instance DIA_DIC_Narrow_Ausbilden (C_INFO)
	{
	npc = DIC_2018_Narrow;
	nr = 4;
	condition = DIA_DIC_Narrow_Ausbilden_Condition;
	information = DIA_DIC_Narrow_Ausbilden_Info;
	permanent = 1;
	important = 0;
	description = "Kannst du mir etwas beibringen?";
	};

func int DIA_DIC_Narrow_Ausbilden_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Narrow_Sieg))
		{
		return 1;
		};
	};

func void DIA_DIC_Narrow_Ausbilden_Info ( )
	{
	AI_Output (hero, self, "DIA_DIC_Narrow_Ausbilden_15_00"); //Kannst du mir etwas beibringen?
	AI_Output (self, hero, "DIA_DIC_Narrow_Ausbilden_07_01"); //Ich kann dich im Kampf mit dem Einhänder und mit dem Bogen unterrichten.

	Info_ClearChoices	(DIA_DIC_Narrow_Ausbilden);
	Info_AddChoice		(DIA_DIC_Narrow_Ausbilden,DIALOG_BACK,DIA_DIC_Narrow_Ausbilden_Back);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0)
		{
		Info_AddChoice		(DIA_DIC_Narrow_Ausbilden,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,0)	,DIA_DIC_Narrow_Train1);
		};
	if (Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1)
		{
		Info_AddChoice		(DIA_DIC_Narrow_Ausbilden,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,0)	,DIA_DIC_Narrow_Train2);
		};
	if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
		{
		Info_AddChoice		(DIA_DIC_Narrow_Ausbilden,B_BuildLearnString(NAME_LearnBow_1, LPCOST_TALENT_BOW_1,0)	,DIA_DIC_Narrow_Train3);
		};

	if (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
		{
		Info_AddChoice		(DIA_DIC_Narrow_Ausbilden,B_BuildLearnString(NAME_LearnBow_2, LPCOST_TALENT_BOW_2,0)	,DIA_DIC_Narrow_Train4);
		};
	};

func void DIA_DIC_Narrow_Ausbilden_Back()
	{
	Info_ClearChoices	(DIA_DIC_Narrow_Ausbilden);
	};

func void DIA_DIC_Narrow_Train3()
	{
	if (B_GiveSkill(hero, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
		{
		AI_Output (hero, self,"DIA_DIC_Narrow_Train3_15_00"); //Kannst du mir beibringen, besser mit dem Bogen umzugehen?
		AI_Output (self, hero,"DIA_DIC_Narrow_Train3_07_01"); //Für einen Anfänger ist es nicht schwierig, besser zu werden. Es ist eine Frage der Haltung.
		AI_Output (self, hero,"DIA_DIC_Narrow_Train3_07_02"); //Die Füße schön weit auseinander, Arme auf eine Linie bringen, Luft anhalten und - Schuss!
		AI_Output (self, hero,"DIA_DIC_Narrow_Train3_07_03"); //An bestimmten Stellen des Körpers reicht ein Schuss aus, um dein Ziel zu erlegen. Als Anfänger hast du nur eine kleine Chance, diese Stellen zu erwischen.
		AI_Output (self, hero,"DIA_DIC_Narrow_Train3_07_04"); //Aber wenn du meine Ratschläge beherzigst, wirst du beim nächsten Mal besser treffen.
		};
	};

func void DIA_DIC_Narrow_Train4()
	{
	if (B_GiveSkill(hero, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
		{
			AI_Output (self, hero,"DIA_DIC_Narrow_Train4_07_00"); //Du bist jetzt schon ein guter Jäger. Erfahre nun das letzte Wissen.
			AI_Output (self, hero,"DIA_DIC_Narrow_Train4_07_01"); //Um ein Meisterschütze zu werden, musst du aufhören, einer sein zu wollen.
			AI_Output (self, hero,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Erkenne das Gesetz von Auge, Spannkraft, Flugbahn und Ziel. Sei immer auf der Hut, sei immer bereit.
			AI_Output (self, hero,"DIA_DIC_Narrow_Train4_07_02"); //Die Technik beherrscht du schon lange zur Genüge. Geh einfach hin und wende dein Wissen und Können an.
		};
	};

func void DIA_DIC_Narrow_Train1()
	{
	AI_Output (hero,self,"DIA_DIC_Narrow_Train1_15_00"); //Ich will besser mit Einhandwaffen umgehen können.

	if (B_GiveSkill(hero, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_01"); //Gut. Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_02"); //Anfänger neigen dazu, Einhandwaffen mit beiden Händen zu halten. Mit so was fängst du am besten gar nicht erst an, das behindert dich nur.
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_03"); //Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer schön schwingen lassen.
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_04"); //Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_05"); //Wenn du dich an meine Anweisungen hältst, wirst du in Zukunft eleganter und vor allem schneller kämpfen.
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_06"); //Ach und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anfänger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
		AI_Output (self,hero,"DIA_DIC_Narrow_Train1_07_07"); //Aber je weiter du fortschreitest, desto besser wird diese Fähigkeit.
		};
	};

func void DIA_DIC_Narrow_Train2()
	{
	if (B_GiveSkill(hero, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
		AI_Output (hero, self,"DIA_DIC_Narrow_Train2_15_00"); //Bring mir bei, noch besser mit Einhandwaffen umzugehen.
		AI_Output (self, hero,"DIA_DIC_Narrow_Train2_07_01"); //Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt hältst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
		AI_Output (self, hero,"DIA_DIC_Narrow_Train2_07_02"); //Nutze den Schwung, weißt du noch? Gut, der nächste Schritt ist, du musst deinen Körper mehr einsetzen. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit überraschst du den Gegner und bist in einer optimalen Position.
		AI_Output (self, hero,"DIA_DIC_Narrow_Train2_07_03"); //Dann ziehst du deine Klinge noch einmal quer von rechts nach links.
		AI_Output (self, hero,"DIA_DIC_Narrow_Train2_07_04"); //Und wieder von vorne. Vergiss nicht, Übung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einhändigen Kampfes.
		};
	};