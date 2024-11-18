//------------ ENDE -----------------
instance DIA_DIC_2027_Arbeiter_Exit (C_INFO)
	{
	npc = DIC_2027_Arbeiter;
	nr = 999;
	condition = DIA_DIC_2027_Arbeiter_Exit_Condition;
	information = DIA_DIC_2027_Arbeiter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};
	
func int DIA_DIC_2027_Arbeiter_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_2027_Arbeiter_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// ------------ Begr��ungsspruch ----------------------
instance DIA_DIC_Arbeiter_Teleport (C_INFO)
	{
	npc = DIC_2027_Arbeiter;
	nr = 1;
	condition = DIA_DIC_Arbeiter_Teleport_Condition;
	information = DIA_DIC_Arbeiter_Teleport_Info;
	permanent = 0;
	important = 1;
	description = "Hey du!";
	};
	
func int DIA_DIC_Arbeiter_Teleport_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_Arbeiter_Teleport_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Arbeiter_Teleport_02_00"); //Hey du! Du solltest in der Wildnis auf dich aufpassen!
	AI_Output (self, other, "DIA_DIC_Arbeiter_Teleport_02_01"); //Besonders sind ausgewachsene W�lfe richtig gef�hrlich, wenn du keine R�stung tr�gst!
	AI_Output (other, self, "DIA_DIC_Arbeiter_Teleport_15_02"); //Danke f�r den Hinweis!
	
	};