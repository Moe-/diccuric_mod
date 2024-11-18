
//*******************************************************************************
// ------------------------ Startup für Diccuric -------------------------------*
//*******************************************************************************
//*******************************************************************************
//*									Burg										*
//*******************************************************************************
func void AussehenSetzen ()
	{
	/*	
	if (Npc_KnowsInfo (hero, DIA_DIC_Lagariman_Bestanden))
		{
		Mdl_SetVisualBody (hero,"hum_body_Naked0",	3,			1,			"Hum_Head_Pony",	6, 			0,			Ardaric_Amor1);	
		B_Scale (hero);
		}
	else
		{
     	Mdl_SetVisualBody (self,"hum_body_Naked0",     4,               1,               "Hum_Head_Bald",     96,                0,       Ardaric_Amor1); 
     	Mdl_SetModelScale (self, 0.83, 1, 0.83);
     	};
     KontrolleRuestungsZahl (); */
     };
     
FUNC VOID STARTUP_SUB_BURG ()
{
	Wld_InsertNpc				(DIC_2004_Raffa,"B_WG_41");
	Wld_InsertNpc				(DIC_2005_Lynn,"WASCHPLATZ_05");
	Wld_InsertNpc				(DIC_2006_Waechter,"WASCHPLATZ_06");
	Wld_InsertNpc				(DIC_2053_Malachias, "B_WG_41");

	Wld_InsertNpc				(Werksmeister,"B_30");
	Wld_InsertNpc				(Schmied,"B_24");

	Wld_InsertNpc				(DIC_2026_Waechter,"B_HAUS1_00");
	Wld_InsertNpc				(DIC_2025_Fiebeler,"B_41");	
	Wld_InsertNpc				(DIC_2031_Koll,"OCR_ARENABATTLE");
	Wld_InsertNpc				(DIC_2030_Soeldner,"B_20");	
	Wld_InsertNpc				(SLD_61_Remember,"B_39");
	Wld_InsertNpc				(DIC_2040_Baltar, "B_50");
	Wld_InsertNpc				(DIC_2043_Slap, "B_05");
	
	Wld_InsertNpc				(DIC_2327_Soeldner, "B_39");
	Wld_InsertNpc				(DIC_2328_Soeldner, "B_13");
	Wld_InsertNpc				(DIC_2329_Soeldner, "B_12");
	Wld_InsertNpc				(DIC_2330_Soeldner, "B_38");
	Wld_InsertNpc				(DIC_2331_Soeldner, "B_14");
	Wld_InsertNpc				(DIC_2332_Soeldner, "B_37");
	Wld_InsertNpc				(DIC_2333_Soeldner, "B_37");
	
	Wld_InsertNpc				(DIC_2318_Wache, "B_46");
	Wld_InsertNpc				(DIC_2319_Wache, "B_46");
	
	Wld_InsertNpc				(DIC_2362_Velaya, "B_STALL_00");
	Wld_InsertNpc				(DIC_2363_Chani, "OCR_ARENABATTLE");
	Wld_InsertNpc				(DIC_2364_Seraphia, "B_11");
		
	Wld_InsertNpc				(WolfK1,"B_HZ2_00");
	Wld_InsertNpc				(WolfK1,"B_HZ2_02");
	Wld_InsertNpc				(WolfK2,"B_HZ1_00");
	Wld_InsertNpc				(WolfK3,"B_HZ1_02");
	Wld_InsertNpc				(WolfK4,"B_HZ1_00");
	Wld_InsertNpc				(WolfK5,"B_HZ1_02");
	
	Wld_InsertNpc    (Haus_Zombie,"B_GG_14");
	Wld_InsertNpc    (Haus_Skeleton,"B_GG_04");
	Wld_InsertNpc    (Haus_Skeleton,"B_GG_09");
 	Wld_InsertNpc    (Haus_Skeleton,"B_GG_07");
 	
 	Wld_InsertNpc    (Haus_Molerat,"B_STALL_B00");
 	Wld_InsertNpc    (Haus_Molerat,"B_STALL_B01");
 	Wld_InsertNpc    (Haus_Molerat,"B_STALL_B02");
 	Wld_InsertNpc    (Haus_Molerat,"B_STALL_B03");
	
	
};

FUNC VOID INIT_SUB_BURG ()
{
	
	Wld_SetMobRoutine (00,00,"FIREPLACE",1);
	Wld_SetMobRoutine (20,05,"FIREPLACE",1);
	Wld_SetMobRoutine (06,00,"FIREPLACE",0);
	                 
//--- Zugbrücke stündlich checken --------
	Wld_SetObjectRoutine (00,00,"TS_ZB",1);
	Wld_SetObjectRoutine (01,00,"TS_ZB",1);
	Wld_SetObjectRoutine (02,00,"TS_ZB",1);
	Wld_SetObjectRoutine (03,00,"TS_ZB",1);
	Wld_SetObjectRoutine (04,00,"TS_ZB",1);
	Wld_SetObjectRoutine (05,00,"TS_ZB",1);
	Wld_SetObjectRoutine (06,00,"TS_ZB",1);
	Wld_SetObjectRoutine (07,00,"TS_ZB",1);
	Wld_SetObjectRoutine (08,00,"TS_ZB",1);
	Wld_SetObjectRoutine (09,00,"TS_ZB",1);
	Wld_SetObjectRoutine (10,00,"TS_ZB",1);
	Wld_SetObjectRoutine (11,00,"TS_ZB",1);
	Wld_SetObjectRoutine (12,00,"TS_ZB",1);
	Wld_SetObjectRoutine (13,00,"TS_ZB",1);
	Wld_SetObjectRoutine (14,00,"TS_ZB",1);
	Wld_SetObjectRoutine (15,00,"TS_ZB",1);
	Wld_SetObjectRoutine (16,00,"TS_ZB",1);
	Wld_SetObjectRoutine (17,00,"TS_ZB",1);
	Wld_SetObjectRoutine (18,00,"TS_ZB",1);
	Wld_SetObjectRoutine (19,00,"TS_ZB",1);
	Wld_SetObjectRoutine (20,00,"TS_ZB",1);
	Wld_SetObjectRoutine (21,00,"TS_ZB",1);
	Wld_SetObjectRoutine (22,00,"TS_ZB",1);
	Wld_SetObjectRoutine (23,00,"TS_ZB",1);

	
//----- wenigstens die wichtigsten ---------	
	Wld_AssignRoomToGuild("BURG01",GIL_GRD);		// zur Winde
	Wld_AssignRoomToGuild("BURG04",GIL_GRD);
	Wld_AssignRoomToGuild("BURG05",GIL_GRD);		// bei Fiebler
//	Wld_AssignRoomToGuild("BURG02",GIL_GRD);		// Komplex mit Taverne
	Wld_AssignRoomToGuild("BURG08",GIL_GRD);
//	Wld_AssignRoomToGuild("BURG07",GIL_GRD);		// Thronsaal
	
};

