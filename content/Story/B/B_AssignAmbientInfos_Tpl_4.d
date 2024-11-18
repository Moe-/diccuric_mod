// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_16 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_4_EXIT_Condition;
	information	= Info_Tpl_4_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				Was machst du hier am Bauernhof?
// *************************************************************************

INSTANCE Info_Tpl_4_Hier(C_INFO)
{
	nr			= 1;
	condition	= Info_Tpl_4_Hier_Condition;
	information	= Info_Tpl_4_Hier_Info;
	permanent	= 1;
	description = "Was machst du hier am Bauernhof?";
};                       

FUNC INT Info_Tpl_4_Hier_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_4_Hier_Info()
{
	AI_Output(other,self,"Info_Tpl_4_Hier_15_00"); //Was machst du hier am Bauernhof?
	AI_Output(self,other,"Info_Tpl_4_Hier_02_01"); //Ich passe darauf auf, dass der Bauernhof nicht angegriffen wird.
};

// *************************************************************************
// 				Du bist keiner von Berengers Leuten?
// *************************************************************************

INSTANCE Info_Tpl_4_Berengar(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_4_Berengar_Condition;
	information	= Info_Tpl_4_Berengar_Info;
	permanent	= 1;
	description = "Du bist keiner von Berengers Leuten?";
};                       

FUNC INT Info_Tpl_4_Berengar_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_4_Berengar_Info()
{
	AI_Output(other,self,"Info_Tpl_4_Hilfe_15_00"); //Du bist keiner von Berengars Leuten?
	AI_Output(self,other,"Info_Tpl_4_Hilfe_02_01"); //Nein, ich bin von der kleinen Burg, die hier in der Nähe auf einem Berg liegt.
};


	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_4(var c_NPC slf)
{
	Info_Tpl_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_4_Hier.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_4_Berengar.npc				= Hlp_GetInstanceID(slf);
};
