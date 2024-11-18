// ------------------- Taliasans Robe -----------------------------

INSTANCE TAL_ROBE(C_Item)
	{
	name 					=	"Taliasans Robe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	15;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDF_ARMOR_H;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_LAW_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 40;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_TAL_ROBE;
	on_unequip		=	UnEquip_TAL_ROBE;
	};

FUNC VOID Equip_TAL_ROBE()
	{
	if (hero.attribute[ATR_STRENGTH] > 40)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 40;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 40 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_TAL_ROBE()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 40;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

// -------------------------- Robe, die Schneider herstellt --------------

INSTANCE Snd_Robe(C_Item)
	{
	name 					=	"Robe des Schneiders";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	15;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDF_ARMOR_H;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_LAW_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 40;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;

	on_equip		=	Equip_Snd_Robe;
	on_unequip		=	UnEquip_Snd_Robe;
	};

FUNC VOID Equip_Snd_Robe()
	{
	if (hero.attribute[ATR_STRENGTH] > 40)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 40;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 40 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_Snd_Robe()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 40;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

//---------------------------------------------------------------------
//	Raffas Empfehlungsschreiben
//---------------------------------------------------------------------
INSTANCE Ra_Empf(C_Item)
	{	
	name 				=	"Raffas Empfehlung";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseRaffaE;

	description			=	name;
	TEXT[1]				=	"Raffa schrieb für mich den Brief.";
	TEXT[2]				=	"Der Brief ist ein Empfehlungschreiben über";
	TEXT[3]				=	"Taliasan.";
	TEXT[4]				=	"Das wird Taliasan bestimmt helfen.";
	};

FUNC VOID UseRaffaE()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "169. Tag");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Taliasan ist ein sehr begabter Magier, der uns unbedingt helfen sollte. Nur mit seiner Hilfe werden wir es schaffen, unseren Einfluss zu vergrößern.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Er scheint auch etwas über den Jungen zu wissen...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Raffa");
				Doc_Show		(nDocID);
	};

// --------------- Babe Robe -------------------
INSTANCE BabeRobe (C_Item)
	{
	name 					=	"Babe_Robe";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	1;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"BaRob.3DS";
	visual_change 			=	"BABE_ROBE_V1.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	};

// ----------------- Glücksbringer (Schwert) -------------
INSTANCE Gluecksbringer (C_Item)
	{	
	name 				=	"Glücksbringer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_MISSION|ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	70;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	35;
	visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};

// ---------------- Ei eines Lurkers --------------

INSTANCE LurkerEi(C_Item)
	{	
	name 					=	"Lurker Ei";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	250;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Ein Ei eines Lurkers.";
	TEXT[1]					=	"";
	TEXT[2]					=	"";
	TEXT[3]					=	"";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
	};
	
//---------------------------------------------------------------------
//	Pyts Empfehlungsschreiben
//---------------------------------------------------------------------
INSTANCE Py_Empf(C_Item)
	{	
	name 				=	"Pyts Empfehlung";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UsePytE;

	description			=	name;
	TEXT[1]				=	"Pyt schrieb für mich den Brief.";
	TEXT[2]				=	"Der Brief ist ein Empfehlungschreiben über";
	TEXT[3]				=	"Taliasan.";
	TEXT[4]				=	"Das wird Taliasan bestimmt helfen.";
	};

FUNC VOID UsePytE()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "169. Tag");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Taliasan ist ein sehr begabter Magier, der uns unbedingt helfen sollte. Nur mit seiner Hilfe werden wir es schaffen, unseren Einfluss zu vergrößern.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Er scheint auch etwas über den Jungen zu wissen...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Pyt");
				Doc_Show		(nDocID);
	};
	
// ------------ Notizblock (nicht lesbar!) ------------
INSTANCE Notizblock (C_ITEM)
	{	
	name 					=	"Notizblock";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MULTI|ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Notizblock";
	TEXT[0]				= NAME_Value;                                                                                                                                                                                          
	COUNT[0]			= value;
	TEXT[1]				= "Das Ding habe ich bei einem";
	////COUNT[1]			= ;
	TEXT[2]				= "Späher gefunden.";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	//TEXT[5]				= NAME_Value;
	//COUNT[5]			= value;
	on_state[0]			=	UseNotizblock;
	};
	
func void UseNotizblock ()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Wolfszählung");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Zahl der Wölfe:");
				Doc_PrintLine	(nDocID,  0, "IIII");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
	};
	
//---------------------------------------------------------------------
//	Runenerklärung
//---------------------------------------------------------------------
INSTANCE Teleport_Des (C_Item)
	{	
	name 				=	"Die zwei Steine";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseTeleport_Des;

	description			=	name;
	TEXT[1]				=	"";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"Der Späher hatte diesen Zettel bei sich.";
	};

FUNC VOID UseTeleport_Des()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Eigentlich sollte ich ja die Wölfe zählen. Aber als ich diese Rune fand und sie benutzte, so landete ich hier, bei der anderen Rune. Seit ich diese eingesteckt habe, lande ich immer dort, wo ich versuche, die Rune zu verwenden...hoffentlich komme ich aus dem Wald wieder lebend heraus...überall sind Wölfe...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
	};
	
// ---------- Anklänge der Manie ---------------
INSTANCE Ta_Buch(C_Item)
	{	
	name 					=	"Anklänge der Manie";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseAnklaengeManie;
	
	description			= "Anklänge der Manie";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseAnklaengeManie()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "ANKLÄNGE DER MANIE"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Auf meinen Reisen traf ich die Erkrankung besonders häufig in Sektengemeinschaften an. In solchen Gruppen blieb die Krankheit oft unerkannt und konnte sich besonders schnell ausbreiten. In Sektenlagern schien absonderliches Verhalten");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "sogar erwünscht zu sein. Teilweise musste ich mit ansehen wie das Kauderwelsch besonders Verwirrter als Zeichen göttlicher Berufung angesehen wurden. Besonders gute Studien stellte ich mit einem Irrgläubigen an, der ständig behauptete 'den Schläfer erwecken' zu wollen.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );
		};	
	
	
	
	
	
	
// -------------- Wein: Doomtré ----------------
INSTANCE Doomtre(C_Item)
	{	
	name 				=	"Doomtre";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	80;

	visual	 			=	"ItFo_Wine_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Doomtre;
	scemeName			=	"POTION";

	description			= name;
	//TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Wein;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wein;
	};

	FUNC VOID UseDoomtre()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wein);
	};
	
//---------------------------------------------------------------------
//	Slades Empfehlungsschreiben
//---------------------------------------------------------------------
INSTANCE Sl_Empf(C_Item)
	{	
	name 				=	"Slades Empfehlung";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseSladeE;

	description			=	name;
	TEXT[1]				=	"Slade schrieb für mich den Brief.";
	TEXT[2]				=	"Der Brief ist ein Empfehlungschreiben über";
	TEXT[3]				=	"Taliasan.";
	TEXT[4]				=	"Das wird Taliasan bestimmt helfen.";
	};

FUNC VOID UseSladeE()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "169. Tag");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Taliasan ist ein sehr begabter Magier, der uns unbedingt helfen sollte. Nur mit seiner Hilfe werden wir es schaffen, unseren Einfluss zu vergrößern.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Er scheint auch etwas über den Jungen zu wissen...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Slade");
				Doc_Show		(nDocID);
	};

// ---------------- Graveyarns Medaillon ---------------
INSTANCE  Graveyarn_Erkennung(C_ITEM)
	{
	name 			=	"Graveyarns Amulette";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	100;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= "Graveyarns Amulette";

	TEXT[3]			= "Graveyarn gab mit das Amulette,";
	TEXT[4]			= "damit ich zeigen kann, dass ich";
	TEXT[5]			= "in seinem Auftrag unterwegs bin.";
	};

// ------------ Fiebelers Schlüssel -------------	
INSTANCE Fi_Key(C_ITEM)
	{
	name 				=	"Fiebelers Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
	};

// ------------- Rhetorik Buch ---------------
INSTANCE Rhetorik_Buch(C_ITEM)
	{	
	name 					=	"Das Rhetorik Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Das Rhetorik Buch";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			= UseItWr_Rhet_Buch;
	};
	
	FUNC VOID UseItWr_Rhet_Buch()
	{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Rhetorik"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "1. Sprich verständlich. Vereinfache Sachverhalte die verschachtelt sind!");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "2. Bedenke, dass auch dein Körper spricht. Lass Mimik und Gestik");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, " sich natürlich entfalten.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "3. Passe deine Rede vorher deinem Gesprächspartner an. Bedenke was der Zuhörer voraussetzt und erwartet.");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "4.Achte darauf das deine Argumente durchdacht sind und einen hohen Gehalt mit sich bringen.");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "5.Ein überzeugender Schlusspunkt kann oftmals den Eindruck über die ganze Rede umkehren.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );
	};
