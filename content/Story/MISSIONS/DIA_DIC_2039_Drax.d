//------------ ENDE -----------------
instance DIA_DIC_Drax_Exit (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 999;
	condition = DIA_DIC_Drax_Exit_Condition;
	information = DIA_DIC_Drax_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};
	
func int DIA_DIC_Drax_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_Drax_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// ---------------- Kampfarena -------------
instance DIA_DIC_Drax_Arena (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 1;
	condition = DIA_DIC_Drax_Arena_Condition;
	information = DIA_DIC_Drax_Arena_Info;
	permanent = 0;
	important = 0;
	description = "Was ist das hier?";
	};
	
func int DIA_DIC_Drax_Arena_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_Drax_Arena_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_Arena_15_00"); //Was ist das hier?
	AI_Output (self, other, "DIA_DIC_Drax_Arena_06_01"); //Das hier ist die Arena. Du kannst hier gegen einige Monster kämpfen.
	AI_Output (other, self, "DIA_DIC_Drax_Arena_15_02"); //Und was ist, wenn ich zu schwach für die Monster bin?
	AI_Output (self, other, "DIA_DIC_Drax_Arena_06_03"); //Von uns wird keiner in den Kampf eingreifen. Überlege deswegen gut, ob du wirklich kämpfen willst.
	AI_Output (other, self, "DIA_DIC_Drax_Arena_15_04"); //Und was ist für mich drin?
	AI_Output (self, other, "DIA_DIC_Drax_Arena_06_05"); //Für deinen ersten gewonnen Kampf zeige ich dir, wie du etwas stärker wirst.
	AI_Output (self, other, "DIA_DIC_Drax_Arena_06_06"); //Nach dem dritten erfolgreichen Kampf bekommst du ein neues Schwert von mir.
	AI_Output (self, other, "DIA_DIC_Drax_Arena_06_07"); //Der fünfte Sieg lässt dich zu einem 6. Kampf zu. Gewinnst du auch diesen, so bringe ich dir bei, wie du richtig schleichst.
	
	Log_CreateTopic (DieKampfArena,  LOG_MISSION);
	Log_SetTopicStatus (DieKampfArena, LOG_RUNNING);
	B_LogEntry (DieKampfArena, "In der Arena in der Stadt kann ich gegen einige Monster kämpfen. Nach 6 siegen lehrt mich Rictiovarus das richtige Schleichen.");
	};
	
// ----------- Was sind das für Kämpfe? ---------
instance DIA_DIC_Drax_Kampf (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 2;
	condition = DIA_DIC_Drax_Kampf_Condition;
	information = DIA_DIC_Drax_Kampf_Info;
	permanent = 0;
	important = 0;
	description = "Was sind das für Kämpfe?";
	};
	
func int DIA_DIC_Drax_Kampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_Arena))
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_Kampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_Kampf_15_00"); //Was sind das für Kämpfe?
	AI_Output (self, other, "DIA_DIC_Drax_Kampf_06_01"); //Du kannst dir die Reihenfolge selbst aussuchen. Du musst gegen einen Scavenger, einen Molerat, einen Lurker, einen Wolf und eine Blutfliege kämpfen.
	};
	
// --------------- Kampf gegen Scavenger ------------
instance DIA_DIC_Drax_ScavKampf (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 3;
	condition = DIA_DIC_Drax_ScavKampf_Condition;
	information = DIA_DIC_Drax_ScavKampf_Info;
	permanent = 0;
	important = 0;
	description = "Ich will gegen den Scavenger kämpfen!";
	};
	
func int DIA_DIC_Drax_ScavKampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_Kampf) && KampfInArena == 0)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_ScavKampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_ScavKampf_15_00"); //Ich will gegen den Scavenger kämpfen!
	AI_Output (self, other, "DIA_DIC_Drax_ScavKampf_06_01"); //Okay, gehe in die Arena. Dort wird er auf dich warten!
	
	Monsterwahl = 1;
	KampfInArena = 1;
	AI_StopProcessInfos (self);
	};
	
