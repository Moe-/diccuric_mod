FUNC VOID ZS_Rake()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Rake");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);

	if !(Npc_IsOnFP(self,"PICK"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "PICK"))
	{
		AI_GotoFP (self,"PICK");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	if (Npc_HasItems (self,ItMi_Rake) == 0)
	{
		CreateInvItem (self,ItMi_Rake);
	};
};

FUNC VOID ZS_Rake_Loop ()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Rake_Loop");
	if ((Npc_GetStateTime(self) >= (Hlp_Random (10) + 20)) && (Hlp_Random(2)))
	{
		AI_UseItemToState (self, ItMi_Rake, -1);
		if (Wld_IsFPAvailable (self, "PICK"))
		{
			AI_SetWalkmode (self,NPC_WALK);	
			AI_GotoNextFP (self, "PICK");
		}
		else if (Npc_IsOnFP(self,"PICK"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"keinen freien FP gefunden!");
		};
		AI_AlignToFP( self );				//Richte Dich aus
		if (!C_BodyStateContains(self, BS_ITEMINTERACT))
		{
			AI_UseItemToState 	(self,ItMi_Rake,1);
		};
		Npc_SetStateTime (self,0);
	}
	else
	{
		if (Npc_IsOnFP(self,"PICK"))
		{
			if (!C_BodyStateContains(self, BS_ITEMINTERACT))
			{
				AI_UseItemToState 	(self,ItMi_Rake,1);
			};
		};
	};
};

FUNC VOID ZS_Rake_End() 
{ 
	AI_UseItemToState (self, ItMi_Rake, -1);
	PrintDebugNpc(PD_TA_FRAME,"ZS_Rake_End");
};