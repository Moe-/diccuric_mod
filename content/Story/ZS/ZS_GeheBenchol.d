func void ZS_GeheBenchol ()
	{
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, "STADT_WEG_053");	
	};
	
func void ZS_GeheBenchol_Loop ()
	{
	AI_GotoWP(self, "STADT_WEG_056");
	};
	
func void ZS_GeheBenchol_End ()
	{
	AI_GotoWP(self, "STADT_WEG_040");
	Npc_ExchangeRoutine	(self,"START");
	};