// ----------- Scavenger besiegt ------------
instance DIA_DIC_Drax_ScavBesiegt (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 4;
	condition = DIA_DIC_Drax_ScavBesiegt_Condition;
	information = DIA_DIC_Drax_ScavBesiegt_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe den Scavenger besiegt.";
	};
	
func int DIA_DIC_Drax_ScavBesiegt_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_ScavKampf) && Npc_IsDead(Arena_Scavenger)) && Monsterwahl == 0
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_ScavBesiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_ScavBesiegt_15_00"); //Ich habe den Scavenger besiegt.
	AI_Output (self, other, "DIA_DIC_Drax_ScavBesiegt_06_01"); //Der war sicher nicht sonderlich fordernd. Aber wie dem auch sei, dein Sieg zählt.
	
	KampfInArena = 0;
	B_LogEntry (DieKampfArena, "Ich habe den Scavenger besiegt.");
	BesiegteGegnerZahl = BesiegteGegnerZahl + 1;
	};
	
// --------------- Kampf gegen Molerat ------------
instance DIA_DIC_Drax_MoleratKampf (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 5;
	condition = DIA_DIC_Drax_MoleratKampf_Condition;
	information = DIA_DIC_Drax_MoleratKampf_Info;
	permanent = 0;
	important = 0;
	description = "Ich will gegen den Molerat kämpfen!";
	};
	
func int DIA_DIC_Drax_MoleratKampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_Kampf) && KampfInArena == 0)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_MoleratKampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_MoleratKampf_15_00"); //Ich will gegen den Molerat kämpfen!
	AI_Output (self, other, "DIA_DIC_Drax_MoleratKampf_06_01"); //Okay, gehe in die Arena. Dort wird er auf dich warten!
	
	Monsterwahl = 2;
	KampfInArena = 1;
	AI_StopProcessInfos (self);
	};
	
// ----------- Molerat besiegt ------------
instance DIA_DIC_Drax_MoleratBesiegt (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 6;
	condition = DIA_DIC_Drax_MoleratBesiegt_Condition;
	information = DIA_DIC_Drax_MoleratBesiegt_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe den Molerat besiegt!";
	};
	
func int DIA_DIC_Drax_MoleratBesiegt_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_MoleratKampf) && Npc_IsDead(Arena_Molerat)) && Monsterwahl == 0
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_MoleratBesiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_MoleratBesiegt_15_00"); //Ich habe den Molerat besiegt!
	AI_Output (self, other, "DIA_DIC_Drax_MoleratBesiegt_06_01"); //Der war doch auch noch einfach. Aber okay, du hast ihn besiegt.	
	KampfInArena = 0;
	B_LogEntry (DieKampfArena, "Der Molerat ist erledigt.");
	BesiegteGegnerZahl = BesiegteGegnerZahl + 1;
	};
	
// --------------- Kampf gegen Lurker ------------
instance DIA_DIC_Drax_LurkerKampf (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 7;
	condition = DIA_DIC_Drax_LurkerKampf_Condition;
	information = DIA_DIC_Drax_LurkerKampf_Info;
	permanent = 0;
	important = 0;
	description = "Ich will gegen den Lurker kämpfen!";
	};
	
func int DIA_DIC_Drax_LurkerKampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_Kampf) && KampfInArena == 0)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_LurkerKampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_LurkerKampf_15_00"); //Ich will gegen den Lurker kämpfen!
	AI_Output (self, other, "DIA_DIC_Drax_LurkerKampf_06_01"); //Okay, gehe in die Arena. Dort wird er auf dich warten!
	
	Monsterwahl = 3;
	KampfInArena = 1;
	AI_StopProcessInfos (self);
	};
	
// ----------- Lurker besiegt ------------
instance DIA_DIC_Drax_LurkerBesiegt (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 8;
	condition = DIA_DIC_Drax_LurkerBesiegt_Condition;
	information = DIA_DIC_Drax_LurkerBesiegt_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe den Lurker besiegt!";
	};
	
