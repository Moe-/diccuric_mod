// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_4_EXIT(C_INFO)
	{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_4_EXIT_Condition;
	information	= Info_Stt_4_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
	};                       

FUNC INT Info_Stt_4_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_4_EXIT_Info()
	{	
	AI_StopProcessInfos	(self);
	};

// *************************************************************************
// 				Wie kann ich mich hier zurechtfinden?
// *************************************************************************

INSTANCE Info_Stt_4_Zurechtfinden(C_INFO)
	{
	nr			= 1;
	condition	= Info_Bau_Stt_4_Zurechtfinden_Condition;
	information	= Info_Bau_Stt_4_Zurechtfinden_Info;
	permanent	= 1;
	description = "Wie kann ich mich hier zurechtfinden?";
	};                       

FUNC INT Info_Bau_Stt_4_Zurechtfinden_Condition()
	{
	return 1;
	};

FUNC VOID Info_Bau_Stt_4_Zurechtfinden_Info()
	{
	AI_Output(other,self,"Info_Stt_4_Zurechtfinden_15_00"); //Wie kann ich mich hier zurechtfinden?
	AI_Output(self,other,"Info_Stt_4_Zurechtfinden_02_01"); //Hier in der Stadt ist es einfach. Wenn du jemanden bestimmten suchst, frag einfach einen der Söldner. Wenn die keinen schlechten Tag haben, kriegst du auch eine ehrliche Antwort.
	AI_Output(self,other,"Info_Stt_4_Zurechtfinden_02_02"); //Wenn du dich aber außerhalb der Stadt zurechtfinden willst, dann brauchst du eine Karte. Und die neun Leben einer Katze.
	};

// *************************************************************************
// 				Wie ist das Leben hier so?
// *************************************************************************

INSTANCE Info_Stt_4_Leben(C_INFO)
	{
	nr			= 2;
	condition	= Info_Stt_4_Leben_Condition;
	information	= Info_Stt_4_Leben_Info;
	permanent	= 1;
	description = "Wie ist das Leben hier so?";
	};                       

FUNC INT Info_Stt_4_Leben_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_4_Leben_Info()
	{
	AI_Output(other,self,"Info_Stt_4_Leben_15_00"); //Wie ist das Leben hier so?
	AI_Output(self,other,"Info_Stt_4_Leben_02_01"); //Wenn du die Stadt nicht verlässt ist es fast angenehm. Aber außerhalb der Schildmauer lebt Wolfsrudel neben Wolfsrudel.
	AI_Output(self,other,"Info_Stt_4_Leben_02_02"); //Man könnte fast denken, mit diesem Ort stimmt etwas nicht! Ansonsten ist es in der Stadt ruhig.
	AI_Output(self,other,"Info_Stt_4_Leben_02_03"); //Aber in ein paar Wochen treffen die Holz- und Erzlieferungen ein. Dann wird hier gearbeitet.
	AI_Output(self,other,"Info_Stt_4_Leben_02_04"); //Schwerter werden geschmiedet, Bögen gebaut, Pfeile hergestellt, Katapulte zusammengehämmert. Kriegsvorbereitungen sind eben keine Kleinigkeit.
	};

// *************************************************************************
// 				Für wen arbeitest du? 
// *************************************************************************

INSTANCE Info_Stt_4_Wen(C_INFO)
	{
	nr			= 3;
	condition	= Info_Stt_4_Wen_Condition;
	information	= Info_Stt_4_Wen_Info;
	permanent	= 1;
	description = "Für wen arbeitest du?";
	};                       

FUNC INT Info_Stt_4_Wen_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_4_Wen_Info()
	{
	AI_Output(other,self,"Info_Stt_4_Wen_15_00"); //Für wen arbeitest du?
	AI_Output(self,other,"Info_Stt_4_Wen_02_01"); //Für Berengar, den zukünftigen Herrscher des Reiches!
	};

	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_4(var c_NPC slf)
	{
	Info_Stt_4_EXIT.npc						= Hlp_GetInstanceID(slf);
	Info_Stt_4_Zurechtfinden.npc			= Hlp_GetInstanceID(slf);
	Info_Stt_4_Leben.npc					= Hlp_GetInstanceID(slf);
	Info_Stt_4_Wen.npc						= Hlp_GetInstanceID(slf);
	};
