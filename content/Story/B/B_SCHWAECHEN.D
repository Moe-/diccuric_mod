// Hero soll langsam abschwächen, bis er wieder schläft - Moe
func void B_Schwaechen ()
{	
	Treffer_b = Treffer_b + 1;
	
/*	
	var string ML_Status;
	ML_Status = IntToString (HPCounter);
	PrintScreen	(ML_Status, 30,30,"font_old_20_white.tga",1);
*/
		
	
	var C_Item SWaffe;
	if (Npc_IsPlayer   (other))
	&& Treffer_a != Treffer_b		// Durchlaufunterschiede checken
		{
		Treffer_a = 0;
		Treffer_b = 0;
		
		HPCounter = HPCounter + 1;
		if HPCounter > SchlaegeZahl
			{
				HPCounter = 0;
				var int HPMTemp;
				HPMTemp = hero.attribute[ATR_HITPOINTS] / 30;
				HPLost = HPLost + HPMTemp;
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - HPMTemp;
				hero.attribute[ATR_HITPOINTS] 	= hero.attribute[ATR_HITPOINTS]	- HPMTemp;
				PrintScreen		("Du hast heute zuviel gekämpft!", -1, 50, _STR_FONT_ONSCREEN, 5 );
				PrintScreen		("Deine Energie sinkt für heute!", -1, 60, _STR_FONT_ONSCREEN, 9 );
			};
		if (Npc_IsInFightMode(hero,FMODE_MELEE) || Npc_IsInFightMode(hero,FMODE_FIST))
			{
			SPCounter = SPCounter + 2;
			if SPCounter > SchlaegeZahl
			&& 	hero.attribute[ATR_STRENGTH] > 3								// um nicht ganz aus den Latschen zu kippen :)
				{
				SPCounter = 0;	
				var int SPMTemp;
				if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 2)		// Talente belohnen
					{
						SPMTemp = (hero.attribute[ATR_STRENGTH] / 35) + 1;
					}
				else if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
					{
						SPMTemp = (hero.attribute[ATR_STRENGTH] / 30) + 1;
					}
				else if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
					{
						SPMTemp = (hero.attribute[ATR_STRENGTH] / 26) + 1;
					}
				else if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 1)
					{
						SPMTemp = (hero.attribute[ATR_STRENGTH] / 23) + 1;
					}
				else
					{
						SPMTemp = (hero.attribute[ATR_STRENGTH] / 20) + 1;
					};
				SPLost = SPLost + SPMTemp;
				hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - SPMTemp;
				PrintScreen		("Du hast heute zuviel Kraft im Kampf gebraucht!", -1, 10, _STR_FONT_ONSCREEN, 5 );
				PrintScreen		("Deine Stärke sinkt für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
				
				SWaffe = Npc_GetReadiedWeapon (hero);
				if (SWaffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
					{
						Wld_SendTrigger ("TS_WAFFENWECHSEL");
						Waffenwechsel = Waffenwechsel | 1;
						PrintScreen		("Diese Waffe ist zu schwer und deswegen verbrauche nun mehr Kraft.", -1, 31, _STR_FONT_ONSCREEN, 5 );
						SPCounter = SPCounter + (SchlaegeZahl / 2);
						
					};
				
				};
			};	
		if (Npc_IsInFightMode(hero,FMODE_FAR))
			{
			GPCounter = GPCounter + 3;
			if GPCounter > SchlaegeZahl
			&& 	hero.attribute[ATR_DEXTERITY] > 8
				{
				GPCounter = 0;
				var int GPMTemp;
				if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 2)		// Talente belohnen
					{
						GPMTemp = (hero.attribute[ATR_DEXTERITY] / 35) + 1;
					}
				else if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1)
					{
						GPMTemp = (hero.attribute[ATR_DEXTERITY] / 30) + 1;
					}
				else if (Npc_GetTalentSkill  ( hero, NPC_TALENT_BOW ) == 2)
					{
						GPMTemp = (hero.attribute[ATR_DEXTERITY] / 26) + 1;
					}
				else if (Npc_GetTalentSkill  ( hero, NPC_TALENT_BOW ) == 1)
					{
						GPMTemp = (hero.attribute[ATR_DEXTERITY] / 23) + 1;
					}
				else
					{
						GPMTemp = (hero.attribute[ATR_DEXTERITY] / 20) + 1;
					};
				GPMTemp = (hero.attribute[ATR_DEXTERITY] / 20) + 1;
				GPLost = GPLost + GPMTemp;
				hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - GPMTemp;
				PrintScreen		("Du hast heute zuviel Geschick im Kampf gebraucht!", -1, 10, _STR_FONT_ONSCREEN, 5 );
				PrintScreen		("Deine Geschick sinkt für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
				
				SWaffe = Npc_GetReadiedWeapon (hero);
				if (SWaffe.cond_value[2] > hero.attribute[ATR_DEXTERITY])
					{
						Wld_SendTrigger ("TS_WAFFENWECHSEL");
						Waffenwechsel = Waffenwechsel | 2;
						PrintScreen		("Dein Geschick ist für die diese Waffe nun zu gering.", -1, 30, _STR_FONT_ONSCREEN, 3 );
						};
				};
			};	
		if (Npc_IsInFightMode(hero,FMODE_MAGIC))
			{
			MPCounter = MPCounter + 4;
			if MPCounter > SchlaegeZahl
			&& 	hero.attribute[ATR_MANA] > 8
				{
				MPCounter = 0;
				var int MPMTemp;
				var int MPMBonus;
				MPMBonus = 13 + ((Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) +1) *2);		// Talente belohnen
				MPMTemp = (hero.attribute[ATR_MANA] / MPMBonus) + 1;
				MPLost = MPLost + MPMTemp;
				hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] - MPMTemp;
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - MPMTemp;
				PrintScreen		("Du hast heute zuviel Mana im Kampf gebraucht!", -1, 10, _STR_FONT_ONSCREEN, 5 );
				PrintScreen		("Dein Mana sinkt für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
				};
			};	
		};
	};
	
