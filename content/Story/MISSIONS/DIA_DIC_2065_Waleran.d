//------------ ENDE -----------------
instance DIA_DIC_Waleran_Exit (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 999;
	condition = DIA_DIC_Waleran_Exit_Condition;
	information = DIA_DIC_Waleran_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Waleran_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Waleran_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Freund -----------------
instance DIA_DIC_Waleran_Freund (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 1;
	condition = DIA_DIC_Waleran_Freund_Condition;
	information = DIA_DIC_Waleran_Freund_Info;
	permanent = 0;
	important = 1;
	description = "Freund";
	};

func int DIA_DIC_Waleran_Freund_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk) && Npc_KnowsInfo(other, DIA_DIC_Amalric_Hilfe))
		{
		return 1;
		};
	};

func void DIA_DIC_Waleran_Freund_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Waleran_Freund_11_00"); //Ich suche einen Satz der in ein Rätsel passt! Wie würdest du den Begriff der Zeit umschreiben?
	};
	
//------------ Verschlingt -----------------
instance DIA_DIC_Waleran_Verschlingt (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 4;
	condition = DIA_DIC_Waleran_Verschlingt_Condition;
	information = DIA_DIC_Waleran_Verschlingt_Info;
	permanent = 0;
	important = 0;
	description = "Etwas, das alles und jeden verschlingt: Zerbeißt jedes Schwert, zermalmt den härtesten Stein.";
	};

func int DIA_DIC_Waleran_Verschlingt_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Waleran_Freund))
		{
		return 1;
		};
	};

func void DIA_DIC_Waleran_Verschlingt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Waleran_Verschlingt_15_00"); //Etwas, das alles und jeden verschlingt: Zerbeißt jedes Schwert, zermalmt den härtesten Stein.
	AI_Output (self, other, "DIA_DIC_Waleran_Verschlingt_11_01"); //Ja, das ist eine gute Lösung.
	AI_Output (other, self, "DIA_DIC_Waleran_Verschlingt_15_02"); //Willst du mir helfen gegen Feordwin zu kämpfen. Amalric hat mir seine Hilfe schon angeboten. Doch wir brauchen noch Magier die uns unterstützen.
	AI_Output (self, other, "DIA_DIC_Waleran_Verschlingt_11_03"); //Gut, ich helfe dir. Doch damit ich für unsere Freiheit antreten kann brauchen ich einen Zauber der mir das Feuer zum Untertan macht.
	};
	
//------------ Halten -----------------
instance DIA_DIC_Waleran_Halten (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 3;
	condition = DIA_DIC_Waleran_Halten_Condition;
	information = DIA_DIC_Waleran_Halten_Info;
	permanent = 1;
	important = 0;
	description = "Man kann es halten, man kann es aber nicht kaufen.";
	};

func int DIA_DIC_Waleran_Halten_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Waleran_Freund) && !Npc_KnowsInfo(other, DIA_DIC_Waleran_Verschlingt))
		{
		return 1;
		};
	};

func void DIA_DIC_Waleran_Halten_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Waleran_Halten_15_00"); //Man kann es halten, man kann es aber nicht kaufen.
	AI_Output (self, other, "DIA_DIC_Waleran_Halten_11_01"); //So so, bitte störe mich nicht weiter.
	
	AI_StopProcessInfos (self);
	};
	
//------------ Eilt Nicht -----------------
instance DIA_DIC_Waleran_Eilt (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 2;
	condition = DIA_DIC_Waleran_Eilt_Condition;
	information = DIA_DIC_Waleran_Eilt_Info;
	permanent = 1;
	important = 0;
	description = "Es eilt nicht, es kann nur stillstehen und ruhen.";
	};

func int DIA_DIC_Waleran_Eilt_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Waleran_Freund) && !Npc_KnowsInfo(other, DIA_DIC_Waleran_Verschlingt))
		{
		return 1;
		};
	};

func void DIA_DIC_Waleran_Eilt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Waleran_Eilt_15_00"); //Es eilt nicht, es kann nur stillstehen und ruhen.
	AI_Output (self, other, "DIA_DIC_Waleran_Eilt_11_01"); //Aha. Entschuldige mich, ich habe zu tun.
	
	AI_StopProcessInfos (self);
	};
	
//------------ Gut ich werde sehen, das ich dir einen Zauber beschaffen kann. -----------------
instance DIA_DIC_Waleran_Zauber (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 5;
	condition = DIA_DIC_Waleran_Zauber_Condition;
	information = DIA_DIC_Waleran_Zauber_Info;
	permanent = 0;
	important = 0;
	description = "Warte. Ich werde dir den Zauber besorgen.";
	};

func int DIA_DIC_Waleran_Zauber_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Waleran_Verschlingt)  && !Npc_KnowsInfo(other, DIA_DIC_Waleran_Geben))
		{
		return 1;
		};
	};

func void DIA_DIC_Waleran_Zauber_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Waleran_Zauber_15_00"); //Warte. Ich werde dir den Zauber besorgen.
	
	AI_StopProcessInfos (self);
	};
	
//------------ Hier ist der Zauber. -----------------
instance DIA_DIC_Waleran_Geben (C_INFO)
	{
	npc = DIC_2065_Waleran;
	nr = 6;
	condition = DIA_DIC_Waleran_Geben_Condition;
	information = DIA_DIC_Waleran_Geben_Info;
	permanent = 0;
	important = 0;
	description = "Hier der Feuerballzauber.";
	};

func int DIA_DIC_Waleran_Geben_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Waleran_Verschlingt) && 
		(Npc_HasItems (hero, ItArRuneFireball) >= 1 || Npc_HasItems (hero, ItArScrollFireball) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Waleran_Geben_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Waleran_Geben_15_00"); //Hier der Feuerballzauber.
	AI_Output (self, other, "DIA_DIC_Waleran_Geben_11_01"); //Ich warte bei Amalric auf dich.
	
	// Zauber geben
	if (Npc_HasItems (hero, ItArScrollFireball) >= 1)
		{
		B_GiveInvItems(other, self,ItArScrollFireball,1);
		}
	else
		{
		B_GiveInvItems(other, self,ItArRuneFireball,1);	
		};
	
	// Zu Amalric gehen
	Npc_ExchangeRoutine(self,"AMALRIC");
	
	B_LogEntry (PruefungGeist, "Auch Waleran wird mir helfen und wartet bei Amalric auf mich.");
	
	AI_StopProcessInfos (self);
	};