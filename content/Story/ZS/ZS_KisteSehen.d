func void ZS_KisteSehen ()
	{
	B_SetPerception (self);
	AI_GotoWP(self, "BRUECKE_002");	
	};
	
func void ZS_KisteSehen_Loop ()
	{	
	CreateInvItems (self, ItMiJoint_3, 1);
	AI_UseItemToState	(self,ItMiJoint_3,-1);
	};
	
func void ZS_KisteSehen_End ()
	{
	AI_GotoWP(self, "B_24");
	Npc_ExchangeRoutine	(self,"WORK");
	};