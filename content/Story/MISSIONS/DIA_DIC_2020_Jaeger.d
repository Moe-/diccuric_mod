//------------ ENDE -----------------
instance DIA_DIC_Jaeger_2020_Exit (C_INFO)
	{
	npc = DIC_2020_Jaeger;
	nr = 999;
	condition = DIA_DIC_Jaeger_2020_Exit_Condition;
	information = DIA_DIC_Jaeger_2020_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Jaeger_2020_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Jaeger_2020_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

//------- Arbeit vernachlässigen --------
instance DIA_DIC_Jaeger_2020_Arbeit (C_INFO)
	{
	npc = DIC_2020_Jaeger;
	nr = 1;
	condition = DIA_DIC_Jaeger_2020_Arbeit_Condition;
	information = DIA_DIC_Jaeger_2020_Arbeit_Info;
	permanent = 0;
	description = "Vernachlässigt ihr eure Aufgaben?";
	};

func int DIA_DIC_Jaeger_2020_Arbeit_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Narrow_Info) && !(Npc_KnowsInfo(other, DIA_DIC_Jaeger_2021_Arbeit)))
		{
		return 1;
		};
	};

func void DIA_DIC_Jaeger_2020_Arbeit_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Jaeger_2020_Arbeit_15_00"); //Kann es sein das ihr euren Dienst vernachlässigt?
	AI_Output (self, other, "DIA_DIC_Jaeger_2020_Arbeit_03_01"); //Halt dich da raus Junge. Misch dich nicht in unsere Angelegenheiten. Vielleicht mache ich dich sonst einen Kopf kürzer, wenn das bei deiner Größe noch geht.
	//AI_Output (self, other, "DIA_DIC_Jaeger_2020_Arbeit_03_02"); //HAHAHA
	
	B_LogEntry (NarrowMission, "Die Jäger wollen Narrow nicht helfen. Ich muss ihnen also auf die Sprünge helfen.");
	};

// -------- Junge mit Medaillon "nervt" ----------
instance DIA_DIC_Jaeger_2020_Graveyarn (C_INFO)
	{
	npc = DIC_2020_Jaeger;
	nr = 2;
	condition = DIA_DIC_Jaeger_2020_Graveyarn_Condition;
	information = DIA_DIC_Jaeger_2020_Graveyarn_Info;
	permanent = 0;
	description = "Kennst du das Zeichen?";
	};

func int DIA_DIC_Jaeger_2020_Graveyarn_Condition ()
	{
	if ((Npc_HasItems (other, Graveyarn_Erkennung) >= 1) && !(Npc_KnowsInfo(other, DIA_DIC_Jaeger_2021_Graveyarn)))
		{
		return 1;
		};
	};

func void JaegerFront ()
	{
			
	};
func void DIA_DIC_Jaeger_2020_Graveyarn_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Jaeger_2020_Graveyarn_15_00"); //Kennst du das Zeichen?
	AI_Output (self, other, "DIA_DIC_Jaeger_2020_Graveyarn_03_01"); //Graveyarns Medaille.
	AI_Output (other, self, "DIA_DIC_Jaeger_2020_Graveyarn_15_02"); //Ich soll euch ausrichten, wenn ihr nicht...
	AI_Output (self, other, "DIA_DIC_Jaeger_2020_Graveyarn_03_03"); //Oh, du brauchst nichts zu sagen! Wir sind schon unterwegs.
	
	B_LogEntry (NarrowMission, "Es geht doch. Kaum sahen die Jäger das Medaillon, sind sie losgegangen.");
	B_GiveXP (250);
	//AI_StopProcessInfos (self);	
	
	Npc_ExchangeRoutine	(self,"FRONT");
	Npc_ExchangeRoutine	(DIC_2021_Jaeger,"FRONT");
	ai_Continueroutine	(DIC_2021_Jaeger);		// Harri - sonst bleibt er stehen
												// Moe: Aber dann in beiden Dateien. :-)		
	};