//*******************************************************************************
//*							Stadt												*
//*******************************************************************************
FUNC VOID STARTUP_SUB_STADT ()
{
	Wld_InsertNpc				(DIC_2003_Alwin,"STADT_WEG_045");
	Wld_InsertNpc				(DIC_2007_Schneider,"STADT_WEG_008");
	Wld_InsertNpc				(DIC_2002_Taliasan,"STADT_WEG_040");
	Wld_InsertNpc				(DIC_2008_Pyt,"STADT_WEG_131");
	Wld_InsertNpc				(DIC_2010_Gabb,"STADT_WEG_084");
	Wld_InsertNpc				(DIC_2011_Graveyarn,"B_14");
	Wld_InsertNpc				(DIC_2012_Slade,"STADT_PATH01_03");
	Wld_InsertNpc				(DIC_2016_Arbeiter,"STADT_WEG_050");
	Wld_InsertNpc				(DIC_2015_Arbeiter,"STADT_WEG_050");
	Wld_InsertNpc				(DIC_2013_Benchol,"STADT_WEG_056");
	Wld_InsertNpc				(DIC_2014_Kamakk,"STADT_WEG_080");
	Wld_InsertNpc				(DIC_2020_Jaeger,"STADT_WEG_056");
	Wld_InsertNpc				(DIC_2021_Jaeger,"STADT_WEG_056");
	Wld_InsertNpc				(DIC_2022_Arbeiter,"STADT_WEG_056");
	Wld_InsertNpc				(DIC_2023_Arbeiter,"STADT_WEG_056");
	Wld_InsertNpc				(DIC_2027_Arbeiter,"STADT_WEG_060");
	Wld_InsertNpc				(DIC_2024_Torwache,"STADT_PATH02_02");
	Wld_InsertNpc				(DIC_2029_Torwache,"STADT_PATH02_02");
	Wld_InsertNpc				(Grd_NT1,"STADT_WEG_176");
	Wld_InsertNpc				(Grd_NT2,"STADT_WEG_176");
	Wld_InsertNpc				(DIC_2034_Homer,"STADT_WEG_049");
	Wld_InsertNpc				(DIC_2035_Fisk,"STADT_WEG_106");
	Wld_InsertNpc				(DIC_2036_Saturas,"STADT_WEG_163");
	Wld_InsertNpc				(DIC_2037_YBerion,"STADT_MITTE_023");
	Wld_InsertNpc				(DIC_2038_Corristo,"STADT_WEG_127");
	Wld_InsertNpc				(DIC_2039_Drax, "STADT_WEG_034");
	Wld_InsertNpc				(DIC_2052_Waechter, "B_00");
	Wld_InsertNpc				(DIC_2307_Lehrling, "SCHMIED_01");
	
	Wld_InsertNpc				(DIC_2100_Soeldner, "SHUETTE306_EINGANG");
	Wld_InsertNpc				(DIC_2101_Soeldner, "STADT_WEG_049");
	Wld_InsertNpc				(DIC_2102_Soeldner, "STADT_WEG_104A");
	Wld_InsertNpc				(DIC_2103_Soeldner, "STADT_WEG_175");
	Wld_InsertNpc				(DIC_2104_Soeldner, "STADT_WEG_135");
	Wld_InsertNpc				(DIC_2105_Soeldner, "STADT_WEG_089");
	Wld_InsertNpc				(DIC_2106_Soeldner, "STADT_WEG_088");
	Wld_InsertNpc				(DIC_2107_Soeldner, "STADT_WEG_080");
	Wld_InsertNpc				(DIC_2108_Soeldner, "STADT_WEG_095");
	Wld_InsertNpc				(DIC_2109_Soeldner, "STADT_MAUER_065");
	Wld_InsertNpc				(DIC_2110_Soeldner, "STADT_MAUER_016");
	Wld_InsertNpc				(DIC_2111_Soeldner, "STADT_WEG_140");
	Wld_InsertNpc				(DIC_2112_Soeldner, "STADTHUET02_EINGANG");
	Wld_InsertNpc				(DIC_2113_Soeldner, "STADT_UNTEN_00");
	Wld_InsertNpc				(DIC_2114_Soeldner, "STADT_WEG_009");
	
	Wld_InsertNpc				(DIC_2334_Soeldner, "STADT_WEG_187");
	Wld_InsertNpc				(DIC_2335_Soeldner, "STADT_WEG_187");
	Wld_InsertNpc				(DIC_2336_Soeldner, "STADT_WEG_037");
	Wld_InsertNpc				(DIC_2337_Soeldner, "STADT_WEG_038");
	Wld_InsertNpc				(DIC_2338_Soeldner, "STADT_WEG_039");
	Wld_InsertNpc				(DIC_2339_Soeldner, "STADT_WEG_142");
	Wld_InsertNpc				(DIC_2340_Soeldner, "STADT_WEG_143");
	Wld_InsertNpc				(DIC_2341_Soeldner, "STADT_WEG_144");
	Wld_InsertNpc				(DIC_2342_Soeldner, "STADT_WEG_012");
	Wld_InsertNpc				(DIC_2343_Soeldner, "HHUET11_EINGANG");
	Wld_InsertNpc				(DIC_2344_Soeldner, "HHUET05_EINGANG");
	Wld_InsertNpc				(DIC_2345_Soeldner, "STADT_WEG_163");
	Wld_InsertNpc				(DIC_2346_Soeldner, "STADT_WEG_168");
	Wld_InsertNpc				(DIC_2347_Soeldner, "STADT_WEG_137");
	Wld_InsertNpc				(DIC_2348_Soeldner, "STADT_WEG_127");
	Wld_InsertNpc				(DIC_2349_Magier, "STADT_MITTE_023");
	Wld_InsertNpc				(DIC_2350_Magier, "STADT_MITTE_024");
	Wld_InsertNpc				(DIC_2351_Soeldner, "STADT_UNTEN_04");
	Wld_InsertNpc				(DIC_2352_Soeldner, "STADT_UNTEN_04");
	Wld_InsertNpc				(DIC_2353_Soeldner, "STADT_UNTEN_04");
	Wld_InsertNpc				(DIC_2354_Soeldner, "STADT_WEG_105");
	Wld_InsertNpc				(DIC_2355_Soeldner, "STADT_WEG_105");
	Wld_InsertNpc				(DIC_2356_Soeldner, "STADT_WEG_079");
	Wld_InsertNpc				(DIC_2357_Soeldner, "STADTHUET02_02");
	Wld_InsertNpc				(DIC_2358_Soeldner, "STADTHUET02_02");
	Wld_InsertNpc				(DIC_2359_Soeldner, "STADTHUET02_02");
	Wld_InsertNpc				(DIC_2360_Soeldner, "STADTHUET02_02");
	Wld_InsertNpc				(DIC_2361_Syra, "STADT_MITTE_023");
	
	Wld_InsertNpc				(DIC_2502_Leofwin, "HHUET09_WANZE");
	Wld_InsertNpc				(Soeldnerwanze, "HHUET09_WANZE");
	Wld_InsertNpc				(Dic_2504_Asarend, "Stadt");	//neu1
	Wld_InsertNpc				(DIC_2365_Natalia, "STADT_MITTE_025");
	
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_018");
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_018");	
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_017");	
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_017");	
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_007");	
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_027");	
	Wld_InsertNpc			(Haus_Ratte, "STADT_UNTERGRUND_026");	
	
//------- In den Zellen der Arena ------- Harri ------
	Wld_InsertNpc			(Haus_Gobbo, "STADT_ARENA_Z1");
	Wld_InsertNpc			(Haus_Wolf, "STADT_ARENA_Z2");
	Wld_InsertNpc			(Haus_Skeleton, "STADT_ARENA_Z3");
	Wld_InsertNpc			(Haus_Ratte, "STADT_ARENA_Z4");
	Wld_InsertNpc			(Haus_Ratte, "STADT_ARENA_Z4");	
	
};

