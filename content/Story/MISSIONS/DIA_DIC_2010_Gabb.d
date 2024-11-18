//------------ ENDE -----------------
instance DIA_DIC_Gabb_Exit (C_INFO)
	{
	npc = DIC_2010_Gabb;
	nr = 999;
	condition = DIA_DIC_Gabb_Exit_Condition;
	information = DIA_DIC_Gabb_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Gabb_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Gabb_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ---------------- Erwischt werden -------------
instance DIA_DIC_Gabb_Erwischt ( C_INFO)
	{
	npc = DIC_2010_Gabb;
	nr = 1;
	condition = DIA_DIC_Gabb_Erwischt_Condition;
	information = DIA_DIC_Gabb_Erwischt_Info;
	important = 1;
	permanent = 0;
	description = "Hey Junge";
	};

func int DIA_DIC_Gabb_Erwischt_Condition ()
	 {
	 if (Npc_HasItems(other, Py_Empf) >= 1)  // Hier nach Graveyarn bestätigung noch ende setzen
	 	{
	 	return 1;
	 	};
	 };

func void DIA_DIC_Gabb_Erwischt_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_00"); //Hey Junge. Wohin des Wegs? Warte doch mal...
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_01"); //Ich habe keine Zeit.
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_02"); //Graveyarn schickt mich. Ich denke mal, du wirst dir jetzt die Zeit nehmen, oder?
	//AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_03"); //Also was ist?
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_09"); //Und was?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_04"); //Was hast du so an Sachen bei dir? Was ist das? Ein Brief? "Taliasans hervorragende Fähigkeiten. Von Pyt für Berengar" - Oh. Ich glaube nicht, dass Maldive darüber erfreut sein wird. Und erst Graveyarn wird nicht gerade glücklich sein, wenn er hört, dass du für Taliasan arbeitest. Denn darum geht es hier doch!
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_05"); //Ich arbeite nicht für ihn, nein. Der Brief ist ... für...
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_06"); //(lacht) Mach's gut Junge.
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_07"); //Warte... was soll ich tun, damit du nichts verrätst und mir den Brief zurück gibst?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_08"); //Ha ha ha. Ok. Da wäre etwas. Du könntest etwas für mich erledigen. 
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_09"); //Und was?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_10"); //In den Wäldern, westlich von hier, liegt die Leiche eines Spähers. Er sollte als Vorhut für unsere Jäger den Bestand der Wölfe zählen. Er war auf dem Rückweg, als die Wölfe ihn töteten. Ich brauche sein Notizbuch, denn Berengar braucht es. Nur bis jetzt hat sich noch keiner in den Wald hineingewagt, um das Buch zu holen. 
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_11"); //Wieso schickt Berengar nicht seine Jäger in den Wald?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_12"); //Berengar wird erst in ein oder zwei Tagen einen Trupp rausschicken. Aber wenn er hört, dass jemand so mutig war, das Buch vorher zu holen, dann wäre das sicherlich mit einer  Belohnung verbunden. Denn wenn Berengar einen Namen in guter Erinnerung behält, ist das mit Gold kaum zu bezahlen. 
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_13"); //Und ich soll das Buch für dich da rausholen?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_14"); //Nein. Du sollst nicht, du musst das Notizbuch da rausholen! Sonst landet dein Brief bei Graveyarn.
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_15"); //Mir bleibt wohl keine andere Wahl. Ich mach es.

	B_LogEntry (TaliasansNeueAuftraege, "Gabb hat mich erwischt, als ich den Brief für Pyt zu Taliasan hinbringen wollte. Er hat nun herausgefunden das ich für Taliasan anstatt für Graveyarn arbeite. Nur wenn ich für ihn ein Wolfsrevier im westlichen Wald aufsuche und ein Notizbuch von einem toten Späher für ihn beschaffe, gibt er mir das Buch zurück und wahrt stillschweigen.");

	B_GiveInvItems(other, self,Py_Empf,1);
	};

// ---------------- Notizblock bringen -------------
instance DIA_DIC_Gabb_Block ( C_INFO)
	{
	npc = DIC_2010_Gabb;
	nr = 2;
	condition = DIA_DIC_Gabb_Block_Condition;
	information = DIA_DIC_Gabb_Block_Info;
	important = 0;
	permanent = 0;
	description = "Hier ist das Notizbuch.";
	};

func int DIA_DIC_Gabb_Block_Condition ()
	 {
	 if (Npc_HasItems(other, Notizblock) >= 1 && Npc_KnowsInfo(other, DIA_DIC_Gabb_Erwischt))
	 	{
	 	return 1;
	 	};
	 };

func void DIA_DIC_Gabb_Block_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gabb_Block_15_00"); //Hier ist das Notizbuch.
	AI_Output (self, other, "DIA_DIC_Gabb_Block_09_01"); //Sehr gut Junge. Wir sollten öfter zusammenarbeiten.

	B_GiveInvItems(self, other,Py_Empf,1);
	B_GiveInvItems(other, self,Notizblock,1);
	
	B_LogEntry (TaliasansNeueAuftraege, "Ich habe von Gabb Pyt's Brief zurückbekommen.");
	
	B_GiveXP (750);
	};

// ------ Schlüssel für Fiebeler --------
instance DIA_DIC_Gabb_Schluessel (C_INFO)
	{
	npc = DIC_2010_Gabb;
	nr = 3;
	condition = DIA_DIC_Gabb_Schluessel_Condition;
	information = DIA_DIC_Gabb_Schluessel_Info;
	important = 0;
	permanent = 0;
	description = "Ich soll für Fiebeler einen Schlüssel holen!";
	};

func int DIA_DIC_Gabb_Schluessel_Condition ()
	{
	if (FiebelerRaetsel == 2)
		{
		return 1;
		};
	};

func void DIA_DIC_Gabb_Schluessel_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gabb_Schluessel_15_00"); //Ich soll für Fiebeler einen Schlüssel holen!
	AI_Output (self, other, "DIA_DIC_Gabb_Schluessel_09_01"); //Gut das du kommst. Ich konnte Fiebeler nirgends finden. Hier, bring ihn den Schlüssel
	CreateInvItem	(self, Fi_Key);
	B_GiveInvItems(self, other, Fi_Key, 1);
	
	B_GiveXP (150);
	
	B_LogEntry (RhetorikQuest, "Ich habe den Schlüssel für Fiebeler von Gabb bekommen.");
	};
