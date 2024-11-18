func void ZS_AmalricAngreifen ()
	{
	B_SetPerception (self);
	//AI_ReadyMeleeWeapon (self);
	AI_SetWalkmode (self,NPC_RUN);
	//AI_GotoNPC(self, DIC_2063_Amalric);	
	};
	
func void ZS_AmalricAngreifen_Loop ()
	{
	if (!Npc_IsDead(DIC_2068_Feordwin))
		{
		Npc_SetTarget (self, DIC_2068_Feordwin);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2068_Feordwin);
		}
	else if (!Npc_IsDead(DIC_2069_Waechter))
		{
		Npc_SetTarget (self, DIC_2069_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2069_Waechter);
		}
	else if (!Npc_IsDead(DIC_2070_Waechter))
		{
		Npc_SetTarget (self, DIC_2070_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2070_Waechter);
		}
	else if (!Npc_IsDead(DIC_2071_Waechter))
		{
		Npc_SetTarget (self, DIC_2071_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2071_Waechter);
		}
	else if (!Npc_IsDead(DIC_2072_Waechter))
		{
		Npc_SetTarget (self, DIC_2072_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2072_Waechter);
		}
	else if (!Npc_IsDead(DIC_2073_Waechter))
		{
		Npc_SetTarget (self, DIC_2073_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2073_Waechter);
		}
	else if (!Npc_IsDead(DIC_2074_Waechter))
		{
		Npc_SetTarget (self, DIC_2074_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2074_Waechter);
		}
	else if (!Npc_IsDead(DIC_2075_Waechter))
		{
		Npc_SetTarget (self, DIC_2075_Waechter);
		AI_Attack(self);
		//AI_FinishingMove (self, DIC_2075_Waechter);
		}
	else
		{
		AI_RemoveWeapon(self);
		Npc_ExchangeRoutine(self,"FOLGE");
		AI_ContinueRoutine	(self);
		};
	};
	
func void ZS_AmalricAngreifen_End ()
	{
	//Nichts
	};