FUNC VOID INIT_SUB_STADT ()
{

	Wld_SetMobRoutine (00,00,"FIREPLACE",1);
	Wld_SetMobRoutine (20,05,"FIREPLACE",1);
	Wld_SetMobRoutine (06,00,"FIREPLACE",0);
	
	
//------------ obere Ebene -------------------
	Wld_AssignRoomToGuild("HHüT05",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT04",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE202",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT11",GIL_SLD);
//	Wld_AssignRoomToGuild("HHüT03",GIL_SLD);		// Hero's Hütte
	Wld_AssignRoomToGuild("SHUETTE201",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT02",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT01",GIL_SLD);
	Wld_AssignRoomToGuild("TURM1",GIL_SLD);			// bei Asarend
	Wld_AssignRoomToGuild("HHüT00_",GIL_SLD);		// Lagerhütte
	Wld_AssignRoomToGuild("TURM2",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE203",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT10_",GIL_SLD);
//	Wld_AssignRoomToGuild("HHüT09",GIL_SLD);		// Wanzenquest
	Wld_AssignRoomToGuild("HHüT08_",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT07",GIL_SLD);
	Wld_AssignRoomToGuild("HHüT06",GIL_SLD);
//	Wld_AssignRoomToGuild("ARENA",GIL_SLD);			// na .. Arena
	Wld_AssignRoomToGuild("HHüT12",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE103",GIL_SLD);
	Wld_AssignRoomToGuild("TURM3",GIL_SLD);
	
//------------ mittlere Ebene ------------------
	Wld_AssignRoomToGuild("SHUETTE306",GIL_SLD);
//	Wld_AssignRoomToGuild("SHUETTE303",GIL_KDW);	// Taliasan	
	Wld_AssignRoomToGuild("SHUETTE307",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE308",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE301",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE302",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE309",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE304",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE305",GIL_SLD);
	
//------------- untere Ebene ------------------
	Wld_AssignRoomToGuild("HHüTTK04",GIL_SLD);
//	Wld_AssignRoomToGuild("HBARACKE",GIL_SLD);		// Betten Baracke

	Wld_AssignRoomToGuild("HHUETTEM01",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM02",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM03",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM04",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM05",GIL_SLD);
	
	Wld_AssignRoomToGuild("HHUETTEM06",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM07",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM08",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM09",GIL_SLD);
	Wld_AssignRoomToGuild("HHUETTEM10",GIL_SLD);
	
	Wld_AssignRoomToGuild("SHUETTE102",GIL_SLD);
	Wld_AssignRoomToGuild("HHüTTK03",GIL_SLD);		// Lagerhütte
	Wld_AssignRoomToGuild("HHüTTK04",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE101",GIL_SLD);
	Wld_AssignRoomToGuild("HHüTTK02",GIL_SLD);
//	Wld_AssignRoomToGuild("STADTHüT02",GIL_SLD);	// hmm .. öffendlich?
//	Wld_AssignRoomToGuild("MITTEE",GIL_SLD);		// Magierobekt - ist eh ne Barjere davor
//	Wld_AssignRoomToGuild("SCHMIED",GIL_SLD);
	Wld_AssignRoomToGuild("HHüTTK01",GIL_SLD);
//	Wld_AssignRoomToGuild("SHUETTE4",GIL_SLD);		// Kneipe
	Wld_AssignRoomToGuild("SHUETTE104",GIL_SLD);
	Wld_AssignRoomToGuild("SHUETTE105",GIL_SLD);

};

//*					Surfaced				*


FUNC VOID STARTUP_SUB_SURFACED ()
{
		// -------- toter Späher ----------
	Wld_InsertNpc				(DIC_2017_Spaeher,"FOREST01_17");
     var C_NPC Spaeher;
     Spaeher = Hlp_GetNpc(DIC_2017_Spaeher); 
     Npc_ChangeAttribute     (Spaeher, ATR_HITPOINTS, -Spaeher.attribute[ATR_HITPOINTS_MAX]);

    Wld_InsertNpc				(DIC_2009_Soeldner,"SEE_VOR_STADT_04");
	Wld_InsertNpc				(DIC_2018_Narrow,"FOREST01_00");
	Wld_InsertNpc				(DIC_2019_Jaeger,"FOREST01_00");
	Wld_InsertNpc				(DIC_2028_Barem,"WIESE02_04");
	Wld_InsertNpc				(DIC_2032_Waechter,"ZSK_24");
	Wld_InsertNpc				(DIC_2033_Baddog,"FOREST01_06");
	Wld_InsertNpc				(Sld_B,"SEE_VOR_STADT_10");
	Wld_InsertNpc				(Mine_Worker_2034,"RAMPE_02");
	Wld_InsertNpc				(Sld_A,"SEE_VOR_STADT_51");
	
	// ---------- Bauernhof ------------
	Wld_InsertNpc				(DIC_2044_Lagariman, "BHOF1_05");
	Wld_InsertNpc				(DIC_2045_Bauer, "BHOF1_03");
	Wld_InsertNpc				(DIC_2046_Baeuerin, "BHOF1_03");
	Wld_InsertNpc				(DIC_2047_Feldarbeiter, "BHOF1_03");
	Wld_InsertNpc				(DIC_2048_Mueller, "BHOF1_03");
	
	Wld_InsertNpc				(DIC_2301_Feldarbeiterin, "BHOF1_03");
	Wld_InsertNpc				(DIC_2302_Feldarbeiterin, "BHOF1_03");
	Wld_InsertNpc				(DIC_2303_Feldarbeiterin, "BHOF1_03");
	Wld_InsertNpc				(DIC_2304_Feldarbeiter, "BHOF1_03");
	Wld_InsertNpc				(DIC_2305_Feldarbeiter, "BHOF1_03");
	Wld_InsertNpc				(DIC_2306_Feldarbeiter, "BHOF1_03");
	
	Wld_InsertNpc				(DIC_2308_Soeldner, "SF_BHOF1_04");
	Wld_InsertNpc				(DIC_2309_Soeldner, "SF_BHOF1_11");
	// -------------- Reisfeld ------------
	Wld_InsertNpc				(DIC_2366_Arbeiterin, "SF_REISFELD_15");
	Wld_InsertNpc				(DIC_2367_Arbeiterin, "SF_REISFELD_15");
	Wld_InsertNpc				(DIC_2368_Arbeiterin, "SF_REISFELD_15");
	Wld_InsertNpc				(DIC_2369_Arbeiterin, "SF_REISFELD_15");
	Wld_InsertNpc				(DIC_2370_Vorarbeiterin, "SF_REISFELD_15");

	// ----------- Missions Tiere --------
	Wld_InsertNpc				(Wolf_GE,"FOREST01_05");
	Wld_InsertNpc				(Wolf_GE,"FOREST01_05");
	Wld_InsertNpc				(Wolf_GE,"FOREST01_05");
	Wld_InsertNpc				(Wolf_GE,"FOREST01_05");

	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");
	Wld_InsertNpc				(Wolf_GZ,"FOREST01_10");

	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");
	Wld_InsertNpc				(Wolf_BQ,"FOREST03_13");

	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	Wld_InsertNpc				(Wolf_HT,"STADT_PATH02_04");
	
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");
	Wld_InsertNpc				(Scavenger,"FOREST03_00");

	Wld_InsertNpc				(JngWaran, "WIESE02_05");				//Bf7 -Harri
	Wld_InsertNpc				(JngWaran, "WIESE02_04");				//Bf7 -Harri
	Wld_InsertNpc				(JngWaran, "WIESE02_03");				//Bf7 -Harri

	Wld_InsertNpc				(Wala,"STADT_PATH02_07");
	Wld_InsertNpc				(BruetLurker,"SF_H02_05");
	Wld_InsertItem				(ItArScrollTrfWolf, "GRAB01_01");
	Wld_InsertItem				(ItArScrollTrfWolf, "GRAB01_02");

	Wld_InsertNpc				(FarmRatte, "BHOF1_02");
	Wld_InsertNpc				(FarmRatte, "BHOF1_02");
	Wld_InsertNpc				(FarmRatte, "BHOF1_02");
	Wld_InsertNpc				(FarmRatte, "BHOF1_02");
	
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");
	Wld_InsertNpc		(FeldWanze, "BHOF1_FELD3_01");

	Wld_InsertNpc		(FeldRatte, "BHOF1_FELD2_03");
	Wld_InsertNpc		(FeldRatte, "BHOF1_FELD2_03");
	Wld_InsertNpc		(FeldRatte, "BHOF1_FELD2_03");
	Wld_InsertNpc		(FeldRatte, "BHOF1_FELD2_03");


	Wld_InsertNpc		(LurkerB, "PATH_UTEMPEL01_20");
	Wld_InsertNpc		(LurkerB, "PATH_UTEMPEL01_20");
	Wld_InsertNpc		(LurkerB, "PATH_UTEMPEL01_20");
	
	Wld_InsertNpc		(WaranB, "SF_BERG01_29");
	Wld_InsertNpc		(WaranB, "SF_BERG01_29");
	Wld_InsertNpc		(WaranB, "SF_BERG01_29");
	Wld_InsertNpc		(WaranB, "SF_BERG01_29");
	Wld_InsertNpc			(FireGolem, "SF_BERG01_32");
	Wld_InsertNpc			(StoneGolem, "SF_BERG01_59");
	Wld_InsertNpc			(StoneGolem, "SF_BERG01_60");
	Wld_InsertNpc			(Skeleton, "SF_BERG01_61");
	Wld_InsertNpc			(Skeleton, "SF_BERG01_61");
	Wld_InsertNpc			(Skeleton, "SF_BERG01_57");
	Wld_InsertNpc			(Skeleton, "SF_BERG01_58");
	Wld_InsertNpc			(SkeletonSH, "SF_BERG01_58");
	Wld_InsertNpc			(Troll, "SF_BERG01_64");
	Wld_InsertNpc			(GreenGobboClub, "SF_BERG01_63");
	Wld_InsertNpc			(GreenGobboClub, "SF_BERG01_63");
	
	Wld_InsertNpc		(BloodflyB, "SF_H04_20");
	Wld_InsertNpc		(BloodflyB, "SF_H04_20");
	Wld_InsertNpc		(BloodflyB, "SF_H04_20");
	Wld_InsertNpc		(BloodflyB, "SF_H04_20");
	
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_38");
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_39");
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_40");
	
	Wld_InsertNpc		(BrownGobboClub, "SF_BHOF1_02");
	Wld_InsertNpc		(BrownGobboClub, "SF_BHOF1_02");
	Wld_InsertNpc		(BrownGobboSword, "SF_BHOF1_02");
	
	Wld_InsertNpc		(BrownGobboClub, "SF_VH06_46");
	Wld_InsertNpc		(BrownGobboSword, "SF_VH06_46");
	Wld_InsertNpc		(BrownGobboClub, "SF_VH06_46");
	
	Wld_InsertNpc		(Harpie, "SF_BERG01_36");
	Wld_InsertNpc		(Harpie, "SF_BERG01_36");
	Wld_InsertNpc		(HarpieB, "SF_BERG01_36");
	Wld_InsertNpc		(HarpieB, "SF_BERG01_36");
	
	Wld_InsertNpc		(LurkerB, "WIESE01_01");
	Wld_InsertNpc		(LurkerB, "WIESE01_01");
	Wld_InsertNpc		(LurkerB, "WIESE01_01");
	
	Wld_InsertNpc		(MoleratB, "SF_BERG01_01");
	Wld_InsertNpc		(MoleratB, "SF_BERG01_01");
	Wld_InsertNpc		(MoleratB, "SF_BERG01_01");
	
	Wld_InsertNpc		(MoleratB, "WFALL_UB_00");
	Wld_InsertNpc		(MoleratB, "WFALL_UB_00");
	Wld_InsertNpc		(MoleratB, "WFALL_UB_00");
	
	Wld_InsertNpc		(ScavengerB, "ZUM_REISFELD_44");
	Wld_InsertNpc		(ScavengerB, "ZUM_REISFELD_44");
	
	Wld_InsertNpc		(ScavengerC, "SEE_UB_07");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_07");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_07");
	
	Wld_InsertNpc		(ScavengerD, "SF_H07_01");
	Wld_InsertNpc		(ScavengerD, "SF_H07_01");
	Wld_InsertNpc		(ScavengerD, "SF_H07_01");
	
	Wld_InsertNpc		(WaranB, "WFALL_UB_09");
	Wld_InsertNpc		(WaranB, "WFALL_UB_09");
	Wld_InsertNpc		(WaranB, "WFALL_UB_09");
	
	Wld_InsertNpc		(BrownGobboClub, "ZUM_REISFELD_47");
	Wld_InsertNpc		(BrownGobboSword, "ZUM_REISFELD_47");
	
	Wld_InsertNpc		(ScavengerC, "SEE_UB_37");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_37");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_37");
	
	Wld_InsertNpc		(WolfZwei, "SF_VH06_55");
	Wld_InsertNpc		(WolfZwei, "SF_VH06_55");
	Wld_InsertNpc		(WolfDrei, "SF_VH06_55");
	Wld_InsertNpc		(WolfDrei, "SF_VH06_55");
	Wld_InsertNpc		(WolfVier, "SF_VH06_55");
	Wld_InsertNpc		(WolfVier, "SF_VH06_55");
	
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_04");
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_04");
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_04");
	Wld_InsertNpc		(BloodflyB, "SEE_VOR_STADT_04");
	
	Wld_InsertNpc		(MoleratB, "SF_VH06_52");
	Wld_InsertNpc		(MoleratB, "SF_VH06_52");
	Wld_InsertNpc		(MoleratB, "SF_VH06_52");
	
	Wld_InsertNpc		(ScavengerD, "SF_VH06_35");
	Wld_InsertNpc		(ScavengerD, "SF_VH06_35");
	Wld_InsertNpc		(ScavengerD, "SF_VH06_35");
	
	Wld_InsertNpc		(ScavengerB, "PATH_UTEMPEL01_09");
	Wld_InsertNpc		(ScavengerB, "PATH_UTEMPEL01_09");
	Wld_InsertNpc		(ScavengerB, "PATH_UTEMPEL01_09");
	
	Wld_InsertNpc		(LurkerB, "PATH_UTEMPEL01_06");
	Wld_InsertNpc		(LurkerB, "PATH_UTEMPEL01_06");
	Wld_InsertNpc		(LurkerB, "PATH_UTEMPEL01_06");
	
	Wld_InsertNpc		(ScavengerB, "SF_BHOF1_21");
	Wld_InsertNpc		(ScavengerB, "SF_BHOF1_21");
	
	Wld_InsertNpc		(MoleratB, "FOREST01_10");
	Wld_InsertNpc		(MoleratB, "FOREST01_10");
	Wld_InsertNpc		(MoleratB, "FOREST01_10");
	
	Wld_InsertNpc		(MoleratB, "SF_VS_06");
	Wld_InsertNpc		(MoleratB, "SF_VS_06");
	Wld_InsertNpc		(MoleratB, "SF_VS_06");
	
	Wld_InsertNpc		(ScavengerD, "SF_VS_04");
	Wld_InsertNpc		(ScavengerD, "SF_VS_04");
	Wld_InsertNpc		(ScavengerD, "SF_VS_04");
	
	Wld_InsertNpc		(ScavengerC, "SF_VS_01");
	Wld_InsertNpc		(ScavengerC, "SF_VS_01");
	Wld_InsertNpc		(ScavengerC, "SF_VS_01");

	Wld_InsertNpc		(WolfDrei, "SF_VS_13");
	Wld_InsertNpc		(WolfVier, "SF_VS_13");
	
	Wld_InsertNpc		(BloodflyB, "VORDERSTADT_06");
	Wld_InsertNpc		(BloodflyB, "VORDERSTADT_06");
	Wld_InsertNpc		(BloodflyB, "VORDERSTADT_06");
	Wld_InsertNpc		(BloodflyB, "VORDERSTADT_06");
	Wld_InsertNpc		(BloodflyB, "VORDERSTADT_06");
	Wld_InsertNpc		(BloodflyB, "VORDERSTADT_06");
	
	Wld_InsertNpc		(WolfZwei, "SF_BERG01_09");
	Wld_InsertNpc		(WolfDrei, "SF_BERG01_09");
	Wld_InsertNpc		(WolfVier, "SF_BERG01_09");
	
	Wld_InsertNpc		(ScavengerB, "SF_BERG01_16");
	Wld_InsertNpc		(ScavengerB, "SF_BERG01_16");
	Wld_InsertNpc		(ScavengerB, "SF_BERG01_16");
	
	Wld_InsertNpc		(Molerat, "ZSK_20");
	Wld_InsertNpc		(Molerat, "ZSK_20");
	Wld_InsertNpc		(Molerat, "ZSK_20");
	Wld_InsertNpc		(Molerat, "ZSK_20");

	Wld_InsertNpc		(GreenGobboSword, "ZAM_32");

	Wld_InsertNpc		(GreenGobboClub, "ZAM_17");
	Wld_InsertNpc		(GreenGobboSword, "ZAM_12");
	Wld_InsertNpc		(GreenGobboSword, "ZAM_05");

	Wld_InsertNpc		(GreenGobboClub, "ZAM_41");
	Wld_InsertNpc		(GreenGobboClub, "ZAM_41");
	Wld_InsertNpc		(GreenGobboClub, "ZAM_41");

	Wld_InsertNpc		(GreenGobboSword, "ZSK_05");
	Wld_InsertNpc		(GreenGobboSword, "ZSK_02");

	Wld_InsertNpc		(Scavenger, "SEE_VOR_STADT_02");
	Wld_InsertNpc		(Scavenger, "SEE_VOR_STADT_02");
	Wld_InsertNpc		(Scavenger, "SEE_VOR_STADT_02");
	Wld_InsertNpc		(Scavenger, "SEE_VOR_STADT_02");

	Wld_InsertNpc		(Waran, "SEE_VOR_STADT_35");

	Wld_InsertNpc		(Bloodfly, "SEE_VOR_STADT_36");
	Wld_InsertNpc		(Bloodfly, "SEE_VOR_STADT_36");
	Wld_InsertNpc		(Bloodfly, "SEE_VOR_STADT_27");
	Wld_InsertNpc		(Bloodfly, "SEE_VOR_STADT_27");

	Wld_InsertNpc		(Wolf, "FOREST01_06");
	Wld_InsertNpc		(Wolf, "FOREST01_06");

	Wld_InsertNpc		(GreenGobboSword, "SF_BHOF1_16");
	Wld_InsertNpc		(GreenGobboClub, "SF_BHOF1_16");

	Wld_InsertNpc		(WolfZwei, "SF_BHOF1_40");
	Wld_InsertNpc		(WolfZwei, "SF_BHOF1_40");
	Wld_InsertNpc		(WolfDrei, "SF_BHOF1_40");
	Wld_InsertNpc		(WolfDrei, "SF_BHOF1_40");
	Wld_InsertNpc		(WolfVier, "SF_BHOF1_40");
	Wld_InsertNpc		(WolfVier, "SF_BHOF1_40");
	Wld_InsertNpc		(Scavenger, "SF_BHOF1_46");
	Wld_InsertNpc		(Scavenger, "SF_BHOF1_46");
	Wld_InsertNpc		(Scavenger, "SF_BHOF1_46");
	Wld_InsertNpc		(Scavenger, "SF_BHOF1_46");

	Wld_InsertNpc		(Lurker, "SF_BHOF1_51");
	Wld_InsertNpc		(Lurker, "SF_BHOF1_51");

	Wld_InsertNpc		(Bloodfly, "WIESE01_02");
	Wld_InsertNpc		(Bloodfly, "WIESE01_02");
	Wld_InsertNpc		(Bloodfly, "WIESE01_07");
	Wld_InsertNpc		(Bloodfly, "WIESE01_07");

	Wld_InsertNpc		(Scavenger, "SF_H04_17");
	Wld_InsertNpc		(Scavenger, "SF_H04_17");
	Wld_InsertNpc		(Scavenger, "SF_H04_17");

	Wld_InsertNpc		(WolfZwei, "FOREST03_32");
	Wld_InsertNpc		(WolfZwei, "FOREST03_32");
	Wld_InsertNpc		(WolfDrei, "FOREST03_32");
	Wld_InsertNpc		(WolfDrei, "FOREST03_32");
	Wld_InsertNpc		(WolfVier, "FOREST03_32");
	Wld_InsertNpc		(WolfVier, "FOREST03_32");
	Wld_InsertNpc		(Molerat, "FOREST03_04");
	Wld_InsertNpc		(Molerat, "FOREST03_04");
	Wld_InsertNpc		(Molerat, "FOREST03_04");
	Wld_InsertNpc		(Molerat, "FOREST03_04");

	Wld_InsertNpc		(Molerat, "FOREST03_26");
	Wld_InsertNpc		(Molerat, "FOREST03_26");
	Wld_InsertNpc		(Molerat, "FOREST03_26");

	Wld_InsertNpc		(BlackGobboWarrior, "SF_VH06_51");
	Wld_InsertNpc		(BlackGobboWarrior, "SF_VH06_51");

	Wld_InsertNpc		(Giant_Rat, "SF_VH06_54");
	Wld_InsertNpc		(Giant_Rat, "SF_VH06_54");
	Wld_InsertNpc		(Giant_Rat, "SF_VH06_54");

	Wld_InsertNpc		(Scavenger, "SEE_UB_39");
	Wld_InsertNpc		(Scavenger, "SEE_UB_39");
	Wld_InsertNpc		(Scavenger, "SEE_UB_39");
	Wld_InsertNpc		(Scavenger, "SEE_UB_41");
	Wld_InsertNpc		(Scavenger, "SEE_UB_41");
	Wld_InsertNpc		(Scavenger, "SEE_UB_41");

	Wld_InsertNpc		(Bloodfly, "SEE_UB_25");
	Wld_InsertNpc		(Bloodfly, "SEE_UB_25");
	Wld_InsertNpc		(Bloodfly, "SEE_UB_25");
	Wld_InsertNpc		(Bloodfly, "SEE_UB_25");

	Wld_InsertNpc		(Waran, "SEE_UB_05");
	Wld_InsertNpc		(Waran, "SEE_UB_05");
	Wld_InsertNpc		(Waran, "SEE_UB_05");
	Wld_InsertNpc		(Waran, "SEE_UB_05");

	Wld_InsertNpc		(GreenGobboSword, "ZUM_REISFELD_26");
	Wld_InsertNpc		(GreenGobboClub, "ZUM_REISFELD_30");

	Wld_InsertNpc		(GreenGobboSword, "ZUM_REISFELD_61");

	Wld_InsertNpc		(GreenGobboClub, "ZUM_REISFELD_48");
	Wld_InsertNpc		(GreenGobboClub, "ZUM_REISFELD_48");

	Wld_InsertNpc		(Scavenger, "SEE_UB_09");
	Wld_InsertNpc		(Scavenger, "SEE_UB_09");
	Wld_InsertNpc		(Scavenger, "SEE_UB_09");
	Wld_InsertNpc		(Scavenger, "SEE_UB_09");

	Wld_InsertNpc		(Wolf, "SEE_UB_15");
	Wld_InsertNpc		(Wolf, "SEE_UB_15");
	Wld_InsertNpc		(Wolf, "SEE_UB_15");
	Wld_InsertNpc		(Wolf, "SEE_UB_15");

	Wld_InsertNpc		(Giant_Rat, "SF_VH06_40");
	Wld_InsertNpc		(Giant_Rat, "SF_VH06_40");
	Wld_InsertNpc		(Giant_Rat, "SF_VH06_40");

	Wld_InsertNpc		(OrcWarrior1, "SF_VH01_08");

	Wld_InsertNpc		(Molerat, "SF_VH01_04");
	Wld_InsertNpc		(Molerat, "SF_VH01_04");
	Wld_InsertNpc		(Molerat, "SF_VH01_04");

	Wld_InsertNpc		(Molerat, "PATH_SW_55");
	Wld_InsertNpc		(Molerat, "PATH_SW_55");

	Wld_InsertNpc		(Giant_Rat, "PATH_SW_51");
	Wld_InsertNpc		(Giant_Rat, "PATH_SW_51");

	Wld_InsertNpc		(GreenGobboSword, "PATH_SW_46");

	Wld_InsertNpc		(OrcWarrior1, "SF_BERG01_46");
	Wld_InsertNpc		(OrcWarrior1, "SF_BERG01_46");

	Wld_InsertNpc		(Scavenger, "SF_BERG01_40");
	Wld_InsertNpc		(Scavenger, "SF_BERG01_40");
	Wld_InsertNpc		(Scavenger, "SF_BERG01_40");

	Wld_InsertNpc		(Bloodfly, "SF_BERG01_03");
	Wld_InsertNpc		(Bloodfly, "SF_BERG01_03");
	Wld_InsertNpc		(Bloodfly, "SF_BERG01_03");

	Wld_InsertNpc		(Molerat, "SF_BERG01_01");
	Wld_InsertNpc		(Molerat, "SF_BERG01_01");

	Wld_InsertNpc		(Skeleton, "SF_BERG01_01");

	Wld_InsertNpc		(YFireWaran, "SF_BERG01_29");

	Wld_InsertNpc		(YoungTroll, "SF_BERG01_21");

	Wld_InsertNpc		(GreenGobboSword, "PATH_SW_27");
	Wld_InsertNpc		(GreenGobboSword, "PATH_SW_27");

	Wld_InsertNpc		(Scavenger, "PATH_SW_16");
	Wld_InsertNpc		(Scavenger, "PATH_SW_16");
	Wld_InsertNpc		(Scavenger, "PATH_SW_16");
	
	Wld_InsertNpc		(WolfZwei, "WFALL_UB_01");
	Wld_InsertNpc		(WolfDrei, "WFALL_UB_01");
	Wld_InsertNpc		(WolfVier, "WFALL_UB_01");
	
	Wld_InsertNpc		(MoleratB, "WFALL_UB_01");
	Wld_InsertNpc		(MoleratB, "WFALL_UB_01");
	Wld_InsertNpc		(MoleratB, "WFALL_UB_01");
	
	Wld_InsertNpc		(ScavengerB, "FOREST01A_05");
	Wld_InsertNpc		(ScavengerB, "FOREST01A_05");
	Wld_InsertNpc		(ScavengerB, "FOREST01A_05");
	
	Wld_InsertNpc		(ScavengerD, "FOREST01A_05");
	Wld_InsertNpc		(ScavengerD, "FOREST01A_05");
	Wld_InsertNpc		(ScavengerD, "FOREST01A_05");
	
	Wld_InsertNpc		(ScavengerC, "ZSK_11");
	Wld_InsertNpc		(ScavengerC, "ZSK_11");
	Wld_InsertNpc		(ScavengerC, "ZSK_11");
	
	Wld_InsertNpc		(MoleratB, "ZAM_12");
	Wld_InsertNpc		(MoleratB, "ZAM_12");
	Wld_InsertNpc		(MoleratB, "ZAM_12");
	
	Wld_InsertNpc		(Molerat, "ZAM_20");
	Wld_InsertNpc		(Molerat, "ZAM_20");
	Wld_InsertNpc		(Molerat, "ZAM_20");
	
	Wld_InsertNpc		(WolfZwei, "SF_H07_07");
	Wld_InsertNpc		(WolfDrei, "SF_H07_07");
	Wld_InsertNpc		(WolfVier, "SF_H07_07");
	Wld_InsertNpc		(WolfZwei, "SF_H07_07");
	Wld_InsertNpc		(WolfDrei, "SF_H07_07");
	Wld_InsertNpc		(WolfVier, "SF_H07_07");
	
	Wld_InsertNpc		(ScavengerD, "SEE_UB_15");
	Wld_InsertNpc		(ScavengerD, "SEE_UB_15");
	Wld_InsertNpc		(ScavengerD, "SEE_UB_15");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_15");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_15");
	Wld_InsertNpc		(ScavengerC, "SEE_UB_15");
	
	Wld_InsertNpc		(FireWaran,"SEE_UB_74");
	Wld_InsertNpc		(FireWaran,"SEE_UB_75");
	Wld_InsertNpc		(FireWaran,"SEE_UB_75");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_80");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_80");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_80");
	Wld_InsertNpc		(MoleratB,"SEE_UB_83");
	Wld_InsertNpc		(MoleratB,"SEE_UB_83");
	Wld_InsertNpc		(MoleratB,"SEE_UB_83");
	Wld_InsertNpc		(Lurker,"SEE_UB_51");
	Wld_InsertNpc		(Lurker,"SEE_UB_52");
	Wld_InsertNpc		(Lurker,"SEE_UB_53");
	Wld_InsertNpc		(LurkerB,"SEE_UB_56");
	Wld_InsertNpc		(LurkerB,"SEE_UB_56");
	Wld_InsertNpc		(BloodflyB,"SEE_UB_58");
	Wld_InsertNpc		(BloodflyB,"SEE_UB_58");
	Wld_InsertNpc		(BloodflyB,"SEE_UB_59");
	Wld_InsertNpc		(BloodflyB,"SEE_UB_59");
	Wld_InsertNpc		(Bloodfly,"SF_DELTA_REISFELD_07");
	Wld_InsertNpc		(Bloodfly,"SF_DELTA_REISFELD_07");
	Wld_InsertNpc		(Bloodfly,"SF_DELTA_REISFELD_07");
	Wld_InsertNpc		(Lurker,"SF_DELTA_REISFELD_09");
	Wld_InsertNpc		(Lurker,"SF_DELTA_REISFELD_09");
	Wld_InsertNpc		(Lurker,"SF_DELTA_REISFELD_10");
	Wld_InsertNpc		(Lurker,"SF_DELTA_REISFELD_13");
	Wld_InsertNpc		(Lurker,"SF_DELTA_REISFELD_24");
	Wld_InsertNpc		(LurkerB,"SF_DELTA_REISFELD_25");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_15");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_15");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_19");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_19");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_20");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_20");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_16");
	Wld_InsertNpc		(BloodflyB,"SF_DELTA_REISFELD_16");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_66");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_66");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_66");
	Wld_InsertNpc		(BloodflyB,"SEE_UB_54");
	Wld_InsertNpc		(Shadowbeast,"SEE_UB_64");
	Wld_InsertNpc		(Molerat,"SEE_UB_61");
	Wld_InsertNpc		(Molerat,"SEE_UB_61");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_71");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_72");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_85");
	Wld_InsertNpc		(Scavenger_Demon,"SEE_UB_85");
	Wld_InsertNpc		(OrcDog,"SEE_UB_73");
	Wld_InsertNpc		(OrcDog,"SEE_UB_73");
	Wld_InsertNpc		(Skeleton,"BEI_HB2_01");
	Wld_InsertNpc		(Skeleton,"BEI_HB2_02");
	Wld_InsertNpc		(SkeletonScout,"BEI_HB2_03");
	Wld_InsertNpc		(Lurker,"BEI_HB2_04");
	Wld_InsertNpc		(Lurker,"BEI_HB2_05");
	Wld_InsertNpc		(Snapper,"ZAM_43");
	Wld_InsertNpc		(Snapper,"ZAM_44");
	Wld_InsertNpc		(Snapper,"ZAM_45");
	
	Wld_InsertNpc		(Snapper, "SF_VH06_23");
	Wld_InsertNpc		(Snapper, "SF_VH06_22");
	Wld_InsertNpc		(Scavenger_Demon, "SF_VH06_26");
	Wld_InsertNpc		(Scavenger_Demon, "SF_VH06_26");
	Wld_InsertNpc		(Molerat,"ZUR_H06_18");
	Wld_InsertNpc		(Molerat,"ZUR_H06_18");
	Wld_InsertNpc		(Scavenger_Demon, "SF_VH06_20");
	Wld_InsertNpc		(Bloodhound, "SF_VH06_07");
	Wld_InsertNpc		(Bloodhound, "SF_VH06_07");
	Wld_InsertNpc		(Bloodhound, "SF_VH06_06");
	Wld_InsertNpc		(Snapper, "SF_VH06_15");
	Wld_InsertNpc		(Snapper, "SF_VH06_13");
	Wld_InsertNpc		(Snapper, "SF_VH06_12");
	Wld_InsertNpc		(WolfVier, "SF_VH06_03");
	Wld_InsertNpc		(WolfDrei, "SF_VH06_30");
	Wld_InsertNpc		(Razor, "SF_VH06_30");
	Wld_InsertNpc		(Razor, "SF_VH06_31");
	Wld_InsertNpc		(SkeletonScout, "SF_H06_08");
	Wld_InsertNpc		(WolfDrei, "SF_VH06_31");
	Wld_InsertNpc		(WolfZwei, "SF_VH06_31");
	Wld_InsertNpc		(Razor, "SF_VH06_49");
	Wld_InsertNpc		(StoneGolem, "SF_VH06_01");
	Wld_InsertNpc		(Troll, "SF_H05_28");
	Wld_InsertNpc		(WaranS, "SF_H05_26");
	Wld_InsertNpc		(WaranS, "SF_H05_26");
	Wld_InsertNpc		(IceGolem, "SF_H05_39");
	
	Wld_InsertNpc		(BlackGobboWarrior, "SF_BERG01_55");
	Wld_InsertNpc		(BlackGobboMace, "SF_BERG01_52");
	Wld_InsertNpc		(BlackGobboMace, "SF_BERG01_53");
	Wld_InsertNpc		(BlackGobboMace, "SF_BERG01_54");
	
	
