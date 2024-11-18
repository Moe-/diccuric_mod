//------------ ENDE -----------------
instance DIA_DIC_Jaeger_2041_Exit (C_INFO)
	{
	npc = DIC_2041_Jaeger;
	nr = 999;
	condition = DIA_DIC_Jaeger_2041_Exit_Condition;
	information = DIA_DIC_Jaeger_2041_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};
	
func int DIA_DIC_Jaeger_2041_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_DIC_Jaeger_2041_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// -------------- Waffen gefunden ---------------
instance DIA_DIC_Jaeger_2041_Waffen (C_INFO)
{
	npc = DIC_2041_Jaeger;
	nr = 1;
	condition = DIA_DIC_Jaeger_2041_Waffen_Condition;
	information = DIA_DIC_Jaeger_2041_Waffen_Info;
	permanent = 1;
	description = "Was macht ihr hier?";
	};
	
func int DIA_DIC_Jaeger_2041_Waffen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Baltar_Auftrag))
		{
		return 1;
		};
	};
	
func void DIA_DIC_Jaeger_2041_Waffen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Jaeger_2041_Waffen_15_00"); //Was macht ihr hier?
	AI_Output (self, other, "DIA_DIC_Jaeger_2041_Waffen_04_01"); //Wir haben ein paar Waffen in einer Höhle gefunden und räumen sie nun auf.
	};