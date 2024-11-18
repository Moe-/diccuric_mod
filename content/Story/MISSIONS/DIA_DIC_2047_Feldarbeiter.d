//------------ ENDE -----------------
instance DIA_DIC_Feldarbeiter_Exit (C_INFO)
	{
	npc = DIC_2047_Feldarbeiter;
	nr = 999;
	condition = DIA_DIC_Feldarbeiter_Exit_Condition;
	information = DIA_DIC_Feldarbeiter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Feldarbeiter_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Feldarbeiter_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------- Korn holen -------------
instance DIA_DIC_Feldarbeiter_Korn (C_INFO)
	{
		npc = DIC_2047_Feldarbeiter;
		nr = 1;
		condition = DIA_DIC_Feldarbeiter_Korn_Condition;
		information = DIA_DIC_Feldarbeiter_Korn_Info;
		permanent = 0;
		description = "Der M�ller schickt mich...";
	};

func int DIA_DIC_Feldarbeiter_Korn_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Mueller_Mehl))
			{
				return 1;
			};
	};

func void DIA_DIC_Feldarbeiter_Korn_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Feldarbeiter_Korn_15_00"); //Der M�ller schickt mich...r sagt, dass ich Korn f�r ihn auftreiben soll.
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_Korn_11_01"); //Jaja, mach blos keinen Stre�. Ich sorge daf�r, dass er morgen genug hat.

		Log_AddEntry (FarmAuftraege, "Der zust�ndige Feldarbeiter will bis morgen das Korn liefern.");

		MuellerTag = Wld_GetDay();
	};

// ------------- Wie siehts aus? ----------
instance DIA_DIC_Feldarbeiter_TagDanach (C_INFO)
	{
		npc = DIC_2047_Feldarbeiter;
		nr = 2;
		condition = DIA_DIC_Feldarbeiter_TagDanach_Condition;
		information = DIA_DIC_Feldarbeiter_TagDanach_Info;
		permanent = 0;
		description = "Was ist mit dem Korn los?";
	};

func int DIA_DIC_Feldarbeiter_TagDanach_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Mueller_Korn))
			{
				return 1;
			};
	};

func void DIA_DIC_Feldarbeiter_TagDanach_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Feldarbeiter_TagDanach_15_00"); //Was ist mit dem Korn los?
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_TagDanach_11_01"); //Ich wollte es ja zum M�ller bringen. Aber ich habe inzwischen ganz andere Sorgen...
		AI_Output (other, self, "DIA_DIC_Feldarbeiter_TagDanach_15_02"); //Was ist denn los?
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_TagDanach_11_03"); //Siehst du die beiden kahlen Felder? Ich muss dort ersteinmal die Sch�dlinge vertreiben.
		AI_Output (other, self, "DIA_DIC_Feldarbeiter_TagDanach_15_04"); //Pass auf: Ich k�mmere mich um das Ungeziefer und du bringst endlich das Korn zur M�hle?
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_TagDanach_11_05"); //Das w�rdest du tun?

		Info_AddChoice(DIA_DIC_Feldarbeiter_TagDanach, "Ja klar!", DIA_DIC_Feldarbeiter_Ja);
		Info_AddChoice(DIA_DIC_Feldarbeiter_TagDanach, "Nat�rlich nicht!", DIA_DIC_Feldarbeiter_Nein);
	};

func void DIA_DIC_Feldarbeiter_Ja ()
	{
		AI_Output (other, self, "DIA_DIC_Lagariman_Anfangen_15_00"); //Ja!
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_Ja_11_01"); //Dann viel Gl�ck!
		FeldUngezieferToeten = 1;
		Info_ClearChoices (DIA_DIC_Feldarbeiter_TagDanach);

		Log_AddEntry (FarmAuftraege, "Damit der Feldarbeiter endlich das Korn liefert, muss ich die beiden kahlen Felder s�ubern...");
	};

func void DIA_DIC_Feldarbeiter_Nein ()
	{
		AI_Output (other, self, "DIA_DIC_Feldarbeiter_Nein_15_00"); //Nat�rlich nicht!
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_Nein_11_01"); //Na gut...
		FeldUngezieferToeten = 2;
		Info_ClearChoices (DIA_DIC_Feldarbeiter_TagDanach);

		Log_AddEntry (FarmAuftraege, "Der Feldarbeiter hat noch nichts gemacht, aber ich will nicht seine Aufgaben �bernehmen...");
	};

// ------------- Ungeziefer tot ----------
instance DIA_DIC_Feldarbeiter_Ungeziefer (C_INFO)
	{
		npc = DIC_2047_Feldarbeiter;
		nr = 2;
		condition = DIA_DIC_Feldarbeiter_Ungeziefer_Condition;
		information = DIA_DIC_Feldarbeiter_Ungeziefer_Info;
		permanent = 0;
		description = "Ich habe das Ungeziefer beseitigt!";
	};

func int DIA_DIC_Feldarbeiter_Ungeziefer_Condition ()
	{
		if (FeldUngezieferToeten == 1 && Npc_IsDead (FeldWanze) && Npc_IsDead (FeldRatte))
			{
				return 1;
			};
	};


func void DIA_DIC_Feldarbeiter_Ungeziefer_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Feldarbeiter_Ungeziefer_15_00"); //Die Nager werden nicht mehr die Felder pl�ndern. Ich habe sie alle erldeigt.
		AI_Output (self, other, "DIA_DIC_Feldarbeiter_Ungeziefer_11_01"); //Sehr sch�n. Ich habe inzwischen beim M�ller alles in die Wege geleitet. Du solltest also das Mehl abholen k�nnen.

		Log_AddEntry (FarmAuftraege, "Ich habe das Ungeziefer get�tet und der M�ller hat inzwischen das Korn bekommen.");
		
		B_GiveXP (250);
	};