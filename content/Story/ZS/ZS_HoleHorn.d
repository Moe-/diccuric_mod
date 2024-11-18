func void ZS_HoleHorn ()
	{
	B_SetPerception (self);
	AI_GotoWP(self, "FOREST01_23");	
	};
	
func void ZS_HoleHorn_Loop ()
	{
	AI_SetWalkmode(self, NPC_WALK);
	//AI_GotoWP(self, "SEE_VOR_STADT_11");
	//AI_GotoWP(self, "SEE_VOR_STADT_12");
	
	if (Npc_GetDistToWP(hero, "SEE_VOR_STADT_10") < 2500 && Npc_GetDistToWP(self, "SEE_VOR_STADT_11") < 50)
		{
		AI_GotoWP(self, "SEE_VOR_STADT_12");
		}
	else if (Npc_GetDistToWP(hero, "SEE_VOR_STADT_10") < 2500 && Npc_GetDistToWP(self, "SEE_VOR_STADT_12") < 50)
		{
		AI_GotoWP(self, "SEE_VOR_STADT_11");
		}
	else if (!(Npc_HasItems(hero,ScavHorn) >= 1) && !(Npc_HasItems(self,ScavHorn) >= 1))
		{
		AI_GotoItem(self, ScavHorn);
		AI_TakeItem (self, ScavHorn);
		}
	else
		{
		AI_GotoWP(self, "VORDERSTADT_06");
		Npc_ExchangeRoutine	(self,"BAUM");
		};
	};
	
func void ZS_HoleHorn_End ()
	{
	AI_GotoWP(self, "VORDERSTADT_06");
	Npc_ExchangeRoutine	(self,"BAUM");
	};