// **********************************************************************************
//						Schmiedquest (Kiste Rohstahl)
// **********************************************************************************
INSTANCE DC_Rohstahlkiste (C_Item)
{
	name 				=	"Rohstahlkiste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"Rohstahlkiste.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[0]				= "Nachschub für den Schmied...";
};


// **********************************************************************************
//						Zahnrad für Austauschplatz
// **********************************************************************************
INSTANCE DC_Gearwheel_AP(C_Item)
{	
	name 				=	"Zahnrad";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Ein neues Zahnrad für die Rampe am";
	TEXT[1]				=	"Austauschplatz.";
	
};


// **********************************************************************************
//						Bettrollentest
// **********************************************************************************
INSTANCE DC_Bedroll(C_Item)
{	
	name 				=	"Schlafsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"schlafsack.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"PAP";

	description			=	name;

	on_state[0]			=	Bedroll_use;
	
};

	FUNC VOID Bedroll_Use()
	{
		Bedroll_Used = TRUE;
		SchlafImSchlafsack = 1;
		AI_DropItem (self, DC_Bedroll);
		AI_PlayAni(self,"T_PLUNDER");
		AI_PlayAni(self,"T_STAND_2_SLEEPGROUND");
		SLEEPABIT_S1();	
		CreateInvItem (self, DC_Bedroll);	
	};
	
// **********************************************************************************
//						Labortest
// **********************************************************************************
INSTANCE MobilesLabor(C_Item)
{	
	name 				=	"Mobiles Labor";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"PAP";

	description			=	name;

	on_state[0]			=	MobLab_use;
	
};

	FUNC VOID MobLab_use()
	{
		TraenkeBrauen ();
		CreateInvItem (self, MobilesLabor);
	};