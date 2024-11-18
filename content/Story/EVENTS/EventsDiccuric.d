// ------- Spieler kommt Taliasans Schrank A zu Nahe nach Anfrage auf Buch ----------
func void Schrank_A_Nah ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Taliasan_Buch))
		{
		SchrankA = 1;
		};
	};
	
// --------- Spieler nähert sich Schrank B nach Anfrage auf Buch -----
func void Schrank_B_Nah ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Taliasan_Buch))
		{
		SchrankB = 1;
		};
	};
	
// ------- Junge bricht mit Kiste ein --------------
// ---- @Harri: Diese Funktion für die Falle aufrufen! ----------
func void BrueckeEinbrechen ()
	{
	if ((Npc_HasItems(hero, DC_Rohstahlkiste)) && (BrueckenEinbruch == 0)
			&& !(DC_1_Tower == -1))
		{
		//Wld_SendTrigger ("BRUECKENBRETT");
		//Wld_SendTrigger ("STAHLKISTEVER");
		
		Wld_SendTrigger ("FALLE1");
		Wld_SendTrigger ("FALLE2");
		Wld_SendTrigger ("FALLE3");
		Wld_SendTrigger ("FALLE4");

		PrintScreen	("Du hast die Stahlkiste verloren!", -1,-1,"font_old_20_white.tga",3);
		
		Npc_RemoveInvItem(pc_hero, DC_Rohstahlkiste);
		BrueckenEinbruch = 1;
		B_LogEntry (OM_MISSION1, "So ein Mist. Wie soll ich denn erklären, dass die Kiste im Schlamm steckt?");
		Npc_ExchangeRoutine(Schmied,"LEHRLING");
		};
	};
	
// --------- Möglicher Nächtlicher Überfall, wenn der Spieler mit dem Schlafsack schläft ----------
func void NaechtlicherUeberfall ()
	{
	// --- Prüfen, ob Spieler an einer sicheren Position ist ---
	if (Npc_GetDistToWP(hero, "STADT_WEG_193") <= 7500
			|| Npc_GetDistToWP(hero, "STADT_WEG_055") <= 7500
			|| Npc_GetDistToWP(hero, "B_03") <= 7500
			|| Npc_GetDistToWP(hero, "B_40") <= 7500
			|| Npc_GetDistToWP(hero, "MINIBURG_35") <= 2500)
		{
		MonsterArt = 2;
		}
	else
		{
		MonsterArt = Hlp_Random(12);
		};
	
	// -------- Wird etwas gespawned? ---------	
	if (MonsterArt == 1)
		{
		GegnerSpawn = Npc_GetNearestWP(hero);
		Wld_InsertNpc (JngWaran2, GegnerSpawn);
		AI_Output (hero, hero, "Schlafsack15_00"); //Ein junger Waran stört mich im Schlaf?
		}
	else if (MonsterArt == 3)
		{
		GegnerSpawn = Npc_GetNearestWP(hero);
		Wld_InsertNpc (YScavenger, GegnerSpawn);
		AI_Output (hero, hero, "Schlafsack15_01"); //So ein junger Scavenger sollte kein Problem sein...
		}
	else if (MonsterArt == 5)
		{
		GegnerSpawn = Npc_GetNearestWP(hero);
		Wld_InsertNpc (YMolerat, GegnerSpawn);
		AI_Output (hero, hero, "Schlafsack15_02"); //Der Molerat erledige ich doch mit Links!
		}
	else if (MonsterArt == 7)
		{
		GegnerSpawn = Npc_GetNearestWP(hero);
		Wld_InsertNpc (Scavenger, GegnerSpawn);
		AI_Output (hero, hero, "Schlafsack15_03"); //Den Scavenger mach ich kalt!
		}
	else if (MonsterArt == 9)
		{
		GegnerSpawn = Npc_GetNearestWP(hero);
		Wld_InsertNpc (Molerat, GegnerSpawn);
		AI_Output (hero, hero, "Schlafsack15_04"); //Hmm...wo kommt denn der Molerat her?
		}
	else if (MonsterArt == 11)
		{
		GegnerSpawn = Npc_GetNearestWP(hero);
		Wld_InsertNpc (Wolf, GegnerSpawn);
		AI_Output (hero, hero, "Schlafsack15_05"); //Ein Wolf? Vielleicht sollte ich doch lieber wegrennen?
		}
	else
		{
		AI_Output (hero, hero, "Schlafsack15_06"); //Was für eine friedliche Nacht!
		};
	SchlafImSchlafsack = 0;	
	AI_StandUpQuick (hero);
	//B_FullStop (hero);
	};
	
// ------------- Quest Pflanze auftauchen -----------------------
// -------------------- Auftauchen -----------------------
func void PflanzeAuftauchen ()
	{
	if (PflanzenTauchen == 0)
		{
		CreateInvItem(hero,PflanzeAlwinA);
		PrintScreen	("Das hier kommt mir ein wenig bekannt vor...", -1,60,"font_old_20_white.tga",3);
		PflanzenTauchen = PflanzenTauchen + 1;
		}
	else if (PflanzenTauchen == 1)
		{
		CreateInvItem(hero,PflanzeAlwinB);
		PrintScreen	("Noch eine Pflanze. Was das wohl ist?", -1,60,"font_old_20_white.tga",3);
		PflanzenTauchen = PflanzenTauchen + 1;
		}
	else if (PflanzenTauchen == 2)
		{
		CreateInvItem(hero,PflanzeAlwinC);
		PrintScreen	("Ob Alwin dieses Unkraut sucht?", -1,60,"font_old_20_white.tga",3);
		PflanzenTauchen = PflanzenTauchen + 1;
		};
	};
	
func void PflanzeNehmenA ()
	{
	if ((PflanzenAufruf & 1) != 1 && Npc_KnowsInfo(hero, Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, Sld_Rem_Makeit)))
		{
		PflanzeAuftauchen ();
		PflanzenAufruf = PflanzenAufruf | 1;
		};
	};
	
