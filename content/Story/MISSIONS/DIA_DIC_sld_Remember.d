// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Sld_Rem_Exit (C_INFO)
{
	npc			= Sld_61_Remember;
	nr			= 999;
	condition	= Sld_Rem_Exit_Condition;
	information	= Sld_Rem_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Sld_Rem_Exit_Condition()
{
	return 1;
};

FUNC VOID Sld_Rem_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 								Zurecht Stutzen!
// ************************************************************

INSTANCE Sld_Rem_Makeit (C_INFO)
{
	npc			= Sld_61_Remember;
	nr			= 1;
	condition	= Sld_Rem_Makeit_Condition;
	information	= Sld_Rem_Makeit_Info;
	permanent	= 0;
	important   = 1;
	//description = DIALOG_ENDE;
};

FUNC INT Sld_Rem_Makeit_Condition()
{
	if (DC_2_Smith == 1 && Npc_KnowsInfo(hero,Alwin_Search_Ufer) 
		&& !(Npc_KnowsInfo(hero, DIA_DIC_Alwin_Gefunden))
		&& !(Npc_KnowsInfo(hero, Schmied_Gib_Kiste))) 
	{
		return 1;
	};
};

FUNC VOID Sld_Rem_Makeit_Info()
{
	AI_Output (self, other, "Sld_Rem_Makeit_Info_11_00"); //Hey, Junge. Komm raus da.
	AI_Output (other, self, "Sld_Rem_Makeit_Info_15_01"); //Mein Name ist Ardaric. Was ist?
	AI_Output (self, other, "Sld_Rem_Makeit_Info_11_02"); //Ich hab schon nach dir überall gesucht. Du solltest doch eine Kiste für den Schmied holen? Was machst du hier?
	AI_Output (other, self, "Sld_Rem_Makeit_Info_15_03"); //Ich.. ich äh... tauche...
	AI_Output (self, other, "Sld_Rem_Makeit_Info_11_04"); //Hör zu Bursche, melde dich bei Graveyarn. Und vorher erledige das mit der Kiste.
	AI_Output (other, self, "Sld_Rem_Makeit_Info_15_05"); //Immer mit der Ruhe. Bin schon auf dem Weg.
	AI_Output (self, other, "Sld_Rem_Makeit_Info_11_06"); //Das sieht man. Ich werde über deinen Ausflug sowieso Bericht erstatten. Wenn du dich beeilst, wird Graveyarn es dir vielleicht nicht allzu übel nehmen.

	B_LogEntry (NL_TAUCHGANG, "Ein Söldner hat mich erwischt, wie ich mit Alwin unterwegs war. Jetzt muss ich dringend los und die Kiste holen.");
	
	Npc_ExchangeRoutine(self,"START");
	Npc_ExchangeRoutine(DIC_2003_Alwin,"FOLGE");
	AI_ContinueRoutine	(DIC_2003_Alwin);
};