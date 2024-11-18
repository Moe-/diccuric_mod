/*************************************************************************
**	Brütender Lurker															**
*************************************************************************/

INSTANCE BruetLurker(Mst_Default_Lurker)										
	{
	name	=	"Brütender Lurker";
	ID	=	MID_DAMLURKER;
	level	=	25;
	//-------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_DEXTERITY]		=	75;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	//-------------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;

	Set_Lurker_Visuals	();
	Npc_SetToFistMode	(self);

	start_aistate	= ZS_MM_GuardEggs;
	};
	
// -------------------- Wölfe für Frontline Quest -----------------------
instance Wolf_GE (Mst_Default_Wolf)
	{
	level = 8;
	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);

	start_aistate = ZS_WGE_ErwarteAngriff;
	};
	
instance Wolf_GZ (Mst_Default_Wolf)
	{
	level = 7;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	};
	
// ------------------- Wölfe für Barem Quest --------------------
instance Wolf_BQ (Mst_Default_Wolf)
	{
	level = 5;
	attribute [ATR_HITPOINTS_MAX] = 40;
	attribute [ATR_HITPOINTS] = 40;
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	start_aistate = ZS_BaremAngriff;
	};
	
// ---------------- Wölfe für Hintertorangriff ------------------
instance Wolf_HT (Mst_Default_Wolf)
	{
	level = 6;
	attribute [ATR_HITPOINTS_MAX] = 50;
	attribute [ATR_HITPOINTS] = 50;
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	start_aistate = ZS_HTAngriff;
	};
	
// ------------------- junger Waran --------------------------------
instance JngWaran(Mst_Default_Waran)
	{
	name = "Junger Waran";
	level = 5;
	//guild = GIL_MEATBUG;
	guild = GIL_WARAN;
	
	aivar[AIV_MM_REAL_ID]			= 	ID_WARAN;
	// Ungefähr auf Niveau eines Scavengers
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;
	
	fight_tactic					=	FAI_WARAN;
	aivar[AIV_MM_Behaviour]			= 	PACKHUNTER;
	
	Set_Waran_Visuals();
	Npc_SetToFistMode(self);
	
	//start_aistate = ZS_MM_WaraneAngriff;
	};
	
instance JngWaran2(Mst_Default_Waran)
	{
	name = "Junger Waran";
	level = 5;
	guild = GIL_WARAN;
	// Ungefähr auf Niveau eines Scavengers
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;
	
	Set_Waran_Visuals();
	Npc_SetToFistMode(self);
	};
	
// -------------------- Wala -------------------------
instance Wala (Mst_Default_Wolf)
	{
	name = "Wala";
	guild 		=	GIL_MEATBUG;
	level = 20;
	attribute [ATR_HITPOINTS_MAX] = 20;
	attribute [ATR_HITPOINTS] = 100;
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	
	start_aistate = ZS_MM_Wala;
	};
	
