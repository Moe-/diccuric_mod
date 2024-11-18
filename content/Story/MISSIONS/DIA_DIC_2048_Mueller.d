//------------ ENDE -----------------
instance DIA_DIC_Mueller_Exit (C_INFO)
	{
	npc = DIC_2048_Mueller;
	nr = 999;
	condition = DIA_DIC_Mueller_Exit_Condition;
	information = DIA_DIC_Mueller_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Mueller_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Mueller_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------- Mehl holen ---------
instance DIA_DIC_Mueller_Mehl (C_INFO)
	{
	npc = DIC_2048_Mueller;
	nr = 1;
	condition = DIA_DIC_Mueller_Mehl_Condition;
	information = DIA_DIC_Mueller_Mehl_Info;
	permanent = 0;
	description = "Ich soll das Mehl holen!";
	};

func int DIA_DIC_Mueller_Mehl_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Baeuerin_Mehl))
			{
				return 1;
			};
	};

func void DIA_DIC_Mueller_Mehl_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Mueller_Mehl_15_00"); //Im Haus wird das Mehl knapp. Ich soll bei dir Neues holen.
		AI_Output (self, other, "DIA_DIC_Mueller_Mehl_07_01"); //So einfach geht das nicht, Kleiner. Also du besorgst mir das Korn und dann kann ich dir Mehl herstellen.

		Log_AddEntry (FarmAuftraege, "Dem Müller fehlt das Korn um zu mahlen...da werde ich wohl was auftreiben müssen.");

		AI_StopProcessInfos (self);
	};

// ------------ Korn da? ---------
instance DIA_DIC_Mueller_Korn (C_INFO)
	{
		npc = DIC_2048_Mueller;
		nr = 2;
		condition = DIA_DIC_Mueller_Korn_Condition;
		information = DIA_DIC_Mueller_Korn_Info;
		permanent = 0;
		description = "Wie sieht es mit dem Mehl aus?";
	};

func int DIA_DIC_Mueller_Korn_Condition ()
	{
		var int AktTag;
		AktTag = Wld_GetDay ();
		if (Npc_KnowsInfo (other, DIA_DIC_Feldarbeiter_Korn) && (AktTag > MuellerTag))
			{
				return 1;
			};
	};

func void DIA_DIC_Mueller_Korn_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Mueller_Korn_15_00"); //Na, wie siehts mit meinem Mehl aus?
		AI_Output (self, other, "DIA_DIC_Mueller_Korn_07_01"); //Du wolltest mir erst neues Korn besorgen, danach wollte ich dir Mehl mahlen...

		Log_AddEntry (FarmAuftraege, "Na toll, der Feldarbeiter hat sich noch immer nicht beim Müller gezeigt. Was ihn wohl aufgehalten hat?");
	};

// -------- Mehl in der Kammer -------------
instance DIA_DIC_Mueller_Fertig (C_INFO)
	{
		npc = DIC_2048_Mueller;
		nr = 3;
		condition = DIA_DIC_Mueller_Fertig_Condition;
		information = DIA_DIC_Mueller_Fertig_Info;
		permanent = 0;
		description = "Ist das Mehl nun fertig?";
	};

func int DIA_DIC_Mueller_Fertig_Condition ()
	{
		if (Npc_KnowsInfo (other, DIA_DIC_Feldarbeiter_Ungeziefer))
			{
				return 1;
			};
	};

func void DIA_DIC_Mueller_Fertig_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Mueller_Fertig_15_00"); //Ist das Mehl nun fertig? Ein Feldarbeiter wollte das Korn bringen...
		AI_Output (self, other, "DIA_DIC_Mueller_Fertig_07_01"); //Natürlich ist es fertig, jetzt war ja genug Korn da.
		AI_Output (other, self, "DIA_DIC_Mueller_Fertig_15_02"); //Na, dann gib es mir doch.
		AI_Output (self, other, "DIA_DIC_Mueller_Fertig_07_03"); //Das geht nicht. Ich hab es schon ins Haus gebracht...ach ja, du sollst dich im Haus melden.

		Log_AddEntry (FarmAuftraege, "Das ging ja jetzt doch besser, als ich dachte. Das Mehl sollte nun im Haus sein.");
	};