//--H08------------	
	Wld_InsertNpc		(SkeletonScout,"SF_H08_06");
	Wld_InsertNpc		(Zombie3,"SF_H08_07");
	Wld_InsertNpc		(SkeletonMage,"SF_H08_08");
	Wld_InsertNpc		(SkeletonScout,"SF_H08_09");
	Wld_InsertNpc		(SkeletonWarrior,"SF_H08_10");
	Wld_InsertNpc		(SkeletonScout,"SF_H08_11");
	Wld_InsertNpc		(Zombie2,"SF_H08_12");
	Wld_InsertNpc		(Shadowbeast,"SF_H08_01");
	
	//--H04------------	
	Wld_InsertNpc		(Minecrawler,"SF_H04_14");
	Wld_InsertNpc		(Minecrawler,"SF_H04_16");
	Wld_InsertNpc		(Minecrawler,"SF_H04_07");
	
//--H05------------ 
 	Wld_InsertNpc  (BrownGobboSword,"SF_H05_11");
 	Wld_InsertNpc  (GreenGobboClub,"SF_H05_11");
 	Wld_InsertNpc  (GreenGobboClub,"SF_H05_11");
 
//--H01------------ 
 	Wld_InsertNpc  (Bloodhound,"SF_H01_01");
 	Wld_InsertNpc  (Bloodhound,"SF_H01_02");
	