func void PflanzeNehmenB ()
	{
	if ((PflanzenAufruf & 2) != 2 && Npc_KnowsInfo(hero, Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, Sld_Rem_Makeit)))
		{
		PflanzeAuftauchen ();
		PflanzenAufruf = PflanzenAufruf | 2;
		};
	};
	
func void PflanzeNehmenC ()
	{
	if ((PflanzenAufruf & 4) != 4 && Npc_KnowsInfo(hero, Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, Sld_Rem_Makeit)))
		{
		PflanzeAuftauchen ();
		PflanzenAufruf = PflanzenAufruf | 4;
		};
	};
		
// -------------------- Sehen -----------------------
func void PflanzeSehenAusgabe ()
	{
	if (PflanzeSehen == 0)
		{
		PrintScreen	("Oh, dort schein was zu sein!", -1,40,"font_old_20_white.tga",3);
		PflanzeSehen = PflanzeSehen + 1;
		}
	else if (PflanzeSehen == 1)
		{
		PrintScreen	("Hmm? Hier ist nochwas!", -1,40,"font_old_20_white.tga",3);
		PflanzeSehen = PflanzeSehen + 1;
		}
	else if (PflanzeSehen == 2)
		{
		PrintScreen	("Also! Diese dort oder keine!", -1,40,"font_old_20_white.tga",3);
		PflanzeSehen = PflanzeSehen + 1;
		};
	};
	
func void PflanzeSehenA ()
	{
	if ((PflanzeSehenAufruf & 1) != 1 && Npc_KnowsInfo(hero, Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, Sld_Rem_Makeit)))
		{
		PflanzeSehenAusgabe ();
		PflanzeSehenAufruf = PflanzeSehenAufruf | 1;
		};
	};
	
func void PflanzeSehenB ()
	{
	if ((PflanzeSehenAufruf & 2) != 2 && Npc_KnowsInfo(hero, Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, Sld_Rem_Makeit)))
		{
		PflanzeSehenAusgabe ();
		PflanzeSehenAufruf = PflanzeSehenAufruf | 2;
		};
	};
	
func void PflanzeSehenC ()
	{
	if ((PflanzeSehenAufruf & 4) != 4 && Npc_KnowsInfo(hero, Alwin_Search_Ufer) && !(Npc_KnowsInfo(hero, Sld_Rem_Makeit)))
		{
		PflanzeSehenAusgabe ();
		PflanzeSehenAufruf = PflanzeSehenAufruf | 4;
		};
	};
	
func void  DiccuricBeenden ()
	{
	PlayVideo ( "diccuric\credits.bik");
	ExitGame(); //Beendet Spiel
	};
	
func void HochstandWoelfe () //Anfangsquest
	{
	if (HochstandAktiviert == 0)
		{
		HochstandAktiviert = HochstandAktiviert +1;
		//PrintScreen("Schnell wech!", -1,-1,"font_old_20_white.tga",3);
		if (Npc_GetDistToWP(sld_b,"AM_HOCHSTAND_00") < 800)		// edit -Harri
		{
			Npc_ExchangeRoutine(sld_b,"RALF"); 
			Npc_ExchangeRoutine(sld_a,"RAL");
			AI_ContinueRoutine(sld_b);
			AI_ContinueRoutine(sld_a);
		};
		
		//AI_Teleport(sld_b,"SEE_VOR_STADT_10");
		//AI_Teleport(sld_a,"SEE_VOR_STADT_10");
		

		// Added by Moe: Ausgabe an Spieler, damit er ein wenig mit Inventar rumspielt
		AI_OutputSVM_Overlay (hero,hero,"TurmGefangen_15_00"); //So ein Mist. Da unten ist ein ganzes Wolfsrudel. Wenigstens hab ich ein wenig Fleisch zum Essen dabei und muss so nicht verhungern... aber ich sollte versuchen, in die Burg zurückzukommen.
		AI_StandUpQuick (hero);
		
		Wld_SendTrigger ("TS_CAMERA_HOCHSTAND");		// Harri - Aktiviert Cammera Hochstand
		
		//PrintScreen("Wölfe!", -1,-1,"font_old_20_white.tga",3);
		BH_WolfSpawn();		//hier, da sonst angriff auf wölfe!
		};
	};
	
func void RampeReparieren ()
	{
	if (BrueckeMussGerichtetWerden == 1)
		{
		Wld_SendTrigger ("FALLE1");
		Wld_SendTrigger ("FALLE2");
		Wld_SendTrigger ("FALLE3");
		Wld_SendTrigger ("FALLE4");	
		BrueckeMussGerichtetWerden = 0;
		if (!Npc_KnowsInfo (hero, Schmied_Gib_Kiste))
			{
			Npc_ExchangeRoutine(Schmied,"START");
			}
		else
			{
			Npc_ExchangeRoutine(Schmied,"WORK");
			};
		};
		
	if (hero.level < 10)
		{
		MonsterRespawn ();
		}
	else if (hero.level < 20)
		{
		MonsterRespawn2 ();
		}
	else
		{
		MonsterRespawn3 ();
		};
	
	Wld_SendTrigger ("RAMPERICHTEN");
	};
	
func void SpawnMagierDicuric ()
	{
	if (Npc_KnowsInfo(hero,DIA_DIC_Amalric_Besiegt) && MagierSpawn == 0)
		{
		Wld_InsertNpc (DIC_2076_Amalric, "ZUR_H06_34");
		Wld_InsertNpc (DIC_2077_Umfrey, "ZUR_H06_34");
		Wld_InsertNpc (DIC_2078_Waleran, "ZUR_H06_34");
		Wld_InsertNpc (DIC_2079_Herlewin, "ZUR_H06_34");
		Wld_InsertNpc (DIC_2080_Gamel, "ZUR_H06_34");
		MagierSpawn = MagierSpawn + 1;
		};
	};
	
