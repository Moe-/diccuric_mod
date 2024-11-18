// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Info_Sld_B_Exit (C_INFO)
{
	npc			= Sld_B;
	nr			= 999;
	condition	= Info_Sld_B_Exit_Condition;
	information	= Info_Sld_B_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Info_Sld_B_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_B_Exit_Info()
{
	AI_StopProcessInfos(self);
};


// **************************************************************
//				1. Zwischenruf beim Start
// **************************************************************

INSTANCE ZW1_Sld_B_Start (C_INFO)
{
	npc			= Sld_B;
	nr			= 1;
	condition	= ZW1_Sld_B_Start_Condition;
	information	= ZW1_Sld_B_Start_Info;
	permanent	= 0;
	//description = DIALOG_ENDE;
	important	= 1;

};

FUNC INT ZW1_Sld_B_Start_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Sld_A_Verarsch1_1))
	&&(Speak2me==1)
    {
		return 1;
	};
};

FUNC void ZW1_Sld_B_Start_Info()
{
	AI_Output (self,other,"ZW1_Sld_B_Start_Info_07_00"); //Du kletterst hoch und hältst Ausschau nach dem Ocorel-Habicht. Wer ihn nicht erkennt, ist ein Dummkopf. Sein Gefieder ist vollständig weiß. Und wenn du ihn siehst, rufst du uns.

	Speak2me = 2; //Sld_B hat seinen Part beendet
	AI_StopProcessInfos(self);
	AI_StartState	(Sld_A,	ZS_Talk, 0, "");
};


// ************************************************************
// 								Warten
// ************************************************************

INSTANCE Sld_B_Wait (C_INFO)
{
	npc			= Sld_B;
	nr			= 2;
	condition	= Sld_B_Wait_Condition;
	information	= Sld_B_Wait_Info;
	permanent	= 1;
	description = "Wie war das nochmal?";
};

FUNC INT Sld_B_Wait_Condition()
{
	if(DC_1_Tower == 0 && !(Npc_KnowsInfo(other, Sld_A_Verarsch1_Back1)))
	{
		return 1;
	};
};

FUNC VOID Sld_B_Wait_Info()
{
	AI_Output (other,self,"Sld_B_Wait_Info_15_00"); //Was sollte ich nochmal machen?
	AI_Output (self,other,"Sld_B_Wait_Info_07_01"); //Komm, lass das Spielchen und geh hoch!
	AI_StopProcessInfos(self);
};


// ************************************************************
// 						Geduldende
// ************************************************************

INSTANCE Sld_B_NoWait (C_INFO)
{
	npc			= Sld_B;
	nr			= 2;
	condition	= Sld_B_NoWait_Condition;
	information	= Sld_B_NoWait_Info;
	permanent	= 0;
	important	= 1;
	//description = "Wie war das nochmal?";
};

FUNC INT Sld_B_NoWait_Condition()
{
	if(Loop_time >= 120 && !(Npc_KnowsInfo(other, Sld_A_Verarsch1_Back1)))
	{
		return 1;
	};
};

FUNC VOID Sld_B_NoWait_Info()
{
	AI_GotoNpc (self, hero);	//Damit die Ausgabe sichtbar ist...(beim lesen)
	AI_Output (self,other,"Sld_B_NoWait_Info_07_00"); //So nicht! Wenn du das nicht machst dann sag es doch gleich!
	DC_1_Tower = -1;
	AI_StopProcessInfos(self);
	
	//--- Da Quest fehlgeschlagen ist, gehen die Söldner -------
	Npc_ExchangeRoutine(sld_b,"RALF"); 
	Npc_ExchangeRoutine(sld_a,"RAL");
	AI_ContinueRoutine(sld_a);
	//AI_ContinueRoutine(sld_b);		// unnötig und macht prob. -Harri
	
	B_LogEntry (VER_MISSION, "Ich habe zu lange gezögert und die Söldner sind gegangen.");
	Log_SetTopicStatus (VER_MISSION, LOG_FAILED);
};


// **************************************************************
//				  Zwischenruf bei Trialog2
// **************************************************************


INSTANCE Sld_B_Verarsch1_Back(C_INFO)
{
	npc			= Sld_B;
	nr			= 1;
	condition	= Sld_B_Verarsch1_Back_Condition;
	information	= Sld_B_Verarsch1_Back_Info;
	important   = 1;
	permanent	= 0;
	//description = "Ihr wusstet das die Wölfe dort ihr Revier haben.";
};

FUNC INT Sld_B_Verarsch1_Back_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_A_Verarsch1_Back1))
	//&& Speak2me == 1)
	{
		return TRUE;
	};

};

FUNC VOID Sld_B_Verarsch1_Back_Info()
{
	AI_Output (other,self,"Sld_B_Verarsch1_Back_Info_15_00"); //Das war kein Spaß. Ihr wusstet, dass die Wölfe kommen. Ich hätte draufgehen können.
	AI_Output (self,other,"Sld_B_Verarsch1_Back_Info_06_01"); //Erzählst du jemanden davon, wirst du keinen Sonnenaufgang mehr erleben.
   	// Speak2me = 0;				//SLD_A hat Dia beendet
	AI_StopProcessInfos(self);

	// ------- Logentries ------------------
	B_LogEntry (VER_MISSION,"Hatte ich mir schon fast gedacht! Die haben mich verarscht und geben es nicht zu. Aber ich werde es ihnen heimzahlen, um jeden Preis!");
	Log_SetTopicStatus(VER_MISSION, LOG_SUCCESS);		//hier rein, wo sonst?
	DC_1_Tower = 3;									//Mission als beendet erklären, wie is egal...

	B_LogEntry		(BekanntePersonen,"Söldner: Scheinbar haben sie Spaß dran Schwächeren ihre Stärke zu zeigen. Jedoch ist dies nur die körperliche Stärke, im Kopf haben sie nichts!");


};

// ---------- Junge stürtzt durch die Brücke ------------
instance DIA_DIC_Kanapus_Sturz (C_INFO)
	{
	npc = Sld_B;
	nr = 1;
	condition = DIA_DIC_Kanapus_Sturz_Condition;
	information = DIA_DIC_Kanapus_Sturz_Info;
	important = 1;
	permanent = 0;
	description = "Kannst du noch nichtmal geradeaus gehen?";
	};

func int DIA_DIC_Kanapus_Sturz_Condition ()
	{
	if (BrueckenEinbruch == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Kanapus_Sturz_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Kanapus_Sturz_06_00"); //Kannst du noch nichtmal geradeaus gehen? Willst du hier baden oder was? Los zum Schmied. Auf, auf...
	AI_Output (other, self, "DIA_DIC_Kanapus_Sturz_15_01"); //Ihr habt die Brücke angesägt. Wenn Graveyarn das erfährt, kriegt ihr ein Problem.
	AI_Output (self, other, "DIA_DIC_Kanapus_Sturz_06_02"); //Aber wenn du was sagst, dann wirst du es bereuen. Sehr bereuen.

	AI_StopProcessInfos(self);
	};