/*
// --------------- Karte für Graveyarn -----------
INSTANCE Graveyarn_Karte(C_Item)
	{	
	name 					=	"Karte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGmap;

	description				= "Eine Karte, die ich für Graveyarn holen soll.";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	};

	FUNC VOID UseGmap()
		{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_OldMine.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
		};*/
		
// ------------------ Erzdrache --------------
INSTANCE Erzdrache(C_ITEM)
	{
	name 			=	"Erzdrache";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 			=	100;

	visual 			=	"erzdrache.3ds";
	material			=	MAT_STONE;
	
	scemeName				=	"PAP";
	on_state[0] = UseDrache;
	//spell				= 	SPL_WALAHEILEN;

	description		= "Erzdrache";

	TEXT[3]			= "Das ist eine wertvolle Statue";
	TEXT[4]			= "aus Erz. Sie sieht sehr kostbar";
	TEXT[5]			= "aus...";
	};
	
	func void UseDrache()
		{
		if (Npc_GetDistToNpc (self,Wala) <= 500 && WalaZustand == 0)
			{
			WalaZustand = 1;
			AI_PlayAni (self,"T_PRACTICEMAGIC3");
			AI_ContinueRoutine (Wala);
			Npc_SetStateTime (self, 2);
			//AI_Wait(self, 1.5);
			//AI_StandUp (self);
			PrintScreen	("Du hast Wala geheilt!", -1,-1,"font_old_20_white.tga",3);
			}
 		else
 			{
 			PrintScreen	("Hier ist niemanden, den du damit heilen kannst!", -1,-1,"font_old_20_white.tga",3);
 			};
 			CreateInvItem (self,Erzdrache);
		};
	
	
// Testrobe	
INSTANCE TEST_ROBE(C_Item)
	{
	name 					=	"Test Robe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	15;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDF_ARMOR_H;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_LAW_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 40;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_TEST_ROBE;
	on_unequip		=	UnEquip_TEST_ROBE;
	};