// ------------ Tiere für die Arena ---------------
// - Scavenger, Molerat, Lurker, Wolf, Blutfliege -
instance Arena_Scavenger (Mst_Default_Scavenger)
	{
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
instance Arena_Molerat (Mst_Default_Molerat)
	{
	attribute	[ATR_STRENGTH]		=	12;
	attribute	[ATR_DEXTERITY]		=	12;
	
	attribute	[ATR_HITPOINTS_MAX]	=	55;
	attribute	[ATR_HITPOINTS]		=	55;
	
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
instance Arena_Lurker (Mst_Default_Lurker)
	{
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	45;
	
	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	
	Set_Lurker_Visuals();
	Npc_SetToFistMode(self);
	};
	
instance Arena_Wolf (Mst_Default_Wolf)
	{
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	};

instance Arena_Blutfliege (Mst_Default_Bloodfly)
	{
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;

	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
	};
	
// --------- 6. Kampf in der Arena gegen einen schachen Ork -------------
INSTANCE Arena_Ork	(Mst_Default_OrcScout)
	{
	//-------- general --------
	//guild			=	GIL_WOLF;
	name			=	"Ork";
	//level			=	30;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	30;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_Sword_Old_01);
	};

// ------------ Haustiere, werden wie Arenatiere nur bei Annäherung unter 2m von npc registriert, bzw. wenn sie angreifen --------------  - Harri
// - Scavenger, Molerat, Lurker, Wolf, Blutfliege -
instance Haus_Scavenger (Mst_Default_Scavenger)
	{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
instance Haus_Molerat (Mst_Default_Molerat)
	{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
instance Haus_Lurker (Mst_Default_Lurker)
	{
	Set_Lurker_Visuals();
	Npc_SetToFistMode(self);
	};
	
instance Haus_Wolf (Mst_Default_Wolf)
	{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	};

instance Haus_Blutfliege (Mst_Default_Bloodfly)
	{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
	};
	
INSTANCE Haus_Gobbo (Mst_Default_GreenGobbo)
	{
	Set_GreenGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Sword_Old_01); //+10
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 10; // da technisch im Faustkampf
	};
	
INSTANCE Haus_Minecrawler	(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE Haus_Skeleton			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};
	
INSTANCE Haus_Zombie	(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	Npc_SetToFistMode(self);
};
	
	
// ----------------- Spint ----------------
instance Spint (Mst_Default_Scavenger)
	{
	name = "Spint";
//	guild = GIL_MEATBUG;
	level							=	4;

	attribute	[ATR_STRENGTH]		=	6;
	attribute	[ATR_DEXTERITY]		=	6;

	attribute	[ATR_HITPOINTS_MAX]	=	35;
	attribute	[ATR_HITPOINTS]		=	35;

//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	8;
	protection	[PROT_EDGE]			=	8;


//	fight_tactic					=	FAI_MONSTER_COWARD;

	Mdl_SetVisual			(self,	"Scavenger.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Spint_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);


	Npc_SetToFistMode(self);
	};
	
// --------------- Leitwolf für Lagariman-Quest ----------------
instance Leitwolf (Mst_Default_Wolf)
	{
	name = "Wolfsrudelsführer";
	guild			=	GIL_WOLF;
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	
	CreateInvItems (self, SprKK, 1);
	
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
// --------- Ork für Prüfung -------------
INSTANCE PruefungOrk	(Mst_Default_OrcWarrior)
	{
	//-------- general --------
	name			=	"Ork";
	level			=	5;
	guild			=	GIL_WOLF;
	npctype							= 	npctype_ambient;
	id								=	2401;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] * 8 / 10;
	attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] * 8 / 10;
	attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX] * 8 / 10;
	/*
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	75;
	attribute	[ATR_HITPOINTS]		=	75;
	*/

	//-------- protection --------
	protection	[PROT_BLUNT]			=	15;
	protection	[PROT_EDGE]			=	999;
	protection	[PROT_POINT]			=	999;
	protection	[PROT_FIRE]			=	999;
	protection	[PROT_FLY]			=	999;
	protection	[PROT_MAGIC]			=	999;

	//-------- inventory --------
	//EquipItem (self, ItMw_2H_Sword_Old_01);
	};
	
// --------------- Weitere Wölfe ----------------
instance WolfZwei (Mst_Default_Wolf)
	{	
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
instance WolfDrei (Mst_Default_Wolf)
	{	
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
instance WolfVier (Mst_Default_Wolf)
	{	
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
// ----------- Wölfe im Käfig --------------
instance WolfK1 (Mst_Default_Wolf)
	{
	guild =	GIL_MEATBUG;
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};

instance WolfK2 (Mst_Default_Wolf)
	{
	guild =	GIL_MEATBUG;
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
instance WolfK3 (Mst_Default_Wolf)
	{
	guild =	GIL_MEATBUG;
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
instance WolfK4 (Mst_Default_Wolf)
	{
	guild =	GIL_MEATBUG;
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
instance WolfK5 (Mst_Default_Wolf)
	{
	guild =	GIL_MEATBUG;
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		4,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
// ---------- Ungeziefer auf dem Feld ------------
instance FeldWanze (Mst_Default_Meatbug)
	{
	Set_Meatbug_Visuals();
	CreateInvItems (self, ItAt_Meatbug_01, 1);
	};
	
// ---------- Der verwandelte Hammond ------------      
 INSTANCE Soeldnerwanze     (Mst_Default_Meatbug) 
      { 
      name                    =     "seltsame Wanze"; 
      Set_Meatbug_Visuals(); 
      CreateInvItems (self, ItAt_Meatbug_01, 1); 
      }; 

// ---------- Neu texturierte Monster ---------------
//**	Bloodfly  **
INSTANCE BloodflyB	(Mst_Default_Bloodfly)
{
		Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};

// **************** Brauner Goblin *******************************
func void Set_BrownGobbo_Visuals()
	{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		2,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	};

INSTANCE BrownGobboClub	(Mst_Default_GreenGobbo)
	{
	Set_BrownGobbo_Visuals();

	fight_tactic					=	FAI_MONSTER_COWARD;

	Npc_SetToFightMode (self, ItMw_1h_Club_01); //+5
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 5;// da technisch im Faustkampf
	};

INSTANCE BrownGobboSword (Mst_Default_GreenGobbo)
	{
	Set_BrownGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Sword_Old_01); //+10
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 10; // da technisch im Faustkampf
	};

// ********** Harpie ************************
INSTANCE HarpieB	(Mst_Default_Harpie)
	{
	Mdl_SetVisual			(self,	"Harpie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Har_Body",		1,	DEFAULT,	"",			1,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	};
	
// ********** Lurker ****************
INSTANCE LurkerB	(Mst_Default_Lurker)
	{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	};
	
// ********* Molerat ************
INSTANCE MoleratB	(Mst_Default_Molerat)
	{
	Mdl_SetVisual			(self,"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
INSTANCE MoleratS	(Mst_Default_Molerat)
	{
	name	=	"Sumpfschwein";
	//------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	28;
	attribute	[ATR_DEXTERITY]		=	28;
	
	attribute	[ATR_HITPOINTS_MAX]	=	140;
	attribute	[ATR_HITPOINTS]		=	140;

//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	28;
	protection	[PROT_EDGE]		=	28;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]		=	15;
	protection	[PROT_FLY]		=	10;
	protection	[PROT_MAGIC]		=	10;
//------------------------------------------------------------
	
	
	Mdl_SetVisual			(self,"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};

// ************* Scavenger **********
INSTANCE ScavengerB	(Mst_Default_Scavenger)
	{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
INSTANCE ScavengerC	(Mst_Default_Scavenger)
	{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
INSTANCE ScavengerD	(Mst_Default_Scavenger)
	{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	};
	
INSTANCE Scavenger_Demon	(Mst_Default_Scavenger)
	
{

	name							=	"Grasland Scavenger";
	level							=	9;
	
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	
	//----- Protections -----
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]		=	40;
	protection	[PROT_POINT]		=	8;
	protection	[PROT_FIRE]		=	10;
	protection	[PROT_FLY]		=	10;
	
	

	//--------Visuals-------

	Mdl_SetVisual			(self,	"ScavengerGL.mds");
	Mdl_SetModelScale(self, 1.1, 1.2, 1.1);
	//								Body-Mesh					Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Scavenger_Demon_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	
};
	
// ************* Waran **************
INSTANCE WaranB	(Mst_Default_Waran)
	{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);

	};

INSTANCE WaranC	(Mst_Default_Waran)
	{
	name	=	"schwarzer Waran";
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

//---------------------------------------------------
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]		=	50;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]		=	20;
	protection	[PROT_FLY]		=	5;
	protection	[PROT_MAGIC]		=	5;
//---------------------------------------------------
	
	
	Mdl_SetVisual			(self,	"Waran.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	Npc_SetToFistMode(self);

	};


INSTANCE WaranS	(Mst_Default_Waran)
	{
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

//---------------------------------------------------
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]		=	40;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]		=	20;
	protection	[PROT_FLY]		=	5;
	protection	[PROT_MAGIC]		=	5;
//---------------------------------------------------
	
	Mdl_SetVisual			(self,	"Waran.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Npc_SetToFistMode(self);

	};




// ************* Sumpfgolem *************
INSTANCE SumpfGolem	(Mst_Default_Golem)
	{
	name	=	"Sumpf Golem";
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	
	attribute	[ATR_STRENGTH]		=	85;
	attribute	[ATR_DEXTERITY]		=	85;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	
	// Verletzlich gegen Stumpfe Waffen und Blitzzauber
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_MAGIC]		=	0;

	
	Mdl_SetVisual			(self,	"Golem.mds");
//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"GOL_SUMPF_BODY",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	//CreateInvItem		(self, ItAt_StoneGolem_01);
	Npc_SetToFistMode	(self);
	};
	
INSTANCE DiccuricZombie		(Mst_Default_Zombie)
	{
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	
	CreateInvItem (self, Schutzamulett_Barriere);
	Set_Zombie_Visuals();
	Npc_SetToFistMode(self);
	};