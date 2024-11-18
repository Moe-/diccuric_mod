/*******************************************************************************************
**	Rüstungswert-Multiplikator	                                         				  **
*******************************************************************************************/
const int	ARMOR_VALUE_MULTIPLIER	= 30;	// wird mit Schutzwert gegen EDGE-Schaden multipliziert

const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;

const int VALUE_STT_ARMOR_M =  750;
const int VALUE_STT_ARMOR_H = 1200;

const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 2100;

const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;

const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2100;

const int VALUE_ORG_ARMOR_L =  750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;

const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2100;

const int VALUE_NOV_ARMOR_L = 500;
const int VALUE_NOV_ARMOR_M = 750;
const int VALUE_NOV_ARMOR_H = 1200;

const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;

const int VALUE_SFB_ARMOR_L = 250;

const int VALUE_KDFVB_ARMOR = 50;



/*******************************************************************************************
**	OldCamp	                                         	  		 						  **
*******************************************************************************************/

/******************************************************************************************/
// Volk

INSTANCE VLK_ARMOR_L(C_Item)
{
	name 					=	"Leichte Buddlerhose";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_VLK_ARMOR_L;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"vlkl.3ds";
	visual_change 			=	"Hum_VLKL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 10;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	
	on_equip		=	Equip_VLK_ARMOR_L;
	on_unequip		=	UnEquip_VLK_ARMOR_L;
};

FUNC VOID Equip_VLK_ARMOR_L()
	{
	if (hero.attribute[ATR_STRENGTH] > 10)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 10;
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
		TempKraft = 10 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_VLK_ARMOR_L()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 10;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE VLK_ARMOR_M(C_Item)
{
	name 					=	"Buddlerhose";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] =   0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_VLK_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"vlkm.3ds";
	visual_change 			=	"Hum_VLKM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 15;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_VLK_ARMOR_M;
	on_unequip		=	UnEquip_VLK_ARMOR_M;
};

FUNC VOID Equip_VLK_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 15)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 15;
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
		TempKraft = 15 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_VLK_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 15;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
// Schatten

INSTANCE STT_ARMOR_M(C_Item)
{
	name 					=	"Schattenkluft";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_STT_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"sttm.3ds";
	visual_change 			=	"Hum_STTM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 20;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_STT_ARMOR_M;
	on_unequip		=	UnEquip_STT_ARMOR_M;
};

FUNC VOID Equip_STT_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 20)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
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
		TempKraft = 20 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_STT_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 20;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE STT_ARMOR_H(C_Item)
{
	name 					=	"Schattenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_STT_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 30;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_STT_ARMOR_H;
	on_unequip		=	UnEquip_STT_ARMOR_H;
};

FUNC VOID Equip_STT_ARMOR_H()
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

	FUNC VOID UnEquip_STT_ARMOR_H()
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
/******************************************************************************************/
// Gardisten		                                                  					 **

INSTANCE GRD_ARMOR_L(C_Item)
{
	name 					=	"Leichte Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_GRD_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdl.3ds";
	visual_change 			=	"Hum_GRDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 40;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_GRD_ARMOR_L;
	on_unequip		=	UnEquip_GRD_ARMOR_L;
};

FUNC VOID Equip_GRD_ARMOR_L()
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

	FUNC VOID UnEquip_GRD_ARMOR_L()
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
/******************************************************************************************/
INSTANCE GRD_ARMOR_M(C_Item)
{
	name 					=	"Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_GRD_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdm.3ds";
	visual_change 			=	"Hum_GRDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 60;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_GRD_ARMOR_M;
	on_unequip		=	UnEquip_GRD_ARMOR_M;
};

FUNC VOID Equip_GRD_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 60)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 60;
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
		TempKraft = 60 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_GRD_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 60;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
INSTANCE GRD_ARMOR_H(C_Item)
{
	name 					=	"Schwere Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_GRD_ARMOR_H;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"grdh.3ds";
	visual_change 			=	"Hum_GRDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 80;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_GRD_ARMOR_H;
	on_unequip		=	UnEquip_GRD_ARMOR_H;
};

