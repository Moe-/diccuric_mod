//------------ ENDE -----------------
instance DIA_DIC_2317_Schmied_Exit (C_INFO)
	{
	npc = DIC_2317_Schmied;
	nr = 999;
	condition = DIA_DIC_2317_Schmied_Exit_Condition;
	information = DIA_DIC_2317_Schmied_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_2317_Schmied_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_2317_Schmied_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// ------------ Nicht Kaufen ------------
instance DIA_DIC_2317_Schmied_Nicht (C_INFO)
	{
		npc = DIC_2317_Schmied;
		nr = 1;
		condition = DIA_DIC_2317_Schmied_Nicht_Condition;
		information = DIA_DIC_2317_Schmied_Nicht_Info;
		permanent = 1;
		important = 0;
		description = "Kann ich bei dir etwas kaufen?";
	};
	
func int DIA_DIC_2317_Schmied_Nicht_Condition ()
	{
		if (!Npc_KnowsInfo(other, DIA_DIC_Verwalter_Lernen))
			{
			return 1;
			};
	};
	
func void DIA_DIC_2317_Schmied_Nicht_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Lehrling_Nicht_15_00"); //Kann ich bei dir etwas kaufen?
		AI_Output (self, other, "DIA_DIC_Lehrling_Nicht_03_01"); //Beweise uns zuerst, dass wir dir vertrauen können. Du bist schließlich einer von Berengars Anhängern!
	};
	
// ------------ Kaufen ------------
instance DIA_DIC_2317_Schmied_Kaufen (C_INFO)
	{
		npc = DIC_2317_Schmied;
		nr = 1;
		condition = DIA_DIC_2317_Schmied_Kaufen_Condition;
		information = DIA_DIC_2317_Schmied_Kaufen_Info;
		permanent = 1;
		important = 0;
		description = "Kann ich bei dir etwas kaufen?";
		trade = 1;
	};
	
func int DIA_DIC_2317_Schmied_Kaufen_Condition ()
	{
		if (Npc_KnowsInfo(other, DIA_DIC_Verwalter_Lernen))
			{
			return 1;
			};
	};
	
func void DIA_DIC_2317_Schmied_Kaufen_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Lehrling_Kaufen_15_00"); //Kann ich bei dir etwas kaufen?
		AI_Output (self, other, "DIA_DIC_Lehrling_Kaufen_03_01"); //Schau doch im Angebot, ob ich etwas für dich habe.
	};
	
// ------------ Rüstung ------------
instance DIA_DIC_2317_Schmied_Ruestung (C_INFO)
	{
		npc = DIC_2317_Schmied;
		nr = 1;
		condition = DIA_DIC_2317_Schmied_Ruestung_Condition;
		information = DIA_DIC_2317_Schmied_Ruestung_Info;
		permanent = 1;
		important = 0;
		description = "Gibt es bei dir Rüstungen?";
	};
	
func int DIA_DIC_2317_Schmied_Ruestung_Condition ()
	{
		if (Npc_KnowsInfo(other, DIA_DIC_Verwalter_Lernen))
			{
			return 1;
			};
	};
	
func void DIA_DIC_2317_Schmied_Ruestung_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Lehrling_Ruestung_15_00"); //Gibt es bei dir Rüstungen?
	AI_Output (self, other, "DIA_DIC_Lehrling_Ruestung_03_01"); //Ja, schau dir doch das Angebot an.
	
	Info_AddChoice(DIA_DIC_2317_Schmied_Ruestung, "Leichte Novizenrüstung (450) 20 Stärke", DIA_DIC_2317_Schmied_RuestA);
	Info_AddChoice(DIA_DIC_2317_Schmied_Ruestung, "Novizenrüstung (900) 30 Stärke", DIA_DIC_2317_Schmied_RuestB);
	Info_AddChoice(DIA_DIC_2317_Schmied_Ruestung, "Leichte Templerrüstung (1350) 40 Stärke", DIA_DIC_2317_Schmied_RuestC);
	Info_AddChoice(DIA_DIC_2317_Schmied_Ruestung, "Mittlere Templerrüstung (1800) 60 Stärke", DIA_DIC_2317_Schmied_RuestD);
	Info_AddChoice(DIA_DIC_2317_Schmied_Ruestung, "Schwere Templerrüstung (2250) 80 Stärke", DIA_DIC_2317_Schmied_RuestE);
	Info_AddChoice(DIA_DIC_2317_Schmied_Ruestung, "Zurueck", DIA_DIC_2317_Schmied_RuestF);
	};

