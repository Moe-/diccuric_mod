func void B_Orc_AssessDamage()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessDamage" );
	
	AI_TurnToNpc( self, other );
	
	//wenn Gegner weit weg, hinspringen!
	if ( Npc_GetDistToNpc( self, other ) > 500 )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessDamage: Gegner weit weg -> hinspringen" );
		AI_PlayAni( self, "T_STAND_2_JUMP" );		
	};

	B_FullStop			(self);
	Npc_SendPassivePerc	(self,	PERC_ASSESSWARN,	self, 	other);

	Npc_SetTempAttitude	(self,	ATT_HOSTILE );
	Npc_SetTarget		(self,	other);
	AI_StartState		(self,	ZS_Orc_Attack, 0, "" );
	
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