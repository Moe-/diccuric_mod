func void ZS_Staerker ()
	{
		C_ZSInit();
		
		if (Npc_GetStateTime(hero) > 30)
			{
				hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 50;
				Npc_ClearAIQueue (hero);
				AI_StandUpQuick (hero);
			}
		else
			{
				var string TempWP;
				TempWP = Npc_GetNearestWP(hero);
				AI_StartState(hero, ZS_Staerker, 0, TempWP);
			};
	};		
	