FUNC VOID Equip_GRD_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 80)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 80;
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
		TempKraft = 80 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_GRD_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 80;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
// Erz-Barone		                                                 					  **

INSTANCE EBR_ARMOR_M(C_Item)
{
	name 					=	"Prunkgewand";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	72;
	protection [PROT_BLUNT] = 	72;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	36;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_EBR;


	visual 					=	"ebrm.3ds";
	visual_change 			=	"Hum_EBRM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 90;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_EBR_ARMOR_M;
	on_unequip		=	UnEquip_EBR_ARMOR_M;
};

FUNC VOID Equip_EBR_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 90)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 90;
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
		TempKraft = 90 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_EBR_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 90;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
INSTANCE EBR_ARMOR_H(C_Item)
{
	name 					=	"Gomez'Rüstung";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	85;
	protection [PROT_BLUNT] = 	85;
	protection [PROT_POINT] = 	9;
	protection [PROT_FIRE] 	= 	42;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
  	ownerGuild 				= 	GIL_EBR;

// 	owner					=   EBR_100_GOMEZ;			-Harri
	visual 					=	"ebrh.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 100;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_EBR_ARMOR_H;
	on_unequip		=	UnEquip_EBR_ARMOR_H;
};

FUNC VOID Equip_EBR_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 100)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 100;
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
		TempKraft = 100 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_EBR_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 100;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
INSTANCE EBR_ARMOR_H2(C_Item)
{
	name 					=	"Schwere Erzbaronrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	8;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_EBR;

	visual 					=	"ebrh2.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 100;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_EBR_ARMOR_H2;
	on_unequip		=	UnEquip_EBR_ARMOR_H2;
};

FUNC VOID Equip_EBR_ARMOR_H2()
	{
	if (hero.attribute[ATR_STRENGTH] > 100)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 100;
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
		TempKraft = 100 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_EBR_ARMOR_H2()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 100;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/*******************************************************************************************
**	NewCamp 						                                        	  		  **
*******************************************************************************************/

/******************************************************************************************/
// Schürferbund

instance SFB_ARMOR_L(C_Item)
{
	name 					=	"Schürferklamotten";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SFB_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 10;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_SFB_ARMOR_L;
	on_unequip		=	UnEquip_SFB_ARMOR_L;
};

FUNC VOID Equip_SFB_ARMOR_L()
	{
	if (hero.attribute[ATR_STRENGTH] > 10)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 10;
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
		TempKraft = 10 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_SFB_ARMOR_L()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 10;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
// Organisatoren

INSTANCE ORG_ARMOR_L(C_Item)
{
	name 					=	"Leichte Banditenkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ORG_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgl.3ds";
	visual_change 			=	"Hum_ORGL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 20;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_ORG_ARMOR_L;
	on_unequip		=	UnEquip_ORG_ARMOR_L;
};

FUNC VOID Equip_ORG_ARMOR_L()
	{
	if (hero.attribute[ATR_STRENGTH] > 20)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
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
		TempKraft = 20 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_ORG_ARMOR_L()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 20;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
INSTANCE ORG_ARMOR_M(C_Item)
{
	name 					=	"Mittlere Banditenkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ORG_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgm.3ds";
	visual_change 			=	"Hum_ORGM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 30;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_ORG_ARMOR_M;
	on_unequip		=	UnEquip_ORG_ARMOR_M;
};

FUNC VOID Equip_ORG_ARMOR_M()
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

	FUNC VOID UnEquip_ORG_ARMOR_M()
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
/******************************************************************************************/
INSTANCE ORG_ARMOR_H(C_Item)
{
	name 					=	"Schwere Banditenkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ORG_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 35;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_ORG_ARMOR_H;
	on_unequip		=	UnEquip_ORG_ARMOR_H;
};

FUNC VOID Equip_ORG_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 35)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 35;
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
		TempKraft = 35 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_ORG_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 35;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE SLD_ARMOR_L(C_Item)
{
	name 					=	"leichte Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT]	= 	45;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	=	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SLD_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldl.3ds";
	visual_change 			=	"Hum_SLDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 40;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_SLD_ARMOR_L;
	on_unequip		=	UnEquip_SLD_ARMOR_L;
};

FUNC VOID Equip_SLD_ARMOR_L()
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

	FUNC VOID UnEquip_SLD_ARMOR_L()
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

/******************************************************************************************/
instance SLD_ARMOR_M(C_Item)
{
	name 					=	"Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SLD_ARMOR_M;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"sldm.3ds";
	visual_change 			=	"Hum_SLDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 60;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_SLD_ARMOR_M;
	on_unequip		=	UnEquip_SLD_ARMOR_M;
};

FUNC VOID Equip_SLD_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 60)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 60;
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
		TempKraft = 60 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_SLD_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 60;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE SLD_ARMOR_H(C_Item)
{
	name 					=	"Schwere Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SLD_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldh.3ds";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 80;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_SLD_ARMOR_H;
	on_unequip		=	UnEquip_SLD_ARMOR_H;
};

FUNC VOID Equip_SLD_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 80)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 80;
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
		TempKraft = 80 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_SLD_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 80;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};


