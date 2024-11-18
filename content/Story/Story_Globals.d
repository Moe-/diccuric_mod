// *************************
// Globalvariablen für Story
// *************************

 // --------------------------------------------------- 
 // Rest von G1 wird eventuell noch gebraucht  -Harri                                   
 // ----------------------------------------------------
 
//#####################################################################    
//##                                                                       
//##                                                                       
//##					Lernkosten                         
//##                                                                       
//##                                                                       
//#####################################################################    
                                                                           
const int	LPCOST_ATTRIBUTE_STRENGTH	=	1;	           
const int	LPCOST_ATTRIBUTE_DEXTERITY	=	1;	           
const int	LPCOST_ATTRIBUTE_MANA		=	1;	           
                                                                           
const int	LPCOST_TALENT_MAGE_1		=	10;	           
const int	LPCOST_TALENT_MAGE_2		=	15;	           
const int	LPCOST_TALENT_MAGE_3		=	20;	           
const int	LPCOST_TALENT_MAGE_4		=	25;	           
const int	LPCOST_TALENT_MAGE_5		=	30;	           
const int	LPCOST_TALENT_MAGE_6		=	40;	           
                                                                           
const int	LPCOST_TALENT_1H_1			=	10;	   
const int	LPCOST_TALENT_1H_2			=	20;	   
const int	LPCOST_TALENT_2H_1			=	30;	   
const int	LPCOST_TALENT_2H_2			=	40;	   
                                                                           
const int	LPCOST_TALENT_BOW_1			=	10;	   
const int	LPCOST_TALENT_BOW_2			=	20;	   
const int	LPCOST_TALENT_CROSSBOW_1	=	10;	           
const int	LPCOST_TALENT_CROSSBOW_2	=	20;	           
                                                                           
const int	LPCOST_TALENT_ACROBAT		=	10;	           
const int	LPCOST_TALENT_SNEAK			=	10;	   
const int	LPCOST_TALENT_PICKLOCK_1	=	10;	           
const int	LPCOST_TALENT_PICKLOCK_2	=	20;	           
const int	LPCOST_TALENT_PICKPOCKET_1	=	10;	           
const int	LPCOST_TALENT_PICKPOCKET_2	=	20;	           
//------------------------------------------------------------------------- 
var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;
var int SLF_FIRE;

var int Kapitel;
var int Play_Lute;
var int Firstjoint;
var int Secondjoint;
var int Thirdjoint;
var int Wissen_Almanach;
var int InExtremoPlaying; 

const int HighPriest_MaxHit = 3;		//Anzahl der Schläge auf den fünften Ork-Priester, bis der "SC-hats-kapiert-Dialog" kommt
var int	EncounteredHighPriest;			//TRUE oder FALSE

 
 
 
// ---------------------------------------------------
// Diccuric - Markus
// ----------------------------------------------------
var int AlkoholStand;
var int LetzterAlkohol;
var int JointStand;
var int LetzterJoint;
var int EssenStand;
var int LetztesEssen;
var int VerlasseneMineBefreien;
var int TaliasanAuftraege;
var int AussehenTest;
var int SchrankA;
var int SchrankB;
var int TaylorPyt;
var int FiebelerRaetsel;
var int WolfAngriff;
var int BaremInfo;
var int RampeRepariert;
var int ReparierenVor;
var int RampDiagPerm;
var int GraveyarnKarteHolen;
var int WalaZustand;
var int BrueckenEinbruch;
var int AlwinDabei;
var int MinenDialog;
var int GraveyarnNerve;
var int SchlafImSchlafsack;
var int MonsterArt;
var string GegnerSpawn;
var int KampfInArena;
var int BesiegteGegnerZahl;
var int WappenBenutzt;
var int PflanzenTauchen;
var int PflanzenAufruf;
var int PflanzeSehen;
var int PflanzeSehenAufruf;
var int GraveyarnTag;
var int MuellerTag;
var int FeldUngezieferToeten;
var int LaborBenutzt;
var int ManaBrauen;
var int HPBrauen;
var int SonstigesBrauen;
var int TempBrauen;
var int HochstandAktiviert;
var int PositionKoll;
var int StartDialogGesprochen;
var int TagHinterTorAngriff;
var int BuchGeistGelesen;
var int MagierSpawn;
var int KollTag;
var int BrueckeMussGerichtetWerden;
var int SpawnCounter;
var int Sld_RemeberSpawnZaehler;
var int LagarimanKenntPerBaltar;
var int KampfMitKoll;
var int RuestungsVerlust;
var int FleischGegessen;