FUNC VOID Equip_TEST_ROBE()
	{
	if (hero.attribute[ATR_STRENGTH] > 40)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 40;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 40 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_TEST_ROBE()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 40;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
	
// ------------- Crawlerei, wegen neuer Beschreibung ---------------
INSTANCE Crawlerei(C_Item)
	{	
	name 					=	"Minecrawler Ei";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"";
	TEXT[1]					=	"";
	TEXT[2]					=	"Diese Eier wurden von einer";
	TEXT[3]					=	"Minecrawler-Königin gelegt.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
	};
	
// ------------------------ Baltars Rüstung -----------------
INSTANCE Baltar_Ruestung(C_Item)
	{
	name 					=	"Baltars Rüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ebrh.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 70;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_Baltar_Ruestung;
	on_unequip		=	UnEquip_Baltar_Ruestung;
	};

FUNC VOID Equip_Baltar_Ruestung()
	{
	if (hero.attribute[ATR_STRENGTH] > 70)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 70;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 70 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_Baltar_Ruestung()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 70;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
	
//----------- Nachricht (Baltar Verschwörung) -------------------
INSTANCE BaltarVerschwoerung (C_Item)
	{	
	name 				=	"Nachricht über Baltar";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBaltarVerschwoerung;
	scemeName			=	"MAP";
	description			= "Eine Nachricht über Baltar";
	};
	
func void UseBaltarVerschwoerung ()
		{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Gabb,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "wir müssen Männer im Lager finden, die unsere Gesinnung teilen. Baltar ist nicht der rechtmäßige König für den er sich hält. Er ist ein Meuchelmörder und ein mächtiger Magier, der alles daran setzen wird, der Welt seinen Willen aufzuzwingen und die Menschen zu versklaven. Wenn wir genügend Leute überzeugen, können wir Baltar töten. Wir müssen von diesem Erdboden tilgen was nur Unglück bedeutet."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "            (gez. Ibba)"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
		};

// ------------- Wappen für Erinnerung ------------------
INSTANCE  WappenErinnerung(C_ITEM)
	{
	name 			=	"Wappen";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	100;

	visual 			=	"ItMi_StonePlate_Read_06.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	
	scemeName				=	"PAP";
	on_state[0] = UseWappen;

	description		= "Wappen";

	TEXT[3]			= "Das Wappen kommt dir von";
	TEXT[4]			= "irgendwoher bekannt vor...Du";
	TEXT[5]			= "solltest einen Blick drauf werfen.";
	};

func void UseWappen ()
	{
	AI_Output (hero,hero,"UseWappen_15_00"); //Dieses Wappen. Da auf dem Schild! Ich kenne es.  Genau das gleiche hing am Eingang unseres Hauses, zur Zierde. Ich erinnere mich wie mein Vater es einmal dort anbrachte. Was waren das noch für Gerüchte die ich vor ein paar Tagen hörte?
	AI_Wait(self, 4);
	AI_StandUpQuick (hero);
	AI_Output (hero,hero,"UseWappen_15_01"); //Es fällt mir schwer mich daran zu erinnern. Mein Vater sei ermordet worden und Baltar hieß es, war sein Mörder. Der Leichnam meines Vaters soll hier in der Nähe vergraben sein.
	AI_Wait(self, 3);
	AI_StandUpQuick (hero);
	AI_Output (hero,hero,"UseWappen_15_02"); //So ein Unsinn. Das Gerede gelangweilter Söldner, die sich die Zeit vertreiben. Hirngespinste. Doch dieser Unfug bringt mich auf eine Idee. Wenn Waffen in den Höhlen zu finden sind, könnte ich mich doch aufmachen und selbst nach Waffen suchen!
	AI_Wait(self, 4);
	AI_StandUpQuick (hero);
	AI_Output (hero,hero,"UseWappen_15_03"); //Solange Baltar keinen Auftrag für mich hat, werde ich mich auf diese Weise nützlich machen. Und vielleicht finde ich vorzeitig, eines der sechs, seltenen Amulette, die Baltar so dringend benötigt.
	AI_Wait(self, 3);
	AI_StandUpQuick (hero);
	
	if (WappenBenutzt < 1)
		{
		B_LogEntry (Vergangenheit, "Ich sollte mich ein wenig in den Höhlen hier in der Gegend umsehen. Vielleicht entdecke ich entwas interessantes. Außerdem kann ich mich von den Gedanken an meinen Vater ein wenig ablenken.");
		Npc_ExchangeRoutine	(DIC_2044_Lagariman,"QUEST");
		B_GiveXP (250);
		WappenBenutzt = 1;
		};
		CreateInvItem (self,WappenErinnerung);
	};
	
// ---------------- Spruchrolle Körperkraft --------------
instance SprKK (C_ITEM)
	{
	name 				=	"Fleisch des Leitwolfs";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItFo_RawMutton_01.3ds";
	scemeName			=	"MEAT";

	scemeName				=	"FOOD";
	on_state[0] = UseSprKK;

	description			=	"Fleisch vom Leitwolf";

	TEXT	[3] =	"Dieses Stück Fleisch habe ich von dem";
	TEXT	[4] =	"Rudelsführer der Wölfe...ob es mir";
	TEXT	[5] =	"gegen den Ork weiterhilft?";
	};
	
func void UseSprKK ()
	{
	if (FleischGegessen == 0 && !Npc_IsDead(PruefungOrk))
		{
		AI_PlayAni (hero,"T_PRACTICEMAGIC3");
		AI_Wait	(self,	3);
 		AI_StandUpQuick (hero);
			
	//	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 5;
		Npc_RemoveInvItem (hero, SprKK);
		
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 50;
		AI_UnequipWeapons (hero);
		
		Wld_SendTrigger ("NPCTEMPSTARK");
		
		/*PruefungOrk.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] * 8 / 10;
		PruefungOrk.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] * 8 / 10;
		PruefungOrk.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX] * 8 / 10;
		*/
		
		//var string TempWP;
		//TempWP = Npc_GetNearestWP(hero);
		//AI_StartState(hero, ZS_Staerker, 0, TempWP);
		//Npc_SetStateTime (hero, 0);
		//AI_Wait (dic_2003_Alwin, 120);		//Könnte eine Ausweichroutine benötigen
		//hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 50;
		FleischGegessen = 1;
		}
	else
		{
		PrintScreen	("Nichts passiert.", -1,-1,"font_old_20_white.tga",3);
		};
	};
	
func void SCHWAECHEPC ()
	{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 50;
		AI_PlayAni (hero,"T_PRACTICEMAGIC3");
		FleischGegessen = 0;
	};
	
// --------------- Verwandlungsring ---------------
instance VerwandlungsRing (C_ITEM)
	{
	name 					=	"Ring der Verwandlung";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	0;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_VerwandlungsRing;
	on_unequip				=	UnEquip_VerwandlungsRing;

	description		= "Ring der Verwandlung";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= NAME_Prot_Fire;
	//COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[4]			= "Der Ring gibt mir das Aussehen,";
	////COUNT[4]		= ;
	TEXT[5]			= "dass ich von Berengar bekam.";
	//COUNT[5]		= value;
	};
	
func void Equip_VerwandlungsRing ()
	{
	Mdl_SetVisualBody (hero,"hum_body_Naked0",     4,               1,               "Hum_Head_Bald",     96,                0,       -1); 
    Mdl_SetModelScale (hero, 0.83, 1, 0.83);	
    KontrolleRuestungsZahl ();
	};
	
func void UnEquip_VerwandlungsRing ()
	{
	Mdl_SetVisualBody (hero,"hum_body_Naked0",	3,			1,			"Hum_Head_Pony",	6, 			0,			-1);	
	Mdl_SetModelScale (hero, 1, 1, 1);
	KontrolleRuestungsZahl ();
	};
	
// -------------- Aufgetauchte Pflanzen ----------------
INSTANCE PflanzeAlwinA(C_ITEM)
	{	
	name 				=	"Unterwasserpflanze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	50;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	};
	
INSTANCE PflanzeAlwinB(C_ITEM)
	{	
	name 				=	"Eine weitere Unterwasserpflanze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	50;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	};
	
INSTANCE PflanzeAlwinC(C_ITEM)
	{	
	name 				=	"Eine andere Unterwasserpflanze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	50;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	};
	
// --------------- Schwert für Söldner (Pyt Quest) --------------------
INSTANCE RotrouSchwert (C_Item)
	{	
	name 				=	"Rotrous Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	97;

	damageTotal			= 	30;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	12;
	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[1]				= "Das ist nicht Glücksbringer!";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};
	
// --------------- Saiyas Schlitzer --------------------
INSTANCE SaiyasSchlitzer (C_Item)
	{	
	name 				=	"Saiyas Schlitzer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	visual 				=	"SaiyasSchlitzer.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	};

//INSTANCE DiccuricKarte(C_Item)
INSTANCE Graveyarn_Karte (C_Item)
{	
	name 					=	"Karte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseDiccuricKarte;

	description				= "Karte";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseDiccuricKarte()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					//Doc_SetLevel	( nDocID,	"DICCURIC.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_Diccuric.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
	
// --------- Bücher Diccuric
//--------- Kriegsbericht Nr.1 ---------------
INSTANCE KriegsBericht1(C_Item)
	{	
	name 					=	"Kriegsbericht (Sicht eines Magierlehrlings)";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseKriegsBericht1;
	
	description			= "Kriegsbericht (Sicht eines Magierlehrlings)";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseKriegsBericht1()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Kriegsbericht"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, "17.Juli:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Wir sind schon drei Wochen an der Front, Meister Frahm meint zwar immer noch das wir siegen werden, doch ich bekomme langsam Zweifel, die Orks rücken im Westen ungehindert voran, im Osten halten unsere Leute sie momentan noch in Schach. Doch wie lange werden sie diese barbarischen Horden noch aufhalten können?");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "18.Juli:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Die Orks im Westen haben das Gebirge überwunden und haben nun praktisch keine Gegenwehr zu erwarten. Im Osten halten wir sie weiterhin. Doch eine neue Armee bestehend aus Orks und Wargen rückt von Norden vor. Unsere Leute haben dieser Armee des Bösen praktisch nichts entgegenzusetzen.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "19.Juli:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Unsere Soldaten im Westen konnten die Orks für den Moment hinhalten, da sie drei wichtige Brücken zerstörten. Im Norden und Osten sieht es dagegen weitaus weniger gut aus. Die Orks haben nun auch unsere Stellungen im Osten überrannt. Im Norden hatten unsere Leute nicht den Hauch einer Chance.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "20.Juli:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Orks rücken an allen Fronten weiter vor.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "21.Juli:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Wir bereiten den Rückzug vor. Wir sind glücklos.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "22.Juli:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Es ist zu spät, sie kommen.");
					Doc_Show		( nDocID );
		};		
	
//--------- Kriegsbericht Nr.2 ---------------
INSTANCE KriegsBericht2(C_Item)
	{	
	name 					=	"Kriegsbericht (Sicht eines Orks)";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseKriegsBericht2;
	
	description			= "Kriegsbericht (Sicht eines Orks)";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseKriegsBericht2()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Kriegsbericht"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Diese Menschen... Ein leichter Hieb auf den Schädel und ihr Kopf zersplittert. War das ein Spaß! -Die Magier unter ihnen, sind schwer zu fassen. - Mein jetziger Auftrag ist hart. Eine Gruppe Magier hält sich in einer Höhle versteckt. Sie zu töten ist schwerer als ich dachte: Die Bastarde haben am Eingang eine magische Barriere erschaffen.");
		
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Aber da sind sie an den falschen geraten. Ich, Rugdush werd´ mich nicht aufhalten lassen. Auch wenn Eragar unser Schamane schwerverletzt ist und uns nicht helfen kann. Ich spüre das der Zauber der Menschlein nicht stark ist!");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Auf Dauer hält er nicht! Aber um sicherzugehen, habe ich Grunk und Pradush losgeschickt und auch Grilg meinen Suchwolf. Sie werden schon einen anderen Eingang in den Berg finden.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Unsere Äxte warten nur darauf, diese jämmerlichen Menschlein niederzumetzeln.");
					Doc_Show		( nDocID );
		};	
	
//--------- Kriegsbericht Nr.3 ---------------
INSTANCE KriegsBericht3(C_Item)
	{	
	name 					=	"Kriegsbericht";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseKriegsBericht3;
	
	description			= "Kriegsbericht";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseKriegsBericht3()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Kriegsbericht"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Kurz nach Sonnenaufgang begann das, womit niemand gerechnet hatte. Ein Orkisches-Ruf Horn erschallte und meine Ordensbrüder und ich schreckten hoch!  Es herrschte allgemeine Verwirrung. Die orkischen Kriegstrommeln ließen die Erde erbeben! Und viele begannen erst jetzt zu begreifen, dass eine Schlacht mit den Orks bevorstand.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Ich hastete mit Legeadon auf den Aussichtsturm. Erst sahen wir nur einzelne Orkkrieger aus den Wäldern kommen. Dann Belagerungstürme, Katapulte, dann Elitekrieger und Schamanen. Die Schlacht begann!  Wir steckten aus der Ferne einige Belagerungswaffen in Brand, - doch als Bruder Cordes duch einen Pfeil zu Boden ging, kam der Befehl in der Abwehr zu bleiben.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Wir heilten einige Schwerverletzte und sprachen Schutzzauber aus. Doch die Orks zersplitterten das Haupttor mit einem Rambock. Sie drangen in den Hof ein und einige von uns schafften es nicht mehr sich rechtzeitig in den Turm zurückzuziehen.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mit unseren Bögen und siedendem Öl konnten wir die Orks etwa eine Stunde lang davon abhalten den Turm zu erstürmen. Doch dann brachen sie ein. Mit unserer letzten Kraft und den wenigen Kämpfern die uns geblieben waren, gelang es uns die Vorhut der Orks zu vernichten. ");
					
					//3.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Tiefe Stille lag über dem Steinturm. Wir waren noch fünfzehn Mann, mehr oder weniger verletzt. Wir alle standen fassungslos auf dem Steinboden der mit Leichen der Orks und Menschen übersäht war. ");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Das war nur eine kleine Vorhut der Orks, da war ich mir sicher. Ein Bote musste ausgeschickt werden, um unseren Orden zu warnen.");
					Doc_Show		( nDocID );
		};	
	
//--------- Liebesgedichte von Slade ---------------
INSTANCE Liebesgedichte(C_Item)
	{	
	name 					=	"Liebesgedichte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseLiebesgedichte;
	
	description			= "Liebesgedichte";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseLiebesgedichte()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Liebesgedichte"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  1, "Die Liebe brennt wie Fieber und verlangt");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Nach dem allein, was heft'ger sie entfacht,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Und nimmt, in wechselnder Begier erkrankt,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Nur Nahrung, die ihr Leiden schlimmer macht.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Der Liebe Arzt verließ mich, der Verstand,");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Im Zorn, weil er vergebens mich berät;");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Und in Verzweiflung hab' ich es erkannt,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Begier ist Tod, die jeden Rat verschmäht.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Unheilbar bin ich, und unheilbar wird");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Der Wahn in mir zu wilder Raserei,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mein Denken ist und Reden toll verwirrt,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Sinnloses Stammeln, nichts als leerer Schrei.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Dich nannt' ich schön, sah dich in lichter Pracht,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Die schwarz wie Hölle, dunkel ist wie Nacht.");
					Doc_Show		( nDocID );
		};	
		
//--------- Gebetsbuch Pyt ---------------
INSTANCE Gebetsbuch(C_Item)
	{	
	name 					=	"Gebetsbuch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseGebetsbuch;
	
	description			= "Gebetsbuch";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseGebetsbuch()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Gebetsbuch"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  1, "Wodins Macht halte mich aufrecht,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Wodins Weisheit, die leite mich:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Wodins Auge schaue für mich,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Wodins Ohr höre für mich,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Wodins Wort spreche für mich,");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Wodins Hand bewahre mich,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Gegen die Fallstricke Lokis,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Gegen die Versuchung des Geistes, des Leibes,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Gegen alle, die mir schaden wollen!");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Wod, segne die Erde, auf der ich jetzt stehe.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Wod, segne den Weg, auf dem ich jetzt gehe.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Wod, segne das Ziel, für das ich jetzt lebe.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Du Ewiger, Du immerdar.");
					Doc_Show		( nDocID );
		};	
		
