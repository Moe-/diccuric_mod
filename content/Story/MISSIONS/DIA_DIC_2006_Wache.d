// -------------- Exit --------------


INSTANCE DIA_DIC_Wache_Exit (C_INFO)
	{
	npc = DIC_2006_Waechter;
	nr = 999;
	condition = DIA_dic_Waechter_Exit_Condition;
	information = DIA_dic_Waechter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_dic_Waechter_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_dic_Waechter_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ------------ Was willst du -----------

instance DIA_DIC_Waechter_Hey (C_INFO)
	{
	npc = DIC_2006_Waechter;
	nr = 1;
	condition = DIA_DIC_Waechter_Hey_Condition;
	information = DIA_DIC_Waechter_Hey_Info;
	permanent = 1;
	important = 1;
	description = "Was willst du?";
	};

func int DIA_DIC_Waechter_Hey_Condition()
	{
	if (Npc_RefuseTalk(self)==FALSE)
		{
		return 1;
		};
	};

func void DIA_DIC_Waechter_Hey_Info()
	{
	AI_Output (self, other, "DIA_DIC_Waechter_Hey_15_00"); //Hey. Was willst du hier?

	if (TaliasanAuftraege == 2)
		{
		Info_AddChoice(DIA_DIC_Waechter_Hey, "Ich soll die Waesche abholen.", DIA_DIC_Waechter_Waesche);
		};

	Info_AddChoice(DIA_DIC_Waechter_Hey, "Ich will mich umsehen.", DIA_DIC_Waechter_Umsehen);
	};

// ---- Wäsche holen ----
func void DIA_DIC_Waechter_Waesche ()
	{
	AI_Output (other, self, "DIA_DIC_Waechter_Waesche_15_00"); //Ich soll die Wäsche abholen.
	AI_Output (self, other, "DIA_DIC_Waechter_Waesche_01_01"); //Ok.

	Info_ClearChoices (DIA_DIC_Waechter_Hey);
	DIA_DIC_Waechter_Hey.permanent = 0;
	DIA_DIC_Waechter_Hey.important = 0;
	AI_StopProcessInfos	(self);
	B_GiveXP (100);
	};

// --- Umsehen ----
func void DIA_DIC_Waechter_Umsehen ()
	{
	AI_Output (other, self, "DIA_DIC_Waechter_Umsehen_15_00"); //Ich will mich mal hier umschauen.
	AI_Output (self, other, "DIA_DIC_Waechter_Umsehen_01_01"); //Umschauen? Willst du mal ein Waschweib werden? Geh lieber Kleiner.

	Info_ClearChoices (DIA_DIC_Waechter_Hey);
	Npc_SetRefuseTalk(self, 10);
	AI_GotoWP(hero, "BRUECKE_001");
	AI_WaitTillEnd (self,hero);
	AI_StopProcessInfos	(self);
	};

// -------- Versuch 1 abzulenken ---------
instance DIA_DIC_Waechter_Versuch_A (C_INFO)
	{
	npc = DIC_2006_Waechter;
	nr = 2;
	condition = DIA_DIC_Waechter_Versuch_A_Condition;
	information = DIA_DIC_Waechter_Versuch_A_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe da eine Geschichte gehört...";
	};

func int DIA_DIC_Waechter_Versuch_A_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Lynn_Herausholen))
		{
		return 1;
		};
	};

func void DIA_DIC_Waechter_Versuch_A_Info()
	{
	AI_Output (other, self, "DIA_DIC_Waechter_Versuch_A_15_00"); //Hallo. Ich habe da eine Geschichte gehört, die ist brüllend komisch.
	AI_Output (self, other, "DIA_DIC_Waechter_Versuch_A_01_01"); //Geh weiter Junge. Ich hab zu tun.

	AI_StopProcessInfos	(self);
	};

// -------- Versuch 2 abzulenken ---------
instance DIA_DIC_Waechter_Versuch_B (C_INFO)
	{
	npc = DIC_2006_Waechter;
	nr = 3;
	condition = DIA_DIC_Waechter_Versuch_B_Condition;
	information = DIA_DIC_Waechter_Versuch_B_Info;
	permanent = 0;
	important = 0;
	description = "Weißt du schon, dass Berengar...";
	};

func int DIA_DIC_Waechter_Versuch_B_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Lynn_Herausholen))
		{
		return 1;
		};
	};

func void DIA_DIC_Waechter_Versuch_B_Info()
	{
	AI_Output (other, self, "DIA_DIC_Waechter_Versuch_B_15_00"); //Weißt du schon, dass Berengar...
	AI_Output (self, other, "DIA_DIC_Waechter_Versuch_B_01_01"); //Lass mich in Ruhe. Wenn es was wichtiges über Berengar zu erzählen gibt, erfahre ich es aus erster Hand. Also, stör mich nicht bei meiner Wache.

	AI_StopProcessInfos	(self);
	};
	
// -------- Wachwechsel ---------
instance DIA_DIC_Waechter_Wachwechsel (C_INFO)
	{
	npc = DIC_2006_Waechter;
	nr = 3;
	condition = DIA_DIC_Waechter_Wachwechsel_Condition;
	information = DIA_DIC_Waechter_Wachwechsel_Info;
	permanent = 0;
	important = 1;
	};

func int DIA_DIC_Waechter_Wachwechsel_Condition()
	{
	if Npc_GetDistToNpc(self, DIC_2026_Waechter) < 350
		{
		return 1;
		};
	};

func void DIA_DIC_Waechter_Wachwechsel_Info()
	{
	// TA anschupsen
	AI_StopProcessInfos	(self);
	};