//////////////////////////////////////////////////////////////////////////
//
//	ZS_ReactToDamage
//	================
//	Wird durch:
//
//	- PERC_ASSESSDAMAGE
//	- einige Magiezustände	(nachtragen, welche)
//
//	aufgerufen. Vorraussetzungen:
//
//	- keine
//
//	Es passiert folgendes:
//
//	1.	Angreifer ist ein MENSCH
//		->	FRIENDLY zu SC-Angreifer		-> "Was soll das?"	-> dann ANGRY
//		-> 	NEUTRAL/ANGRY zu SC-Angreifer	-> dann HOSTILE		-> ZS_AssessEnemy
//		->	NSC-Angreifer					-> ZS_AssessEnemy
//	2.	Angreifer ist ein MONSTER
//		-> ZS_AssessMonster	  
//
//////////////////////////////////////////////////////////////////////////
func void ZS_ReactToDamage ()
{	
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_ReactToDamage" );			
	PrintGlobals		(PD_ZS_CHECK);
	C_ZSInit();	

	Npc_PercEnable		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic			);
	Npc_PercEnable		(self,	PERC_ASSESSMURDER	,	B_CombatAssessMurder	);	
	Npc_PercEnable		(self,	PERC_ASSESSDEFEAT	,	B_CombatAssessDefeat	);
	
	B_WhirlAround 		(self, other);

	// Hero soll langsam abschwächen, bis er wieder schläft
	B_Schwaechen ();
		
	//-------- spezielle Reaktionen im Kampf --------
	if (self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION])
	{
		B_SpecialCombatDamageReaction();
	};

	// Wächter einschalten
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DIC_2068_Feordwin))
		{
		Npc_ExchangeRoutine(DIC_2069_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2069_Waechter);
		Npc_ExchangeRoutine(DIC_2070_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2070_Waechter);
		Npc_ExchangeRoutine(DIC_2071_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2071_Waechter);
		Npc_ExchangeRoutine(DIC_2072_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2072_Waechter);
		Npc_ExchangeRoutine(DIC_2073_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2073_Waechter);
		Npc_ExchangeRoutine(DIC_2074_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2074_Waechter);
		Npc_ExchangeRoutine(DIC_2075_Waechter,"ANGRIFF");
		AI_ContinueRoutine	(DIC_2075_Waechter);	
		};
	
	//-------- Merken ob Schaden durch Fernkampfwaffe/Magie verursacht wurde --------
	if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};

	//-------- Angreifer ist Mensch/Ork ! --------
	if (!C_NpcIsMonster(other))		
	{
		if (Npc_IsPlayer(other))
		{
			self.aivar[AIV_BEENATTACKED] = 1;
	
			if ((Npc_GetTempAttitude(self,other)==ATT_FRIENDLY) || (self.npctype==NPCTYPE_FRIEND))
			{
				PrintDebugNpc			(PD_ZS_CHECK,	"...NSC FRIENDLY zum Angreifer");
				C_LookAtNpc 			(self,	other);
				B_Say 					(self,	other,	"WHATAREYOUDOING");
				Npc_SetTempAttitude		(self,	ATT_ANGRY);
				AI_ContinueRoutine		(self);
				return;
			}
			else
			{
				PrintDebugNpc			(PD_ZS_CHECK, "...NSC nicht FRIENDLY zum Angreifer!");
	
				if (Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					Npc_SetPermAttitude	(self,	ATT_ANGRY);
				};
				Npc_SetTempAttitude		(self,	ATT_HOSTILE);
			};
		};
		
		AI_StartState 				(self,	ZS_AssessEnemy,	0, "" );
	}
	
	//-------- Angreifer ist Monster ! --------
	else		
	{	
		AI_StartState 				(self,	ZS_AssessMonster,	0, "" );
	};
	
	//Added by Moe - Npc darf nur mit bestimmter Waffe angegriffen werden
	if (Npc_IsPlayer   (other) &&
	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Leitwolf)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PruefungOrk)))
	{
		if(Npc_IsInFightMode(other,FMODE_MELEE))
		{
			var C_Item itm;
			itm = Npc_GetReadiedWeapon(other);
			PrintScreen		(itm.name, -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("Mit der Waffe richte ich keinen Schaden an!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	
		}
		else if(Npc_IsInFightMode(other,FMODE_FAR))
		{
			var C_Item itm2;
			itm2 = Npc_GetReadiedWeapon(other);
			PrintScreen		(itm2.name, -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("Mit der Waffe richte ich keinen Schaden an!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		}
		else if(Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			PrintScreen		("Magie", -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("Mit der Waffe richte ich keinen Schaden an!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		}
		else if(Npc_IsInFightMode(other,FMODE_FIST))
		{
			PrintScreen		("Faustkampf", -1, 10, _STR_FONT_ONSCREEN, 9 );
		}
		else
		{
			PrintScreen		("Gegner wurde nicht selber getötet!", -1, 10, _STR_FONT_ONSCREEN, 9 );
			
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
};


