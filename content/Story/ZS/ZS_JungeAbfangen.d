func void ZS_JungeAbfangen ()
	{
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);
	AI_GotoWP(self, "ZUM_REISFELD_15");	
	};
	
func void ZS_JungeAbfangen_Loop ()
	{
	if (DC_2_Smith == 1 && Npc_KnowsInfo(hero,Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, DIA_DIC_Alwin_Gefunden))
		&& Npc_GetStateTime(self) >= 180)
		{
		Npc_ExchangeRoutine	(self,"FOLGEN");
		}
	else
		{
		var string WP_JP;
		WP_JP = Npc_GetNearestWP(self);
		AI_GotoWP(self, WP_JP);
		};
	AI_Wait (self,10);
	};
	
func void ZS_JungeAbfangen_End ()
	{
	AI_GotoWP(self, "ZUM_REISFELD_17");
	};