func void BuchImRegal ()
	{
	if (BuchGeistGelesen == 0)
		{
		CreateInvItem(hero,Buch_Geist);
		PrintScreen	("Was ist das für ein Buch?", -1,60,"font_old_20_white.tga",3);
		BuchGeistGelesen = 1;
		};
	};
	
func void PilzWandeln ()
	{
	if (Npc_HasItems(hero,ItFo_Plants_mushroom_02) >= 1)
		{
		AI_PlayAni (self,"T_PLUNDER");
		PrintScreen	("Aus dem Pilz wurde eine Seraphis?!?", -1,60,"font_old_20_white.tga",3);
		CreateInvItem(hero,ItFo_Plants_Seraphis_01);
		Npc_RemoveInvItem(hero,ItFo_Plants_mushroom_02);	
		};
	};
	
func void SpawnTauchQuest ()
	{
	if (!Npc_KnowsInfo(hero, DIA_DIC_Alwin_Gefunden) && Sld_RemeberSpawnZaehler == 1)
		{
		AI_Teleport(Sld_61_Remember,"SEE_UB_26");
		//AI_Wait(Sld_61_Remember, 240);
		Npc_ExchangeRoutine	(Sld_61_Remember,"FOLGEN");
		AI_ContinueRoutine	(Sld_61_Remember);	
		Sld_RemeberSpawnZaehler = 2;
		}
	else if (Sld_RemeberSpawnZaehler == 0)
		{
		Sld_RemeberSpawnZaehler = 1;
		Wld_SendTrigger ("NPCSPAWNTAUCHQUEST");
		};
	};
	
/****************************************************************************************************
*				Events    - Harri -						    *
****************************************************************************************************/
	
	
// ------- Kiste steckt fest --------------

func void Kiste_fest ()
	{
	if (BrueckenEinbruch == 1)
	&& !Npc_KnowsInfo(hero, Schmied_Gib_Kiste)
		{
		PrintScreen	("Keine Chance. Die Kiste steckt fest", -1,-1,"font_old_20_white.tga",3);
		};
	};
	
// ------- Einfügung Hamond --------------
func void HAMOND_INSERT ()
	{
		Wld_SendUnTrigger ("HA_00");
		AI_Teleport	(Soeldnerwanze,"FOREST01_00");
		Wld_InsertNpc	(DIC_2501_Hamond, "HHÜT09_WANZE");
		B_LogEntry	(WANZENQUEST, "Der Zauber hat gewirkt. Hamond ist wieder ganz der Alte.");
		PrintScreen	("WOW!", -1,9,"font_old_20_white.tga",3);	
	};
	
// ------- Mutprobe --------------
func void MUTPROBE_TRUE ()
	{
		if (Leofwin_Mutprobe >= 1) && (Npc_GetDistToWP(DIC_2502_Leofwin,"ZAM_22")<500)
		{
			Leofwin_Mutprobe = 3;
		}
		
		else if (Leofwin_Mutprobe >= 1) && (Npc_GetDistToWP(DIC_2502_Leofwin,"ZAM_22")>500)
		{
			Leofwin_Mutprobe = 2;
		};
	};

// ------- Arena Gittersteuerung -------------- 

func void MONSTERAUSWAHL ()
{
	if Monsterwahl == 1
	{
		Wld_InsertNpc (Arena_Scavenger, "STADT_ARENA_07");
	}
	else if Monsterwahl == 2
	{
		Wld_InsertNpc (Arena_Molerat, "STADT_ARENA_07");
	}
	else if Monsterwahl == 3
	{
		Wld_InsertNpc (Arena_Lurker, "STADT_ARENA_07");
	}
	else if Monsterwahl == 4
	{
		Wld_InsertNpc (Arena_Wolf, "STADT_ARENA_07");
	}
	else if Monsterwahl == 5
	{
		Wld_InsertNpc (Arena_Blutfliege, "STADT_ARENA_07");
	}
	else if Monsterwahl == 6
	{
		Wld_InsertNpc (Arena_Ork, "STADT_ARENA_07");
	};
};
 
func void ARENA_ANGRIFF () 
{ 
 	if Monsterwahl == 1
	{
		AI_GotoWP(Arena_Scavenger, "STADT_ARENA_MITTE");
	}
	else if Monsterwahl == 2
	{
		AI_GotoWP(Arena_Molerat, "STADT_ARENA_MITTE");
	}
	else if Monsterwahl == 3
	{
		AI_GotoWP(Arena_Lurker, "STADT_ARENA_MITTE");
	}
	else if Monsterwahl == 4
	{
		 AI_GotoWP(Arena_Wolf, "STADT_ARENA_MITTE");
	}
	else if Monsterwahl == 5
	{
		AI_GotoWP(Arena_Blutfliege, "STADT_ARENA_MITTE");
	}
	else if Monsterwahl == 6
	{
		 AI_GotoWP(Arena_Ork, "STADT_ARENA_MITTE");
		 Npc_SendSinglePerc ( hero, Arena_Ork,  PERC_ASSESSDAMAGE ); 
	};
	
	Monsterwahl = 0;
}; 
 
func void ARENA_MITTE () 
     { 
          if Monsterwahl > 0  && KampfInArena == 1 && (Npc_GetDistToWP(DIC_2031_Koll,"STADT_ARENA_MITTE")>1500)
          { 
	      MONSTERAUSWAHL ();
          Wld_SendTrigger ("ARENA_E3"); 
          Wld_SendTrigger ("ARENA_E1"); 
          Wld_SendTrigger ("ARENA_E2"); 
          Wld_SendTrigger ("TS_ARENA_ANGRIFF"); 
          KampfInArena = 2; 
          }; 
     }; 
 

	
