//------------ ENDE -----------------
instance DIA_DIC_2032_Waechter_Exit (C_INFO)
	{
	npc = DIC_2032_Waechter;
	nr = 999;
	condition = DIA_DIC_2032_Waechter_Exit_Condition;
	information = DIA_DIC_2032_Waechter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2032_Waechter_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2032_Waechter_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------------- Junge kommt an ----------------
instance DIA_DIC_2032_Waechter_Junge (C_INFO)
	{
	npc = DIC_2032_Waechter;
	nr = 1;
	condition = DIA_DIC_2032_Waechter_Junge_Condition;
	information = DIA_DIC_2032_Waechter_Junge_Info;
	important = 0;
	permanent = 0;
	description = "Graveyarn schickt mich.";
	};

func int DIA_DIC_2032_Waechter_Junge_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Graveyarn_Karte))
		{
		return 1;
		};
	};

func void DIA_DIC_2032_Waechter_Junge_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Waechter_Junge_15_00"); //Graveyarn schickt mich. Hast du eine Karte für mich?
	if (Npc_GetDistToWP(DIC_2031_Koll,"PATH_SW_20")<300)
		{
		AI_Output (self, other, "DIA_DIC_Waechter_Junge_02_01"); //Da hättest du ein wenig flinker sein müssen. Koll war schon hier.
		Npc_ExchangeRoutine	(DIC_2031_Koll,"START");
		CreateInvItem	(DIC_2031_Koll, Graveyarn_Karte);
		B_LogEntry (DerKartenzeichner, "Ich war zu langsam. Koll war schneller und hat die Karte schon geholt.");
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Waechter_Junge_02_02"); //Ja. Hier. Bist wohl der Schnellere gewesen?
		Npc_ExchangeRoutine	(DIC_2031_Koll,"START");
		CreateInvItem	(self, Graveyarn_Karte);
		B_GiveInvItems(self, other,Graveyarn_Karte,1);
		B_LogEntry (DerKartenzeichner, "Ich war schneller als Koll, und habe die Karte bekommen.");
		B_GiveXP (250);
		};
	};
