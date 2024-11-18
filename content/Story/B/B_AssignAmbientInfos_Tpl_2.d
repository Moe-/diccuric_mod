// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_16 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_2_EXIT_Condition;
	information	= Info_Tpl_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 				Warum seid ihr hier?
// *************************************************************************

INSTANCE Info_Tpl_2_Hier(C_INFO)
{
	nr			= 1;
	condition	= Info_Tpl_2_Hier_Condition;
	information	= Info_Tpl_2_Hier_Info;
	permanent	= 1;
	description = "Warum seid ihr hier?";
};                       

FUNC INT Info_Tpl_2_Hier_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_2_Hier_Info()
{
	AI_Output(other,self,"Info_Tpl_2_Hier_15_00"); //Warum seid ihr hier?
	AI_Output(self,other,"Info_Tpl_2_Hier_02_01"); //Das ist eine lange Geschichte. Aber ich versuche, es dir zu erklären:
	AI_Output(self,other,"Info_Tpl_2_Hier_02_02"); //Früher arbeiteten wir als Söldner im Königreich. Wir arbeiteten für die Garde des Königs.
	AI_Output(self,other,"Info_Tpl_2_Hier_02_03"); //Doch das, was wir verdient haben, reichte nichteinmal dazu, dass wir uns ausreichend Nahrung kaufen konnten.
	AI_Output(self,other,"Info_Tpl_2_Hier_02_04"); //Aber selbst der König wollte uns nicht zuhören. Niemanden hat es interessiert, ob wir überleben können oder nicht.
	AI_Output(self,other,"Info_Tpl_2_Hier_02_05"); //Irgendwann hatten wir dann die Schnauze voll und sind hierher gegangen.
	AI_Output(self,other,"Info_Tpl_2_Hier_02_06"); //Hier draußen können wird endlich jeder von uns satt, mehr wollen wir nicht.
};

// *************************************************************************
// 				Warum helft ihr den Bauern?
// *************************************************************************

INSTANCE Info_Tpl_2_Hilfe(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_2_Hilfe_Condition;
	information	= Info_Tpl_2_Hilfe_Info;
	permanent	= 1;
	description = "Warum helft ihr den Bauern?";
};                       

FUNC INT Info_Tpl_2_Hilfe_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_2_Hilfe_Info()
{
	AI_Output(other,self,"Info_Tpl_2_Hilfe_15_00"); //Warum helft ihr den Bauern? und den Feldarbeitern?
	AI_Output(self,other,"Info_Tpl_2_Hilfe_02_01"); //Als wir in diese verlassene Region aufbrachen, hatten sie ähnliche Probleme wie wir. Sie litten unter den hohen Abgaben an den König und hatten auch nicht genug zu essen.
	AI_Output(self,other,"Info_Tpl_2_Hilfe_02_02"); //Also beschlossen wir, gemeinsam zu gehen, und uns gemeinsam etwas aufzubauen. Wir leben zwar nicht gemeinsam in einer Burg, aber dennoch sind wir füreinander da.
	AI_Output(self,other,"Info_Tpl_2_Hilfe_02_03"); //Inzwischen sind wir zu guten Freunden geworden und wir helfen uns gegenseitig.
};


	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_2(var c_NPC slf)
{
	Info_Tpl_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_2_Hier.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_2_Hilfe.npc				= Hlp_GetInstanceID(slf);
};
