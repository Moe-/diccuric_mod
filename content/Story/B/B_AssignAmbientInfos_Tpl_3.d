// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_16 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_3_EXIT_Condition;
	information	= Info_Tpl_3_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				Wie lebt ihr mit den Bauern zusammen?
// *************************************************************************

INSTANCE Info_Tpl_3_Leben(C_INFO)
{
	nr			= 1;
	condition	= Info_Tpl_3_Leben_Condition;
	information	= Info_Tpl_3_Leben_Info;
	permanent	= 1;
	description = "Wie lebt ihr mit den Bauern zusammen?";
};                       

FUNC INT Info_Tpl_3_Leben_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_3_Leben_Info()
{
	AI_Output(other,self,"Info_Tpl_3_Leben_15_00"); //Wie lebt ihr mit den Bauern zusammen?
	AI_Output(self,other,"Info_Tpl_3_Leben_02_01"); //Jede von unseren beiden Gruppen hat eine M�glichkeit, sich zur�ckzuziehen: Wir betreten nicht den Bauernhof, die vom Bauernhof kommen nicht in die Burg.
	AI_Output(self,other,"Info_Tpl_3_Leben_02_02"); //Au�erdem bieten wir den Bauern Schutz vor den W�lfen, die hier drau�en so zahlreich herumlaufen. Andererseits bekommen wir Nahrung vom Bauernhof und somit Abwechslung zum Fleisch.
	AI_Output(self,other,"Info_Tpl_3_Leben_02_03"); //Hier drau�en leben wir also friedlich zusammen und auf uns lastet kein Druck vom K�nig.
};

// *************************************************************************
// 				Was denkt ihr �ber Berengar?
// *************************************************************************

INSTANCE Info_Tpl_3_Berengar(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_3_Berengar_Condition;
	information	= Info_Tpl_3_Berengar_Info;
	permanent	= 1;
	description = "Was denkt ihr �ber Berengar?";
};                       

FUNC INT Info_Tpl_3_Berengar_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_3_Berengar_Info()
{
	AI_Output(other,self,"Info_Tpl_3_Berengar_15_00"); //Was denkt ihr �ber Berengar?
	AI_Output(self,other,"Info_Tpl_3_Berengar_02_01"); //Bisher hat er uns in Frieden gelassen, und es ist noch ruhig f�r uns. Aber er plant doch irgendwas, sonst h�tte er mit uns geredet.
	AI_Output(self,other,"Info_Tpl_3_Berengar_02_02"); //Aber er scheint eine Auseinandersetzung zu f�rchten, also wird er jeden seiner S�ldner f�r etwas brauchen. Ich hoffe nur, dass er auf keine dumme Gedanken kommt.
	AI_Output(self,other,"Info_Tpl_3_Berengar_02_03"); //Sonst kann es schnell mit unserer Ruhe hier zu Ende sein. F�r uns w�re es besser, wenn er wieder ginge.
};


	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_3(var c_NPC slf)
{
	Info_Tpl_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_3_Leben.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_3_Berengar.npc				= Hlp_GetInstanceID(slf);
};