func void ARENA_AUS1 ()
	{
		if (KampfInArena == 2) 
		&&(((!Npc_KnowsInfo (self, DIA_DIC_Drax_ScavBesiegt)) && (Npc_KnowsInfo (self, DIA_DIC_Drax_ScavKampf)) && (Npc_IsDead(Arena_Scavenger)))
		|| ((!Npc_KnowsInfo (self, DIA_DIC_Drax_MoleratBesiegt)) && (Npc_KnowsInfo (self, DIA_DIC_Drax_MoleratKampf)) && (Npc_IsDead(Arena_Molerat)))
		|| ((!Npc_KnowsInfo (self, DIA_DIC_Drax_LurkerBesiegt)) && (Npc_KnowsInfo (self, DIA_DIC_Drax_LurkerKampf)) && (Npc_IsDead(Arena_Lurker)))
		|| ((!Npc_KnowsInfo (self, DIA_DIC_Drax_WolfBesiegt)) && (Npc_KnowsInfo (self, DIA_DIC_Drax_WolfKampf)) && (Npc_IsDead(Arena_Wolf)))
		|| ((!Npc_KnowsInfo (self, DIA_DIC_Drax_BlutfliegeBesiegt))&& (Npc_KnowsInfo (self, DIA_DIC_Drax_BlutfliegeKampf))&& (Npc_IsDead(Arena_Blutfliege)))
		|| ((!Npc_KnowsInfo (self, DIA_DIC_Drax_OrkBesiegt)) && (Npc_KnowsInfo (self, DIA_DIC_Drax_5_Sieg)) && (Npc_IsDead(Arena_Ork))))
		
		{
		Wld_SendUnTrigger ("ARENA_E1");
		Wld_SendUnTrigger ("ARENA_E2");
		KampfInArena = 1;
		};
		
		if KampfInArena > 2 && KampfMitKoll > 0
		{
			Wld_SendUnTrigger ("ARENA_E1");
			Wld_SendUnTrigger ("ARENA_E2");
			if KampfInArena == 3
			{
				KampfInArena = 0;
			}
			else
			{
				KampfInArena = 1;
			};
		};
		
	};

func void ARENA_AUS2 ()
	{
	ARENA_AUS1 ();
	};
	
func void ARENA_EINGANG1 ()
	{
	Wld_SendUnTrigger ("ARENA_E3");
	};
	
func void ARENA_EINGANG2 ()
	{
	ARENA_EINGANG1 ();
	};
	
func void ZELLENGANG ()
	{
	Wld_SendUnTrigger ("ARENA_E3");
	};
	
func void ARENA_E3_AUF ()
	{
	Wld_SendTrigger ("ARENA_E3");
	};
	
		
	
//------------ Auf Buch Aufpasstrigger bei Taliasan-Hütte -------------------

func void TALIASAN_HUTAUS ()
	{
	if ((Npc_HasItems(hero, Ta_Buch) >= 1) && !(Npc_KnowsInfo(hero,DIA_DIC_Taliasan_Benchol)))
		{
			if (Npc_IsInFightMode(hero, FMODE_FAR ) || Npc_IsInFightMode(hero, FMODE_MAGIC) ||Npc_IsInFightMode (hero,FMODE_MELEE ) || Npc_IsInFightMode (hero,FMODE_FIST ))
			{
			AI_RemoveWeapon (hero);
			};
		AI_TurnToNpc (self, dic_2002_Taliasan);
		B_FullStop(dic_2002_Taliasan);
		AI_GotoWP (dic_2002_Taliasan,"STADT_WEG_120");
		AI_WaitTillEnd	(self, dic_2002_Taliasan);
		};
	};



//--------Start--------
func void VOR_HOCHSTAND ()  
{ 

	if (StartDialogGesprochen == 0)  
	{
		introducechapter ("Kapitel 1","Ardarics Leben","chapter.tga","levelup.wav", 6000);
		HPCounter = -140; SPCounter = -140; GPCounter = -140;  // nur wegen den Freischlägen
		
		AI_StandUp				(self);
		Wld_SendTrigger ("CAMERA_GAME_START");
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_00"); //Wie lange sind wir jetzt hier im Lager? Zwei Monate, drei? Berengar habe ich in der ganzen Zeit nicht zu Gesicht bekommen.   
		AI_Wait (hero, 1); 
		AI_StandUpQuick (hero);
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_01"); //Als ich ihm damals gefolgt bin, hätt´ ich nie im Leben geglaubt, dass wir so weit reisen werden. 
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_02"); //Nun ja, fast sind wir wieder zurück in Gatyah. Obwohl, hier in der Festung Parthalan werden wir noch eine Weile bleiben.   
		AI_Wait (hero, 1);  
		AI_StandUpQuick (hero); 
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_03"); //Für mich gibt es viel zu tun. Ich bin es leid, dass die Söldner mich wie einen schäbigen Laufburschen behandeln. Ich muss endlich im Lager ernst genommen werden.  
		AI_TurnAway	(hero, Sld_B);
		AI_Wait (hero, 1);  
		AI_StandUpQuick (hero);  
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_04"); //Und ich weiß, dass ich ein Krieger sein kann. Außerdem will ich ein Kämpfer an Berengars Seite werden. 
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_05"); //Spätestens dann sieht niemand mehr einen Dienstboten in mir. Berengar wird seinen verlorenen Ruhm zurückerkämpfen, und ich werde seine rechte Hand dabei sein.  
		AI_Wait (hero, 1); 
		AI_StandUpQuick (hero);  
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_06"); //Wo ist eigentlich Alwin? Neben Berengar ist er der einzige, dem ich hier im Lager vertrauen kann. Egal...  
		AI_Wait (hero, 1);  
		AI_StandUpQuick (hero);  
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_07"); //Zuerst helfe ich den Söldnern hier. Berengar sagte, er hat ein Auge auf mich geworfen, und er riet mir, im Lager zu helfen, wo immer ich kann.  
		AI_Wait (hero, 1);  
		AI_StandUpQuick (hero);  
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_08"); //Ich weiß noch genau, was er zu mir sagte: "Der Tag wird kommen, an dem ich dich zu mir rufe. 
		AI_Output (hero, hero, "DIA_DIC_Monolog_15_09"); //Wenn sich zeigt, dass du würdig bist in meine Dienste zu treten, kannst du mit deiner Ausbildung zum Krieger beginnen." Ja, und wenn dieser Tag kommt, werde ich bereit sein.  
		AI_Wait (hero, 1);  
		AI_StandUpQuick (hero);
		AI_GotoNpc (hero, Sld_A);  
		AI_GotoNpc (Sld_B, Sld_A);
		StartDialogGesprochen = 1;  
	}; 

};