//--H02------------	
	Wld_InsertNpc		(BrownGobboSword,"SF_H02_09");
	Wld_InsertNpc		(BrownGobboSword,"SF_H02_09");
	//Wld_InsertNpc		(BruetLurker,"SF_H02_05");
	
//--H07------------	
	Wld_InsertNpc		(Tarantel,"SF_H07_06");
	Wld_InsertNpc		(Tarantel,"SF_H07_05");
	
//--H06------------ 
 	Wld_InsertNpc  (BrownGobboSword,"SF_H06_02");
 	Wld_InsertNpc  (GreenGobboClub,"SF_H06_02");
 	Wld_InsertNpc  (GreenGobboClub,"SF_H06_02");
	
};

FUNC VOID INIT_SUB_SURFACED ()
{
	Wld_SetMobRoutine (00,00,"FIREPLACE",1);
	Wld_SetMobRoutine (20,05,"FIREPLACE",1);
	Wld_SetMobRoutine (06,00,"FIREPLACE",0);	
	
	Wld_AssignRoomToGuild("VILLAO",GIL_BAU);
	Wld_AssignRoomToGuild("VILLAU",GIL_BAU);

};

//*******************************************************************************
//*					Insel - PTP				*
//*******************************************************************************
FUNC VOID STARTUP_SUB_PTP_DIC ()
{
/*
	Wld_InsertNpc		(Aptp_2011_Gosslin,"PTP_02");
//	Wld_InsertNpc		(AT_2004_Gardist,"PTP_03");		// Animations Vorführer
	Wld_InsertNpc		(Aptp_2013_Carl,"PTP_20");*/
	Wld_InsertNpc		(APTP_2014_RScavenger,"PTP_23");	//neu1
	Wld_InsertNpc		(Scavenger_Demon,"PTP_02");
	Wld_InsertNpc		(Scavenger_Demon,"PTP_02");
	Wld_InsertNpc		(Scavenger_Demon,"PTP_18");
	Wld_InsertNpc		(YFireWaran,	"PTP_14");
	Wld_InsertNpc		(Bloodfly,	"PTP_09");
	Wld_InsertNpc		(Bloodfly,	"PTP_09");
	Wld_InsertNpc		(Bloodfly,	"PTP_10");
	Wld_InsertNpc		(Bloodfly,	"PTP_10");
	Wld_InsertNpc		(Tarantel,	"BH_01");
	Wld_InsertNpc		(Tarantel,	"BH_S01");
	Wld_InsertNpc		(Tarantel,	"BH_02");	
	Wld_InsertNpc          (WaranC,     "PTP_39"); 
    Wld_InsertNpc          (WaranC,     "PTP_35");
	
};