// **************************************************************
// Zähler für Schwächung des Heros
// **************************************************************
const int SchlaegeZahl = 99;		// 100 ist realer -Harri
var int HPCounter;
var int MPCounter;
var int SPCounter;
var int GPCounter;
var int HPLost;
var int MPLost;
var int SPLost;
var int GPLost;

// **************************************************************
//		Diccuric Zusatzvars Alex
// **************************************************************
var int use_Lab;                  //Wichtig wegen C_INFO-unterscheidung zw. Schlafen/Labornutzen
var int start_cs;				  //Zu Beginn des Spiels wird ein cs mit Dias emuliert
var int Potion_Choosen;           //Wurde ein Trank(im mcm) ausgewählt?
var int Selected_Potion;          //Welcher Trank wurde ausgewählt?
var int ScavHornUsed;			  //Benutzen des ScavHorns auf 4 begrentzen(pro Tag?)!
var int meat_taken;               //Fleisch wird von den Wölfen "benutzt"
var int ScavHornStatus;           //??? Irgendwas halt :)
var int Speak2me;                 /* 0: Keine Aktion
								  	 1: ein Teil des Dialoges von Person 1 wurde abgeschlossen	
									 2: der von Person 2 wurde abgeschlossen	
								  */
var int get_away;				  //Speichert den Abstand  NPC -> Spieler (für Entfehrnungsabfrage)
var int Alwin_count;			  //Zur dia abfrage, mehr net ;)
var int Loop_time;				  //speichert die Zeit, wielang der NPC in Loop is
var int Bedroll_Used;			  //Zum AI_Standup wichtig!
var int Thrown_Meat;              //falls der Spieler Fleisch runterwirft!

//-----------------------------------------------------------
// Dinge, die Alex vergeßen zu haben scheint, added by Markus
//-----------------------------------------------------------
var int DC_1_TOWER;
var int DC_2_SMITH;
var int DC_2_2;
var int DC_3_AP;
var int DC_4_Lausch;

// ---------------------------------------------------
// Diccuric - Harri
// ----------------------------------------------------
var int Hamond_Wanze;			//welches Angebot nimmt hero von Taliasan
var int Hamond_Amu;				//wie gibt hero amulett an Taliasan
var int Hamond_Auftrag_Day;		//Ultimatum Auftrag von Taliasan
var int Hamond_Trank_Day;		//Trankbrauzeit für Hamond
var int Hamond_CanTeach;		//Hamond als Lehrer
var int Leofwin_Mutprobe;		//Rampehochfahren geschaft und-oder gesehen
var int	MPPATH;					//Wählt den Teleport-Path
var int	MP_CONT;				//Erstkontakt Flag
var int	Sumpf_Sprung;			//Belohnung beim Sprung (Sumpfberg)
var int Durch_Barriere;			//prüft ob Amulett der Barriere angelegt ist
var int Bonus_Waldbeeren;		//Stärkebonus
var int Bonus_Flammendorn;		//Geschickbonus
var int H_pilz;					//Manabonus
var int H06_STONEWALL;			//Durchbruch in Höle 6
var int TeleAmu;				//Teleporteramulette suchen Flag
var int TeleAmulohn;			//Teleporteramulett - Belohnung
var int Trainiert;				//ob NPC Trainiert
var int ML_UTempel;				//Flag Magiclight im UTempel
var int Knows_GetFlammenzunge;	//Flammenzunge nehmen erlernen
var int Status_ZB;				//Status Zugbrücke Burg
var int Monsterwahl;			//Arenamonterauswahl
var int Treffer_b;
var int treffer_a;
var int Waffenwechsel;

// **************************************************
//		ptp Variablen
// **************************************************
var int INFO_Truhe;