func int DIA_DIC_Drax_LurkerBesiegt_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_LurkerKampf) && Npc_IsDead(Arena_Lurker)) && Monsterwahl == 0
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_LurkerBesiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_LurkerBesiegt_15_00"); //Ich habe den Lurker besiegt!
	AI_Output (self, other, "DIA_DIC_Drax_LurkerBesiegt_06_01"); //Na, dass war doch schon anstregend. Eine gute Leistung von dir!	
	KampfInArena = 0;
	B_LogEntry (DieKampfArena, "Der Lurker wacht nicht mehr auf.");
	BesiegteGegnerZahl = BesiegteGegnerZahl + 1;
	};
	
// --------------- Kampf gegen Wolf ------------
instance DIA_DIC_Drax_WolfKampf (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 9;
	condition = DIA_DIC_Drax_WolfKampf_Condition;
	information = DIA_DIC_Drax_WolfKampf_Info;
	permanent = 0;
	important = 0;
	description = "Ich will gegen den Wolf kämpfen!";
	};
	
func int DIA_DIC_Drax_WolfKampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_Kampf) && KampfInArena == 0)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_WolfKampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_WolfKampf_15_00"); //Ich will gegen den Wolf kämpfen!
	AI_Output (self, other, "DIA_DIC_Drax_WolfKampf_06_01"); //Okay, gehe in die Arena. Dort wird er auf dich warten!
	
	Monsterwahl = 4;
	KampfInArena = 1;
	AI_StopProcessInfos (self);
	};
	
// ----------- Wolf besiegt ------------
instance DIA_DIC_Drax_WolfBesiegt (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 10;
	condition = DIA_DIC_Drax_WolfBesiegt_Condition;
	information = DIA_DIC_Drax_WolfBesiegt_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe den Wolf besiegt!";
	};
	
func int DIA_DIC_Drax_WolfBesiegt_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_WolfKampf) && Npc_IsDead(Arena_Wolf)) && Monsterwahl == 0
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_WolfBesiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_WolfBesiegt_15_00"); //Ich habe den Wolf besiegt!
	AI_Output (self, other, "DIA_DIC_Drax_WolfBesiegt_06_01"); //Super, der Wolf war ein starker Gegner!
	KampfInArena = 0;
	B_LogEntry (DieKampfArena, "Den Wolf habe ich erschlagen.");
	BesiegteGegnerZahl = BesiegteGegnerZahl + 1;
	};
	
// --------------- Kampf gegen Blutfliege ------------
instance DIA_DIC_Drax_BlutfliegeKampf (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 11;
	condition = DIA_DIC_Drax_BlutfliegeKampf_Condition;
	information = DIA_DIC_Drax_BlutfliegeKampf_Info;
	permanent = 0;
	important = 0;
	description = "Ich will gegen die Blutfliege kämpfen!";
	};
	
func int DIA_DIC_Drax_BlutfliegeKampf_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_Kampf) && KampfInArena == 0)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_BlutfliegeKampf_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_BlutfliegeKampf_15_00"); //Ich will gegen den Blutfliege kämpfen!
	AI_Output (self, other, "DIA_DIC_Drax_BlutfliegeKampf_06_01"); //Okay, gehe in die Arena. Dort wird er auf dich warten!
	
	Monsterwahl = 5;
	KampfInArena = 1;
	AI_StopProcessInfos (self);
	};
	
// ----------- Blutfliege besiegt ------------
instance DIA_DIC_Drax_BlutfliegeBesiegt (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 12;
	condition = DIA_DIC_Drax_BlutfliegeBesiegt_Condition;
	information = DIA_DIC_Drax_BlutfliegeBesiegt_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe die Blutfliege besiegt!";
	};
	
func int DIA_DIC_Drax_BlutfliegeBesiegt_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Drax_BlutfliegeKampf) && Npc_IsDead(Arena_Blutfliege)) && Monsterwahl == 0
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_BlutfliegeBesiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_BlutfliegeBesiegt_15_00"); //Ich habe die Blutfliege besiegt!
	AI_Output (self, other, "DIA_DIC_Drax_BlutfliegeBesiegt_06_01"); //Nicht schlecht, nicht schlecht!
	KampfInArena = 0;
	B_LogEntry (DieKampfArena, "Die Blutfliege nach niemanden mehr schaden.");
	BesiegteGegnerZahl = BesiegteGegnerZahl + 1;
	};

