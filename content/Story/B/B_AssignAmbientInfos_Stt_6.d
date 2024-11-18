// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_6_EXIT(C_INFO)
	{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_6_EXIT_Condition;
	information	= Info_Stt_6_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
	};                       

FUNC INT Info_Stt_6_EXIT_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_6_EXIT_Info()
	{	
	AI_StopProcessInfos	(self);
	};

// *************************************************************************
// 				Wo finde ich ...
// *************************************************************************

INSTANCE Info_Stt_6_Finde(C_INFO)
	{
	nr			= 1;
	condition	= Info_Bau_Stt_6_Finde_Condition;
	information	= Info_Bau_Stt_6_Finde_Info;
	permanent	= 1;
	description = "Wo finde ich...";
	};                       

FUNC INT Info_Bau_Stt_6_Finde_Condition()
	{
	return 1;
	};

FUNC VOID Info_Bau_Stt_6_Finde_Info()
	{
	AI_Output(other,self,"Info_Stt_6_Finde_15_00"); //Wo finde ich...
	Info_AddChoice (Info_Stt_6_Finde, "Graveyarn?", Info_Stt_6_Graveyarn);
	Info_AddChoice (Info_Stt_6_Finde, "Berengar?", Info_Stt_6_Berengar);
	Info_AddChoice (Info_Stt_6_Finde, "Alwin?", Info_Stt_6_Alwin);
	Info_AddChoice (Info_Stt_6_Finde, "Taliasan?", Info_Stt_6_Taliasan);
	Info_AddChoice (Info_Stt_6_Finde, "Benchol?", Info_Stt_6_Benchol);
	Info_AddChoice (Info_Stt_6_Finde, "Narrow?", Info_Stt_6_Narrow);
	Info_AddChoice (Info_Stt_6_Finde, "Vergi� es", Info_Stt_6_Zurueck);
	};
	
func void Info_Stt_6_Graveyarn ()
	{
	AI_Output (other, self, "Info_Stt_6_Graveyarn_15_00"); //Graveyarn?
	AI_Output (self, other, "Info_Stt_6_Graveyarn_06_01"); //Graveyarn? ist in der Festung. Ab und zu kommt er in die Stadt, um nach dem Rechten zu sehen.
	};

func void Info_Stt_6_Berengar ()
	{
	AI_Output (other, self, "Info_Stt_6_Berengar_15_00"); //Berengar?
	AI_Output (self, other, "Info_Stt_6_Berengar_06_01"); //Berengar? ist so gut wie immer in der Festung. Er hat viel zu tun und l�sst sich in der Stadt nur zu besonderen Anl�ssen blicken.
	};
	
func void Info_Stt_6_Alwin ()
	{
	AI_Output (other, self, "Info_Stt_6_Alwin_15_00"); //Alwin?
	AI_Output (self, other, "Info_Stt_6_Alwin_06_01"); //Alwin? Wenn er nicht drau�en arbeitet, findest du ihn vor seiner H�tte, in der N�he des G�tterbaumes in der Stadt.
	};
	
func void Info_Stt_6_Taliasan ()
	{
	AI_Output (other, self, "Info_Stt_6_Taliasan_15_00"); //Taliasan?
	AI_Output (self, other, "Info_Stt_6_Taliasan_06_01"); //Such die sch�bigste H�tte hier, und dort die hinterste Ecke. Dort findest du Taliasan.
	};
	
func void Info_Stt_6_Benchol ()
	{
	AI_Output (other, self, "Info_Stt_6_Benchol_15_00"); //Benchol?
	AI_Output (self, other, "Info_Stt_6_Benchol_06_01"); //Wenn du Wein bei dir hast, warte einfach ein wenig und Benchol findet dich.
	};
	
func void Info_Stt_6_Narrow ()
	{
	AI_Output (other, self, "Info_Stt_6_Narrow_15_00"); //Narrow?
	AI_Output (self, other, "Info_Stt_6_Narrow_06_01"); //Narrow? ist im Einsatz. Er leitet eine J�gergruppe gegen die W�lfe.
	};
	
func void Info_Stt_6_Zurueck ()
	{
	AI_Output (other, self, "Info_Stt_6_Zurueck_15_00"); //Vergiss es...
	Info_ClearChoices (Info_Stt_6_Finde);
	};

// *************************************************************************
// 				Hast du ein paar Ratschl�ge f�r mich?
// *************************************************************************

INSTANCE Info_Stt_6_Ratschlag(C_INFO)
	{
	nr			= 2;
	condition	= Info_Stt_6_Ratschlag_Condition;
	information	= Info_Stt_6_Ratschlag_Info;
	permanent	= 1;
	description = "Hast du ein paar Ratschl�ge f�r mich?";
	};                       

FUNC INT Info_Stt_6_Ratschlag_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_6_Ratschlag_Info()
	{
	AI_Output(other,self,"Info_Stt_6_Ratschlag_15_00"); //Hast du ein paar Ratschl�ge f�r mich?
	AI_Output(self,other,"Info_Stt_6_Ratschlag_02_01"); //Ja, halt deine Nase aus fremden Angelegenheiten. Wenn es dir einf�llt, hier die H�tten zu durchst�bern und zu stehlen, sperre ich dich pers�nlich eine Woche lang in einen Verschlag.
	};

// *************************************************************************
// 				Was gibt's neues?
// *************************************************************************

INSTANCE Info_Stt_6_Neues (C_INFO)
	{
	nr			= 3;
	condition	= Info_Stt_6_Neues_Condition;
	information	= Info_Stt_6_Neues_Info;
	permanent	= 1;
	description = "Was gibt's neues?";
	};                       

FUNC INT Info_Stt_6_Neues_Condition()
	{
	return 1;
	};

FUNC VOID Info_Stt_6_Neues_Info()
	{
	AI_Output(other,self,"Info_Stt_6_Neues_15_00"); //Was gibt's neues?
	AI_Output(self,other,"Info_Stt_6_Neues_02_01"); //Ein paar von den S�ldnern haben bei ihrem letzten Einsatz im Wald schwere Bisswunden davongetragen. Arme Schweine. Zum Gl�ck sind unter den Magiern viele Heiler. Die kriegen die Verletzten schnell wieder auf die Beine.
	};

	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_6(var c_NPC slf)
	{
	Info_Stt_6_EXIT.npc						= Hlp_GetInstanceID(slf);
	Info_Stt_6_Finde.npc					= Hlp_GetInstanceID(slf);
	Info_Stt_6_Ratschlag.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_6_Neues.npc					= Hlp_GetInstanceID(slf);
	};
