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
	 if (Npc_HasItems(other, Py_Empf) >= 1)  // Hier nach Graveyarn best�tigung noch ende setzen
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
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_04"); //Was hast du so an Sachen bei dir? Was ist das? Ein Brief? "Taliasans hervorragende F�higkeiten. Von Pyt f�r Berengar" - Oh. Ich glaube nicht, dass Maldive dar�ber erfreut sein wird. Und erst Graveyarn wird nicht gerade gl�cklich sein, wenn er h�rt, dass du f�r Taliasan arbeitest. Denn darum geht es hier doch!
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_05"); //Ich arbeite nicht f�r ihn, nein. Der Brief ist ... f�r...
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_06"); //(lacht) Mach's gut Junge.
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_07"); //Warte... was soll ich tun, damit du nichts verr�tst und mir den Brief zur�ck gibst?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_08"); //Ha ha ha. Ok. Da w�re etwas. Du k�nntest etwas f�r mich erledigen. 
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_09"); //Und was?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_10"); //In den W�ldern, westlich von hier, liegt die Leiche eines Sp�hers. Er sollte als Vorhut f�r unsere J�ger den Bestand der W�lfe z�hlen. Er war auf dem R�ckweg, als die W�lfe ihn t�teten. Ich brauche sein Notizbuch, denn Berengar braucht es. Nur bis jetzt hat sich noch keiner in den Wald hineingewagt, um das Buch zu holen. 
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_11"); //Wieso schickt Berengar nicht seine J�ger in den Wald?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_12"); //Berengar wird erst in ein oder zwei Tagen einen Trupp rausschicken. Aber wenn er h�rt, dass jemand so mutig war, das Buch vorher zu holen, dann w�re das sicherlich mit einer  Belohnung verbunden. Denn wenn Berengar einen Namen in guter Erinnerung beh�lt, ist das mit Gold kaum zu bezahlen. 
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_13"); //Und ich soll das Buch f�r dich da rausholen?
	AI_Output (self, other, "DIA_DIC_Gabb_Erwischt_09_14"); //Nein. Du sollst nicht, du musst das Notizbuch da rausholen! Sonst landet dein Brief bei Graveyarn.
	AI_Output (other, self, "DIA_DIC_Gabb_Erwischt_15_15"); //Mir bleibt wohl keine andere Wahl. Ich mach es.

	B_LogEntry (TaliasansNeueAuftraege, "Gabb hat mich erwischt, als ich den Brief f�r Pyt zu Taliasan hinbringen wollte. Er hat nun herausgefunden das ich f�r Taliasan anstatt f�r Graveyarn arbeite. Nur wenn ich f�r ihn ein Wolfsrevier im westlichen Wald aufsuche und ein Notizbuch von einem toten Sp�her f�r ihn beschaffe, gibt er mir das Buch zur�ck und wahrt stillschweigen.");

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
	AI_Output (self, other, "DIA_DIC_Gabb_Block_09_01"); //Sehr gut Junge. Wir sollten �fter zusammenarbeiten.

	B_GiveInvItems(self, other,Py_Empf,1);
	B_GiveInvItems(other, self,Notizblock,1);
	
	B_LogEntry (TaliasansNeueAuftraege, "Ich habe von Gabb Pyt's Brief zur�ckbekommen.");
	
	B_GiveXP (750);
	};

// ------ Schl�ssel f�r Fiebeler --------
instance DIA_DIC_Gabb_Schluessel (C_INFO)
	{
	npc = DIC_2010_Gabb;
	nr = 3;
	condition = DIA_DIC_Gabb_Schluessel_Condition;
	information = DIA_DIC_Gabb_Schluessel_Info;
	important = 0;
	permanent = 0;
	description = "Ich soll f�r Fiebeler einen Schl�ssel holen!";
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
	AI_Output (other, self, "DIA_DIC_Gabb_Schluessel_15_00"); //Ich soll f�r Fiebeler einen Schl�ssel holen!
	AI_Output (self, other, "DIA_DIC_Gabb_Schluessel_09_01"); //Gut das du kommst. Ich konnte Fiebeler nirgends finden. Hier, bring ihn den Schl�ssel
	CreateInvItem	(self, Fi_Key);
	B_GiveInvItems(self, other, Fi_Key, 1);
	
	B_GiveXP (150);
	
	B_LogEntry (RhetorikQuest, "Ich habe den Schl�ssel f�r Fiebeler von Gabb bekommen.");
	};
