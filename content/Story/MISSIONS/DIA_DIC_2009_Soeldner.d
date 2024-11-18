//------------ ENDE -----------------
instance DIA_DIC_Soeldner_Exit (C_INFO)
	{
	npc = DIC_2009_Soeldner;
	nr = 999;
	condition = DIA_DIC_Soeldner_Exit_Condition;
	information = DIA_DIC_Soeldner_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Soeldner_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Soeldner_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------ Ei gegen Schwert ----------
instance DIA_DIC_Soeldner_Ei (C_INFO)
	{
	npc = DIC_2009_Soeldner;
	nr = 1;
	condition = DIA_DIC_Soeldner_Ei_Condition;
	information = DIA_DIC_Soeldner_Ei_Info;
	permanent = 0;
	description = "Hey. Was tust du hier?";
	};

func int DIA_DIC_Soeldner_Ei_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Taylor_Auftrag)) //Wenn von Pyt geschickt, dann DIA_DIC_Pyt_Annehmen als Bedingung
		{
		return 1;
		};
	};

func void DIA_DIC_Soeldner_Ei_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Soeldner_Ei_15_00"); //Hey. Was tust du hier?
	AI_Output (self, other, "DIA_DIC_Soeldner_Ei_14_01"); //Wache halten. Wenn sich hier ein paar Fremde oder Orks herumtreiben, stehen Probleme an. Schickt Graveyarn dich?
	};

// ------------ Pyt schickt mich ----------
instance DIA_DIC_Soeldner_Pyt (C_INFO)
	{
	npc = DIC_2009_Soeldner;
	nr = 2;
	condition = DIA_DIC_Soeldner_Pyt_Condition;
	information = DIA_DIC_Soeldner_Pyt_Info;
	permanent = 0;
	description = "Pyt schickt mich.";
	};

func int DIA_DIC_Soeldner_Pyt_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Soeldner_Ei) && !Npc_KnowsInfo(other, DIA_DIC_Soeldner_Tausch))
		{
		return 1;
		};
	};

func void DIA_DIC_Soeldner_Pyt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Soeldner_Pyt_15_00"); //Nein. Mich schickt niemand. Aber ich habe gehört das du das Schwert von Pyt bei dir trägst. Du sollst es ihm geraubt haben!
	AI_Output (self, other, "DIA_DIC_Soeldner_Pyt_14_01"); //Hat Pyt das gesagt? Natürlich! Wer sonst setzt solche hahnenbüchenen Geschichten in die Welt? Ich habe mir erst kürzlich ein Schwert neu anfertigen lassen. Dass Pyt jetzt behauptet es wäre seins, passt zu diesem Gauner!
	AI_Output (other, self, "DIA_DIC_Soeldner_Pyt_15_02"); //Ah verstehe! Aber was sagst du dazu, wenn nicht nur Pyt sondern noch ein anderer darauf schwört, das du der Dieb bist? Ist das etwa Zufall?
	AI_Output (self, other, "DIA_DIC_Soeldner_Pyt_14_03"); //Ja, genau, das ist Zufall.  Und wenn gleich meine Faust ausrutscht und ich dich niederschlage ist das auch Zufall.
	
	B_LogEntry (PytQuest, "Als ich Rotrou sagte, dass ich wegen Pyt bei ihm bin, wollte er mich fast angreifen.");
	};

// ----------------- Tauschhandel ---------------
instance DIA_DIC_Soeldner_Tausch (C_INFO)
	{
	npc = DIC_2009_Soeldner;
	nr = 3;
	condition = DIA_DIC_Soeldner_Tausch_Condition;
	information = DIA_DIC_Soeldner_Tausch_Info;
	permanent = 1;
	description = "Ich versuche mich gerade mit Tauschhandel über Wasser zuhalten.";
	};

func int DIA_DIC_Soeldner_Tausch_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Soeldner_Ei))
		{
		return 1;
		};
	};

func void DIA_DIC_Soeldner_Tausch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Soeldner_Tausch_15_00"); //Nein. Ich versuche mich gerade mit Tauschhandel über Wasser zuhalten. Vielleicht können wir etwas tauschen?
	AI_Output (self, other, "DIA_DIC_Soeldner_Tausch_14_01"); //Warum nicht. Lass mal sehen, was du so dabei hast.
	if (Npc_HasItems(other, LurkerEi) >= 1)
		{
		AI_Output (self, other, "DIA_DIC_Soeldner_Tausch_14_03"); //Oh ein Lurkerei. Das ist wahrhaft selten.
		AI_Output (other, self, "DIA_DIC_Soeldner_Tausch_15_04"); //Bekomme ich dafür dein Schwert?
		AI_Output (self, other, "DIA_DIC_Soeldner_Tausch_15_05"); //Ja klar. Dafür kann ich mir glatt drei neue Schwerter kaufen... 
		B_GiveInvItems(other, self,LurkerEi,1);
		B_GiveInvItems(self, other,RotrouSchwert,1);
		
		B_GiveXP (150);
		
		B_LogEntry (PytQuest, "Ich habe mit Rotrou ein Lurkerei gegen ein Schwert getauscht. Leider ist es nicht das von Pyt...aber ob das Ei etwas bewirkt?");

		AI_Teleport	(BruetLurker, "SEE_VOR_STADT_18");
		
			
		B_GiveXP (150);
		}
	else
		{
		AI_Output (self,  other, "DIA_DIC_Soeldner_Tausch_14_04"); //Du hast nichts brauchbares...
		B_LogEntry (PytQuest, "Rotrou würde mit mir tauschen, wenn ich etwas Interessantes für ihn auftreiben kann.");
		};
	};