func void Hero_Aufsteh ()
	{
	
	AI_PlayAni (hero, "T_SIT_2_STAND" );
	};

// ------- Cammera in Ghosttown -------------

	
func void Start_Camera_GT_in ()
	{
	Wld_SendTrigger ("CAMERA_GT_IN");
	};
	
// ------- Cammera auf Hochstand -------------

	
func void Start_Camera_Hochstand ()
	{
	Wld_SendTrigger ("CAMERA_HOCHSTAND");
	};
		
// ------------- zusatz bei Narow-Nacht-Cammerafahrt --------------------	
	
func void WOLFNAROWANGRIFF ()
{
	if WolfAngriff == 0
	{
	WolfAngriff = 1;
	Wld_InsertNpc				(Wolf_GE,"FOREST01_29");	// werden verdeckt hinter der kamera gespawnt und greifen an
	Wld_InsertNpc				(Wolf_GE,"FOREST01_29");
	Wld_InsertNpc				(Wolf_GE,"FOREST01_29");
	Wld_InsertNpc				(Wolf_GE,"FOREST01_29");
	AI_PlayAni (hero, "T_SIT_2_STAND" );
	}
	else
	{
	WolfAngriff = 0;	// Harri - Muß bei der Camerafahrt kurtz zurückgesetzt werden, da sonst Wölfe GLEICH angreifen.
	};
};


//-------------------Wheel Rampe--------------------------------

FUNC int WHEEL_RAMPE ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"WHEEL_RAMPE");

	if (RampeRepariert == 5)||(RampeRepariert == 6)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...bedienbar");
		return 			TRUE;

	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");
		G_PrintScreen	(_STR_MESSAGE_WHEEL_STUCKS);
		return 			FALSE;
	};
};


//------- für Dialog Arbeiter1_Arbeiter2_Vater_Info ---------


FUNC int Vater_Info_Tot ()
{
	if Wld_IsTime(18,00,23,00)
	&& Npc_KnowsInfo(hero, DIA_DIC_Alwin_Hinweis)
	&& RampeRepariert == 5
	&& (Npc_GetDistToWP(DIC_2015_ARBEITER,"RAMPE_05")<200)
	&& (Npc_GetDistToWP(DIC_2016_ARBEITER,"RAMPE_07")<200)
	&& C_BodyStateContains ( self, BS_SNEAK)
	&& (!(Npc_IsInCutscene(DIC_2015_ARBEITER) || Npc_IsInCutscene(DIC_2016_ARBEITER)))
	{
		RampeRepariert = 6;
		Npc_SendSinglePerc ( hero, DIC_2015_ARBEITER,  PERC_ASSESSTALK);
		AI_StandUp	(self);
	};
};

//----------- Sprung vom Berg im Sumpf -----------

FUNC int Sumpf_Berg_Sprung ()
{
	if Sumpf_Sprung < 10
	{
		if Sumpf_Sprung == 0
		{
		B_GiveXP (500);
		};
	B_RaiseAttribute	(ATR_DEXTERITY,	1);
	PrintScreen	("Wow,   durch diesen gewagten Sprung verbessert sich meine Geschicklichkeit.", -1,30,"font_old_20_white.tga",4);
	Sumpf_Sprung = Sumpf_Sprung + 1;
	}
	else
	{
		PrintScreen	("Jippi hey,   Super wie ich das mache. Aber besser werde ich nicht.", -1,30,"font_old_20_white.tga",4);
	};
};



//------------------- Schlösser knacken 1 --------------------------------

FUNC int Use_Lockpick ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"USE_LOCKPICK");

	if (Npc_GetTalentSkill(self, NPC_TALENT_PICKLOCK) > 0)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...bedienbar");
		return 			TRUE;

	}
	
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");
		if Npc_IsPlayer	(self)
		{
			PrintScreen	("Soviel versteh ich nicht vom Schlösserknacken.", -1,30,"font_old_20_white.tga",4);
		};
		return 			FALSE;
	};
};

//------------------- Schlösser knacken 2 --------------------------------

FUNC int Use_Lockpick2 ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"USE_LOCKPICK");

	if (Npc_GetTalentSkill(self, NPC_TALENT_PICKLOCK) > 1)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...bedienbar");
		return 			TRUE;

	}
	
	else if (Npc_GetTalentSkill(self, NPC_TALENT_PICKLOCK) == 1)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");
		if Npc_IsPlayer	(self)
		{
			PrintScreen	("Das Schloss ist noch zu kompliziert für mich.", -1,30,"font_old_20_white.tga",4);
		};
		return 			FALSE;
	}
	
	else if (Npc_GetTalentSkill(self, NPC_TALENT_PICKLOCK) < 1)
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");
		if Npc_IsPlayer	(self)
		{
			PrintScreen	("Das Schloss sieht sehr kompliziert aus.", -1,30,"font_old_20_white.tga",4);
		};
		return 			FALSE;
	};
	
};




//------------------- Durch die 12mag-Barriere gehen können -------------

FUNC int Trigger_12Mag_Barriere ()
{
	if (((Durch_Barriere & 1) != 1)	&& ((Durch_Barriere & 2) != 2))
	
	{
		Wld_SendTrigger ("12MAG_BARRIERE_DAME");
	};

};

//------------------- 12mag-Barriere fällt -------------

