//------------ ENDE -----------------
instance DIA_DIC_Baeuerin_Exit (C_INFO)
	{
	npc = DIC_2046_Baeuerin;
	nr = 999;
	condition = DIA_DIC_Baeuerin_Exit_Condition;
	information = DIA_DIC_Baeuerin_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Baeuerin_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Baeuerin_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------- Scheune befreien --------------
instance DIA_DIC_Baeuerin_Scheune (C_INFO)
	{
	npc = DIC_2046_Baeuerin;
	nr = 1;
	condition = DIA_DIC_Baeuerin_Scheune_Condition;
	information = DIA_DIC_Baeuerin_Scheune_Info;
	permanent = 0;
	important = 0;
	description = "Dein Mann schickt mich...";
	};

func int DIA_DIC_Baeuerin_Scheune_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_2045_Bauer_Auftrag))
		{
		return 1;
		};
	};

func void DIA_DIC_Baeuerin_Scheune_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baeuerin_Scheune_15_00"); //Dein Mann schickt mich...ch suche arbeit.
	AI_Output (self, other, "DIA_DIC_Baeuerin_Scheune_16_01"); //Wir sind in gro�er Sorge. In der Scheune machen sich seit ein paar Tagen Riesenratten breit und fre�en unsere Vorr�te.
	AI_Output (other, self, "DIA_DIC_Baeuerin_Scheune_15_02"); //Warum helfen euch denn nicht die S�ldner, die euch besch�tzen?
	AI_Output (self, other, "DIA_DIC_Baeuerin_ScheuneA_16_03"); //Die S�ldner sind damit besch�ftigt unseren Bauernhof vor dem Einfall der W�lfe zu bewahren! Sie haben keine Zeit sich um anderes zu k�mmern. 
	AI_Output (self, other, "DIA_DIC_Baeuerin_ScheuneB_16_03"); //Allerdings k�nnte ich mir auch vorstellen, dass sie damit besch�ftigt sind, ihre Burg zu sichern. Denn seitdem Berengar in Etain ist, f�rchten sie einen Angriff. Aber die S�ldner werden uns beistehen, egal was kommt. Wir halten zusammen!
	//AI_Output (other, self, "DIA_DIC_Baeuerin_Scheune_15_04"); //Dann werde ich die Ratten erledigen.
	AI_Output (self, other, "DIA_DIC_Baeuerin_Scheune_16_05"); //Gut!

	Log_CreateTopic (FarmAuftraege, LOG_MISSION);
	Log_SetTopicStatus (FarmAuftraege, LOG_RUNNING);
	Log_AddEntry (FarmAuftraege, "Die B�uerin hat mich geschickt, um in der Scheune die Ratten zu erledigen.");
	};

// ------------- Ratten tot --------------
instance DIA_DIC_Baeuerin_Ratten (C_INFO)
	{
	npc = DIC_2046_Baeuerin;
	nr = 2;
	condition = DIA_DIC_Baeuerin_Ratten_Condition;
	information = DIA_DIC_Baeuerin_Ratten_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe die Ratten erledigt!";
	};

func int DIA_DIC_Baeuerin_Ratten_Condition ()
	{
	if (Npc_IsDead(FarmRatte) && Npc_KnowsInfo (other, DIA_DIC_Baeuerin_Scheune))
		{
		return 1;
		};
	};

func void DIA_DIC_Baeuerin_Ratten_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baeuerin_Ratten_15_00"); //Ich habe den Ratten den Garaus gemacht!
	AI_Output (self, other, "DIA_DIC_Baeuerin_Ratten_16_01"); //Danke. Hier ist deine Belohnung. Wenn du mehr f�r mich erledigen willst, komm einfach wieder vorbei.

	CreateInvItems (self, ItFoLoaf, 5);
	B_GiveInvItems (self, other, ItFoLoaf, 5);
	B_GiveXP (250);

	Log_AddEntry (FarmAuftraege, "Ich habe die Ratten f�r die B�uerin get�tet.");
	AI_StopProcessInfos (self);
	};

