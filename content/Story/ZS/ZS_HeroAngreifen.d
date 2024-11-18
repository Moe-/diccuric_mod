func void ZS_HeroAngreifen ()
	{
	B_SetPerception (self);
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_FollowPC_AssessSC	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	AI_ReadyMeleeWeapon (self);
	AI_SetWalkmode (self,NPC_RUN);
	AI_GotoNPC(self, hero);	
	};
	
func void ZS_HeroAngreifen_Loop ()
	{
	if (Npc_GetDistToNPC(self,hero) <= 1000)
		{
		Npc_SetTarget (self, hero);
		AI_Attack(self);
		
		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude 	(self, ATT_HOSTILE);
		
		};
	};
	
func void ZS_HeroAngreifen_End ()
	{
	//Nichts
	};