/*******************************************************************************************
**	PsiCamp 		                                               	  					  **
*******************************************************************************************/

/******************************************************************************************/
// Novizen

INSTANCE NOV_ARMOR_L(C_Item)
{
	name 					=	"Novizen Rock";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_NOV_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 15;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_NOV_ARMOR_L;
	on_unequip		=	UnEquip_NOV_ARMOR_L;
};

FUNC VOID Equip_NOV_ARMOR_L()
	{
	if (hero.attribute[ATR_STRENGTH] > 15)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 15;
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
		TempKraft = 15 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_NOV_ARMOR_L()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 15;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
/******************************************************************************************/
INSTANCE NOV_ARMOR_M(C_Item)
{
	name 					=	"Leichte Novizenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_NOV_ARMOR_M;

 
	visual 					=	"novm.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 20;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_NOV_ARMOR_M;
	on_unequip		=	UnEquip_NOV_ARMOR_M;
};

FUNC VOID Equip_NOV_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 20)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
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
		TempKraft = 20 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_NOV_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 20;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE NOV_ARMOR_H(C_Item)
{
	name 					=	"Novizenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_NOV_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"novh.3ds";
	visual_change 			=	"Hum_NOVS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 30;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_NOV_ARMOR_H;
	on_unequip		=	UnEquip_NOV_ARMOR_H;
};

FUNC VOID Equip_NOV_ARMOR_H()
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

	FUNC VOID UnEquip_NOV_ARMOR_H()
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

/******************************************************************************************/
// Templer

INSTANCE TPL_ARMOR_L(C_Item)
{
	name 					=	"Leichte Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_TPL_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"tpll.3ds";
	visual_change 			=	"Hum_TPLL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 40;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_TPL_ARMOR_L;
	on_unequip		=	UnEquip_TPL_ARMOR_L;
};

FUNC VOID Equip_TPL_ARMOR_L()
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

	FUNC VOID UnEquip_TPL_ARMOR_L()
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

/******************************************************************************************/
INSTANCE TPL_ARMOR_M(C_Item)
{
	name 					=	"Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_TPL_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplm.3ds";
	visual_change 			=	"Hum_TPLM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 60;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_TPL_ARMOR_M;
	on_unequip		=	UnEquip_TPL_ARMOR_M;
};

FUNC VOID Equip_TPL_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 60)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 60;
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
		TempKraft = 60 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_TPL_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 60;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};
	
/******************************************************************************************/
INSTANCE TPL_ARMOR_H(C_Item)
{
	name 					=	"Schwere Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_TPL_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 80;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_TPL_ARMOR_H;
	on_unequip		=	UnEquip_TPL_ARMOR_H;
};

FUNC VOID Equip_TPL_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 80)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 80;
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
		TempKraft = 80 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_TPL_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 80;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
// Gurus

INSTANCE GUR_ARMOR_M(C_Item)
{
	name 					=	"Gururobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	71;
	protection [PROT_BLUNT] = 	71;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GUR;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 85;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_GUR_ARMOR_M;
	on_unequip		=	UnEquip_GUR_ARMOR_M;
};

