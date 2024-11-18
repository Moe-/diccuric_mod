/*************************************************************************
**	Ratte Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Giant_Rat(C_Npc)			
{
	name							=	"Riesenratte";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_MOLERAT;
	level							=	7;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-----------------------------------------------------------
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic					=	FAI_MOLERAT;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 1000;		// 10m

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-----------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};
//-----------------------------------------------------------
func void Set_Giant_Rat_Visuals()
{
	Mdl_SetVisual			(self,"Giant_Rat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Ratte    															**
*************************************************************************/

INSTANCE Giant_Rat	(Mst_Default_Giant_Rat)
{
	Set_Giant_Rat_Visuals();
	Mdl_SetModelScale (self, 0.5, 0.5, 0.5);
	Npc_SetToFistMode(self);
};

// -------------- Ratte für Farm ------------------
INSTANCE FarmRatte	(Mst_Default_Giant_Rat)
	{
	Set_Giant_Rat_Visuals();
	Mdl_SetModelScale (self, 0.5, 0.5, 0.5);
	Npc_SetToFistMode(self);
	};
	
instance FeldRatte (Mst_Default_Giant_Rat)
	{
	Set_Giant_Rat_Visuals();
	Mdl_SetModelScale (self, 0.5, 0.5, 0.5);
	Npc_SetToFistMode(self);
	};
	
instance SumpfRatte (Mst_Default_Giant_Rat)
	{
	name = "Sumpfratte";
	//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
//-----------------------------------------------------------
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]		=	30;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]		=	20;
	protection	[PROT_FLY]		=	5;
	protection	[PROT_MAGIC]		=	5;
//-----------------------------------------------------------
	
	Mdl_SetVisual			(self,"Giant_Rat.mds");
	//						Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale (self, 1, 1, 0.7);
	Npc_SetToFistMode(self);
	};
	
instance Haus_Ratte (Mst_Default_Giant_Rat)
	{
	Set_Giant_Rat_Visuals();
	Mdl_SetModelScale (self, 0.5, 0.5, 0.5);
	Npc_SetToFistMode(self);
	};