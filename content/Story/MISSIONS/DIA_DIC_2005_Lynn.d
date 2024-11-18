// -------------- Exit --------------


INSTANCE DIA_DIC_Lynn_Exit (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 999;
	condition = DIA_dic_Lynn_Exit_Condition;
	information = DIA_dic_Lynn_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_dic_Lynn_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_dic_Lynn_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ------------ Raffa schickt mich -----------

instance DIA_DIC_Lynn_Raffa (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 1;
	condition = DIA_DIC_Lynn_Raffa_Condition;
	information = DIA_DIC_Lynn_Raffa_Info;
	permanent = 0;
	description = "Raffa schickt mich";
	};

func int DIA_DIC_Lynn_Raffa_Condition()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Raffa_Hallo))
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_Raffa_Info()
	{
	AI_Output (other, self, "DIA_DIC_Lynn_Raffa_15_00"); //Hallo. Raffa schickt mich. Ich soll dich zu ihm bringen.
	AI_Output (self, other, "DIA_DIC_Lynn_Raffa_16_01"); //Was? Raffa hat dich geschickt? Dann werde ich ihn bald wiedersehen? Ich kann es kaum erwarten. Wann kann ich zu ihm?
	};

// --------------- Hole dich raus -------------------

instance DIA_DIC_Lynn_Rausholen (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 2;
	condition = DIA_DIC_Lynn_Rausholen_Condition;
	information = DIA_DIC_Lynn_Rausholen_Info;
	permanent = 0;
	description ="Ich weiß noch nicht, wie ich dich hier rauslotsen soll.";
	};

