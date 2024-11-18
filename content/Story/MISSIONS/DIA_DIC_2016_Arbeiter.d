//------------ ENDE -----------------
instance DIA_DIC_Arbeiter_2016_Exit (C_INFO)
	{
	npc = DIC_2016_Arbeiter;
	nr = 999;
	condition = DIA_DIC_Arbeiter_2015_Exit_Condition;
	information = DIA_DIC_Arbeiter_2015_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};
	
func int DIA_DIC_Arbeiter_2016_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_Arbeiter_2016_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// Alex Script
// ************************************************************
// 							Austauschplatzmission
// ************************************************************

INSTANCE ZR_60_GoZR (C_INFO)
{
	npc			= DIC_2016_Arbeiter;
	nr			= 1;
	condition	= ZR_60_GoZR_Condition;
	information	= ZR_60_GoZR_Info;
	permanent	= 0;
	description = "Bist du der Aufzugsarbeiter?";
};                       

FUNC INT ZR_60_GoZR_Condition()
{
	if(DC_3_AP)
	&&(!Npc_KnowsInfo(hero,ZR_59_GoZR))
	{
		return 1;
	};
};

FUNC VOID ZR_60_GoZR_Info()
{
	AI_Output (other,self,"ZR_59_GoZR_15_00"); //Bist du einer der Arbeiter die die Rampe reparieren sollen?
	AI_Output (self,other,"ZR_60_GoZR_04_01"); //Was? Aber ich hab' gerade keine Lust. Lass uns doch lieber ein Bier zusammen trinken 
	AI_Output (other, self, "DIA_DIC_Graveyarn_RepariertJa_15_00"); //Nein.
	AI_StopProcessInfos(self);
};

//------------- suchen -- holen ---------------------

INSTANCE DIA_2016_Arbeiter_los (C_INFO)
{
	npc			= DIC_2016_Arbeiter;
	nr			= 1;
	condition	= DIA_2016_Arbeiter_los_Condition;
	information	= DIA_2016_Arbeiter_los_Info;
	permanent	= 0;
	important 	= 1;

};                       



FUNC INT DIA_2016_Arbeiter_los_Condition()
{
	if (Npc_GetDistToWp(self, "RAMPE_02") > 500)
	&& (Npc_KnowsInfo(hero,DIA_DIC_2015_Arbeiter_alleine))
	&& (!Npc_KnowsInfo(hero,DIA_DIC_Arbeiter_2015_Angekommen))
	{
		return 1;
	};
};

FUNC VOID DIA_2016_Arbeiter_los_Info()
{
	AI_Output (other,self,"DIA_2016_Arbeiter_los_15_00"); //Gehts nicht en bissel schneller?
	AI_Output (self,other,"DIA_2016_Arbeiter_los_04_01"); //Arg. Lass mich in ruhe.
	AI_SetWalkmode (self,NPC_RUN);
	Npc_ExchangeRoutine(self,"SCHNELLER");
	AI_StopProcessInfos(self);
	
};