//--------- Wanderbericht  ---------------
INSTANCE Wanderbericht (C_Item)
	{	
	name 					=	"Wanderbericht";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseWanderbericht;
	
	description			= "Wanderbericht";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseWanderbericht()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wanderbericht"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Heute erreichten wir die erste Brücke. Sie führt über einen Bach. Da wir schon vom Regen durchnässt waren, blieb sie völlig unnütz. Der Weg wurde schließlich zum Pfad. Dann der Wald der immer dichter wurde.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Und plötzlich verloren wir den Fußweg aus den Augen. Wir mussten das Dickicht mit unseren Schwertern freilegen. Es gab nur diesen verborgenen Weg zur Kaskadenschlucht.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Und wir sind ja nicht zum Vergnügen hier. Das Tiwaz-Artefakt werde ich schon finden. Allerdings hoffe ich, dass meine Begleiter und Träger meinen Befehl nicht missachten. Sie dürfen mit nicht folgen, wenn ich das Artefakt ausgrabe.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mein Befehl lautet unwiderruflich, dass niemand außer Baltar und mir von dem Tiwaz-Artefakt wissen darf. Für den Fall der Fälle, ist meine Klinge geschärft.");
					Doc_Show		( nDocID );
		};	
	
//--------- Tagebuch  ---------------
INSTANCE Tagebuch (C_Item)
	{	
	name 					=	"Tagebuch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseTagebuch;
	
	description			= "Tagebuch";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseTagebuch()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Tagebuch"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, "Tag 284");
					Doc_PrintLines	( nDocID,  0, "Seit einigen Tagen irre ich nun durch die Landschaft. Wie konnte ich nur so dumm sein und von Zuhause weglaufen...");
					Doc_PrintLine	( nDocID,  1, "Tag 285");
					Doc_PrintLines	( nDocID,  0, "Seit heute Mittag wütet ein starkes Unwetter. Zum Glück hab ich eine Höhle zum Unterschlupf gefunden. In dieser Gottverdammten Wildnis gibt es keinerlei Anzeichen einer Zivilisation. Meine Vorräte neigen sich dem Ende zu. Sieht so aus als ob ich morgen etwas jagen muss.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "Tag 286");
					Doc_PrintLines	( nDocID,  1, "Das Unwetter ruht noch immer nicht. Auf der Suche nach etwas Essbaren ist mir eine Wolfsfamilie gefolgt. Sie belagern mich nun vor dieser Höhle. Ich habe nichts zu Essen. Vater hilf mir..");
					Doc_PrintLine	( nDocID,  1, "Tag 287");
					Doc_PrintLines	( nDocID,  1, "Ich lebe noch immer! Das Wetter ist wieder besser, doch die Wölfe werden immer hungriger. Einige Fleischwanzen haben sich über die vergammelten Reste meines Proviants hergemacht. Wenigsten etwas zu essen. Mittlerweile sollte allein der Uringestank die Wölfe vom Eindringen in die Höhle hindern.");
					
					//3.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "Tag 288");
					Doc_PrintLines	( nDocID,  1, "Ich habe alle meine Wertsachen in eine Kiste getan. Ich werde die Wölfe jetzt angreifen. Lieber im Kampf sterben als hier zu verhungern. Gott steh mir bei...");
					Doc_Show		( nDocID );
		};	
		
//--------- Runenbuch ---------------
INSTANCE Runenbuch (C_Item)
	{	
	name 					=	"Runenbuch";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseRunenbuch;
	
	description			= "Runenbuch";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseRunenbuch()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Runenbuch"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Nur wer in Not gerät, darf Naudhiz, den alten Zauber sprechen. Dann wird ihm Kraft zuteil, als ständen Götter ihm hilfreich zur Seite. Doch wer ohne Not wähnt, Naudhiz zu gebrauchen, der findet sich wieder Inmitten von Leid, das nicht enden will.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "Sprichst du Tiwaz, wirst du sehen und ergreifen, was hilft dir dein Ziel zu erreichen.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Kein Hindernis auferlegt dir, den Schein hilfreich zu sein. Bist du der Sonne zugewandt, so ist Tiwaz wie dem Seefahrer der günstigste Wind.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Bist du dem Mond verwandt, so nutzt Tiwaz die Menschen ins Nichts zu führen. Dann wirst du Herrscher sein, über jene, die Träume träumen, die längst vernichtet sind.");
					Doc_Show		( nDocID );
		};	
	
// ------ Buch für Geistprüfung -------------
INSTANCE Buch_Geist (C_Item)
	{	
	name 					=	"Der Held Argantael";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseBuch_Geist;
	
	description			= "Der Held Argantael";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseBuch_Geist()
		{   
		BuchGeistGelesen = 2;
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Runenbuch"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "...dennoch wagten sie mutig den Angriff, und da ließ Argantael aus dem Bruch einen dichten Nebel aufsteigen, dass die Grirawyr ihrer Gegner Kleinzahl nicht wahrnahmen, sondern meinten, das gesamte Ordensheer stehe gegen sie,");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  0, "und da die Magier so tapfer und heftig angriffen, so hielten die Grirawyr nicht stand, sondern flohen von allen Seiten nach allen Seiten. Und solange der Kampf währte, vermochte kein Wind den Nebel zu zerteilen.");

					Doc_Show		( nDocID );
		};			

// ---------- Rune des Geistes (bassiert auf ItArRuneControl) ------------------
INSTANCE RuneDesGeistes (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	1200;

	visual				=	"ItAr_Rune_02.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	mag_circle 			=	3;

	description			=	"Rune des Geistes";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SLEEP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

// Beschwörungsrune für Endgegner Geistquest
INSTANCE ItArRuneSummonSkeletons (C_Item)
	{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1250;

	visual				=	"ItAr_Rune_16.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONSKELETON;
	mag_circle 			=	3;

	description			=	"Skelette beschwören";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_STORMFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_STORMFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
	};
		
// --------------- Triramar Amulette ---------------
instance TriramarAmulette (C_ITEM)
	{
	name 					=	"Triramar Amulette";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_AMULET;

	value 					=	500;

	visual 					=	"ItMi_Amulet_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_TriramarAmulette;
	on_unequip				=	UnEquip_TriramarAmulette;

	description		= "Triramar Amulette";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= NAME_Prot_Fire;
	//COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[4]			= "Triramar Amulette";
	////COUNT[4]		= ;
	TEXT[5]			= "Wert:";
	COUNT[5]		= value;
	};

func void Equip_TriramarAmulette()
	{
	};
	
func void UnEquip_TriramarAmulette()
	{
	};
	
// Harpie beschwören (Scrolls und Runen)
INSTANCE ItArRuneHarpie (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1800;

	visual				=	"ItAr_Rune_38.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONHARPIE;
	mag_circle 			= 	3;

	description			=	"Harpien beschwören";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SUMMONHARPIE;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollHarpie (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual				=	"ItAr_Scroll_06.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONHARPIE;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SUMMONHARPIE;

	description			=	"Harpien beschwören";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SUMMONHARPIE;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};	


// Razor beschwören (Scrolls und Runen)
INSTANCE ItArRuneRazor (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1800;

	visual				=	"ItAr_Rune_38.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONRAZOR;
	mag_circle 			= 	3;

	description			=	"Razor beschwören";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SUMMONRAZOR;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollRazor (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual				=	"ItAr_Scroll_06.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONRAZOR;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SUMMONRAZOR;

	description			=	"Razor beschwören";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SUMMONRAZOR;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

// ------ Teleport Runen -------------------
INSTANCE TeleportRune (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_37.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT6;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			= 	"Teleport";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE AnkunftRuneInAkt (C_Item)
	{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Rune_38.3ds";	
	material			=	MAT_STONE;

	scemeName 			= "PAP";
 	on_state[0] 		= TeleportRuneAktivieren;

	description			= 	"Rune";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
	};

INSTANCE AnkunftRune (C_Item)
	{
	name 				=	"Ankunftsrune";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_40.3ds";	
	material			=	MAT_STONE;

	mag_circle 			= 	6;
	description			= 	"Ankunftsrune";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
	};
	
func void TeleportRuneAktivieren()
	{
	PrintScreen	("Du hast die Rune aktiviert!", -1,-1,"font_old_20_white.tga",3);	
	//Npc_RemoveInvItem (hero, AnkunftRuneInAkt);
	CreateInvItem (hero, AnkunftRune);
	};

// --------------- Triramar Amulette ---------------
instance KollsAmulette (C_ITEM)
	{
	name 					=	"Triramar Amulette";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_AMULET;

	value 					=	50;

	visual 					=	"ItMi_Amulet_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_KollsAmulette;
	on_unequip				=	UnEquip_KollsAmulette;

	description		= "Kolls Amulette";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= NAME_Prot_Fire;
	//COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[4]			= "Kolls Amulette";
	////COUNT[4]		= ;
	TEXT[5]			= "Wert:";
	COUNT[5]		= value;
	};

func void Equip_KollsAmulette()
	{
	};
	
func void UnEquip_KollsAmulette()
	{
	};
	
// --------------- Taliasans Überzeugungszauber ---------------
instance TalZauber (C_Item)
	{
	name 					=	"Taliasans Gruß";
	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_08.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	30;
	mag_circle 			= 	6;

	description			=	"Kontrolle";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
	};
	
//---------------------------------------------------------------------
//	Schreiben Schmied
//---------------------------------------------------------------------
INSTANCE Schmied_Schreiben(C_Item)
	{	
	name 				=	"Eine Notiz";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseSchmied_Schreiben;

	description			=	name;
	TEXT[1]				=	"Eine kleine Notiz, die ich beim Schmied";
	TEXT[2]				=	"gefunden habe.";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID UseSchmied_Schreiben()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "169. Tag");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Hallo. Wenn du kommst, um das Zahnrad für die Rampe zu holen, so gehe bitte zum Werksmeister. Ich selbst");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "habe einfach keine Zeit, um dich einzuweisen, Graveyarn will einfach zu viele Schwerter geschmiedet haben.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Albros");
				Doc_Show		(nDocID);
				
	B_LogEntry (GY_PR_1, "Ich soll das Zahnrad beim Werksmeister holen.");
	};
	
// Tagebuch Ardaric


INSTANCE Tagebuch_Ardaric1 (C_Item)
{	
	name 					=	"Ardarics Tagebuch 1";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Ardarics Tagebuch 1 ";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseTagebuch_Ardaric1;
};

	FUNC VOID UseTagebuch_Ardaric1 ()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Ardarics Tagebuch"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "1. Jetzt weiss ich was die Söldner meinten. Geisterstadt hiess es ständig. Geisterstadt. Als wir Parthalan betraten, fanden wir keine Menschenseele. Die Hütten standen leer, waren aber gut erhalten. Sogar die meisten Holztüren hingen noch in ihren Angeln. Die Söldner waren still als sie die Stadt betraten. Berengar und Graveyarn gingen voraus. Beide mit erhobenen Schwertern. Aber weder ein Wolf noch sonst ein Raubtier hielt sich innerhalb der Mauern auf.");
					Doc_PrintLine	( nDocID,  0, "");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "2. Mir ist eine der Baracken zugeteilt worden. Ein schäbiger Raum. Als ich etwas Gerümpel wegschaffte fand ich einen menschlichen Armknochen.");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLines	( nDocID,  1, "3. Berengar hat jetzt die Turmfestung bezogen. Seine persönliche Garde und der Magier Maldive leben dort. Niemand darf ohne seine Erlaubnis die Festung betreten. Oben auf dem Turm stehen Tag und Nacht Wachen. Es ist beruhigend sie dort oben zu wissen.");
					Doc_Show		( nDocID );
	};					
INSTANCE Tagebuch_Ardaric2 (C_Item)
{	
	name 					=	"Ardarics Tagebuch 2";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Ardarics Tagebuch 2 ";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseTagebuch_Ardaric2;
};

	FUNC VOID UseTagebuch_Ardaric2 ()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					  Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Ardarics Tagebuch 2"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "4. Bislang darf ich die Stadt nicht verlassen. Oben vom Wehrgang, konnte ich ins Tal sehen. Dort scheint es einen Bauernhof zu geben. Was zum Teufel machen Bauern in Etain? Vielleicht kann ich Alwin begleiten, wenn er dort etwas zu tun hat. Dann finde ich mehr heraus.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "5. Bei ihrer Rückkehr von einem Jagdeinsatz, kamen nur drei von den sieben Jägern lebend zurück. Einer verblutete wenige Schritte hinter dem Eingangstor.");
					
					//2.Seite
					Doc_SetMargins	( nDocID,  1,  30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "6. Benchol hat mir eine Flasche Wein geschenkt. Dann aber die Hälfte davon selbst ausgetrunken.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "7. In der Mitte der Stadt ist ein rätselhaftes Bauwerk. Die Magier sind dort eingezogen. Der Eingang ist mit einer Barriere versperrt. Wenn ich nur wüsste wie man diese unsichtbare Wand passieren kann!");
					Doc_Show		( nDocID );
							
	};
	
INSTANCE Tagebuch_Ardaric3 (C_Item)
{	
	name 					=	"Ardarics Tagebuch 3";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Ardarics Tagebuch 3";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseTagebuch_Ardaric3;
};

	FUNC VOID UseTagebuch_Ardaric3 ()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Ardarics Tagebuch 3"			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "8. Ich warte immer noch darauf, dass Berengar mich zu sich ruft!");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "9. Heute Nacht war helle Aufregung. Hammond hatte eine Kochstelle nicht vollständig gelöscht und ein Funkenflug lies die angrenzende Hütte in Flammen aufgehen. Die Söldner lachten sich erst einen, bis Graveyarn auftauchte und plötzlich bemühte sich jede Hand eifrig darum das Feuer zu löschen.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "10. Komisch, manchmal merke ich wenn jemand in meiner Nähe zaubert. Auch dann wenn ich es weder hören noch sehen kann.");
		
				
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "11. Benchol ist heute zusammengeschlagen worden. Er lag fast eine Stunde am Boden, bevor er sich aufraffte und sich in eine Kaschemme schleppte.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "12. Ich bin gerade zurück. Es ist noch Nacht. Erst bin ich leise aus meiner Hütte raus. Dann hieß es warten bis die Nachtwache endlich verschwindet. Aber schließlich hab ich es geschafft und war in Sichtweite der Turmfestung. Die Fenster waren erleuchtet. Viel konnte ich leider nicht sehen. Ein paar Schatten. Doch einmal sah ich wie Blitze einen der Turmräume erhellten. Aber ein Geräusch hörte ich nicht. Seltsam.");
					Doc_Show		( nDocID );
	};
					
					
INSTANCE Tagebuch_Ardaric4 (C_Item)
{	
	name 					=	"Ardarics Tagebuch 4";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Ardarics Tagebuch 4";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseTagebuch_Ardaric4;
};

	FUNC VOID UseTagebuch_Ardaric4()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Ardarics Tagebuch 4"			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");						
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "13. Ich war heute an der Mine. Fast hätte ich durch eine ungeschickte Bewegung mir meine Hand an einer Spitzhacke aufgespiesst. Zudem ist es hart dort zu arbeiten. Wann wird Berengar mich endlich mit einer ernstzunehmenden Aufgabe betrauen?");
				
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "14. Heute Nacht erwachte ich von einem seltsamen kehligen Schnarren. Es waren keine Tierlaute, soviel steht fest. Für mich klang es wie ein Ork. Aber dies war ja unmöglich. Ich lag still und horchte. Wahrscheinlich hatte ich nur geträumt.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );
	};
