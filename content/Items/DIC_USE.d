const int BetrunkenZeit = 45000;	// 45 sec
const int JointZeit = 90000;

func void AlkoholTrinken ()
	{
	if (Wld_GetDay() == LetzterAlkohol && Npc_IsPlayer(self))
		{
		AlkoholStand = AlkoholStand + 1;
		if (AlkoholStand > 3)
			{
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_DRUNKEN.MDS", BetrunkenZeit);
			};
		}
	else
		{
		AlkoholStand = 1;
		LetzterAlkohol = Wld_GetDay();
		};	
	};
	
func void JointRauchen ()
	{
	if (Wld_GetDay() == LetzterJoint && Npc_IsPlayer(self))
		{
		JointStand = JointStand + 1;
		if (JointStand > 3 || JointStand == 1)
			{
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_DRUNKEN.MDS", JointZeit);
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_RELAXED.MDS", JointZeit);
			};
		}
	else
		{
		JointStand = 2;
		LetzterJoint = Wld_GetDay();
		};	
	};
	
// Zuviel gegessen
func void VielEssen ()
	{
	if (Wld_GetDay() == LetztesEssen && Npc_IsPlayer(self))
		{
		EssenStand = EssenStand + 1;
		if EssenStand > 100
			{
			PrintScreen	("Ohh man, mir ist Übel vom vielen Essen", -1,30,"font_old_20_white.tga",4);
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_DRUNKEN.MDS", JointZeit);			
			Mdl_ApplyOverlayMds	(hero,"HUMANS_ARROGANCE.MDS");
			};
		}
	else
		{
		EssenStand = 1;
		LetztesEssen = Wld_GetDay();
		Mdl_RemoveOverlayMDS (self, "HUMANS_ARROGANCE.MDS");
		};	
	};

func void VielEssenAufheben ()
	{
	EssenStand = 0;
	LetztesEssen = Wld_GetDay();
	Mdl_RemoveOverlayMDS (self, "HUMANS_ARROGANCE.MDS");	
	};
	
// -------- Überschüssige Rüstungen durch Verwandlungen entfernen ---------
func void KontrolleRuestungsZahl ()
	{
	var int RuestungsAnzahl;
	RuestungsAnzahl = Npc_HasItems (hero, Ardaric_Amor1);
	if (RuestungsAnzahl > 1)
		{
		RuestungsAnzahl = RuestungsAnzahl - 1;
		Npc_RemoveInvItems (hero, Ardaric_Amor1, RuestungsAnzahl);
		};
	};