//------------ ENDE -----------------
instance DIA_DIC_Corristo_Exit (C_INFO)
	{
	npc = DIC_2038_Corristo;
	nr = 999;
	condition = DIA_DIC_Corristo_Exit_Condition;
	information = DIA_DIC_Corristo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Corristo_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Corristo_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------ Junge hat Buch --------------
INSTANCE DIA_DIC_Corristo_Buch (C_INFO)
	{
	npc			= DIC_2038_Corristo;
	nr			= 1;
	condition	= DIA_DIC_Corristo_Buch_Condition;
	information	= DIA_DIC_Corristo_Buch_Info;
	permanent	= 0;
	important = 1;
	description = "Du hat DAS Buch?";
	};

FUNC INT DIA_DIC_Corristo_Buch_Condition()
	{
	if (Npc_HasItems(other, ItWr_GolemBook1) >= 1)
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Corristo_Buch_Info()
	{
	AI_Output (self, other, "DIA_DIC_Corristo_Buch_14_00"); //Ardaric, du hast das Buch "Arkanum Golum"? Damit hast du es geschafft!
	AI_Output (other, self, "DIA_DIC_Corristo_Buch_15_01"); //Was habe ich geschafft?
	AI_Output (self, other, "DIA_DIC_Corristo_Buch_14_02"); //Pass auf: Jeder, der es schafft, dieses Buch zu bekommen, hat gezeigt, dass er ein gro�er H�ndler ist.
	AI_Output (other, self, "DIA_DIC_Corristo_Buch_15_03"); //Und was hei�t das?
	AI_Output (self, other, "DIA_DIC_Corristo_Buch_14_04"); //Wenn du mir das Buch gibst, wirst du zwischen 3 Belohnungen w�hlen d�rfen. Au�erdem kannst du nun in Zukunft bei mir R�stungen kaufen.
	
	B_LogEntry (HandelsQuest, "Konogan ist der letzte H�ndler. Er will das Buch Arkanum Golum.");
	Log_SetTopicStatus (HandelsQuest, LOG_SUCCESS);
	B_GiveXP (500);
	
	B_LogEntry (BekanntePersonen, "Konogan ist noch ein H�ndler. Er verkauft auch R�stungen.");
	};

// ----------- Junge gibt das Buch her ---------------
instance DIA_DIC_Corristo_Ja (C_INFO)
	{
	npc			= DIC_2038_Corristo;
	nr			= 2;
	condition	= DIA_DIC_Corristo_Ja_Condition;
	information	= DIA_DIC_Corristo_Ja_Info;
	permanent	= 0;
	important = 0;
	description = "Hier hast du das Buch.";
	};

func int DIA_DIC_Corristo_Ja_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Corristo_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Corristo_Ja_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_Ja_15_00"); //Ich brauche das Buch sowieso nicht. Hier, hast du es!
	AI_Output (self, other, "DIA_DIC_Corristo_Ja_14_01"); //Danke. Und nun passe auf, dass hier sind die drei m�glichen Belohnungen:
	AI_Output (self, other, "DIA_DIC_Corristo_Ja_14_02"); //1. Ich lehre dich die Kunst der Akrobatik.
	AI_Output (self, other, "DIA_DIC_Corristo_JA_14_03"); //2. Ich gebe dir eine Waffe.
	AI_Output (self, other, "DIA_DIC_Corristo_JA_14_04"); //3. Du bekommst eine Rune.
	AI_Output (self, other, "DIA_DIC_Corristo_JA_14_05"); //�berlege gut, was du w�hlst. Du kannst deine Wahl sp�ter nicht mehr �ndern.

	Info_AddChoice(DIA_DIC_Corristo_Ja, B_BuildLearnString(NAME_LearnAcrobat, 0,0), DIA_DIC_Corristo_Akrobatik);
	Info_AddChoice(DIA_DIC_Corristo_Ja, "Ich nehme die Waffe!", DIA_DIC_Corristo_Waffe);
	Info_AddChoice(DIA_DIC_Corristo_Ja, "Ich w�hle die Rune!", DIA_DIC_Corristo_Rune);
	};

// ------------------ Akrobatik -------------------
func void DIA_DIC_Corristo_Akrobatik ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_Akrobatik_15_00"); //Ich will die Kunst der Akrobatik beherrschen!
	AI_Output (self, other, "DIA_DIC_Corristo_Akrobatik_14_01"); //Eine seltene Wahl. Aber nun gut, h�re mit gut zu:

	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, 0))
		{
		AI_Output (self, other,"DIA_DIC_Corristo_Akrobatik_14_02"); //Wenn du deinen K�rper beherrscht, bist du in der Lage viel weiter zu springen.
		AI_Output (self, other,"DIA_DIC_Corristo_Akrobatik_14_03"); //Du lernst dich richtig abzurollen und aus dem Fall heraus richtig zu landen. Aber denk daran, du bist nicht unsterblich!
		AI_Output (self, other,"DIA_DIC_Corristo_Akrobatik_14_04"); //Auch im Kampf ist Akrobatik sehr hilfreich. Du kannst deinen Abstand zum Gegner sehr schnell ver�ndern. Viel Gl�ck!
		};

	Info_ClearChoices (DIA_DIC_Corristo_Ja);
	};
