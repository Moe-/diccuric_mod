func void ZS_Rennen ()
	{
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, self.wp);
	if (Npc_GetDistToWP (self, self.wp) <= 1000)
		{
			PositionKoll = PositionKoll + 1;
		};
	};
	
func void ZS_Rennen_Loop ()
	{
	if (PositionKoll == 1)
		{
			Npc_ExchangeRoutine	(DIC_2031_Koll,"RUNB");
		}
	else if (PositionKoll == 2)
		{
			Npc_ExchangeRoutine	(DIC_2031_Koll,"RUNC");
		}
	else if (PositionKoll == 3)
		{
			var int TagEndeKollQuest;
			TagEndeKollQuest = Wld_GetDay();
			if (KollTag < TagEndeKollQuest)
				{
					Npc_ExchangeRoutine	(DIC_2031_Koll,"KARTE");
				}
			else
				{
					Npc_ExchangeRoutine	(DIC_2031_Koll,"START");
				};			
		};	
	};
	
func void ZS_Rennen_End ()
	{
	//AI_GotoWP(self, self.wp);
	};