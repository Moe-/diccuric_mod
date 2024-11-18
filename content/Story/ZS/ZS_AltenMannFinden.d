func void ZS_AltenMannFinden ()
	{
	B_SetPerception (self);
	AI_ReadyMeleeWeapon (self);
	AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, "B_52");	
	};
	
func void ZS_AltenMannFinden_Loop ()
	{
	if (Npc_IsDead(DIC_2053_Malachias))
		{
		AI_RemoveWeapon(self);
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine	(self);
		}
	else
		{
		Npc_SetTarget (self, DIC_2053_Malachias);
		AI_Attack(self);
		AI_FinishingMove (self, DIC_2053_Malachias);
		};
	};
	
func void ZS_AltenMannFinden_End ()
	{
	//Nichts
	};