func int DIA_DIC_Lynn_Rausholen_Condition()
	{
	if NPC_KnowsInfo (hero, DIA_DIC_Lynn_Raffa)
	&& !NPC_KnowsInfo (hero, DIA_DIC_Lynn_Herausholen)
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_Rausholen_Info()
	{
	AI_Output (other, self, "DIA_DIC_Lynn_Rausholen_15_00"); //Ich weiß noch nicht, wie ich dich hier herausbringen soll. Aber ich finde schon einen Weg.
	AI_Output (self, other, "DIA_DIC_Lynn_Rausholen_16_01"); //Beeil dich. Ich warte auf dich.
	AI_Output (other, self, "DIA_DIC_Lynn_Rausholen_15_02"); //Ich bin schon unterwegs.
	};

// --------------- Hast du Idee -------------------

instance DIA_DIC_Lynn_Idee (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 3;
	condition = DIA_DIC_Lynn_Idee_Condition;
	information = DIA_DIC_Lynn_Idee_Info;
	permanent = 0;
	description = "Hast du eine Idee?";
	};

func int DIA_DIC_Lynn_Idee_Condition()
	{
	if (NPC_KnowsInfo (hero, DIA_DIC_Lynn_Raffa))
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_Idee_Info()
	{
	AI_Output (other, self, "DIA_DIC_Lynn_Idee_15_00"); //Hast du vielleicht eine Idee, wie ich dich an der Wache vorbeibringen kann?
	AI_Output (self, other, "DIA_DIC_Lynn_Idee_16_01"); //Wenn ich einen Weg wüsste, wäre ich schon bei ihm. Was für eine einfältige Frage.
	AI_Output (other, self, "DIA_DIC_Lynn_Idee_15_02"); //Wenn ich nicht für Raffa arbeiten müsste, würde ich dir spätestens jetzt nicht mehr helfen. 
	AI_Output (self, other, "DIA_DIC_Lynn_Idee_16_03"); //Du bist doch fast noch ein Kind. Was willst du schon ausrichten?
	};

// --------------- Idee, herauszuholen -------------------
instance DIA_DIC_Lynn_Herausholen (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 4;
	condition = DIA_DIC_Lynn_Herausholen_Condition;
	information = DIA_DIC_Lynn_Herausholen_Info;
	permanent = 0;
	description = "Hier Lynn. Das ist die Lösung.";
	};

func int DIA_DIC_Lynn_Herausholen_Condition()
	{
	if (Npc_HasItems(other, Snd_Robe) >= 1 && NPC_KnowsInfo (hero, DIA_DIC_Lynn_Raffa))
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_Herausholen_Info()
	{
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_00"); //Hier Lynn. Das ist die Lösung. Streif diese Robe über. Wenn du zu Raffa in die Festung gehst, werden dich die Wachen für einen Magier halten, und dich passieren lassen.

	B_GiveInvItems(other, self,Snd_Robe,1);
	// CreateInvItem	(self, BabeRobe);		// hat sie nun gleich -Harri

	AI_Output (self, other, "DIA_DIC_Lynn_Herausholen_16_01"); //Eine Robe? Das ist eine gute Idee. Also los...
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_02"); //Halt! Mir fällt da gerade etwas ein.
	AI_Output (self, other, "DIA_DIC_Lynn_Herausholen_16_03"); //Was? ist denn?
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_04"); //Wir können nicht gehen.
	AI_Output (self, other, "DIA_DIC_Lynn_Herausholen_16_05"); //Was?
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_06"); //Seit Stunden hat kein Magier das Waschhaus betreten. Die Wache wird misstrauisch, wenn plötzlich ein Magier das Waschhaus verlässt, ohne vorher ein Magier eines der Häuser aufgesucht hat.
	AI_Output (self, other, "DIA_DIC_Lynn_Herausholen_16_07"); //Dann schwimme ich einfach rüber, ans Ufer.
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_08"); //Nein, die Söldner auf der anderen Seite würden dich sofort entdecken. 
	AI_Output (self, other, "DIA_DIC_Lynn_Herausholen_16_09"); //Dann versuch die Wache abzulenken. Verwickle ihn in ein Gespräch. Sobald ich höre das er länger mit dir redet, versuche ich mich wegzuschleichen.
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_10"); //Ok, ich probiere das.
	AI_Output (self, other, "DIA_DIC_Lynn_Herausholen_16_11"); //Wenn das nicht klappt, lass dir was anderes einfallen.
	AI_Output (other, self, "DIA_DIC_Lynn_Herausholen_15_12"); //Ich versuche es.
	
	B_LogEntry (RaffasAufgabe, "Ich habe Lynn zwar eine Magierrobe gebracht, aber da schon lange kein Magier in den Waschhütten war, muss mir noch was einfallen, damit wir hier raus kommen.");
	};

// ----- Wache will sich nicht ablenken lassen --------------
instance DIA_DIC_Lynn_ProblemWache (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 5;
	condition = DIA_DIC_Lynn_ProblemWache_Condition;
	information = DIA_DIC_Lynn_ProblemWache_Info;
	permanent = 0;
	description = "Es klappt nicht.";
	};

func int DIA_DIC_Lynn_ProblemWache_Condition()
	{
	if (NPC_KnowsInfo(hero, DIA_DIC_Waechter_Versuch_B) && NPC_KnowsInfo (hero, DIA_DIC_Waechter_Versuch_A))
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_ProblemWache_Info()
	{
	AI_Output (other, self, "DIA_DIC_Lynn_ProblemWache_15_00"); //Es klappt nicht.
	AI_Output (self, other, "DIA_DIC_Lynn_ProblemWache_16_01"); //Denk dir was aus!!

	Npc_ExchangeRoutine	(DIC_2006_Waechter,"GEWECHSELT");
	Npc_ExchangeRoutine	(DIC_2026_Waechter,"GEWECHSELT");
	AI_StopProcessInfos	(self);
	};

// -------- Wachwechsel --------
instance DIA_DIC_Lynn_Wachwechsel (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 6;
	condition = DIA_DIC_Lynn_Wachwechsel_Condition;
	information = DIA_DIC_Lynn_Wachwechsel_Info;
	permanent = 0;
	description = "Draußen war gerade der Wachwechsel.";
	};

func int DIA_DIC_Lynn_Wachwechsel_Condition()
	{
	if NPC_KnowsInfo(hero, DIA_DIC_Lynn_ProblemWache) 
	&& Npc_GetDistToNpc(DIC_2006_Waechter, DIC_2005_Lynn) > 700
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_Wachwechsel_Info()
	{
	AI_Output (other, self, "DIA_DIC_Lynn_Wachwechsel_15_00"); //Wir können gehen. Draußen war gerade der Wachwechsel.
	AI_Output (self, other, "DIA_DIC_Lynn_Wachwechsel_16_01"); //Gut. Riskieren wir es. Ich folge dir.

	AI_EquipArmor(self, BabeRobe);
	AI_StopProcessInfos	(self);

	Mdl_ApplyOverlayMds (self,"Babe_Robe.mds");

	//				Body-Mesh		Body-Tex	Skin-Color	  Head-MMS		Head-Tex	Teeth-Tex	ARMOR
	//Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	0, 	  	4,		"Bab_Head_Hair1", 	3,  		DEFAULT, 	BabeRobe);
	//AI_StartState(self, ZS_FollowPC, 0, "");

	Npc_ExchangeRoutine	(self,"FOLGEN");
	TaliasanAuftraege  = 3;
	B_GiveXP (250);
	
	B_LogEntry (RaffasAufgabe, "Nach einem Wachwechsel kann ich versuchen, mit Lynn loszugehen.");
	};

// --------------- Zusammengeführt -------------------

instance DIA_DIC_Lynn_Vereint (C_INFO)
	{
	npc = DIC_2005_Lynn;
	nr = 7;
	condition = DIA_DIC_Lynn_Vereint_Condition;
	information = DIA_DIC_Lynn_Vereint_Info;
	permanent = 0;
	important = 1;
	description = "Danke.";
	};

func int DIA_DIC_Lynn_Vereint_Condition()
	{
	if (NPC_KnowsInfo (hero, DIA_DIC_Raffa_Lynn))
		{
		return 1;
		};
	};

func void DIA_DIC_Lynn_Vereint_Info()
	{
	AI_Output (self, other, "DIA_DIC_Lynn_Vereint_16_00"); //Ich bin dir so dankbar. Du weißt nicht welches Glück du mir mit deiner Hilfe geschenkt hast. Endlich darf ich Raffa wiedersehen.

	AI_StopProcessInfos	(self);
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0", 	2, 	  	1,		"Bab_Head_Hair1", 	3,  		DEFAULT, 	-1);
	// AI_UnequipArmor (self);				// warum?  würde doch normal auffallen -Harri

	Npc_ExchangeRoutine	(self,"BEFREIT");
	Npc_ExchangeRoutine	(dic_2004_Raffa,"LYNN");
	AI_ContinueRoutine (dic_2004_Raffa);
	};