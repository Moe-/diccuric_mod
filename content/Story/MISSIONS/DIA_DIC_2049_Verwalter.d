//------------ ENDE -----------------
instance DIA_DIC_Verwalter_Exit (C_INFO)
	{
	npc = DIC_2049_Verwalter;
	nr = 999;
	condition = DIA_DIC_Verwalter_Exit_Condition;
	information = DIA_DIC_Verwalter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Verwalter_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Verwalter_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------ Was machst du? ---------
instance DIA_DIC_Verwalter_Was (C_INFO)
	{
		npc = DIC_2049_Verwalter;
		nr = 1;
		condition = DIA_DIC_Verwalter_Was_Condition;
		information = DIA_DIC_Verwalter_Was_Info;
		permanent = 0;
		important = 0;
		description = "Was ist deine Aufgabe?";
	};

func int DIA_DIC_Verwalter_Was_Condition ()
	{
		return 1;
	};

func void DIA_DIC_Verwalter_Was_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Verwalter_Was_15_00"); //Was ist deine Aufgabe? hier?
		AI_Output (self, other, "DIA_DIC_Verwalter_Was_09_01"); //Ich k�mmere mich um den Lagerbestand. Wenn was fehlt, sorgen meine M�nner und ich daf�r das es neu angeschafft wird. 
	};

// ---------- Junge bringt Nahrung ----------
instance DIA_DIC_Verwalter_Nahrung (C_INFO)
	{
		npc = DIC_2049_Verwalter;
		nr = 2;
		condition = DIA_DIC_Verwalter_Nahrung_Condition;
		information = DIA_DIC_Verwalter_Nahrung_Info;
		permanent = 0;
		important = 0;
		description = "Ich bringe hier die Nahrung von der Farm.";
	};

func int DIA_DIC_Verwalter_Nahrung_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Baeuerin_LosGehen) &&
				Npc_HasItems(other, ItFoLoaf) >= 5 &&
				Npc_HasItems(other, ItFo_mutton_01) >= 3 &&
				Npc_HasItems(other, ItFoCheese) >= 4)
			{
				return 1;
			};
	};

func void DIA_DIC_Verwalter_Nahrung_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Verwalter_Nahrung_15_00"); //Ich bringe die Nahrung von der Farm.
		AI_Output (self, other, "DIA_DIC_Verwalter_Nahrung_09_01"); //Danke, unsere Vorr�te waren schon fast ersch�pft...und unsere J�ger finden nur noch wenig Nahrung.

		B_GiveInvItems(other, self, ItFoLoaf,5);
		B_GiveInvItems(other, self, ItFo_mutton_01,3);
		B_GiveInvItems(other, self, ItFoCheese,4);

		Log_AddEntry (FarmAuftraege, "Die S�ldner hatten die Nahrung dringend n�tig, scheinbar ist ihr Jagdgebiet ziemlich stark von uns gepl�ndert worden...");
	};

// ---------- Lernen ----------
instance DIA_DIC_Verwalter_Lernen (C_INFO)
	{
		npc = DIC_2049_Verwalter;
		nr = 3;
		condition = DIA_DIC_Verwalter_Lernen_Condition;
		information = DIA_DIC_Verwalter_Lernen_Info;
		permanent = 0;
		important = 0;
		description = "Kann ich hier etwas lernen?";
	};

func int DIA_DIC_Verwalter_Lernen_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Verwalter_Nahrung))
			{
				return 1;
			};
	};

func void DIA_DIC_Verwalter_Lernen_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Verwalter_Lernen_15_00"); //Kann ich hier etwas lernen?
		AI_Output (self, other, "DIA_DIC_Verwalter_Lernen_09_01"); //Klar. Wir haben hier ein paar J�ger, die dir einige Sachen beibringen k�nnen. Und wenn du mit dem Bogen oder den einh�ndigen Schwert richtig gut umgehen kannst, k�nnen wir dir den Umgang mit dem Zweih�nder und der Armbrust zeigen.
		AI_Output (self, other, "DIA_DIC_Verwalter_Lernen_09_02"); //Sprech doch einfach unsere Jungs an, da ist sicher der ein oder andere bereit, sein K�nnen jemandem zu lehren. 
	};