// ------------ Mehl holen ------------
instance DIA_DIC_Baeuerin_Mehl (C_INFO)
	{
	npc = DIC_2046_Baeuerin;
	nr = 3;
	condition = DIA_DIC_Baeuerin_Mehl_Condition;
	information = DIA_DIC_Baeuerin_Mehl_Info;
	permanent = 0;
	important = 0;
	description = "Hast du noch mehr Arbeit f�r mich?";
	};

func int DIA_DIC_Baeuerin_Mehl_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Baeuerin_Ratten))
		{
		return 1;
		};
	};

func void DIA_DIC_Baeuerin_Mehl_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Baeuerin_Mehl_15_00"); //Hast du noch etwas f�r mich zu tun?
	AI_Output (self, other, "DIA_DIC_Baeuerin_Mehl_16_01"); //Unser Mehl geht langsam zu Neige. Gehe zur M�hle und hole etwas Mehl.

	Log_AddEntry (FarmAuftraege, "Die B�uerin hat mich beauftragt, daf�r zu sorgen, dass sie neues Mehl bekommt.");
	};

// ---------- Mehl fertig -------------
instance DIA_DIC_Baeuerin_Beliefert (C_INFO)
	{
		npc = DIC_2046_Baeuerin;
		nr = 4;
		condition = DIA_DIC_Baeuerin_Beliefert_Condition;
		information = DIA_DIC_Baeuerin_Beliefert_Info;
		permanent = 0;
		important = 0;
		description = "Ich soll mich melden?";
	};

func int DIA_DIC_Baeuerin_Beliefert_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Mueller_Fertig))
			{
				return 1;
			};
	};

func void DIA_DIC_Baeuerin_Beliefert_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Baeuerin_Beliefert_15_00"); //Der M�ller sagt, dass ich mich melden soll?
		AI_Output (self, other, "DIA_DIC_Baeuerin_Beliefert_16_01"); //Danke, dass du dich um das Mehl gek�mmert hast. Wenn du willst, habe ich noch eine Aufgabe f�r dich.

		B_GiveXP (500);
		Log_AddEntry (FarmAuftraege, "Die B�uerin hat sich sehr gefreut, dass ich das Problem mit dem Mehl gel�st habe.");
	};

// ---------- Feldarbeiter streikt ----------
instance DIA_DIC_Baeuerin_KeinMehl (C_INFO)
	{
		npc = DIC_2046_Baeuerin;
		nr = 5;
		condition = DIA_DIC_Baeuerin_KeinMehl_Condition;
		information = DIA_DIC_Baeuerin_KeinMehl_Info;
		permanent = 0;
		important = 0;
		description = "Ich kann kein Mehl bringen!";
	};

func int DIA_DIC_Baeuerin_KeinMehl_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Feldarbeiter_TagDanach) && FeldUngezieferToeten == 2)
			{
				return 1;
			};
	};

func void DIA_DIC_Baeuerin_KeinMehl_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Baeuerin_KeinMehl_15_00"); //Ich kann dir kein Mehl bringen. Auf dem Feld bekomme ich einfach kein Korn.
		AI_Output (self, other, "DIA_DIC_Baeuerin_KeinMehl_16_01"); //Alles muss man selbst machen...

		AI_StopProcessInfos (self);
		Log_AddEntry (FarmAuftraege, "Die B�uerin war sehr entt�uscht, dass ich das nicht erledigt habe...");
	};

//--------- Mehr Arbeit? --------------
instance DIA_DIC_Baeuerin_Brot (C_INFO)
	{
		npc = DIC_2046_Baeuerin;
		nr = 6;
		condition = DIA_DIC_Baeuerin_Brot_Condition;
		information = DIA_DIC_Baeuerin_Brot_Info;
		permanent = 0;
		important = 0;
		description = "Hast du noch etwas f�r mich zu tun?";
	};

func int DIA_DIC_Baeuerin_Brot_Condition ()
	{
		if (Npc_KnowsInfo(other, DIA_DIC_Baeuerin_Beliefert) || Npc_KnowsInfo(other, DIA_DIC_Baeuerin_KeinMehl))
			{
				return 1;
			};
	};