func void DIA_DIC_2317_Schmied_RuestA ()
	{
	AI_Output (other, self, "DIA_DIC_2317_Schmied_RuestA_15_00"); //Ich nehme die Leichte Novizenrüstung.
	if (Npc_HasItems(other, ItMiNugget) >= 450)
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestA_14_01"); //Hier hast du sie.
		CreateInvItem (self, NOV_ARMOR_M);
		B_GiveInvItems(self, other, NOV_ARMOR_M, 1);
		B_GiveInvItems(other, self, ItMiNugget, 450);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_2317_Schmied_Ruestung);
	};

func void DIA_DIC_2317_Schmied_RuestB ()
	{
	AI_Output (other, self, "DIA_DIC_2317_Schmied_RuestB_15_00"); //Ich nehme die Novizenrüstung.
	if (Npc_HasItems(other, ItMiNugget) >= 900)
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestB_14_01"); //Hier hast du sie.
		CreateInvItem (self, NOV_ARMOR_H);
		B_GiveInvItems(self, other, NOV_ARMOR_H, 1);
		B_GiveInvItems(other, self, ItMiNugget, 900);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_2317_Schmied_Ruestung);
	};

func void DIA_DIC_2317_Schmied_RuestC ()
	{
	AI_Output (other, self, "DIA_DIC_2317_Schmied_RuestC_15_00"); //Ich nehme die Leichte Templerrüstung.
	if (Npc_HasItems(other, ItMiNugget) >= 1350)
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestC_14_01"); //Hier hast du sie.
		CreateInvItem (self, TPL_ARMOR_L);
		B_GiveInvItems(self, other, TPL_ARMOR_L, 1);
		B_GiveInvItems(other, self, ItMiNugget, 1350);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_2317_Schmied_Ruestung);
	};

func void DIA_DIC_2317_Schmied_RuestD ()
	{
	AI_Output (other, self, "DIA_DIC_2317_Schmied_RuestD_15_00"); //Ich nehme die Mittlere Templerrüstung.
	if (Npc_HasItems(other, ItMiNugget) >= 1800)
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestD_14_01"); //Hier hast du sie.
		CreateInvItem (self, TPL_ARMOR_M);
		B_GiveInvItems(self, other, TPL_ARMOR_M, 1);
		B_GiveInvItems(other, self, ItMiNugget, 1800);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_2317_Schmied_Ruestung);
	};

func void DIA_DIC_2317_Schmied_RuestE ()
	{
	AI_Output (other, self, "DIA_DIC_2317_Schmied_RuestE_15_00"); //Ich nehme die Schwere Templerrüstung.
	if (Npc_HasItems(other, ItMiNugget) >= 2250)
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestE_14_01"); //Hier hast du sie.
		CreateInvItem (self, TPL_ARMOR_H);
		B_GiveInvItems(self, other, TPL_ARMOR_H, 1);
		B_GiveInvItems(other, self, ItMiNugget, 2250);
		AI_EquipBestArmor (self);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_2317_Schmied_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_2317_Schmied_Ruestung);
	};
	
func void DIA_DIC_2317_Schmied_RuestF ()
	{
	Info_ClearChoices (DIA_DIC_2317_Schmied_Ruestung);
	};