FUNC VOID INIT_SUB_PTP_DIC ()
{

};

//*******************************************************************************
//*					Ghosttown				*
//*******************************************************************************
FUNC VOID STARTUP_SUB_GHOSTTOWN ()
{
	
	//Wld_InsertNpc			(PruefungOrk, "WN");
	//Wld_InsertNpc			(Leitwolf, "GT_05");
	Wld_InsertNpc			(Wolf, "GT_23");
	Wld_InsertNpc			(Wolf, "GT_23");
	Wld_InsertNpc			(Wolf, "GT_23");
	Wld_InsertNpc			(Wolf, "GT_23");
	Wld_InsertNpc			(Wolf, "GT_23");
	Wld_InsertNpc			(Wolf, "GT_23");
		
	Wld_InsertNpc		(MoleratB, "SF_GT_26");
	Wld_InsertNpc		(MoleratB, "SF_GT_26");
	Wld_InsertNpc		(MoleratB, "SF_GT_26");
		
	Wld_InsertNpc		(WolfDrei, "GT_19");
	Wld_InsertNpc		(WolfZwei, "GT_20");
	Wld_InsertNpc		(WolfVier, "GT_17");
	Wld_InsertNpc		(WolfDrei, "GT_11");
	Wld_InsertNpc		(WolfVier, "GT_08");
	Wld_InsertNpc		(WolfZwei, "GT_08");
		
	Wld_InsertNpc		(BrownGobboClub, "GT_37");
	Wld_InsertNpc		(BrownGobboSword, "GT_37");
	Wld_InsertNpc		(BrownGobboClub, "GT_36");
	Wld_InsertNpc		(BrownGobboSword, "GT_36");
	
	Wld_InsertNpc		(DIC_2084_Gardist,"SF_GT_22");
	Wld_InsertNpc		(BrownGobboSword,"SF_GT_21");
 	Wld_InsertNpc		(BrownGobboClub,"SF_GT_21");
 	Wld_InsertNpc		(BrownGobboClub,"SF_GT_21");
 	Wld_InsertNpc		(GreenGobboSword,"SF_GT_21");
 	Wld_InsertNpc		(GreenGobboClub,"SF_GT_21");
 	Wld_InsertNpc		(GreenGobboClub,"SF_GT_21");
 	Wld_InsertNpc		(Scavenger_Demon,"SF_GT_07");
 	Wld_InsertNpc		(Scavenger_Demon,"SF_GT_07");
	
	Wld_InsertNpc  (Zombie3, "GT_H01_IN");
};

FUNC VOID INIT_SUB_GHOSTTOWN ()
{

};