FUNC int Barriere_12Mag_weg ()
{
	Durch_Barriere = Durch_Barriere | 2;
	Wld_SendTrigger ("MOVER_12MAG_BARRIERE");
	PrintScreen	("Barriere wegg.", -1,30,"font_old_20_white.tga",4);

};

//------------------- Verhindert cheat ohne Ammulett (beim 1. mal) -------------

FUNC int NoCheat_12Mag_Barriere ()
{
	if (Npc_HasItems(hero, Schutzamulett_Barriere) < 1)
	&& ((Durch_Barriere & 2) != 2)
	&& ((Durch_Barriere & 4) != 4)
	{
	ai_teleport (self, "SF_H06_13");
	PrintScreen	("So nicht! Nicht ohne Schutzamulett Barriere!", -1,30,"font_old_20_white.tga",4);
	}
	else
	{
	Durch_Barriere = Durch_Barriere | 4;
	};
};


//-------------------- Wächter in Höhle 08 --------------------- 

FUNC int GRUFT_H08 () 
{ 
    If (Npc_GetDistToWP(Dic_2503_Gruftpriest, "WP_H08_HELL")<20000) 
    && (!Npc_KnowsInfo(hero,  Info_Dic_Gruftpriest)) 
    {      
    Npc_SendSinglePerc ( hero, Dic_2503_Gruftpriest,  PERC_ASSESSDAMAGE); 
    }; 
     
    If (Npc_HasItems(hero, ITMW_1H_SWORD_BASTARD_04)>= 1) 
    && (Npc_GetDistToWP(hero,"WP_H08_HELL")<500)
    && (!Npc_KnowsInfo(hero,  Info_Dic_Gruftpriest)) 
    && (Npc_GetDistToWP(Dic_2503_Gruftpriest, "SF_H08_07")>20000) 
    { 
    Wld_SendTrigger ("EVT_SPAWN_H08"); 
    Wld_InsertNpc (Dic_2503_Gruftpriest, "SF_H08_07"); 
    Snd_Play      ("MFX_SPAWN_CAST"); 
    Wld_SendTrigger ("EVT_GRUFTBARRERE"); 
    Wld_SendTrigger ("TS_GRUFT_H08");     // aktiviert sich selber nach 1s 
    }; 
     
     
    If (Npc_GetDistToWP(hero,"WP_H08_HELL")<2000) 
	&& (!Npc_HasItems(hero, ITMW_1H_SWORD_BASTARD_04)>= 1) 
    && (!Npc_KnowsInfo(hero,  Info_Dic_Gruftpriest)) 
    {      
    Wld_SendTrigger ("TS_GRUFT_H08");     // aktiviert sich selber nach 1s 
    //PrintScreen	(Trainiert, -1,30,"font_old_20_white.tga",4);
  /*  
    var string ML_Status;
	ML_Status = IntToString (Trf_Status);
	PrintScreen	(ML_Status, -1,-1,"font_old_20_white.tga",3);
  */
    };  
     
}; 

//-------------------- Steinwand Höle 6 ---------------------


FUNC int EVT_H06_STONEWALL ()
{

	if H06_STONEWALL == 2
	{
	Wld_SendUnTrigger ("CPFX_H06_01");
	H06_STONEWALL = 3;
	};
	
	if C_BodyStateContains ( hero, BS_MOBINTERACT_INTERRUPT)
	&& H06_STONEWALL == 1
	{
	AI_StandUp (hero);
	introducechapter ("nach ein paar Stunden harter Arbeit","","EVT_H06_dic.tga","levelup.wav", 6000);
	Wld_SendTrigger ("STONEWALL_01");
	Wld_SendTrigger ("STONEWALL_02");
	AI_Teleport (hero,"SF_H06_09");
	H06_STONEWALL = 2;
	Wld_SendTrigger ("TS_H06_STONEWALL");
	};

	if C_BodyStateContains ( hero, BS_MOBINTERACT_INTERRUPT)
	&& H06_STONEWALL == 0
	{
	H06_STONEWALL = 1;
	Wld_SendTrigger ("TS_H06_STONEWALL");
	PrintScreen	("Ich glaube hier lockert sich was.", -1,30,"font_old_20_white.tga",4);
	};
	
	
	if (Npc_GetDistToWP(hero,"SF_H06_09") < 700)
	&& !(C_BodyStateContains ( hero, BS_MOBINTERACT_INTERRUPT))
	&& H06_STONEWALL < 2
	{
	Wld_SendTrigger ("TS_H06_STONEWALL");
	H06_STONEWALL = 0;
	};

	
};

//-------------------- Hinterniss in Stadt-Maggiergebäute ---------------------


FUNC int STADT_MAG_DOOR ()
{
	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
	
	if (Hlp_IsItem(myarmor, Snd_Robe))
	|| ((Durch_Barriere & 1) == 1)
	{
	Wld_SendTrigger ("STADT_MAG_DOOR");
	};
};

//-------------------- Sargquest UTempel ---------------------
//****************************************************************
// Bit 1-5 von ML_UTempel = Wld_SendTrigger(UT_ML1 (bis) UT_ML5)
// Bit 6 Überlauf
// Bit 7 Flipp (alle waren an oder aus)
//****************************************************************

//--------- Schalter links ------------ Lichter nach links drehen (5 Bit's rollen)

