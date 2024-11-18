//------------ ENDE -----------------
instance DIA_DIC_Immanuel_Exit (C_INFO)
	{
	npc = DIC_2059_Immanuel;
	nr = 999;
	condition = DIA_DIC_Immanuel_Exit_Condition;
	information = DIA_DIC_Immanuel_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Immanuel_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Immanuel_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	//Npc_SetKnowsPlayer (self, hero);
	};
	
//------------ ENDE -----------------
instance DIA_DIC_Immanuel_Angriff (C_INFO)
	{
	npc = DIC_2059_Immanuel;
	nr = 1;
	condition = DIA_DIC_Immanuel_Angriff_Condition;
	information = DIA_DIC_Immanuel_Angriff_Info;
	permanent = 0;
	important = 1;
	description = "Greife dich an";
	};

func int DIA_DIC_Immanuel_Angriff_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk))
		{
		return 1;
		};
	};

func void DIA_DIC_Immanuel_Angriff_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Immanuel_Angriff_05_00"); //Wenn Du,das Absolute im Sinne des Mannigfaltigen auffasst, kannst du dir dessen bewusst sein, dass Wahrnehmung der Wahrheit des Absoluten nur so erfolgt, indem es nacheinander und allmählich sich ereignet, auch dann, wenn das Vielfache in einer Einheit bildenden, materiellen Form auftritt.
	AI_Output (self, other, "DIA_DIC_Immanuel_Angriff_05_01"); //Nur das Ende deines Lebens, das in wenigen Minuten abgeschlossen sein wird, wird nicht allmählich eintreten, sondern ganz plötzlich...
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	
	AI_StopProcessInfos (self);
	};
	