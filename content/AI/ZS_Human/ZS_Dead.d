func void ZS_Dead ()
{	
	PrintDebugNpc	(PD_ZS_FRAME, "ZS_Dead" );		
	PrintGlobals	(PD_ZS_CHECK);

	C_ZSInit();

	self.aivar[AIV_PLUNDERED] = FALSE;
	
/*
	// --------- Feordwin ohne Magier umgehauen ---------------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DIC_2068_Feordwin)
		&& !Npc_KnowsInfo (other, DIA_DIC_Amalric_Los))
		{
		Wld_InsertNpc (StoneGolem, "HOEHLE_002");
		};
*/
		
	// -------------- Arena mit Koll -------------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DIC_2031_Koll)
			&& Npc_GetDistToWP(self, "STADT_WEG_170") <= 5000 && KampfMitKoll == 0)
		{
		KampfMitKoll = 1;
		};
	if (Npc_IsPlayer (self) && Npc_GetDistToWP(DIC_2031_Koll, "STADT_WEG_170") <= 1000
			&& KampfMitKoll == 0)
		{
		KampfMitKoll = 2;
		};
	
	// Abfrage, ob richtige Waffe verwendet wurde
	if (Npc_IsPlayer   (other) &&
	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Leitwolf)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PruefungOrk)))
	{
		if(Npc_IsInFightMode(other,FMODE_MELEE))
		{
			var C_Item itm;
			itm = Npc_GetReadiedWeapon(other);
			PrintScreen		(itm.name, -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("So solltest du den Gegner nicht töten!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Leitwolf))
				{
				Wld_InsertNpc			(Leitwolf, "GT_05");
				}
			else
				{
				Wld_InsertNpc			(PruefungOrk, "GT_HUETT_01");
				};
		}
		else if(Npc_IsInFightMode(other,FMODE_FAR))
		{
			var C_Item itm2;
			itm2 = Npc_GetReadiedWeapon(other);
			PrintScreen		(itm2.name, -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("So solltest du den Gegner nicht töten!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Leitwolf))
				{
				Wld_InsertNpc			(Leitwolf, "GT_05");
				}
			else
				{
				Wld_InsertNpc			(PruefungOrk, "GT_HUETT_01");
				};
		}
		else if(Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			PrintScreen		("Magic", -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("So solltest du den Gegner nicht töten!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Leitwolf))
				{
				Wld_InsertNpc			(Leitwolf, "GT_05");
				}
			else
				{
				Wld_InsertNpc			(PruefungOrk, "GT_HUETT_01");
				};
		}
		else if(Npc_IsInFightMode(other,FMODE_FIST))
		{
			PrintScreen		("Faustkampf", -1, 10, _STR_FONT_ONSCREEN, 9 );
		}
		else
		{
			PrintScreen		("Gegner nicht selbst getötet!", -1, 10, _STR_FONT_ONSCREEN, 9 );
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Leitwolf))
				{
				Wld_InsertNpc			(Leitwolf, "GT_05");
				}
			else
				{
				Wld_InsertNpc			(PruefungOrk, "GT_HUETT_01");
				};
		};
	};
	
	//-------- Erfahrungspunkte für den Spieler ? --------
	//SN: VORSICHT, auch in B_MagicHurtNpc() vorhanden!
	if	Npc_IsPlayer   (other)
	||	(C_NpcIsHuman  (other) && other.aivar[AIV_PARTYMEMBER])
	||	(C_NpcIsMonster(other) && other.aivar[AIV_MM_PARTYMEMBER])
	{
		B_DeathXP();	// vergibt XP an SC
	};
	
	if	C_NpcIsMonster(self)
	{
		B_GiveDeathInv (); 	// für Monster
	};
//	B_CheckDeadMissionNPCs ();		gibts in Dic keine -Harri
//	B_Respawn (self); 			war eh auskommentiert  -Harri
};