//***********************************************************************************************************************
//*				      Items für Dic  -   Harri								*		
//***********************************************************************************************************************



//	Zutatenliste für Hamonds Zurückverwandlungstrank
//---------------------------------------------------------------------
INSTANCE Ha_list(C_Item)
	{	
	name 				=	"Taliasans Zutatenliste";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseHammondlist;

	description			=	name;
	TEXT[1]				=	"Die Zutatenliste der Ingredienzien.";
	TEXT[2]				=	"die Taliasan braucht um";
	TEXT[3]				=	"Hamond wieder zurückzuverwandeln.";
	TEXT[4]				=	"";
	};

FUNC VOID UseHammondlist()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Zutatenliste");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "5 Höllenpilze");
				Doc_PrintLine	(nDocID,  0, "1 Bergmoos");
				Doc_PrintLine	(nDocID,  0, "1 Grabmoos");
				Doc_PrintLine	(nDocID,  0, "2 Steinwurzeln");
				Doc_PrintLine	(nDocID,  0, "1 Flammenzunge eines Feuerwarans");
				Doc_PrintLine	(nDocID,  0, "2 Stacheln einer Blutfliege");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "und vergiss nicht die 3 Reisschnaps!");
				Doc_PrintLine	(nDocID,  0, "Ohne die kann ich mich nicht konzentrieren.");
				Doc_Show		(nDocID);
	};