FUNC int EVENT_TS_UT_SL ()
{
	if ((ML_UTempel & 16) == 16)
	{
		ML_UTempel = ML_UTempel | 32;
		if ((ML_UTempel & 1) != 1)
		{
			Wld_SendTrigger("UT_ML1");
		};
	}
	else
	{
		ML_UTempel = ML_UTempel & 223;
		if ((ML_UTempel & 1) == 1)
		{
			Wld_SendUnTrigger("UT_ML1");
		};
	};
          
	if ((ML_UTempel & 8) == 8)
	{
		
		if ((ML_UTempel & 16) != 16)
		{
			ML_UTempel = ML_UTempel | 16;
			Wld_SendTrigger("UT_ML5");
		};
	}
	else
	{
		
		if ((ML_UTempel & 16) == 16)
		{	
			ML_UTempel = ML_UTempel & 239;
			Wld_SendUnTrigger("UT_ML5");
		};
	};
	
	if ((ML_UTempel & 4) == 4)
	{
		if ((ML_UTempel & 8) != 8)
		{
			ML_UTempel = ML_UTempel | 8;	
			Wld_SendTrigger("UT_ML4");
		};
	}
	else
	{
		
		if ((ML_UTempel & 8) == 8)
		{	
			ML_UTempel = ML_UTempel & 247;
			Wld_SendUnTrigger("UT_ML4");
		};
	};
	
	
	if ((ML_UTempel & 2) == 2)
	{
		
		if ((ML_UTempel & 4) != 4)
		{	
			ML_UTempel = ML_UTempel | 4;
			Wld_SendTrigger("UT_ML3");
		};
	}
	else
	{
		
		if ((ML_UTempel & 4) == 4)
		{	
			ML_UTempel = ML_UTempel & 251;
			Wld_SendUnTrigger("UT_ML3");
		};
	};
	
	
	if ((ML_UTempel & 1) == 1)
	{
		
		if ((ML_UTempel & 2) != 2)
		{	
			ML_UTempel = ML_UTempel | 2;
			Wld_SendTrigger("UT_ML2");
		};
	}
	else
	{
		if ((ML_UTempel & 2) == 2)
		{	
			ML_UTempel = ML_UTempel & 253;
			Wld_SendUnTrigger("UT_ML2");
		};
	};
	
	
	if ((ML_UTempel & 32) == 32)
	{
	ML_UTempel = ML_UTempel | 1;
	}
	else
	{
	ML_UTempel = ML_UTempel & 254;
	};
};                                                                


FUNC int EVENT_TS_UT_CHECK ()
{
	
	
	if ((ML_UTempel & 1) == 1)
	&& ((ML_UTempel & 2) == 2)
	&& ((ML_UTempel & 4) == 4)  
	&& ((ML_UTempel & 8) == 8)    
	&& ((ML_UTempel & 16) == 16)  
	&& ((ML_UTempel & 64) != 64)
	{
		ML_UTempel = ML_UTempel | 64;
		Wld_SendTrigger("UT_SD");
		Wld_SendTrigger("PILLAR1_UT");
		Wld_SendTrigger("PILLAR2_UT");
		Wld_SendTrigger("PILLAR3_UT");
		Wld_SendTrigger("PILLAR4_UT");
		Wld_SendTrigger("PILLAR5_UT");
		Wld_SendTrigger("EVT_SPAWN_UTEMPEL01");
		Snd_Play      ("MFX_SPAWN_CAST");
		Wld_InsertNpc		(Skeleton, "UTEMPEL01_35");
		Wld_InsertNpc		(SkeletonWarrior, "UTEMPEL01_35");
		Wld_InsertNpc		(Skeleton, "UTEMPEL01_33");
		Wld_InsertNpc		(SkeletonWarrior, "UTEMPEL01_33");
		Wld_InsertNpc		(SkeletonMage, "UTEMPEL01_38");
	};
	
	if ((ML_UTempel & 1) != 1)
	&& ((ML_UTempel & 2) != 2)
	&& ((ML_UTempel & 4) != 4)  
	&& ((ML_UTempel & 8) != 8)    
	&& ((ML_UTempel & 16) != 16)  
	&& ((ML_UTempel & 64) == 64)
	{
		ML_UTempel = ML_UTempel & 191;
		Wld_SendUnTrigger("PILLAR1_UT");
		Wld_SendUnTrigger("PILLAR2_UT");
		Wld_SendUnTrigger("PILLAR3_UT");
		Wld_SendUnTrigger("PILLAR4_UT");
		Wld_SendUnTrigger("PILLAR5_UT");
	};
};


//--------- Schalter rechts ------------ Rolett
                                                                  
FUNC int EVENT_TS_UT_SR ()                                        
{                                                                 
	var int ML_Temp;
	ML_Temp = Hlp_Random(31);
	
	if ((ML_Temp & 1) == 1) && ((ML_UTempel & 1) != 1)
	{
		ML_UTempel = ML_UTempel | 1;
		Wld_SendTrigger("UT_ML1");
	}
	else
	{
		if ((ML_Temp & 1) != 1) && ((ML_UTempel & 1) == 1)
		{
			ML_UTempel = ML_UTempel & 254;
			Wld_SendUnTrigger("UT_ML1");
		};
	};
	
	if ((ML_Temp & 2) == 2) && ((ML_UTempel & 2) != 2)
	{
		ML_UTempel = ML_UTempel | 2;
		Wld_SendTrigger("UT_ML2");
	}
	else
	{
		if ((ML_Temp & 2) != 2) && ((ML_UTempel & 2) == 2)
		{
			ML_UTempel = ML_UTempel & 253;
			Wld_SendUnTrigger("UT_ML2");
		};
	};
	
	if ((ML_Temp & 4) == 4) && ((ML_UTempel & 4) != 4)
	{
		ML_UTempel = ML_UTempel | 4;
		Wld_SendTrigger("UT_ML3");
	}
	else 
	{
		if ((ML_Temp & 4) != 4) && ((ML_UTempel & 4) == 4)
		{
			ML_UTempel = ML_UTempel & 251;
			Wld_SendUnTrigger("UT_ML3");
		};
	};
	
	if ((ML_Temp & 8) == 8) && ((ML_UTempel & 8) != 8)
	{
		ML_UTempel = ML_UTempel | 8;
		Wld_SendTrigger("UT_ML4");
	}
	else
	{
		if ((ML_Temp & 8) != 8) && ((ML_UTempel & 8) == 8)
		{	
			ML_UTempel = ML_UTempel & 247;
			Wld_SendUnTrigger("UT_ML4");
		};
	};
	
	if ((ML_Temp & 16) == 16) && ((ML_UTempel & 16) != 16)
	{
		ML_UTempel = ML_UTempel | 16;
		Wld_SendTrigger("UT_ML5");
	}
	else 
	{
		if ((ML_Temp & 16) != 16) && ((ML_UTempel & 16) == 16)
		{
			ML_UTempel = ML_UTempel & 239;
			Wld_SendUnTrigger("UT_ML5");
		};
	};
	
	EVENT_TS_UT_CHECK ();	


};                                                                 




