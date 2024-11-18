// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_3_EXIT(C_INFO)
	{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_3_EXIT_Condition;
	information	= Info_Stt_3_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
	};                       

FUNC INT Info_Stt_3_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_3_EXIT_Info()
	{	
	AI_StopProcessInfos	(self);
	};

// *************************************************************************
// 				Wo finde ich Arbeit?
// *************************************************************************

INSTANCE Info_Stt_3_Arbeit(C_INFO)
	{
	nr			= 1;
	condition	= Info_Bau_Stt_3_Arbeit_Condition;
	information	= Info_Bau_Stt_3_Arbeit_Info;
	permanent	= 1;
	description = "Wie kann ich hier Arbeit finden?";
	};                       

FUNC INT Info_Bau_Stt_3_Arbeit_Condition()
	{
	return 1;
	};

FUNC VOID Info_Bau_Stt_3_Arbeit_Info()
	{
	AI_Output(other,self,"Info_Stt_3_Arbeit_15_00"); //Wie kann ich hier Arbeit finden?
	AI_Output(self,other,"Info_Stt_3_Arbeit_02_01"); //Wende dich an Alwin.
	};

// *************************************************************************
// 				Wo ist unser Anführer?
// *************************************************************************

INSTANCE Info_Stt_3_Anfuehrer(C_INFO)
	{
	nr			= 2;
	condition	= Info_Stt_3_Anfuehrer_Condition;
	information	= Info_Stt_3_Anfuehrer_Info;
	permanent	= 1;
	description = "Wo ist unser Anführer?";
	};                       

FUNC INT Info_Stt_3_Anfuehrer_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_3_Anfuehrer_Info()
	{
	AI_Output(other,self,"Info_Stt_3_Anfuehrer_15_00"); //Wo ist unser Anführer?
	AI_Output(self,other,"Info_Stt_3_Anfuehrer_02_01"); //Berengar hält sich in der Festung auf. Aber du darfst dort keinen Fuß hineinsetzen! Nur wer von Berengar oder Graveyarn die Erlaubnis hat, darf die Festung betreten.
	};

// *************************************************************************
// 				Wer kann mir hier etwas beibringen? 
// *************************************************************************

INSTANCE Info_Stt_3_Beibringen(C_INFO)
	{
	nr			= 3;
	condition	= Info_Stt_3_Beibringen_Condition;
	information	= Info_Stt_3_Beibringen_Info;
	permanent	= 1;
	description = "Wer kann mir hier etwas beibringen?";
	};                       

FUNC INT Info_Stt_3_Beibringen_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_3_Beibringen_Info()
	{
	AI_Output(other,self,"Info_Stt_3_Beibringen_15_00"); //Wer kann mir hier etwas beibringen?
	AI_Output(self,other,"Info_Stt_3_Beibringen_02_01"); //Frag mal Rictiovarus, Narrow oder Alwin.
	};

	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_3(var c_NPC slf)
	{
	Info_Stt_3_EXIT.npc						= Hlp_GetInstanceID(slf);
	Info_Stt_3_Arbeit.npc					= Hlp_GetInstanceID(slf);
	Info_Stt_3_Anfuehrer.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_3_Beibringen.npc				= Hlp_GetInstanceID(slf);
	};