/******************************************************************************************/
// Verwandlungstrank für Hamond

INSTANCE Heil_Hamond(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	100;	

	visual 			=	"Heil_Hamond.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Kipp_auf_Hamond;
	scemeName		=	"AUSKIPP";

	description			= 	"Trank für Hamond";
	TEXT[1]				=	"Soll Hamond.";
	TEXT[2]				=	"zurückverwandeln";
	TEXT[3]				=	"";
	TEXT[4]				=	"einfach draufkippen.";
	};

	FUNC VOID Kipp_auf_Hamond()
	{
		PrintScreen	("Nun bin ich ja gespannt", -1,7,"FONT_OLD_20_WHITE.TGA",3);
		
	if (Npc_GetDistToNpc(Soeldnerwanze,hero)>200)
		{
		PrintScreen	("Das war wohn nix und der Tarnk ist verbraucht", -1,-1,"font_old_20_white.tga",3);
		B_LogEntry		(WANZENQUEST, "Ups, ich war wohl nicht nah genug über der Wanze. Hamond wird nun ewig als Wanze rumlaufen.");
		Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);
		Hamond_Wanze = 5;
		}
	else
		{
		Wld_SendTrigger ("TL_HA");
		};
	};

/******************************************************************************************/
// ------ Ermöglicht teleport zum MP01 -----------------

	INSTANCE  Amulett_Leo(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"Amulett_Leo.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Leo;
	on_unequip		=	UnEquip_Amulett_Leo;

	description		= "Amulett Leo";
	//TEXT[0]		= "";
	//TEXT[1]		= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]		= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Leo()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		PrintScreen	("Stärke +5", -1,-1,"font_old_20_white.tga",3);
		
	};

	FUNC VOID UnEquip_Amulett_Leo()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
		PrintScreen	("Stärke -5", -1,-1,"font_old_20_white.tga",3);
	};

/******************************************************************************************/
// ------ Ermöglicht teleport zum MP02 -----------------

	INSTANCE  Amulett_Capricorn(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"Amulett_Capricorn.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Capricorn;
	on_unequip		=	UnEquip_Amulett_Capricorn;

	description		= "Amulett Capricorn";
	//TEXT[0]		= "";
	//TEXT[1]		= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]		= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Capricorn()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 5;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 5;
		PrintScreen	("Mana +5", -1,-1,"font_old_20_white.tga",3);
		
	};

	FUNC VOID UnEquip_Amulett_Capricorn()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 5;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 5;
		PrintScreen	("Mana -5", -1,-1,"font_old_20_white.tga",3);
	};

/******************************************************************************************/
// ------ Ermöglicht teleport zum MP03 -----------------

	INSTANCE  Amulett_Gemini(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"Amulett_Gemini.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Gemini;
	on_unequip		=	UnEquip_Amulett_Gemini;

	description		= "Amulett Gemini";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]		= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Gemini()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 10;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 10;
		PrintScreen	("Lebensenergie +10", -1,-1,"font_old_20_white.tga",3);
		
	};

	FUNC VOID UnEquip_Amulett_Gemini()
	{
		self.attribute [ATR_HITPOINTS_MAX] = self.attribute [ATR_HITPOINTS_MAX] -10;
		if (self.attribute[ATR_HITPOINTS] > 11)
		{
		self.attribute [ATR_HITPOINTS] = self.attribute [ATR_HITPOINTS] -10;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
		PrintScreen	("Lebensenergie -10", -1,-1,"font_old_20_white.tga",3);
	};

/******************************************************************************************/
// ------ Ermöglicht teleport zum MP04 -----------------

	INSTANCE  Amulett_Tarus(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"Amulett_Tarus.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Tarus;
	on_unequip		=	UnEquip_Amulett_Tarus;

	description		= "Amulett Tarus";
	//TEXT[0]		= "";
	//TEXT[1]		= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]		= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Tarus()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		PrintScreen	("Geschick +5", -1,-1,"font_old_20_white.tga",3);
		
	};

	FUNC VOID UnEquip_Amulett_Tarus()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
		PrintScreen	("Geschick -5", -1,-1,"font_old_20_white.tga",3);
	};