// -------------------- Waffe ---------------------
func void DIA_DIC_Corristo_Waffe ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_Waffe_15_00"); //Ich will eine neue Waffe!
	AI_Output (self, other, "DIA_DIC_Corristo_Waffe_14_01"); //Deine Wahl �berrascht mich nicht. Hier, nehme das Schwert. Vielleicht musst du noch etwas trainieren, bis du es benutzen kannst...

	B_GiveInvItems(self, other,Artos_Schwert,1);
	Info_ClearChoices (DIA_DIC_Corristo_Ja);
	};

// --------------------- Rune ---------------------
func void DIA_DIC_Corristo_Rune ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_Rune_15_00"); //Ich will eine Rune haben!
	AI_Output (self, other, "DIA_DIC_Corristo_Rune_14_01"); //Deine Wahl �berrascht mich. Hier ist deine Rune. Viel Gl�ck bei der Suche nach einem Lehrmeister!

	B_GiveInvItems(self, other,ItArRuneFirebolt,1);
	Info_ClearChoices (DIA_DIC_Corristo_Ja);
	};

// --------- R�stungen kaufen ---------------------
instance DIA_DIC_Corristo_Ruestungen (C_INFO)
	{
	npc			= DIC_2038_Corristo;
	nr			= 2;
	condition	= DIA_DIC_Corristo_Ruestungen_Condition;
	information	= DIA_DIC_Corristo_Ruestungen_Info;
	permanent	= 1;
	important = 0;
	description = "Ich will eine R�stung kaufen!";
	};

func int DIA_DIC_Corristo_Ruestungen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Corristo_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Corristo_Ruestungen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_Ruestungen_15_00"); //Ich will eine R�stung kaufen!
	AI_Output (self, other, "DIA_DIC_Corristo_Ruestungen_14_01"); //Na, dann schau doch mal, ob ich was f�r dich habe!

	Info_AddChoice(DIA_DIC_Corristo_Ruestungen, "Schattenkluft (450) 20 St�rke", DIA_DIC_Corristo_RuestA);
	Info_AddChoice(DIA_DIC_Corristo_Ruestungen, "Garder�stung  (900) 45 St�rke", DIA_DIC_Corristo_RuestB);
	Info_AddChoice(DIA_DIC_Corristo_Ruestungen, "Leichte S�ldnerr�stung (1350) 40 St�rke", DIA_DIC_Corristo_RuestC);
	Info_AddChoice(DIA_DIC_Corristo_Ruestungen, "Mittlere S�ldnerr�stung (1800) 60 St�rke", DIA_DIC_Corristo_RuestD);
	Info_AddChoice(DIA_DIC_Corristo_Ruestungen, "Schwere Gardistenr�stung (2250) 80 St�rke", DIA_DIC_Corristo_RuestE);
	Info_AddChoice(DIA_DIC_Corristo_Ruestungen, "Zur�ck", DIA_DIC_Corristo_Zurueck);
	};

func void DIA_DIC_Corristo_RuestA ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_RuestA_15_00"); //Ich nehme die Schattenkluft.
	if (Npc_HasItems(other, ItMiNugget) >= 450)
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_01"); //Hier hast du sie.
		CreateInvItem (self, STT_ARMOR_M);
		B_GiveInvItems(self, other, STT_ARMOR_M, 1);
		B_GiveInvItems(other, self, ItMiNugget, 450);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_Corristo_Ruestungen);
	};

func void DIA_DIC_Corristo_RuestB ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_RuestB_15_00"); //Ich nehme die Garder�stung.
	if (Npc_HasItems(other, ItMiNugget) >= 900)
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_01"); //Hier hast du sie.
		CreateInvItem (self, GRD_ARMOR_I);
		B_GiveInvItems(self, other, GRD_ARMOR_I, 1);
		B_GiveInvItems(other, self, ItMiNugget, 900);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_Corristo_Ruestungen);
	};

func void DIA_DIC_Corristo_RuestC ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_RuestC_15_00"); //Ich nehme die Leichte S�ldnerr�stung.
	if (Npc_HasItems(other, ItMiNugget) >= 1350)
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_01"); //Hier hast du sie.
		CreateInvItem (self, SLD_ARMOR_L);
		B_GiveInvItems(self, other, SLD_ARMOR_L, 1);
		B_GiveInvItems(other, self, ItMiNugget, 1350);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_Corristo_Ruestungen);
	};

func void DIA_DIC_Corristo_RuestD ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_RuestD_15_00"); //Ich nehme die Mittlere S�ldnerr�stung.
	if (Npc_HasItems(other, ItMiNugget) >= 1800)
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_01"); //Hier hast du sie.
		CreateInvItem (self, SLD_ARMOR_M);
		B_GiveInvItems(self, other, SLD_ARMOR_M, 1);
		B_GiveInvItems(other, self, ItMiNugget, 1800);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_Corristo_Ruestungen);
	};

func void DIA_DIC_Corristo_RuestE ()
	{
	AI_Output (other, self, "DIA_DIC_Corristo_RuestE_15_00"); //Ich nehme die Schwere Gardistenr�stung.
	if (Npc_HasItems(other, ItMiNugget) >= 2250)
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_01"); //Hier hast du sie.
		CreateInvItem (self, GRD_ARMOR_H);
		B_GiveInvItems(self, other, GRD_ARMOR_H, 1);
		B_GiveInvItems(other, self, ItMiNugget, 2250);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Corristo_RuestA_14_02"); //Du hast nicht genug Geld!
		};
	Info_ClearChoices (DIA_DIC_Corristo_Ruestungen);
	};
	
func void DIA_DIC_Corristo_Zurueck ()
	{
	Info_ClearChoices (DIA_DIC_Corristo_Ruestungen);
	};