FUNC VOID Equip_GUR_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 85)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 85;
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
		TempKraft = 85 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_GUR_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 85;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE GUR_ARMOR_H(C_Item)
{
	name 					=	"Hohe Gururobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	82;
	protection [PROT_BLUNT] = 	82;
	protection [PROT_POINT] = 	8;
	protection [PROT_FIRE] 	= 	41;
	protection [PROT_MAGIC] = 	4;
	wear 					=	WEAR_TORSO;

 	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

   ownerGuild 				= 	GIL_GUR;
	visual 					=	"gurh.3ds";
	visual_change 			=	"Hum_GURS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 90;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_GUR_ARMOR_H;
	on_unequip		=	UnEquip_GUR_ARMOR_H;
};

FUNC VOID Equip_GUR_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 90)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 90;
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
		TempKraft = 90 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_GUR_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 90;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};


/*******************************************************************************************
**	MAGIER		                                                  						**
*******************************************************************************************/

/******************************************************************************************/
// Feuermagier

INSTANCE KDF_ARMOR_L(C_Item)
{
	name 					=	"Feuermagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	5;
	wear 					=	WEAR_TORSO;

 	value 					=	VALUE_KDF_ARMOR_L;

	visual 					=	"kdfl.3ds";
	visual_change 			=	"Hum_KDFL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 35;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_KDF_ARMOR_L;
	on_unequip		=	UnEquip_KDF_ARMOR_L;
};

FUNC VOID Equip_KDF_ARMOR_L()
	{
	if (hero.attribute[ATR_STRENGTH] > 35)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 35;
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
		TempKraft = 35 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_KDF_ARMOR_L()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 35;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE KDF_ARMOR_H(C_Item)
{
	name 					=	"Große Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	10;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDF_ARMOR_H;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 45;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_KDF_ARMOR_H;
	on_unequip		=	UnEquip_KDF_ARMOR_H;
};

FUNC VOID Equip_KDF_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 45)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 45;
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
		TempKraft = 45 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_KDF_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 45;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
// Wassermagier

INSTANCE KDW_ARMOR_L(C_Item)
{
	name 					=	"Wasserrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	15;

	value 					=	VALUE_KDW_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"kdwl.3ds";
	visual_change 			=	"Hum_KDWL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 65;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_KDW_ARMOR_L;
	on_unequip		=	UnEquip_KDW_ARMOR_L;
};

FUNC VOID Equip_KDW_ARMOR_L()
	{
	if (hero.attribute[ATR_STRENGTH] > 65)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 65;
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
		TempKraft = 65 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_KDW_ARMOR_L()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 65;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

/******************************************************************************************/
INSTANCE KDW_ARMOR_H(C_Item)
{
	name 					=	"Große Wasserrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	20;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDW_ARMOR_H;

	visual 					=	"kdwh.3ds";
	visual_change 			=	"Hum_KDWS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 70;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_KDW_ARMOR_H;
	on_unequip		=	UnEquip_KDW_ARMOR_H;
};

FUNC VOID Equip_KDW_ARMOR_H()
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

	FUNC VOID UnEquip_KDW_ARMOR_H()
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

/******************************************************************************************/
// Dämonenbeschwörer

INSTANCE DMB_ARMOR_M(C_Item)
{
	name 					=	"Robe der Dunklen Künste";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	90;
	protection [PROT_BLUNT] = 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	60;
	protection [PROT_MAGIC] = 	30;

	wear 					=	WEAR_TORSO;

 	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	ownerGuild 				= 	GIL_DMB;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_DMBM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 100;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_DMB_ARMOR_M;
	on_unequip		=	UnEquip_DMB_ARMOR_M;
};

FUNC VOID Equip_DMB_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 90)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 100;
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
		TempKraft = 100 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_DMB_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 100;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};



/*******************************************************************************************
**	Spezial-Rüstungen                                                                     **
*******************************************************************************************/

// FIXME: hier fehlen noch die Visuals für die Erz-Rüstungen und das INV-Item für die CRAWLERPLATTEN-RÜSTUNG 

