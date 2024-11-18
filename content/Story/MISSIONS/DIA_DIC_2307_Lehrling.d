//------------ ENDE -----------------
instance DIA_DIC_Lehrling_Exit (C_INFO)
	{
	npc = DIC_2307_Lehrling;
	nr = 999;
	condition = DIA_DIC_Lehrling_Exit_Condition;
	information = DIA_DIC_Lehrling_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Lehrling_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Lehrling_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
// ------------ Wo ist dein Meister ------------
instance DIA_DIC_Lehrling_Meister (C_INFO)
	{
		npc = DIC_2307_Lehrling;
		nr = 1;
		condition = DIA_DIC_Lehrling_Meister_Condition;
		information = DIA_DIC_Lehrling_Meister_Info;
		permanent = 0;
		important = 0;
		description = "Wo ist dein Meister?";
	};
	
func int DIA_DIC_Lehrling_Meister_Condition ()
{
	if (Npc_GetDistToNpc(self,Schmied) > 600 )		// sonst würde die frage komisch wirken  -Harri
	{
		return 1;
	};
};
	
func void DIA_DIC_Lehrling_Meister_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Lehrling_Meister_15_00"); //Du bist doch der Lehrling von Albros. Wo ist er denn?
		AI_Output (self, other, "DIA_DIC_Lehrling_Meister_03_01"); //Er kommt ständig hier vorbei. Aber sonst ist er noch in seiner Schmiede, der Hofschmiede. Aber ich denke nicht, dass du in die Burg kommst...
	};