// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE M_Worker_Exit (C_INFO)
{
	npc			= Mine_Worker_2034;
	nr			= 999;
	condition	= M_Worker_Exit_Condition;
	information	= M_Worker_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT M_Worker_Exit_Condition()
{
	return 1;
};

FUNC VOID M_Worker_Exit_Info()
{
	AI_StopProcessInfos(self);
};


// **************************************************************
//				Kiste mitnehmen (ohne Alwin)
// **************************************************************

INSTANCE M_Worker_Kiste (C_INFO)
{
	npc			= Mine_Worker_2034;
	nr			= 1;
	condition	= M_Worker_Kiste_Condition;
	information	= M_Worker_Kiste_Info;
	permanent	= 0;
	//description = DIALOG_ENDE;
	important	= 1;

};

FUNC INT M_Worker_Kiste_Condition()
{
	if(DC_2_Smith && (AlwinDabei == 0))
	{
		return 1;
	};
};

FUNC void M_Worker_Kiste_Info()
{
	AI_Output (self,other,"M_Worker_Kiste_07_00"); //Wie lange soll ich denn noch warten. Hier die Kiste.
	AI_Output (other,self,"M_Worker_Kiste_15_01"); //Hatte viel zu tun.

	B_GiveInvItems(self,other,DC_Rohstahlkiste,1);		//Kiste übergeben
	Npc_ExchangeRoutine(self,"HACKEN");
	
	B_LogEntry (OM_MISSION1, "Ich habe die Kiste geholt. Jetzt muss ich sie zur Burg bringen.");
	
	AI_StopProcessInfos(self);
};

// ------------ Kiste zusammen mit Alwin abholen (Trialog funzt net => mehrere Dialoge nötig...) ---------------
INSTANCE DIA_DIC_Worker_Alwin (C_INFO)
	{
	npc			= Mine_Worker_2034;
	nr			= 1;
	condition	= DIA_DIC_Worker_Alwin_Condition;
	information	= DIA_DIC_Worker_Alwin_Info;
	permanent	= 0;
	important	= 1;
	description = "";
	};

FUNC INT DIA_DIC_Worker_Alwin_Condition()
	{
	if (DC_2_Smith && AlwinDabei)
		{
		return 1;
		};
	};

FUNC void DIA_DIC_Worker_Alwin_Info()
	{
	AI_TurnToNpc	(DIC_2003_Alwin,self);
	AI_TurnToNpc	(self,DIC_2003_Alwin);	
	AI_Output (self,other,		"M_Worker_Kiste_Info_07_00"); //Alwin, bist du der neue Leibwächter von Ardaric? Ha Ha Ha.
	
	MinenDialog = MinenDialog + 1;
	AI_GotoNpc (hero, DIC_2003_Alwin);
	AI_WaitTillEnd(self, hero);
	AI_StopProcessInfos(self);
	};

INSTANCE DIA_DIC_Worker_Alwin_3 (C_INFO)
	{
	npc			= Mine_Worker_2034;
	nr			= 2;
	condition	= DIA_DIC_Worker_Alwin_3_Condition;
	information	= DIA_DIC_Worker_Alwin_3_Info;
	permanent	= 0;
	important	= 1;
	description = "";
	};

FUNC INT DIA_DIC_Worker_Alwin_3_Condition()
	{
	if (MinenDialog == 2)
		{
		return 1;
		};
	};

FUNC void DIA_DIC_Worker_Alwin_3_Info()
	{
	AI_TurnToNpc	(DIC_2003_Alwin,self);
	AI_TurnToNpc	(self,DIC_2003_Alwin);	
	AI_Output (self,other,		"M_Worker_Kiste_Info_07_02"); //Hey, das ist nichts verbotenes!
	MinenDialog = MinenDialog + 1;
	AI_GotoNpc (hero, DIC_2003_Alwin);
	AI_WaitTillEnd(self, hero);
	AI_StopProcessInfos(self);
	};

INSTANCE DIA_DIC_Worker_Alwin_5 (C_INFO)
	{
	npc			= Mine_Worker_2034;
	nr			= 3;
	condition	= DIA_DIC_Worker_Alwin_5_Condition;
	information	= DIA_DIC_Worker_Alwin_5_Info;
	permanent	= 0;
	important	= 1;
	description = "";
	};

FUNC INT DIA_DIC_Worker_Alwin_5_Condition()
	{
	if (MinenDialog == 4)
		{
		return 1;
		};
	};

FUNC void DIA_DIC_Worker_Alwin_5_Info()
	{
	AI_TurnToNpc	(DIC_2003_Alwin,self);
	AI_TurnToNpc	(self,DIC_2003_Alwin);
	AI_Output (self,other,		"M_Worker_Kiste_Info_07_04"); //Hey, Hey, Einigkeit! "Möge der Frieden des weisen Königs von Gatyah auch dein Herz mit Sanftmut erfüllen." Oder wie war der Spruch noch von damals? naja... also alles ruhig Mann... ich hab nichts gesagt
	AI_GotoNpc (self, DIC_2003_Alwin);
	MinenDialog = MinenDialog + 1;
	B_GiveInvItems(self,DIC_2003_Alwin,DC_Rohstahlkiste,1);		//Kiste übergeben
	Npc_ExchangeRoutine(self,"HACKEN");

	AI_GotoNpc (hero, DIC_2003_Alwin);
	AI_WaitTillEnd(self, hero);
	AI_StopProcessInfos(self);
	};

// **************************************************************
//				Mit Kiste angequatscht
// **************************************************************

INSTANCE M_Worker_Kiste_quatsch (C_INFO)
{
	npc			= Mine_Worker_2034;
	nr			= 1;
	condition	= M_Worker_Kiste_quatsch_Condition;
	information	= M_Worker_Kiste_quatsch_Info;
	permanent	= 0;
	description = "Wat nu?";
	important	= 0;

};

FUNC INT M_Worker_Kiste_quatsch_Condition()
{
	if(DC_2_Smith)
	&&(Npc_HasItems(other,DC_Rohstahlkiste) >=1)
	{
		return 1;
	};
};

FUNC void M_Worker_Kiste_quatsch_Info()
{
	AI_Output (other,self,"M_Worker_Kiste_quatsch_Info_07_00"); //Und? Was nun?
	AI_Output (self,other,"M_Worker_Kiste_quatsch_Info_15_01"); //Himmel! Nun gehst du zum Schmied?! Da kann man aber auch selber drauf kommen!!!
	AI_StopProcessInfos(self);
};