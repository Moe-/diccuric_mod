// ---------------- Rezepte Manatränke --------------------
// ------ Kleiner Manatrank -------
INSTANCE Kl_Mana_Rezept(C_Item)
	{	
	name 				=	"Rezept: Essenz magischer Energie";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Kl_Mana_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Essenz magischer Energie";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Kl_Mana_Re()
	{   
	ManaBrauen = ManaBrauen | 1;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Essenz magischer Energie");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Eine Essenz magischer Energie ist relativ einfach herzustellen. Man nimmt dazu ein Rabenkraut und erhitzt es in einer Laborflasche.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Nach dem Abkühlen ist der Trank fertig.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Essenz magischer Energie");	
	};
	
// ------ Mittlerer Manatrank -------
INSTANCE Mi_Mana_Rezept(C_Item)
	{	
	name 				=	"Rezept: Extrakt magischer Energie";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Mi_Mana_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Extrakt magischer Energie";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Mi_Mana_Re()
	{   
	ManaBrauen = ManaBrauen | 2;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Extrakt magischer Energie");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Extrakt magischer Energie kann durch das Zerdrücken eines Dunkelkrauts in einer Laborflasche hergestellt werden.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Extrakt magischer Energie");	
	};
	
// ------ Großer Manatrank -------
INSTANCE Gr_Mana_Rezept(C_Item)
	{	
	name 				=	"Rezept: Elixier magischer Energie";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Gr_Mana_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Elixier magischer Energie";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Gr_Mana_Re()
	{   
	ManaBrauen = ManaBrauen | 4;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Elixier magischer Energie");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Eine Elixier magischer Energie ensteht, wenn man eine Steinwurzel in einer Laborflasche erhitzt.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Nach dem Abkühlen ist der Trank fertig.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Elixier magischer Energie");	
	};
	
// ------ Permanenter Manatrank -------
INSTANCE Perm_Mana_Rezept(C_Item)
	{	
	name 				=	"Rezept: Extrakt des Geistes";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Perm_Mana_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Extrakt des Geistes";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Perm_Mana_Re()
	{   
	ManaBrauen = ManaBrauen | 8;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Extrakt des Geistes");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Extrakt des Geistes ist einfach herzustellen, sobald man die Zutaten gefunden hat. Man zerdrückt dazu eine Trollkirsche mit 2 Drachenwurzeln und erhitzt das Ganze.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Nach dem Abkühlen ist der Trank fertig.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Extrakt des Geistes");	
	};
	
// ------ Kleiner Heiltrank -------
INSTANCE Kl_HP_Rezept(C_Item)
	{	
	name 				=	"Rezept: Essenz heilender Kraft";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Kl_HP_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Essenz heilender Kraft";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Kl_HP_Re()
	{   
	HPBrauen = HPBrauen | 1;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Essenz heilender Kraft");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Eine Essenz heilender Kraft wird aus einem schwachen Heilkraut in einer Laborflasche durch zerdrücken hergestellt.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Essenz heilender Kraft");
	};
	
// ------ Mittlerer Heiltrank -------
INSTANCE Mi_HP_Rezept(C_Item)
	{	
	name 				=	"Rezept: Extrakt heilender Kraft";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Mi_HP_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Extrakt heilender Kraft";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Mi_HP_Re()
	{   
	HPBrauen = HPBrauen | 2;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Extrakt heilender Kraft");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Extrakt heilender Kraft wird aus einem normalen Heilkraut in einer Laborflasche durch zerdrücken hergestellt.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Extrakt heilender Kraft");
	};
	
// ------ Großer Heiltrank -------
INSTANCE Gr_HP_Rezept(C_Item)
	{	
	name 				=	"Rezept: Elixier heilender Kraft";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Gr_HP_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Elixier heilender Kraft";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Gr_HP_Re()
	{   
	HPBrauen = HPBrauen | 4;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Elixier heilender Kraft");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Elixier heilender Kraft wird aus einem starken Heilkraut in einer Laborflasche durch zerdrücken hergestellt.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Elixier heilender Kraft");
	};
	
// ------ Permanenter HPtrank -------
INSTANCE Perm_HP_Rezept(C_Item)
	{	
	name 				=	"Rezept: Extrakt des Lebens";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Perm_HP_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Extrakt des Lebens";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Perm_HP_Re()
	{   
	HPBrauen = HPBrauen | 8;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Extrakt des Lebens");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Extrakt des Lebens stellt man her, indem man 2 Eichenblätter zusammen mit einer Trollkirsche erhitzt.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Nach dem Abkühlen ist der Trank fertig.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Extrakt des Lebens");
	};
	