//--------- Schalter mitte ------------

FUNC int EVENT_TS_UT_SM ()
{
	if ((ML_UTempel & 1) == 1)
	{
	ML_UTempel = ML_UTempel & 254;
	Wld_SendUnTrigger("UT_ML1");
	}
	else
	{
	ML_UTempel = ML_UTempel | 1;
	Wld_SendTrigger("UT_ML1");
	};
	
	if ((ML_UTempel & 4) == 4)
	{
	ML_UTempel = ML_UTempel & 251;
	Wld_SendUnTrigger("UT_ML3");
	}
	else
	{
	ML_UTempel = ML_UTempel | 4;
	Wld_SendTrigger("UT_ML3");
	};
	
	if ((ML_UTempel & 8) == 8)
	{
	ML_UTempel = ML_UTempel & 247;
	Wld_SendUnTrigger("UT_ML4");
	}
	else
	{
	ML_UTempel = ML_UTempel | 8;
	Wld_SendTrigger("UT_ML4");
	}; 
	EVENT_TS_UT_CHECK ();
};


//--------- Reset UTempelquest - bzw. Schalter Gate im UT ------------

FUNC int EVENT_TS_UT_GATE ()
{
	if ((ML_UTempel & 1) == 1)
	{
		ML_UTempel = ML_UTempel & 254;
		Wld_SendUnTrigger("UT_ML1");
	};
	
	if ((ML_UTempel & 2) == 2)
	{
		ML_UTempel = ML_UTempel & 253;
		Wld_SendUnTrigger("UT_ML2");
	};
	
	if ((ML_UTempel & 4) == 4)
	{
		ML_UTempel = ML_UTempel & 251;
		Wld_SendUnTrigger("UT_ML3");
	};
	
	if ((ML_UTempel & 8) == 8)
	{
		ML_UTempel = ML_UTempel & 247;
		Wld_SendUnTrigger("UT_ML4");
	};
	
	if ((ML_UTempel & 16) == 16)
	{
		ML_UTempel = ML_UTempel & 239;
		Wld_SendUnTrigger("UT_ML5");
	};
/*	
	var string ML_Status;
	ML_Status = IntToString(ML_UTempel);
	PrintScreen	(ML_Status, -1,-1,"font_old_20_white.tga",3);
*/		
	EVENT_TS_UT_CHECK ();
};

//------------------ Lebensbrunnen mit tücke *g --------------

FUNC int EVENT_H08_HELL ()
{
	if (Npc_GetDistToWP(hero, "WP_H08_HELL") < 150)
	&& !(Npc_IsInFightMode(hero, FMODE_FAR ) || Npc_IsInFightMode(hero, FMODE_MAGIC) ||Npc_IsInFightMode (hero,FMODE_MELEE ) || Npc_IsInFightMode (hero,FMODE_FIST ))
	&& !C_BodyStateContains ( hero, BS_DEAD)
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + (hero.attribute[ATR_HITPOINTS_MAX] / 16);
		Snd_Play 	("Heal_H08");
		if hero.attribute[ATR_HITPOINTS] >= hero.attribute[ATR_HITPOINTS_MAX]
		{
			hero.attribute[ATR_HITPOINTS] = 1;		// wer zuviel will .... *g
			Snd_Play 	("DEM_AMBIENT_A2");
		};
		Wld_SendTrigger("TS_H08_HELL");
	};
};

//----------------- Steuerung Zugbrücke Burg ------------------

FUNC int EVENT_BURG_ZB ()
{
	if Wld_IsTime(22,30,05,55)
	{
		Wld_SendTrigger("MC_ZB_ZU");
		Wld_SendTrigger("MC_ZBK_ZU");
		Status_ZB = 0;
	}
	
	else
	{
		Wld_SendTrigger("MC_ZB_AUF");
		Wld_SendTrigger("MC_ZBK_AUF");
		Status_ZB = 1;
	};
};

FUNC int EVENT_BURG_WHEEL_ZB ()
{
	if Status_ZB == 0
	{
		Wld_SendTrigger("MC_ZB_AUF");
		Wld_SendTrigger("MC_ZBK_AUF");
		Status_ZB = 1;
	}
	else
	{
		Wld_SendTrigger("MC_ZB_ZU");
		Wld_SendTrigger("MC_ZBK_ZU");
		Status_ZB = 0;
	};	
};

//------------ Barem's Warane -------------------

FUNC int EVENT_WARANANGRIF ()
	{
		Npc_SendSinglePerc ( hero, JngWaran,  PERC_ASSESSDAMAGE ); 
	};
	
//----------- Not-Teleport's ------------------

FUNC int EVENT_TELEPORT_BURG ()
	{
		B_FullStop 				(self);
		AI_Teleport				(self, "B_02");
	};
	
FUNC int EVENT_TELEPORT_MINIBURG ()
	{
		B_FullStop 				(self);
		AI_Teleport				(self, "MINIBURG_30");
	};
	
// --- hero bekommt Minenschlüssel ---------- ABANDONEDMINE_OUT2      
FUNC int EVENT_SCHLUESSELGEBEN () 
     { 
          if Npc_HasItems (self, ItKeKey_Mine) < 1 
          { 
          CreateInvItem     (self, ItKeKey_Mine); 
          }; 
           
     };
