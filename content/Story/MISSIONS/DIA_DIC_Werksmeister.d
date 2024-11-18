// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Werksmeister_Exit (C_INFO)
{
	npc			= Werksmeister;
	nr			= 999;
	condition	= Werksmeister_Exit_Condition;
	information	= Werksmeister_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Werksmeister_Exit_Condition()
{
	return 1;
};

FUNC VOID Werksmeister_Exit_Info()
{
	AI_StopProcessInfos(self);
};


// ******************************************************************
//							Zahnrad geben
// ******************************************************************

INSTANCE Werksmeister_ZR(C_INFO)
{
	npc			= Werksmeister;
	nr			= 1;
	condition	= Werksmeister_ZR_Condition;
	information	= Werksmeister_ZR_Info;
	permanent	= 0;
	important   = 0;
	description = "Die Rampe";
};

FUNC INT Werksmeister_ZR_Condition()
{
	if(DC_3_AP && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
	{
		return TRUE;
	};

};

FUNC VOID Werksmeister_ZR_Info()
{
	AI_Output (other,self,"Werksmeister_ZR_15_00"); //Ich soll mich bei dir melden. Es geht um die Rampe.
	AI_Output (self,other,"Werksmeister_ZR_12_01"); //Ja. Genau. Hier nimm dieses Zahnrad, du brauchst es für die Reparatur der Anlieferungsrampe.

	B_GiveInvItems(self,other,DC_Gearwheel_AP,1);
	
	B_LogEntry (GY_PR_1, "Ich habe beim Werksmeister das Ersatzteil für die Rampe geholt.");
};


// ******************************************************************
//							Wo sind Arbeiter
// ******************************************************************

INSTANCE Werksmeister_Worker(C_INFO)
{
	npc			= Werksmeister;
	nr			= 2;
	condition	= Werksmeister_Worker_Condition;
	information	= Werksmeister_Worker_Info;
	permanent	= 1;
	important   = 0;
	description = "Wo sind die Arbeiter?";
};

FUNC INT Werksmeister_Worker_Condition()
{
	if(DC_3_AP && !(Npc_KnowsInfo(hero, DIA_dic_Taliasan_Annehmen)))
	{
		return TRUE;
	};

};

FUNC VOID Werksmeister_Worker_Info()
{
	AI_Output (other,self,"Werksmeister_Worker_15_00"); //Wo sind die Arbeiter?, die mich begleiten sollen?
	AI_Output (self,other,"Werksmeister_Worker_12_01"); //Sie sind wahrscheinlich an ihren Hütten gegenüber des hölzernen Podestes.

};


// ----------- Brücke Reparieren ------------------
INSTANCE DIA_DIC_Werksmeister_Bruecke(C_INFO)
	{
	npc			= Werksmeister;
	nr			= 3;
	condition	= DIA_DIC_Werksmeister_Bruecke_Condition;
	information	= DIA_DIC_Werksmeister_Bruecke_Info;
	permanent	= 0;
	important   = 0;
	description = "Die Brücke ist eingekracht...";
	};

FUNC INT DIA_DIC_Werksmeister_Bruecke_Condition()
	{
	if(BrueckenEinbruch == 1)
		{
		return 1;
		};

	};

FUNC VOID DIA_DIC_Werksmeister_Bruecke_Info()
	{
	AI_Output (other, self, "DIA_DIC_Werksmeister_Bruecke_15_00"); //Der Holzsteg an der Brücke ist eingekracht. Zwei Söldner haben sie angesägt...
	AI_Output (self, other, "DIA_DIC_Werksmeister_Bruecke_12_01"); //Wer war das?!?!?
	AI_Output (other, self, "DIA_DIC_Werksmeister_Bruecke_15_02"); //Dabnor und Kanapus.
	AI_Output (self, other, "DIA_DIC_Werksmeister_Bruecke_12_03"); //Die beiden werde ich... Danke, dass du das gesagt hast. Ich werde mich darum kümmern.

	BrueckeMussGerichtetWerden = 1;
	//Wld_SendTrigger ("RAMPERICHTEN");
	B_GiveXP (100);
	};