// Crawler-Plattenrüstung
INSTANCE CRW_ARMOR_H(C_Item)
{
	name 					=	"Crawler-Plattenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	5;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
	visual 					=	"crws.3ds";
	visual_change 			=	"Hum_CRAWLER_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 90;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_CRW_ARMOR_H;
	on_unequip		=	UnEquip_CRW_ARMOR_H;
};

FUNC VOID Equip_CRW_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 90)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 90;
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
		TempKraft = 90 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_CRW_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 90;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};



/******************************************************************************************/
// Erz-Rüstungen
INSTANCE ORE_ARMOR_M(C_Item)
{
	name 					=	"antike Erzrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	95;
	protection [PROT_BLUNT] = 	95;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	10;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2; // x2 weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 95;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_ORE_ARMOR_M;
	on_unequip		=	UnEquip_ORE_ARMOR_M;
};

FUNC VOID Equip_ORE_ARMOR_M()
	{
	if (hero.attribute[ATR_STRENGTH] > 95)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 95;
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
		TempKraft = 95 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_ORE_ARMOR_M()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 95;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};

INSTANCE ORE_ARMOR_H(C_Item)
{
	name 					=	"verbesserte Erzrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	15;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;	// x2 weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 110;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_ORE_ARMOR_H;
	on_unequip		=	UnEquip_ORE_ARMOR_H;
};

FUNC VOID Equip_ORE_ARMOR_H()
	{
	if (hero.attribute[ATR_STRENGTH] > 110)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 110;
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
		TempKraft = 110 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_ORE_ARMOR_H()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 110;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};




/*******************************************************************************************
**	Der Richter                                                                       **
*******************************************************************************************/
INSTANCE LAW_ARMOR (C_Item)
{
	name 					=	"Richterrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_DMB;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_LAW_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 25;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_LAW_ARMOR;
	on_unequip		=	UnEquip_LAW_ARMOR;
};

FUNC VOID Equip_LAW_ARMOR()
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

	FUNC VOID UnEquip_LAW_ARMOR()
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






/*******************************************************************************************
**	Wache für Intro-Cutscene                                                          **
*******************************************************************************************/
INSTANCE GRD_ARMOR_I(C_Item)
{
	name 					=	"Königliche Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	1;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GRD;

	visual 					=	"grdi.3ds";
	visual_change 			=	"Hum_GRDI_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 45;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
	on_equip		=	Equip_GRD_ARMOR_I;
	on_unequip		=	UnEquip_GRD_ARMOR_I;
};

FUNC VOID Equip_GRD_ARMOR_I()
	{
	if (hero.attribute[ATR_STRENGTH] > 45)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 45;
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
		TempKraft = 45 - hero.attribute[ATR_STRENGTH];
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

	FUNC VOID UnEquip_GRD_ARMOR_I()
	{
	if (RuestungsVerlust == 0)
		{
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 45;
		}
	else
		{
		RuestungsVerlust = 0;
		};
	};



/*******************************************************************************************
**	Nackte Babes
*******************************************************************************************/
INSTANCE BAB_ARMOR_NUDE (C_Item)
{
	name 					=	"Nacktes Babe";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	1;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
};

/******************************************************************************************/
INSTANCE BAB_ARMOR_BIKINI (C_Item)
{
	name 					=	"bikini babe";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	1;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
};
/******************************************************************************************/
/******************************************************************************************/
// neue rüstungen
/******************************************************************************************/



INSTANCE KDFVB_ARMOR(C_Item)
{
	name 					=	"alte angesenkte Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	50;


	wear 					=	WEAR_TORSO;

 	value 					=	VALUE_KDFVB_ARMOR;

	visual 					=	"kdfvb.3ds";
	visual_change 				=	"Hum_KDFVB_ARMOR.ASC";
	visual_skin 				=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Benötigte Stärke:"; COUNT[0] = 25;
	TEXT[1]					=	NAME_Prot_Edge;		COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;	COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;		COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;	COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;		COUNT[5]	= value;



	on_equip		=	Equip_KDFVB_ARMOR;
	on_unequip		=	UnEquip_KDFVB_ARMOR;
};

FUNC VOID Equip_KDFVB_ARMOR()
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

	FUNC VOID UnEquip_KDFVB_ARMOR()
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