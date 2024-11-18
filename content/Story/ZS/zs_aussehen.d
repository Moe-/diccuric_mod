func void zs_aussehen ()
	{
	Mdl_SetVisualBody (hero,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);
	PrintDebugNpc (PD_TA_FRAME,"ZS_Guard");
	
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	B_InitArmor();   
	};

func void zs_aussehen_loop()
	{
	PrintDebugNpc	(PD_TA_LOOP,"ZS_Guard_Loop");

	B_GotoFP		(self, "GUARD");
		
	if (Npc_GetDistToNpc(self,hero)<800)
	{
		B_SmartTurnToNpc(self,hero);
	}
	else
	{
		AI_AlignToFP	(self);
	};
	
	B_PlayArmor		();
 	
	AI_Wait			(self,	0.5);
	};

func void zs_aussehen_end()
	{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Guard_End");
	
	B_ExitArmor();  
	};