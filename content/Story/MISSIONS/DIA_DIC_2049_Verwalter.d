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
		AI_Output (self, other, "DIA_DIC_Verwalter_Was_09_01"); //Ich kümmere mich um den Lagerbestand. Wenn was fehlt, sorgen meine Männer und ich dafür das es neu angeschafft wird. 
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
		AI_Output (self, other, "DIA_DIC_Verwalter_Nahrung_09_01"); //Danke, unsere Vorräte waren schon fast erschöpft...und unsere Jäger finden nur noch wenig Nahrung.

		B_GiveInvItems(other, self, ItFoLoaf,5);
		B_GiveInvItems(other, self, ItFo_mutton_01,3);
		B_GiveInvItems(other, self, ItFoCheese,4);

		Log_AddEntry (FarmAuftraege, "Die Söldner hatten die Nahrung dringend nötig, scheinbar ist ihr Jagdgebiet ziemlich stark von uns geplündert worden...");
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
		AI_Output (self, other, "DIA_DIC_Verwalter_Lernen_09_01"); //Klar. Wir haben hier ein paar Jäger, die dir einige Sachen beibringen können. Und wenn du mit dem Bogen oder den einhändigen Schwert richtig gut umgehen kannst, können wir dir den Umgang mit dem Zweihänder und der Armbrust zeigen.
		AI_Output (self, other, "DIA_DIC_Verwalter_Lernen_09_02"); //Sprech doch einfach unsere Jungs an, da ist sicher der ein oder andere bereit, sein Können jemandem zu lehren. 
	};