func void B_Waffenwechsel ()
{
	var C_Item SWaffe;
	
	if (Npc_IsInFightMode(hero,FMODE_MELEE) || Npc_IsInFightMode(hero,FMODE_FIST) || Npc_IsInFightMode(hero,FMODE_FAR) || Npc_IsInFightMode(hero,FMODE_MAGIC))
	{
		Wld_SendTrigger ("TS_WAFFENWECHSEL");		// feuert nach 1s auf B_Waffenwechsel - muß in jedes Level!!
	}
	else
	{
	
		if (Waffenwechsel & 1) == 1
		{
			
						PrintScreen		("Alte Waffe muß gewechselt werden.", -1, 32, _STR_FONT_ONSCREEN, 3 );
						AI_EquipBestMeleeWeapon		(hero);
						SWaffe = Npc_GetReadiedWeapon (hero);
						if (SWaffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
						{
							PrintScreen		("Ich habe keine kleinere Waffe und verbrauche nun mehr Kraft.", -1, 34, _STR_FONT_ONSCREEN, 5 );
							PrintScreen		("und sollte besser eine schwächere Rüstung tragen.", -1, 36, _STR_FONT_ONSCREEN, 9 );
						};
		};
		
		if (Waffenwechsel & 2) == 2
		{
			
						Waffenwechsel = Waffenwechsel | 2;
						PrintScreen		("Dein Geschick ist für die diese Waffe zu gering.", -1, 30, _STR_FONT_ONSCREEN, 3 );
						AI_EquipBestRangedWeapon		(hero);
						SWaffe = Npc_GetReadiedWeapon (hero);
						if (SWaffe.cond_value[2] > hero.attribute[ATR_DEXTERITY])
						{
							PrintScreen		("Ich habe keine schwächere Waffe und verbrauche nun mehr Geschick.", -1, 38, _STR_FONT_ONSCREEN, 3 );
						};
		};
		
		Waffenwechsel = 0;
	};
};