// Stärke I
INSTANCE Mi_Staerke_Rezept(C_Item)
	{	
	name 				=	"Rezept: Extrakt der Stärke";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Mi_Staerke_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Extrakt der Stärke";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Mi_Staerke_Re()
	{   
	SonstigesBrauen = SonstigesBrauen | 1;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Extrakt der Stärke");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Extrakt der Stärke wird aus einem Reisschnapps, 5 Slavenbrot, 5 Höllenpilzen und 1 Trollkirsche gekocht.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Extrakt der Stärke");
	};

// Stärke II
INSTANCE Gr_Staerke_Rezept(C_Item)
	{	
	name 				=	"Rezept: Elixier der Stärke";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Gr_Staerke_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Elixier der Stärke";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Gr_Staerke_Re()
	{   
	SonstigesBrauen = SonstigesBrauen | 2;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Elixier der Stärke");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Elixier der Stärke wird aus einem Reisschnapps, 5 Seraphis, 5 Velayis und 1 Trollkirsche gekocht.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Elixier der Stärke");
	};
	
// Geschick I
INSTANCE Mi_Geschick_Rezept(C_Item)
	{	
	name 				=	"Rezept: Extrakt der Geschicklichkeit";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Mi_Geschick_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Extrakt der Geschicklichkeit";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Mi_Geschick_Re()
	{   
	SonstigesBrauen = SonstigesBrauen | 4;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Extrakt der Geschicklichkeit");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Extrakt der Geschicklichkeit wird aus einem Reisschnapps, 5 Bergmoos, 5 Grabmoos und 1 Trollkirsche gekocht.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Extrakt der Geschicklichkeit");
	};
	
// Geschick II
INSTANCE Gr_Geschick_Rezept(C_Item)
	{	
	name 				=	"Rezept: Elixier der Geschicklichkeit";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Gr_Geschick_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Elixier der Geschicklichkeit";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Gr_Geschick_Re()
	{   
	SonstigesBrauen = SonstigesBrauen | 8;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Elixier der Geschicklichkeit");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Elixier der Geschicklichkeit wird aus einem Reisschnapps, 5 Nachtschatten, 5 Mondschatten und 1 Trollkirsche gekocht.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Elixier der Geschicklichkeit");
	};

// ------ Kleiner Speedtrank -------
INSTANCE Kl_Speed_Rezept(C_Item)
	{	
	name 				=	"Rezept: Trank der Geschwindigkeit";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Kl_Speed_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Trank der Geschwindigkeit";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Kl_Speed_Re()
	{   
	TempBrauen = TempBrauen | 1;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Trank der Geschwindigkeit");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Trank der Geschwindigkeit ist relativ einfach herzustellen. Man nimmt dazu drei Orkblätter und zerstampft sie in einer Laborflasche.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Trank der Geschwindigkeit");
	};
	
// ------ Mittlerer Speedtrank -------
INSTANCE Mi_Speed_Rezept(C_Item)
	{	
	name 				=	"Rezept: Trank der Schnelligkeit";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Mi_Speed_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Trank der Schnelligkeit";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Mi_Speed_Re()
	{   
	TempBrauen = TempBrauen | 2;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Trank der Schnelligkeit");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Trank der Schnelligkeit ist relativ einfach herzustellen. Man nimmt dazu fünf Orkblätter und zerstampft sie in einer Laborflasche.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Trank der Schnelligkeit");
	};
	
// ------ Großer Manatrank -------
INSTANCE Gr_Speed_Rezept(C_Item)
	{	
	name 				=	"Rezept: Trank der Eile";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";
	material			=	MAT_STONE;

	scemeName			=	"MAP";	
	on_state[0]			=	Use_Gr_Speed_Re;

	description			=	name;
	TEXT[1]				=	"Rezept: Trank der Eile";
	TEXT[2]				=	"";
	TEXT[3]				=	"";
	TEXT[4]				=	"";
	};

FUNC VOID Use_Gr_Speed_Re()
	{   
	TempBrauen = TempBrauen | 4;	
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "Maya_Stoneplate_03.tga"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Trank der Eile");
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ein Trank der Eile ist relativ einfach herzustellen. Man nimmt dazu neun Orkblätter und zerstampft sie in einer Laborflasche.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_Show		(nDocID);
				
	Log_CreateTopic (RezepteListe,LOG_NOTE);
	B_LogEntry (RezepteListe,"Trank der Eile");
	};