//*******************************************************************************
//*					Sumpf					*
//*******************************************************************************
FUNC VOID STARTUP_SUB_SUMPF ()
{	
	Wld_InsertNpc		(DIC_2085_Killian, "SUMPF_BERG_50");
	Wld_InsertNpc       (Dic_2505_Moriarty, "SF_SUMPF_144B");
	
	Wld_InsertNpc		(BrownGobboClub, "SF_SUMPF_01");
	Wld_InsertNpc		(BrownGobboSword, "SF_SUMPF_01");
	Wld_InsertNpc		(BrownGobboClub, "SF_SUMPF_01");
	
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_166");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_166");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_166");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_166");
	
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_75");
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_75");
	
	Wld_InsertNpc		(SumpfGolem, "SF_SUMPF_79");
	
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_82");
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_82");
	
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_102");
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_102");
	
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_109");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_109");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_109");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_109");
	
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_113");
	Wld_InsertNpc		(Swampshark, "SF_SUMPF_113");
	
	Wld_InsertNpc		(SumpfGolem, "SF_SUMPF_116");
	
	Wld_InsertNpc		(Bloodfly, "SF_SUMPF_107");
	Wld_InsertNpc		(Bloodfly, "SF_SUMPF_107");
	Wld_InsertNpc		(Bloodfly, "SF_SUMPF_107");
	Wld_InsertNpc		(Bloodfly, "SF_SUMPF_107");
	
	Wld_InsertNpc		(SumpfGolem, "SF_SUMPF_34");
	
	Wld_InsertNpc		(MoleratB, "SF_SUMPF_39");
	Wld_InsertNpc		(MoleratB, "SF_SUMPF_39");
	Wld_InsertNpc		(MoleratB, "SF_SUMPF_39");
	
	Wld_InsertNpc		(Giant_Rat, "SF_SUMPF_71");
	Wld_InsertNpc		(Giant_Rat, "SF_SUMPF_71");
	Wld_InsertNpc		(Giant_Rat, "SF_SUMPF_71");
	
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_28");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_28");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_30");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_30");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_10");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_10");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_23");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_23");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_23");
	Wld_InsertNpc		(FireWaran, "SF_SUMPF_21");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_20");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_18");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_19");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_11");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_07");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_05");
	Wld_InsertNpc		(BloodflyB, "SF_SUMPF_06");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_176");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_176");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_176");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_177");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_177");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_177");
	Wld_InsertNpc		(SumpfGolem, "SF_SUMPF_72");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_93");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_93");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_93");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_93");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_86");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_86");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_86");
	Wld_InsertNpc		(SumpfGolem, "SF_SUMPF_124");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_131");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_131");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_131");
	Wld_InsertNpc		(WaranS, "SF_SUMPF_131");
	Wld_InsertNpc		(Troll, "SF_SUMPF_147");
	Wld_InsertNpc		(BlackGobboWarrior, "SF_SUMPF_147");
	Wld_InsertNpc		(BlackGobboWarrior, "SF_SUMPF_147");
	Wld_InsertNpc		(BlackGobboWarrior, "SF_SUMPF_147");
	Wld_InsertNpc		(BlackGobboWarrior, "SF_SUMPF_147");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_151");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_151");
	Wld_InsertNpc		(Scavenger_Demon, "SF_SUMPF_151");
	Wld_InsertNpc		(MoleratS, "SF_SUMPF_152");
	Wld_InsertNpc		(MoleratS, "SF_SUMPF_152");
	Wld_InsertNpc		(MoleratS, "SF_SUMPF_152");
	Wld_InsertNpc		(HarpieB, "SF_SUMPF_144B");
	Wld_InsertNpc		(HarpieB, "SF_SUMPF_144B");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_138");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_138");
	Wld_InsertNpc		(SumpfRatte, "SF_SUMPF_138");
	Wld_InsertNpc		(SumpfGolem, "SF_SUMPF_142");
	Wld_InsertNpc		(GreenGobboSword, "SUMPF_BERG_07");
	Wld_InsertNpc		(GreenGobboClub, "SUMPF_BERG_07");
	Wld_InsertNpc		(GreenGobboClub, "SUMPF_BERG_07");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_14");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_14");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_14");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_25");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_26");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_27");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_23");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_24");
	Wld_InsertNpc		(SumpfGolem, "SUMPF_BERG_34");
	Wld_InsertNpc		(FireWaran, "SUMPF_BERG_72");
	Wld_InsertNpc		(WaranS, "SUMPF_BERG_71");
	Wld_InsertNpc		(WaranS, "SUMPF_BERG_70");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_45");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_45");
	Wld_InsertNpc		(Troll, "SUMPF_BERG_56A");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_57");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_57");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_57");
	Wld_InsertNpc		(MoleratS, "SUMPF_BERG_57");
	Wld_InsertNpc		(Snapper, "SUMPF_BERG_64");
	Wld_InsertNpc		(Snapper, "SUMPF_BERG_64");
	Wld_InsertNpc		(Snapper, "SUMPF_BERG_64");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_52");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_52");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_52");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_BERG_52");
	Wld_InsertNpc		(WaranC, "SUMPF_TAL_03");
	Wld_InsertNpc		(WaranC, "SUMPF_TAL_04");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_15");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_15");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_15");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_11");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_11");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_11");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_11");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_16");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_16");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_16");
	Wld_InsertNpc		(Scavenger_Demon, "SUMPF_TAL_16");
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_07");
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_07");
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_07");
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_07");
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_09");	
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_09");	
	Wld_InsertNpc		(MoleratS, "SUMPF_TAL_09");	

};

FUNC VOID INIT_SUB_SUMPF ()
{

};

//*******************************************************************************
//*								UTempel01										*
//*******************************************************************************
FUNC VOID STARTUP_SUB_UTEMPEL01 ()
{	
	Wld_InsertNpc		(Minecrawler, "UTEMPEL01_18");
	Wld_InsertNpc		(Minecrawler, "UTEMPEL01_21");
	Wld_InsertNpc		(Minecrawler, "UTEMPEL01_22");
	Wld_InsertNpc		(Minecrawler, "UTEMPEL01_15");
	Wld_InsertNpc		(MinecrawlerWarrior, "UTEMPEL01_39");
	Wld_InsertNpc		(MinecrawlerWarrior, "UTEMPEL01_41");
	Wld_InsertNpc		(Zombie3, "UTEMPEL01_34");
};

FUNC VOID INIT_SUB_UTEMPEL01 ()
{

};

//*******************************************************************************
//*								Miniburg										*
//*******************************************************************************
FUNC VOID STARTUP_SUB_MINIBURG ()
{
	Wld_InsertNpc				(DIC_2049_Verwalter, "MINIBURG_30");
	Wld_InsertNpc				(DIC_2050_Jaeger, "MINIBURG_24");
	Wld_InsertNpc				(DIC_2051_Soeldner, "MINIBURG_32");
	Wld_InsertNpc				(DIC_2083_Harlok, "MINIBURG_34");
	Wld_InsertNpc				(DIC_2310_Jaeger, "MINIBURG_13");
	Wld_InsertNpc				(DIC_2311_Jaeger, "MINIBURG_26");
	Wld_InsertNpc				(DIC_2312_Soeldner, "MINIBURG_35");
	Wld_InsertNpc				(DIC_2313_Soeldner, "MINIBURG_45");
	Wld_InsertNpc				(DIC_2314_Soeldner, "MINIBURG_43");
	Wld_InsertNpc				(DIC_2315_Soeldner, "MINIBURG_41");
	Wld_InsertNpc				(DIC_2316_Soeldner, "MINIBURG_57");
	Wld_InsertNpc				(DIC_2317_Schmied, "MINIBURG_34");
};

FUNC VOID INIT_SUB_MINIBURG ()
{
	Wld_SetMobRoutine (00,00,"FIREPLACE",1);
	Wld_SetMobRoutine (20,05,"FIREPLACE",1);
	Wld_SetMobRoutine (06,00,"FIREPLACE",0);
	
	
		Wld_AssignRoomToGuild("MINIMBURG01",GIL_TPL);	// Wachturm
//		Wld_AssignRoomToGuild("MINIMBURG02",GIL_TPL);	// Labor drinn
};

func VOID STARTUP_BURG ()
{
    STARTUP_SUB_BURG ();
};

func VOID INIT_BURG ()
{
    INIT_SUB_BURG ();
};



func VOID STARTUP_STADT ()
{
    STARTUP_SUB_STADT ();
};

func VOID INIT_STADT ()
{
    INIT_SUB_STADT ();
};


func VOID STARTUP_SURFACED ()
{
    STARTUP_SUB_SURFACED ();
};

func VOID INIT_SURFACED ()
{
    INIT_SUB_SURFACED ();
};


func VOID STARTUP_PTP_DIC ()
{
    STARTUP_SUB_PTP_DIC ();
};

func VOID INIT_PTP_DIC ()
{
    INIT_SUB_PTP_DIC ();
};


func VOID STARTUP_GHOSTTOWN ()
{
    STARTUP_SUB_GHOSTTOWN ();
};

func VOID INIT_GHOSTTOWN ()
{
    INIT_SUB_GHOSTTOWN ();
};


func VOID STARTUP_SUMPF ()
{
    STARTUP_SUB_SUMPF ();
};

func VOID INIT_SUMPF ()
{
    INIT_SUB_SUMPF ();
};

func VOID STARTUP_UTEMPEL01 ()
{
    STARTUP_SUB_UTEMPEL01 ();
};

func VOID INIT_UTEMPEL01 ()
{
    INIT_SUB_UTEMPEL01 ();
};

func VOID STARTUP_MINIBURG ()
{
    STARTUP_SUB_MINIBURG ();
};

func VOID INIT_MINIBURG ()
{
    INIT_SUB_MINIBURG ();
};


		
//-------- eigentliche Startup des Spiels Diccuric --------
FUNC VOID INIT_DICCURIC ()
{
	INIT_Sub_Burg			();
	INIT_Sub_Stadt			();
	INIT_Sub_Surfaced 		();
	INIT_Sub_PTP_Dic 		();
	INIT_Sub_Ghosttown 		();
	INIT_Sub_Sumpf			();
	INIT_Sub_UTempel01		();
	INIT_Sub_Miniburg		();

	AussehenSetzen();
	RampeReparieren ();
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};

FUNC VOID STARTUP_DICCURIC ()
{
	Startup_Sub_Burg			();
	Startup_Sub_Stadt			();
	Startup_Sub_Surfaced			();
	Startup_Sub_PTP_Dic			();
	Startup_Sub_Ghosttown			();
	Startup_Sub_Sumpf			();
	Startup_Sub_UTempel01			();
	Startup_Sub_Miniburg			();

	//die folgende Zeile gilt nur, bis die INIT_...-Funktionen von Ulf unterstützt werden.
	INIT_DICCURIC					();
	PlayVideo ("Diccuric\INTRO.BIK");
};

//*******************************************************************************
//*			GROTTE							*									*
//*******************************************************************************