/******************************************************************************************/
// ------ Ermöglicht teleport zum MP05 -----------------

	INSTANCE  Amulett_Pisces(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"Amulett_Pisces.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Pisces;
	on_unequip		=	UnEquip_Amulett_Pisces;

	description		= "Amulett Pisces";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Magic;
	COUNT[3]		= 5;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Pisces()
	{
		self.protection [PROT_MAGIC] += 5;
		self.protection [PROT_FIRE]  += 5;
		PrintScreen	("Magieschutz +5", -1,9,"font_old_20_white.tga",3);
		PrintScreen	("Feuerschutz +5", -1,11,"font_old_20_white.tga",3);
		
	};

	FUNC VOID UnEquip_Amulett_Pisces()
	{
		self.protection [PROT_MAGIC] -= 5;
		self.protection [PROT_FIRE]  -= 5;
		PrintScreen	("Magieschutz -5", -1,9,"font_old_20_white.tga",3);
		PrintScreen	("Feuerschutz -5", -1,11,"font_old_20_white.tga",3);
	};

/******************************************************************************************/
// ------ Ermöglicht teleport zum MP06 -----------------

	INSTANCE  Amulett_Aquarius(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"Amulett_Aquarius.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Aquarius;
	on_unequip		=	UnEquip_Amulett_Aquarius;

	description		= "Amulett Aquarius";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 7;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 7;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Aquarius()
	{
		self.protection [PROT_EDGE]   += 7;
		self.protection [PROT_BLUNT]  += 7;
		self.protection [PROT_POINT]  += 7;
		PrintScreen	("Waffenschutz +7", -1,-1,"font_old_20_white.tga",3);
		
	};

	FUNC VOID UnEquip_Amulett_Aquarius()
	{
		self.protection [PROT_EDGE]   -= 7;
		self.protection [PROT_BLUNT]  -= 7;
		self.protection [PROT_POINT]  -= 7;
		PrintScreen	("Waffenschutz -7", -1,-1,"font_old_20_white.tga",3);
	};
	
	
//Edit HornOx
//---------------------------------------------------------
INSTANCE ItMi_Rake (C_Item)
{
	name 				=	"Harke";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"HACKE.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"RAKE";
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
//Edit HornOx End

// -------------------------- Bauernkleid 4 --------------

INSTANCE Bau_Kleid4(C_Item)
	{
	name 					=	"Bauernkleid 4";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	5;
	wear 					=	WEAR_TORSO;

	value 					=	150;

	visual 					=	"BAU_KLEID4.3DS";
	visual_change 				=	"HUM_BAUERNKLEID4.ASC";
	visual_skin 				=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 30;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;

	on_equip		=	Equip_Bau_Kleid4;
	on_unequip		=	UnEquip_Bau_Kleid4;
	};

FUNC VOID Equip_Bau_Kleid4()
	{
	if (hero.attribute[ATR_STRENGTH] > 30)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 30;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 30 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_Bau_Kleid4()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 30;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

// -------------------------- Bauernkleid 2 --------------

INSTANCE Bau_Kleid2(C_Item)
	{
	name 					=	"Bauernkleid 2";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	5;
	wear 					=	WEAR_TORSO;

	value 					=	150;

	visual 					=	"BAU_KLEID2.3DS";
	visual_change 				=	"HUM_BAUERNKLEID2.ASC";
	visual_skin 				=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 30;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;

	on_equip		=	Equip_Bau_Kleid2;
	on_unequip		=	UnEquip_Bau_Kleid2;
	};

FUNC VOID Equip_Bau_Kleid2()
	{
	if (hero.attribute[ATR_STRENGTH] > 30)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 30;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 30 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_Bau_Kleid2()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 30;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
	
//------------------------ Zum Durchgehen der Barriere zu den 12 Mag. ------------------

	INSTANCE  Schutzamulett_Barriere (C_ITEM)
{
	name 			=	"Schutzamulett Barriere";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Barriere;
	on_unequip		=	UnEquip_Schutzamulett_Barriere;

	description		= "Amulett der Barriere";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 15;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Barriere()
	{
		self.protection [PROT_MAGIC] += 15;
		Durch_Barriere = Durch_Barriere | 1;
	};

	FUNC VOID UnEquip_Schutzamulett_Barriere()
	{
		self.protection [PROT_MAGIC] -= 15;
		Durch_Barriere = Durch_Barriere & 6;
	};

// -------------------------- Ardaric Rüstung 1 --------------

INSTANCE Ardaric_Amor1 (C_Item)
	{
	name 					=	"Ardaric's Klamotten";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	8;
	protection [PROT_BLUNT] = 	5;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	3;
	protection [PROT_MAGIC] = 	2;
	wear 					=	WEAR_TORSO;

	value 					=	100;
	owner					=   hero;
	
	visual 					=	"ITAR_ARDARIC.3DS";
	visual_change 				=	"HUM_ARDARIC_ARMOR.ASC";
	visual_skin 				=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 4;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;

	on_equip		=	Equip_Ardaric_Amor1;
	on_unequip		=	UnEquip_Ardaric_Amor1;
	};

FUNC VOID Equip_Ardaric_Amor1()
	{
	if (hero.attribute[ATR_STRENGTH] > 4)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 4;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		};
	};

	FUNC VOID UnEquip_Ardaric_Amor1()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 4;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
	

// -------------------------- Gebetsbuch --------------


INSTANCE ItWr_Book_Gebet_01(C_Item)
{	
	name 		= "Gebetsbuch";
	mainflag 	= ITEM_KAT_DOCS;
	flags 		= 0;
	value 		= 0;
	visual 		= "ItWr_Book_02_03.3ds";
	material 	= MAT_LEATHER;
	scemeName	= "MAP";	
	description	= "Pyts Gebetsbuch";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
	on_state[0]	= UseItWr_Book_Gebet_01;
};

FUNC VOID UseItWr_Book_Gebet_01()
{   
	var int nDocID;
	nDocID = 	Doc_Create		()			  ;								// DocManager 
	Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
	//1.Seite
	Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLine	( nDocID,  0, "Caylins Macht halte mich aufrecht,");
	Doc_PrintLine	( nDocID,  0, "Caylins Weisheit, die leite mich:");
	Doc_PrintLine	( nDocID,  0, "Caylins Auge schaue für mich,");
	Doc_PrintLine	( nDocID,  0, "Caylins Ohr höre für mich,");
	Doc_PrintLine	( nDocID,  0, "Caylins Wort spreche für mich,");
	Doc_PrintLine	( nDocID,  0, "Caylins Hand bewahre mich,");
	//2.Seite
	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  0, "Gegen die Fallstricke Yelards,");
	Doc_PrintLine	( nDocID,  0, "Gegen die Versuchung des Geistes, des Leibes,");
	Doc_PrintLine	( nDocID,  0, "Gegen alle, die mir schaden wollen!");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLine	( nDocID,  0, "Ocied, segne die Erde, auf der ich jetzt stehe.");
	Doc_PrintLine	( nDocID,  0, "Ocied, segne den Weg, auf dem ich jetzt gehe.");
	Doc_PrintLine	( nDocID,  0, "Ocied, segne das Ziel, für das ich jetzt lebe.");
	Doc_PrintLine	( nDocID,  0, "Du Ewiger, Du immerdar.");
	Doc_Show	( nDocID );
};

// -------------- Pfeilsack klein ----------------
INSTANCE Pfeilsack_klein(C_Item)
	{	
	name 				=	"kleiner Pfeilsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual	 			=	"Pfeilsack.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_kPfeilsack;
	scemeName			=	"PAP";

	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Pfeile";	COUNT[2]	= 25;
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 25;
	};

	FUNC VOID Use_kPfeilsack()
	{
		CreateInvItems(self,ItAmArrow,25);
		PrintScreen	("25 Pfeile entnommen", -1,30,"font_old_20_white.tga",4);
	};

// -------------- Pfeilsack mittel ----------------
INSTANCE Pfeilsack_mittel(C_Item)
	{	
	name 				=	"mittlerer Pfeilsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual	 			=	"Pfeilsack.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_mPfeilsack;
	scemeName			=	"PAP";

	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Pfeile";	COUNT[2]	= 50;
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 50;
	
	};
	FUNC VOID Use_mPfeilsack()
	{
		CreateInvItems(self,ItAmArrow,50);
		PrintScreen	("50 Pfeile entnommen", -1,30,"font_old_20_white.tga",4);
	};

// -------------- Pfeilsack groß ----------------
INSTANCE Pfeilsack_groß(C_Item)
	{	
	name 				=	"großer Pfeilsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual	 			=	"Pfeilsack.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_gPfeilsack;
	scemeName			=	"PAP";

	description			= 	name;

	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Pfeile";	COUNT[2]	= 100;
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 100;
	};

	FUNC VOID Use_gPfeilsack()
	{
		CreateInvItems(self,ItAmArrow,100);
		PrintScreen	("100 Pfeile entnommen", -1,30,"font_old_20_white.tga",4);
	};

// ---------- Tagebuch Moriarty ---------------
INSTANCE Tagebuch_Moriarty(C_Item)
	{	
	name 					=	"Tagebuch Moriarty";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	25;

	visual 					=	"itwr_book_02_05.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]			= UseTagebuchMoriarty;
	
	description			= "Tagebuch Moriarty";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseTagebuchMoriarty()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_BROWN_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "BOOK_BROWN_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Tagebuch"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Tag 21:    Auch wenn ich jede dieser Ratten erschlagen muss, die mich noch vor 3 Wochen das Fürchten lehrten. Meine Rückkehr zur Scheune ist unvermeidlich! Es gibt keinen anderen Ausgang!");
					Doc_PrintLines	( nDocID,  0, "Eine Waffe ist mittlerweile mein Eigen geworden. Mit ihr sollte ich mich der scharfen Krallen der Nager erwehren können. ");
					Doc_PrintLines	( nDocID,  0, "Aber selbst die beste Waffe hilft nicht, den richtigen Weg zu finden.");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Tag 22:    Schon ganz andere Probleme habe ich gemeistert, schon ganz andere Gegner besiegt. ");
					Doc_PrintLines	( nDocID,  0, "Und vor dieser Epoche düstrer Barbarei werde ich nicht Kleinbei geben!");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Tag 23:    Ein Buschwerk in dem ich mich verstecken konnte, hat mich gerettet. ");
					Doc_PrintLines	( nDocID,  1, "Diese patrouillierenden schwerbewaffneten Kriegertrupps  tauchen manchmal so unvermittelt auf, das es mir schwer fällt unentdeckt zu bleiben. ");
					Doc_PrintLines	( nDocID,  1, "Besser ich verlasse mich auf meinen Instinkt und richte weiterhin kein einziges Wort an sie!");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Tag 24:    All meine Forschungsarbeit bleibt ergebnislos. ");
					Doc_PrintLines	( nDocID,  1, "Ich finde keine Belege, keine Spuren, nichts was mich beweisen läßt das Trug und Schein die Grundlage dieser Welt bilden.");

					Doc_Show		( nDocID );
		};	
	
// -------------- Komunikator ----------------
INSTANCE Komunikator(C_Item)
	{	
	name 				=	"Goldbrosche";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual	 			=	"Komunikator.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Komunikator;
	scemeName			=	"PAP";

	description			= 	name;

	TEXT[0]				= 	"Es scheint mehr als nur Schmuck zu sein";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Man muß es irgendwie oder irgendwo benutzen können";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	"Wert                                   unbezahlbar";
	};

	FUNC VOID Use_Komunikator()
	{
		if (Npc_GetDistToWP(hero,"BHOF1_00") < 350)		// war doch etwas zu wenig
		{
			PrintScreen	("alterieren", -1,-1,"font_old_20_white.tga",4);
			Wld_SendTrigger ("KONSOLE");
		}
		else if(Npc_GetDistToWP(hero,"BHOF1_00") < 700)
		{
			PrintScreen	("Nix? Aber in der Scheune muß es doch irgendwo irgendwas Aktivieren?!.", -1,-1,"font_old_20_white.tga",4);
		}
		else if(Npc_GetDistToWP(hero,"BHOF1_00") >= 700)
		{
			PrintScreen	("Hmm? Scheint der falsche Ort zu sein.", -1,30,"font_old_20_white.tga",4);
		};
		CreateInvItem (self,Komunikator);
	};
	
// -------------- Angar's Schlüssel ----------------	
	
INSTANCE ItKeKey_A (C_Item)
{
	name 				=	"Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

// -------------- Min-Schlüssel ----------------	
	
INSTANCE ItKeKey_Mine (C_Item)
{
	name 				=	"Schlüssel Mine";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

// -------------- Lehrbuch Flammenzunge ----------------	

INSTANCE Buch_FWaran (C_Item)
	{	
	name 				= "Die Feuerwarane";
	
	mainflag 			= ITEM_KAT_DOCS;
	flags 				= 0;

	value 				= 500;

	visual 				= "itwr_book_02_05.3DS";
	material 			= MAT_LEATHER;

	scemeName			= "MAP";	
	on_state[0]			= UseBuchFWaran;
	
	description			= name;
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	};

	FUNC VOID UseBuchFWaran ()
		{   
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_BROWN_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "BOOK_BROWN_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
//  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
  					Doc_SetMargins	( nDocID,  0,  260, 15, 15, 10, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Die Feuerwarane"			);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Mir sind nur vier Menschen bekannt, die einen Fuß auf die Vulkaninseln gesetzt haben: Die Inseln, die die Heimat der Feuerwarane sind. Die Ufer sind aus kantigem, messerscharfen Gestein. Doch meistens liegt eine Ascheschicht auf den Felszacken, die dann so stumpf wirken, als könnte man mit seinen Stiefelsohlen darauf spazieren gehen. Doch wer diesen Weg einschlägt, geht nicht mehr als einen Schritt. ");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Wenn es aber jemandem gelingt zu einem Feuerwaran zu gelangen und ihn abseits seiner Artgenossen zu erlegen, dann sollte man wissen wie man die kostbare, gespaltene Zunge heraustrennt. ");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 15, 20, 260, 15, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Beim Aufsperren des Maules helfen die stumpfen Zahnreihen des Warans Griff zu finden. Dann schneidet man mit einem kurzklingigem Messer längsseitig, neben der Zunge in den Unterkiefer des Warans zwei Furchen. Die Muskeln die dabei durchtrennt werden, sind mit dem Zungenmuskel verbunden, durchschnitten erleichtern sie den letzten Handgriff. Die Zunge packt man mit der Linken mittig, tastet mit der Messerspitze bis zum Beginn des Rachenraumes und trennt dann die Zunge ab.");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Ratsam ist es darauf  zu achten, das die Hände dabei pulvertrocken sind. Schweiß und der Mundschleim eines Warans verbinden sich zu einem, für die Haut ätzend wirkenden Gemisch.");
	

					Doc_Show		( nDocID );
			
			if Knows_GetFlammenzunge == False
			{
				Knows_GetFlammenzunge = True;
				PrintScreen	("lerne Flammenzunge entnehmen", -1,18,"font_old_20_white.tga",3);
			};
				
					
					
		};	
/******************************************************************************************/
// Alte Schattenkluft für Moriarty

INSTANCE STT_ARMOR_O(C_Item)
{
	name 			=	"alte Schattenkluft";

	mainflag 		=	ITEM_KAT_ARMOR;
	flags 			=	0;

	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 			=	VALUE_STT_ARMOR_M;

	wear 			=	WEAR_TORSO;

	visual 			=	"sttm.3ds";
	visual_change 		=	"Hum_STTM_ARMOR.asc";
	visual_skin 		=	1;
	material 		=	MAT_LEATHER;

	description		=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 25;
	TEXT[1]			=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 		=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]			=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]			=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_STT_ARMOR_O;
	on_unequip		=	UnEquip_STT_ARMOR_O;
	};

FUNC VOID Equip_STT_ARMOR_O()
	{
	if (hero.attribute[ATR_STRENGTH] > 25)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 25;
		var C_Item Waffe;
		Waffe = Npc_GetEquippedMeleeWeapon (hero);
		if (Waffe.cond_value[2] > hero.attribute[ATR_STRENGTH])
			{
			PrintScreen		(Waffe.name, -1, 20, _STR_FONT_ONSCREEN, 3 );
			PrintScreen		("abgelegt.", -1, 25, _STR_FONT_ONSCREEN, 3 );
			AI_EquipBestMeleeWeapon (hero);
			};
		}
	else
		{
		var int TempKraft;
		TempKraft = 25 - hero.attribute[ATR_STRENGTH];
		var string Fehlkraft;
		Fehlkraft = IntToString (TempKraft);
		RuestungsVerlust = 1;
		AI_UnequipArmor (hero);
		PrintScreen		("Für diese Rüstung fehlen dir ", 30, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(Fehlkraft, 50, 30, _STR_FONT_ONSCREEN, 3 );
		PrintScreen		(" Stärkepunkte.", 53, 30, _STR_FONT_ONSCREEN, 3 );
		AI_EquipArmor	(hero, Ardaric_Amor1 );
		};
	};

	FUNC VOID UnEquip_STT_ARMOR_O()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 25;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

// --------------Schlüssel Truhe Reisfeld ----------------	
	
INSTANCE ItKeKey_Reis (C_Item)
{
	name 				=	"Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/
// Reispflanze

INSTANCE ItFo_Plants_Reis (C_Item)
{	
	name 				=	"Reispflanze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	1;

	visual 				=	"Itpl_Swampherb.3ds";		
	material 			=	MAT_WOOD;
	on_state[0]			= UseReispflanze;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 1;
	TEXT[2]				= NAME_Bonus_Mana;				COUNT[2]	= 1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 1;
};

		func void UseReispflanze ()
		{			
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	1);
			Npc_ChangeAttribute	(self,	ATR_MANA,	1);
			PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Reispflanze");
		};

/******************************************************************************************/
//	Notitz für Esteregg - wiel keine story :( 
/******************************************************************************************/
INSTANCE Notiz_Startek (C_Item)
	{	
	name 				=	"Notiz";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseNotizStartek;

	description			=	name;
	TEXT[1]				=	"Notiz.";
	TEXT[2]				=	"";
	TEXT[3]				=	"auf Holodeck";
	TEXT[4]				=	"";
	};

FUNC VOID UseNotizStartek ()
	{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Notiz vom Modteam");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Leider ist hier nix los. Wir sind einfach zeitmäßig nicht dazu gekommen hier ne kleine Story einzubinden. Aber vielleicht oder bestimmt machen wir das im 2. Teil. Suche den Turboschacht - das ist der Ausgang.");

				Doc_Show		(nDocID);
	};
/******************************************************************************************/

// -------------- Schlüssel Baumhaus----------------	
	
INSTANCE ItKeKey_BH (C_Item)
{
	name 				=	"Schlüssel Baumhaus";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

// -------------- Schlüssel Truhe PTPD unten ----------------	
	
INSTANCE ItKeKey_PTPT (C_Item)
{
	name 				=	"Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};