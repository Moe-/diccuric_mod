// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_5_EXIT(C_INFO)
	{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_5_EXIT_Condition;
	information	= Info_Stt_5_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
	};                       

FUNC INT Info_Stt_5_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_5_EXIT_Info()
	{	
	AI_StopProcessInfos	(self);
	};

// *************************************************************************
// 				Welchen Aufgaben geht ihr als Söldner nach?
// *************************************************************************

INSTANCE Info_Stt_5_Aufgaben(C_INFO)
	{
	nr			= 1;
	condition	= Info_Bau_Stt_5_Aufgaben_Condition;
	information	= Info_Bau_Stt_5_Aufgaben_Info;
	permanent	= 1;
	description = "Welchen Aufgaben geht ihr als Söldner nach?";
	};                       

FUNC INT Info_Bau_Stt_5_Aufgaben_Condition()
	{
	return 1;
	};

FUNC VOID Info_Bau_Stt_5_Aufgaben_Info()
	{
	AI_Output(other,self,"Info_Stt_5_Aufgaben_15_00"); //Welchen Aufgaben geht ihr als Söldner nach?
	AI_Output(self,other,"Info_Stt_5_Aufgaben_02_01"); //Sieht man mal von den Arbeiten ab, die dich nichts angehen Bengel, halten wir Wache, gehen auf die Jagd, arbeiten in der Schmiede, lernen mit dem Schwert besser umzugehen, und noch einiges mehr.
	};

// *************************************************************************
// 				Wie geht's?
// *************************************************************************

INSTANCE Info_Stt_5_Wie(C_INFO)
	{
	nr			= 2;
	condition	= Info_Stt_5_Wie_Condition;
	information	= Info_Stt_5_Wie_Info;
	permanent	= 1;
	description = "Wie geht's?";
	};                       

FUNC INT Info_Stt_5_Wie_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_5_Wie_Info()
	{
	AI_Output(other,self,"Info_Stt_5_Wie_15_00"); //Wie geht's?
	AI_Output(self,other,"Info_Stt_5_Wie_02_01"); //Das Essen ist schlecht. Der Schlafplatz ist hart. Jeden Tag eine neue Möglichkeit, durch die Wölfe das Leben zu verlieren. Aber ich werde gut bezahlt für meine Dienste. Das wiegt einiges auf.
	};

// *************************************************************************
// 				Wie komme ich in die Festung?
// *************************************************************************

INSTANCE Info_Stt_5_Festung(C_INFO)
	{
	nr			= 3;
	condition	= Info_Stt_5_Festung_Condition;
	information	= Info_Stt_5_Festung_Info;
	permanent	= 1;
	description = "Wie komme ich in die Festung?";
	};                       

FUNC INT Info_Stt_5_Festung_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_5_Festung_Info()
	{
	AI_Output(other,self,"Info_Stt_5_Festung_15_00"); //Wie komme ich in die Festung?
	AI_Output(self,other,"Info_Stt_5_Festung_02_01"); //Du musst Graveyarn oder Berengar beweisen, dass du kein Waschlappen bist! Wenn du das schaffst, kannst du in die Festung!
	};

	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_5(var c_NPC slf)
	{
	Info_Stt_5_EXIT.npc						= Hlp_GetInstanceID(slf);
	Info_Stt_5_Aufgaben.npc					= Hlp_GetInstanceID(slf);
	Info_Stt_5_Wie.npc						= Hlp_GetInstanceID(slf);
	Info_Stt_5_Festung.npc					= Hlp_GetInstanceID(slf);
	};
