// Lurker, der auf sein  Brut (Eier) aufpasst
func void ZS_MM_GuardEggs()
	{
	if (Npc_HasItems(hero, LurkerEi) >= 1 && !Npc_IsInState(hero, ZS_Talk))
		{
		AI_Wait (self, 3);
		Npc_SetTarget (self, hero);
		AI_Attack(self);
		}
	else if (Npc_HasItems(DIC_2009_Soeldner, LurkerEi) >= 1 && !Npc_IsInState(DIC_2009_Soeldner, ZS_Talk))
		{
		Npc_SetTarget (self, DIC_2009_Soeldner);
		AI_Attack(self);
		}
	else
		{
		if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
			}
		else
			{
			AI_StartState (self, ZS_MM_Rtn_Default, 1, "");
			};
		};
	}; 
	
// Lurker, der auf sein  Brut (Eier) aufpasst
/*
func void ZS_MM_WaraneAngriff()
	{	
	AI_GotoNpc (self, hero);
	if (Npc_GetDistToNpc(self, hero) <= 7500 &&
			Npc_GetDistToWP(self, "WIESE02_04") <= 7500 && 
			!Npc_IsInState(hero, ZS_Talk))
		{	
		self.guild = GIL_WARAN;
		self.fight_tactic	=	FAI_WARAN;
		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude 	(self, ATT_HOSTILE);
		Npc_SetTarget (self, hero);
		AI_Attack(self);
		};
	}; */

//Wolf KI vom Frontlinequest
func void ZS_WGE_ErwarteAngriff ()
	{
	if (WolfAngriff >= 1 && !Npc_IsInState(DIC_2018_Narrow, ZS_Talk))
		{
		Npc_SetTarget (self, DIC_2018_Narrow);
		AI_Attack(self);
		}
	else
		{
		if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
			}
		else
			{
			AI_StartState (self, ZS_MM_Rtn_Default, 1, "");
			};
		};
	};
	
// Wolfangriff bei Barem
func void ZS_BaremAngriff ()
	{
	if (BaremInfo >= 3)
		{
		B_GotoWPNextToNpc(self, hero);		
		}
	else
		{
		if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
			}
		else
			{
			AI_StartState (self, ZS_MM_Rtn_Default, 1, "");
			};
		};
	};
	
// Wolfangriff bei Hintertor
func void ZS_HTAngriff ()
	{
	var int TempTagHinterTor;
	TempTagHinterTor = Wld_GetDay();
	if (Npc_KnowsInfo(hero, DIA_DIC_Torwache_Woelfe) && TagHinterTorAngriff < TempTagHinterTor)
		{
		Npc_SetTarget (self, DIC_2024_Torwache);
		AI_Attack(self);
		}
	else 
		{
		if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
			}
		else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
			{
			AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
			}
		else
			{
			AI_StartState (self, ZS_MM_Rtn_Default, 1, "");
			};
		};
	//B_GotoWPNextToNpc(self, DIC_2024_Torwache);		
	};

func void ZS_MM_Wala ()
	{
	Npc_SetTempAttitude		(self,	ATT_FRIENDLY); 
	Npc_SetAttitude			(self,	ATT_FRIENDLY);
	
	if (WalaZustand == 0)
		{
		AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
		}
	else if (WalaZustand == 1)
		{
		AI_StartState (self, ZS_FollowPC, 1, "");
		}
	else
		{
		AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
		};
	};