func void DIA_DIC_Baeuerin_Brot_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Baeuerin_Brot_15_00"); //Hast du noch etwas f�r mich zu tun?
		AI_Output (self, other, "DIA_DIC_Baeuerin_Brot_16_01"); //Eine Sache h�tte ich noch. Die S�ldner, die uns besch�tzen, m�ssen t�glich verpflegt werden. Heute habe ich unerwartet viel zu tun. Du k�nntest aber den S�ldner ihre Nahrung bringen.
		AI_Output (other, self, "DIA_DIC_Baeuerin_Brot_15_02"); //Und wo finde ich diese S�ldner?
		AI_Output (self, other, "DIA_DIC_Baeuerin_Brot_16_03"); //Frag meinen Mann, der sollte dir den Weg beschreiben k�nnen.
	};

// ------------- Junge geht los -----------------
instance DIA_DIC_Baeuerin_LosGehen (C_INFO)
	{
		npc = DIC_2046_Baeuerin;
		nr = 7;
		condition = DIA_DIC_Baeuerin_LosGehen_Condition;
		information = DIA_DIC_Baeuerin_LosGehen_Info;
		permanent = 0;
		important = 0;
		description = "Gib das Zeug her. Ich erledige das!";
	};

func int DIA_DIC_Baeuerin_LosGehen_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Baeuerin_Brot))
			{
				return 1;
			};
	};

func void DIA_DIC_Baeuerin_LosGehen_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Baeuerin_LosGehen_15_00"); //Gib mir die Waren. Ich bringe sie dorthin.
		AI_Output (self, other, "DIA_DIC_Baeuerin_LosGehen_16_01"); //Hier. Das sollte erstmal reichen.

		CreateInvItems (self, ItFoLoaf,5);
		CreateInvItems (self, ItFo_mutton_01,3);
		CreateInvItems (self, ItFoCheese,4);

		B_GiveInvItems(self, other,ItFoLoaf,5);
		B_GiveInvItems(self, other,ItFo_mutton_01,3);
		B_GiveInvItems(self, other,ItFoCheese,4);

		Log_AddEntry (FarmAuftraege, "Die B�uerin hat mir ein paar Nahrungsmittel gegeben, die ich zu den S�ldner bringen soll.");
	};
	
// ------------- Lieferung erfolgt -----------------
instance DIA_DIC_Baeuerin_Fertig (C_INFO)
	{
		npc = DIC_2046_Baeuerin;
		nr = 8;
		condition = DIA_DIC_Baeuerin_Fertig_Condition;
		information = DIA_DIC_Baeuerin_Fertig_Info;
		permanent = 0;
		important = 0;
		description = "Ich habe die Lieferung durchgef�hrt!";
	};

func int DIA_DIC_Baeuerin_Fertig_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Verwalter_Nahrung))
			{
				return 1;
			};
	};

func void DIA_DIC_Baeuerin_Fertig_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Baeuerin_Fertig_15_00"); //Ich habe die Lieferung durchgef�hrt!
		AI_Output (self, other, "DIA_DIC_Baeuerin_Fertig_16_01"); //Danke. Hier, nimm dieses Rezept als Dank von mir.
		AI_Output (other, self, "DIA_DIC_Baeuerin_Fertig_15_02"); //Gibt es hier noch mehr Arbeit?
		AI_Output (self, other, "DIA_DIC_Baeuerin_Fertig_16_03"); //Auch wenn du ein guter Arbeiter bist, vorerst ist hier Arbeit erledigt. Also habe ich f�r dich nichts mehr zu tun.

		CreateInvItems (self, Perm_HP_Rezept,1);
		B_GiveInvItems(self, other,Perm_HP_Rezept,1);
		
		B_GiveXP (500);

		Log_AddEntry (FarmAuftraege, "Ich habe die Aufgaben auf dem Bauernhof vorerst beendet.");
		Log_SetTopicStatus (FarmAuftraege, LOG_SUCCESS);
	};
		