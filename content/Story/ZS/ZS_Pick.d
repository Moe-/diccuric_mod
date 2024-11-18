func void ZS_Pick () 
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Pick");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand

	if !(Npc_IsOnFP(self,"PICK"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "PICK"))
	{
		AI_GotoFP (self,"PICK");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	
};

func void ZS_Pick_Loop ()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Pick_Loop");
	AI_SetWalkmode (self,NPC_WALK);	
	if (Npc_GetStateTime(self) >= (Hlp_Random (10) + 20))
	{
		PrintDebugNpc(PD_TA_DETAIL,"Pick Bücken mit Platzwechsel");
		if (Wld_IsFPAvailable (self, "PICK"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel");
			AI_GotoNextFP (self, "PICK");
			AI_PlayAni (self,"T_PLUNDER");
			Npc_SetStateTime (self,0);
		}
		else if (Npc_IsOnFP(self,"PICK"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"keinen freien FP gefunden!");
			AI_PlayAni (self,"T_PLUNDER");
			Npc_SetStateTime (self,0);
		};
		AI_SetWalkmode (self,NPC_WALK);
	}
	else
	{
		PrintDebugNpc(PD_TA_DETAIL,"Pick Bücken");
		if (Npc_IsOnFP(self,"PICK"))
		{
			AI_PlayAni (self,"T_PLUNDER");
		};
		if (! Hlp_Random (2)) {
			AI_Wait(self,1);
		};
	};
};

func void ZS_Pick_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Pick_End");
};