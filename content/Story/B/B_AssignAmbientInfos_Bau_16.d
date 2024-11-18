// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_16_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_16 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_16_EXIT_Condition;
	information	= Info_Bau_16_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Bau_16_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				Freiwillig hier?
// *************************************************************************

INSTANCE Info_Bau_16_Personen(C_INFO)
{
	nr			= 1;
	condition	= Info_Bau_16_Personen_Condition;
	information	= Info_Bau_16_Personen_Info;
	permanent	= 1;
	description = "Welche Personen sind hier wichtig?";
};                       

FUNC INT Info_Bau_16_Personen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_16_Personen_Info()
{
	AI_Output(other,self,"Info_Bau_16_Personen_15_00"); //Welche Personen sind hier wichtig?
	AI_Output(self,other,"Info_Bau_16_Personen_16_01"); //Zuerst ist da der Bauer. Er kümmert sich hier um die zentralen Dinge und kennt sich ganz gut aus.
	AI_Output(self,other,"Info_Bau_16_Personen_16_02"); //Außerdem gibt es die Bäuerin. Sie kümmert sich um die Tagelöhner und die Versorgung.
	AI_Output(self,other,"Info_Bau_16_Personen_16_03"); //Weiterhin gibt es den Müller... der faulenzt den ganzen Tag an seiner Mühle herum.
	AI_Output(self,other,"Info_Bau_16_Personen_16_04"); //Sonst gibt es hier noch einige Angestellte, die sich um den Ablauf hier kümmern.
};

// *************************************************************************
// 				Arbeit
// *************************************************************************

INSTANCE Info_Bau_16_Orte(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_16_Orte_Condition;
	information	= Info_Bau_16_Orte_Info;
	permanent	= 1;
	description = "Welche Orte sind hier wichtig?";
};                       

FUNC INT Info_Bau_16_Orte_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_16_Orte_Info()
{
	AI_Output(other,self,"Info_Bau_16_Orte_15_00"); //Welche Orte sind hier wichtig?
	AI_Output(self,other,"Info_Bau_16_Orte_16_01"); //Hier bei der Farm liegen die wichtigsten Orte beieinander. Außerdem gibt es eine kleine Burg, wenn du dem Weg folgst. Der Bauer kann dir sicher den Weg beschreiben.
	AI_Output(self,other,"Info_Bau_16_Orte_16_02"); //Dort oben in der Burg ist seit kurzem eine Söldnergruppe. Aber zu denen gehörst du doch, und kennst sie deswegen besser als ich.
};


	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_16(var c_NPC slf)
{
	Info_Bau_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_16_Personen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_16_Orte.npc				= Hlp_GetInstanceID(slf);
};