// --------------- 1 Sieg => Stärker ----------------
instance DIA_DIC_Drax_1_Sieg (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 13;
	condition = DIA_DIC_Drax_1_Sieg_Condition;
	information = DIA_DIC_Drax_1_Sieg_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe ein mal gewonnen!";
	};
	
func int DIA_DIC_Drax_1_Sieg_Condition ()
	{
	if (BesiegteGegnerZahl >= 1)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_1_Sieg_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_1_Sieg_15_00"); //Ich habe einmal gewonnen!
	AI_Output (self, other, "DIA_DIC_Drax_1_Sieg_06_01"); //Hör mir zu: Du musst dein Gewicht in den Schlag legen, damit er stärker wird!
	PrintScreen	("Stärke +3", -1,-1,"font_old_20_white.tga",3);
	Npc_ChangeAttribute (hero, ATR_STRENGTH, 3);
	};
	
// --------------- 3 Siege => Schwert ---------------
instance DIA_DIC_Drax_3_Sieg (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 14;
	condition = DIA_DIC_Drax_3_Sieg_Condition;
	information = DIA_DIC_Drax_3_Sieg_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe drei mal gewonnen!";
	};
	
func int DIA_DIC_Drax_3_Sieg_Condition ()
	{
	if (BesiegteGegnerZahl >= 3)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_3_Sieg_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_3_Sieg_15_00"); //Ich habe dreimal gewonnen!
	AI_Output (self, other, "DIA_DIC_Drax_3_Sieg_06_01"); //Hier, da hast du dein neues Schwert.
	
	B_GiveInvItems(self, other,ItMw_1H_Sword_Short_05,1);
	};
	
// --------------- 5 Siege => Bonuskampf ------------
instance DIA_DIC_Drax_5_Sieg (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 14;
	condition = DIA_DIC_Drax_5_Sieg_Condition;
	information = DIA_DIC_Drax_5_Sieg_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe fünf mal gewonnen und will den letzten Kampf!";
	};
	
func int DIA_DIC_Drax_5_Sieg_Condition ()
	{
	if (BesiegteGegnerZahl >= 5)
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_5_Sieg_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_5_Sieg_15_00"); //Ich habe fünf mal gewonnen und will den letzten Kampf!
	AI_Output (self, other, "DIA_DIC_Drax_5_Sieg_06_01"); //So sei es. Gehe in die Arena, dein Gegner wird dort auf dich warten.
	
	Monsterwahl = 6;
	KampfInArena = 1;
	AI_StopProcessInfos (self);
	};

// --------------- 6 Siege => Schleichen ------------
instance DIA_DIC_Drax_OrkBesiegt (C_INFO)
	{
	npc = DIC_2039_Drax;
	nr = 15;
	condition = DIA_DIC_Drax_OrkBesiegt_Condition;
	information = DIA_DIC_Drax_OrkBesiegt_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe auch den letzten Kampf gewonnen!";
	};
	
func int DIA_DIC_Drax_OrkBesiegt_Condition ()
	{
	if (Npc_IsDead(Arena_Ork) && Npc_KnowsInfo (other, DIA_DIC_Drax_5_Sieg)) && Monsterwahl == 0
		{
		return 1;
		};
	};
	
func void DIA_DIC_Drax_OrkBesiegt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Drax_OrkBesiegt_15_00"); //Ich habe auch den letzten Kampf gewonnen!
	AI_Output (self, other, "DIA_DIC_Drax_OrkBesiegt_06_01"); //Du hast den Ork besiegt? Wow!
	
	if (B_GiveSkill(other,NPC_TALENT_SNEAK, 1, 0))
		{
		AI_Output (self, other, "DIA_DIC_Drax_OrkBesiegt_06_02"); //Beim schleichen musst du darauf achten, möglichst leise zu gehen. Wenn du dabei noch sehr langsam gehst, so wird man dich kaum bemerken.	
		};
		
	BesiegteGegnerZahl = BesiegteGegnerZahl + 1;
	KampfInArena = 0;
	B_LogEntry (DieKampfArena, "Ich habe nun auch den Ork besiegt und das schleichen gelernt.");
	Log_SetTopicStatus (DieKampfArena, LOG_SUCCESS);
	B_GiveXP (250);
	};