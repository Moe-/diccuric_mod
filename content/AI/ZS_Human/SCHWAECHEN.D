// Hero soll langsam abschwächen, bis er wieder schläft - Moe
func void Schwaechen ()
	{
	var int SchlaegeZahl;
	SchlaegeZahl = 5;
	if (Npc_IsPlayer   (other))
		{
		HPCounter = HPCounter + 1;
		if ((HPCounter % SchlaegeZahl) == 0)
			{
			var int HPMTemp;
			HPMTemp = hero.attribute[ATR_HITPOINTS] / 10;
			HPLost = HPLost + HPMTemp;
			hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - HPMTemp;
			hero.attribute[ATR_HITPOINTS] 	= hero.attribute[ATR_HITPOINTS]	- HPMTemp;
			PrintScreen		("Du hast heute zuviel gekämpft!", -1, 10, _STR_FONT_ONSCREEN, 9 );
			PrintScreen		("Deine HP sinken für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
			};
		if (Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST))
			{
			SPCounter = SPCounter + 1;
			if ((SPCounter % SchlaegeZahl) == 0)
				{
				var int SPMTemp;
				SPMTemp = hero.attribute[ATR_STRENGTH] / 10;
				SPLost = SPLost + SPMTemp;
				hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - SPMTemp;
				PrintScreen		("Du hast heute zuviel Kraft im Kampf gebraucht!", -1, 10, _STR_FONT_ONSCREEN, 9 );
				PrintScreen		("Deine Stärke sinkt für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
				};
			};	
		if (Npc_IsInFightMode(other,FMODE_FAR))
			{
			GPCounter = GPCounter + 1;
			if ((GPCounter % SchlaegeZahl) == 0)
				{
				var int GPMTemp;
				GPMTemp = hero.attribute[ATR_DEXTERITY] / 10;
				GPLost = GPLost + GPMTemp;
				hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - GPMTemp;
				PrintScreen		("Du hast heute zuviel Geschick im Kampf gebraucht!", -1, 10, _STR_FONT_ONSCREEN, 9 );
				PrintScreen		("Deine Geschick sinkt für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
				};
			};	
		if (Npc_IsInFightMode(other,FMODE_MAGIC))
			{
			MPCounter = MPCounter + 1;
			if ((MPCounter % SchlaegeZahl) == 0)
				{
				var int MPMTemp;
				MPMTemp = hero.attribute[ATR_MANA] / 10;
				MPLost = MPLost + MPMTemp;
				hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] - MPMTemp;
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - MPMTemp;
				PrintScreen		("Du hast heute zuviel Mana im Kampf gebraucht!", -1, 10, _STR_FONT_ONSCREEN, 9 );
				PrintScreen		("Dein Mana sinkt für heute!", -1, 20, _STR_FONT_ONSCREEN, 9 );
				};
			};	
		};
	};