FUNC VOID STARTUP_GROTTE ()
{
//vordere Höhle

	Wld_InsertNpc		(OTMinecrawler,	"GR_11");
	Wld_InsertNpc		(SkeletonSH,	"GR_02");
	Wld_InsertNpc		(Skeleton,	"GR_03");
	Wld_InsertNpc		(Skeleton,	"GR_03");
	Wld_InsertNpc		(SkeletonMage,	"GR_21");
	Wld_InsertNpc		(SkeletonWarrior,	"GR_24");
	Wld_InsertNpc		(SkeletonWarrior,	"GR_24");
	Wld_InsertNpc		(SkeletonWarrior,	"GR_20");
	Wld_InsertNpc		(SkeletonWarrior,	"GR_20");
	Wld_InsertNpc		(OTMinecrawler,	"GR_13");
	Wld_InsertNpc		(OTMinecrawler,	"GR_13");
	Wld_InsertNpc		(OTDemon,	"GR_14");

	Wld_InsertNpc		(Minecrawler,	"GR_43");
	Wld_InsertNpc		(MinecrawlerWarrior,"GR_26");
	Wld_InsertNpc		(OTMinecrawler,	"GR_25");
	Wld_InsertNpc		(Zombie4,	"GR_13");
	Wld_InsertNpc		(SkeletonMage,	"GR_12");
	Wld_InsertNpc		(SkeletonScout,	"GR_22");
	Wld_InsertNpc		(OTMinecrawler,	"GR_06");
	Wld_InsertNpc		(OTMinecrawler,	"GR_06");
	Wld_InsertNpc		(OTMinecrawler,	"GR_09");
	Wld_InsertNpc		(OTMinecrawler,	"GR_09");
	Wld_InsertNpc		(OTMinecrawler,	"GR_52");
	Wld_InsertNpc		(MinecrawlerWarrior,"GR_16");

// Hintere Höhle

	Wld_InsertNpc		(Bridgegolem,	"GR3_12");
	Wld_InsertNpc		(Bridgegolem,	"GR3_16");
	Wld_InsertNpc		(SkeletonMage,	"GR3_14");
	Wld_InsertNpc		(OTMinecrawler,	"GR3_04");
	Wld_InsertNpc		(SkeletonScout,	"GR3_15");
	Wld_InsertNpc		(SkeletonScout,	"GR3_13");
	Wld_InsertNpc		( ORC_Priest_6,"GR3_00");

};


FUNC VOID INIT_GROTTE ()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);
	AussehenSetzen();

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};

//*******************************************************************************
//*			Platform						*									*
//*******************************************************************************

FUNC VOID STARTUP_Platform ()
{
	Wld_InsertNpc		(Babe_Rockefeller,	"PF_07");
	Wld_InsertNpc		(AT_2004_Gardist,	"PF_04");
};

FUNC VOID INIT_Platform ()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);
	AussehenSetzen();

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};

//*******************************************************************************
//*			PTP							*									*
//*******************************************************************************

FUNC VOID STARTUP_PTP ()
{
	Wld_InsertNpc		(Aptp_2011_Gosslin,"PTP_02");
//	Wld_InsertNpc		(AT_2004_Gardist,"PTP_03");
	Wld_InsertNpc		(APTP_2014_RScavenger,	"PTP_23");
	Wld_InsertNpc		(Aptp_2013_Carl,"ptp_20");
	Wld_InsertNpc		(Scavenger,	"PTP_02");
	Wld_InsertNpc		(Scavenger,	"PTP_02");
	Wld_InsertNpc		(Scavenger,	"PTP_18");
	Wld_InsertNpc		(YFireWaran,	"PTP_14");
	Wld_InsertNpc		(Bloodfly,	"PTP_09");
	Wld_InsertNpc		(Bloodfly,	"PTP_09");
	Wld_InsertNpc		(Bloodfly,	"PTP_10");
	Wld_InsertNpc		(Bloodfly,	"PTP_10");

};

FUNC VOID INIT_PTP ()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);
	AussehenSetzen();

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};

//*******************************************************************************
//*			PTPN							*									*
//*******************************************************************************

FUNC VOID STARTUP_PTPN ()
{
	Wld_InsertNpc		(Aptp_2011_Gosslin,"PTP_02");
//	Wld_InsertNpc		(AT_2004_Gardist,"PTP_03");
	Wld_InsertNpc		(APTP_2014_RScavenger,	"PTP_23");
	Wld_InsertNpc		(Aptp_2013_Carl,"ptp_20");
	Wld_InsertNpc		(Scavenger,	"PTP_02");
	Wld_InsertNpc		(Scavenger,	"PTP_02");
	Wld_InsertNpc		(Scavenger,	"PTP_18");
	Wld_InsertNpc		(YFireWaran,	"PTP_14");
	Wld_InsertNpc		(Bloodfly,	"PTP_09");
	Wld_InsertNpc		(Bloodfly,	"PTP_09");
	Wld_InsertNpc		(Bloodfly,	"PTP_10");
	Wld_InsertNpc		(Bloodfly,	"PTP_10");
	Wld_InsertNpc		(Tarantel,	"BH_01");
	Wld_InsertNpc		(Tarantel,	"BH_S01");
	Wld_InsertNpc		(Tarantel,	"BH_02");

};

FUNC VOID INIT_PTPN ()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);
	AussehenSetzen();

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};
//*******************************************************************

FUNC VOID STARTUP_ABANDONEDMINE_DIC ()
{
	Wld_InsertNpc				(DIC_2081_Modares,"VM_HOEHL_TUER");
	Wld_InsertNpc				(DIC_2320_Soeldner,"VM_EING_R");
	Wld_InsertNpc				(DIC_2321_Soeldner,"VM_INN_SEEW4");
	Wld_InsertNpc				(DIC_2322_Soeldner,"VM_INN_OBEN");
	Wld_InsertNpc				(DIC_2323_Soeldner,"VM_OBE_WEG2");
	Wld_InsertNpc				(DIC_2324_Soeldner,"VM_OBE_WEG4");
	Wld_InsertNpc				(DIC_2325_Soeldner,"VM_HOEHL_DURCH");
	Wld_InsertNpc				(DIC_2326_Schuerfer,"VM_ERZ02");
	
	Wld_InsertNpc				(StoneGolem,"VM_INN_UEBER");

	Wld_InsertNpc				(Minecrawler,"START_CRW_01");
	Wld_InsertNpc				(Minecrawler,"START_CRW_01");
	Wld_InsertNpc				(Minecrawler,"START_CRW_01");
	Wld_InsertNpc				(Minecrawler,"START_CRW_02");
	Wld_InsertNpc				(Minecrawler,"START_CRW_03");
	Wld_InsertNpc				(Minecrawler,"START_CRW_03");
	Wld_InsertNpc				(Minecrawler,"START_CRW_04");
	Wld_InsertNpc				(Minecrawler,"START_CRW_04");
	Wld_InsertNpc				(Minecrawler,"START_CRW_05");
	Wld_InsertNpc				(Minecrawler,"START_CRW_05");
	Wld_InsertNpc				(Minecrawler,"START_CRW_06");
	Wld_InsertNpc				(Minecrawler,"START_CRW_06");
	Wld_InsertNpc				(Minecrawler,"START_CRW_07");
	Wld_InsertNpc				(Minecrawler,"START_CRW_07");
	Wld_InsertNpc				(Minecrawler,"START_CRW_07");
	Wld_InsertNpc				(MinecrawlerWarrior,"START_CRW_NEST");
	Wld_InsertNpc				(MinecrawlerWarrior,"START_CRW_NEST");
	Wld_InsertNpc				(MinecrawlerWarrior,"START_CRW_NEST");
	Wld_InsertNpc				(MinecrawlerWarrior,"START_CRW_NEST");
	Wld_InsertNpc				(MinecrawlerQueen,"START_CRW_NEST");
//	Wld_InsertNpc				(VM_2001_Wache,"VM_OBE_WACHE1");

	//-------- globale Variable --------
	//EnteredAbandonedMine = TRUE;
};

FUNC VOID INIT_ABANDONEDMINE_DIC ()
{
//	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);
	AussehenSetzen();

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};

FUNC VOID STARTUP_12MAG ()
{
	Wld_InsertNpc				(DIC_2054_Fulk,"HOEHLE_004");
	Wld_InsertNpc				(DIC_2055_Anselm,"HOEHLE_018");
	Wld_InsertNpc				(DIC_2056_Aldred,"HOEHLE_018");
	Wld_InsertNpc				(DIC_2057_Payn,"HOEHLE_034");
	Wld_InsertNpc				(DIC_2058_Quentin,"HOEHLE_018");
	Wld_InsertNpc				(DIC_2059_Immanuel,"HOEHLE_029");
	Wld_InsertNpc				(DIC_2060_Eustace,"HOEHLE_004");
	Wld_InsertNpc				(DIC_2061_Gladwin,"HOEHLE_018");
	Wld_InsertNpc				(DIC_2062_Masci,"HOEHLE_027");
	Wld_InsertNpc				(DIC_2063_Amalric,"HOEHLE_021");
	Wld_InsertNpc				(DIC_2064_Umfrey,"HOEHLE_018");
	Wld_InsertNpc				(DIC_2065_Waleran,"HOEHLE_028");
	Wld_InsertNpc				(DIC_2066_Herlewin,"HOEHLE_037");
	Wld_InsertNpc				(DIC_2067_Gamel,"HOEHLE_004");
	Wld_InsertNpc				(DIC_2068_Feordwin,"HOEHLE_008");
	Wld_InsertNpc				(DIC_2069_Waechter,"HOEHLE_007");
	Wld_InsertNpc				(DIC_2070_Waechter,"HOEHLE_007");
	Wld_InsertNpc				(DIC_2071_Waechter,"HOEHLE_007");
	Wld_InsertNpc				(DIC_2072_Waechter,"HOEHLE_007");
	Wld_InsertNpc				(DIC_2073_Waechter,"HOEHLE_006");
	Wld_InsertNpc				(DIC_2074_Waechter,"HOEHLE_006");
	Wld_InsertNpc				(DIC_2075_Waechter,"HOEHLE_006");


	//-------- globale Variable --------
	//EnteredAbandonedMine = TRUE;
};

FUNC VOID INIT_12MAG ()
{
//	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);
	//AussehenSetzen();

	//-------- Attitüden initialisieren --------
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
};



