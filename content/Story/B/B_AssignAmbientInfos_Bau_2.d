// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_2_EXIT_Condition;
	information	= Info_Bau_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Bau_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				Freiwillig hier?
// *************************************************************************

INSTANCE Info_Bau_2_Freiwillig(C_INFO)
{
	nr			= 1;
	condition	= Info_Bau_2_Freiwillig_Condition;
	information	= Info_Bau_2_Freiwillig_Info;
	permanent	= 1;
	description = "Arbeitest du freiwillig auf dem Bauernhof?";
};                       

FUNC INT Info_Bau_2_Freiwillig_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_Freiwillig_Info()
{
	AI_Output(other,self,"Info_Bau_2_Freiwillig_15_00"); //Arbeitest du freiwillig auf dem Bauernhof?
	AI_Output(self,other,"Info_Bau_2_Freiwillig_02_01"); //Ja. Hier muss ich zwar hart arbeiten, aber dafür verhungere ich nicht. Außerdem werden wir hier vor den Wölfen beschützt.
};

// *************************************************************************
// 				Arbeit
// *************************************************************************

INSTANCE Info_Bau_2_Arbeit(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_2_Arbeit_Condition;
	information	= Info_Bau_2_Arbeit_Info;
	permanent	= 1;
	description = "Gibt es hier Arbeit?";
};                       

FUNC INT Info_Bau_2_Arbeit_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_Arbeit_Info()
{
	AI_Output(other,self,"Info_Bau_2_Arbeit_15_00"); //Gibt es hier Arbeit? für mich?
	AI_Output(self,other,"Info_Bau_2_Arbeit_02_01"); //Klar, sprich doch einfach mit der Bäuerin. Sie kümmert sich um die Tagelöhner.
};


	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_2(var c_NPC slf)
{
	Info_Bau_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_2_Freiwillig.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_2_Arbeit.npc				= Hlp_GetInstanceID(slf);
};
