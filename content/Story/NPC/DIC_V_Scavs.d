instance V_SCAV1 (Npc_Default)
{
	name							=	"Scavenger";
	guild							=	GIL_SCAVENGER;
	npctype							= 	npctype_ambient;
	id								=	15;
	level							=	5;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	240;
	attribute	[ATR_HITPOINTS]		=	240;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	9;
	protection	[PROT_EDGE]			=	9;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;

	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	Npc_SetToFistMode(self);
	daily_routine = Rtn_start_scav1;
};

FUNC VOID Rtn_Start_scav1()
{
	TA_GetBH	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_GetBH	(21,00,06,00,"SEE_VOR_STADT_06"); 
};

instance V_SCAV2 (Npc_Default)
{
	name							=	"Scavenger";
	guild							=	GIL_SCAVENGER;
	npctype							= 	npctype_ambient;
	id								=	16;
	level							=	5;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	240;
	attribute	[ATR_HITPOINTS]		=	240;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	9;
	protection	[PROT_EDGE]			=	9;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;

	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	Npc_SetToFistMode(self);
	daily_routine = Rtn_start_scav2;
};

FUNC VOID Rtn_Start_scav2()
{
	TA_GetBH	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_GetBH	(21,00,06,00,"SEE_VOR_STADT_06"); 
};

instance V_SCAV3 (Npc_Default)
{
	name							=	"Scavenger";
	guild							=	GIL_SCAVENGER;
	npctype							= 	npctype_ambient;
	id								=	17;
	level							=	5;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	240;
	attribute	[ATR_HITPOINTS]		=	240;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	9;
	protection	[PROT_EDGE]			=	9;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;

	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	Npc_SetToFistMode(self);
	daily_routine = Rtn_start_scav3;
};

FUNC VOID Rtn_Start_scav3()
{
	TA_GetBH	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_GetBH	(21,00,06,00,"SEE_VOR_STADT_06"); 
};

instance V_SCAV4 (Npc_Default)
{
	name							=	"Scavenger";
	guild							=	GIL_SCAVENGER;
	npctype							= 	npctype_ambient;
	id								=	18;
	level							=	5;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	240;
	attribute	[ATR_HITPOINTS]		=	240;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	9;
	protection	[PROT_EDGE]			=	9;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;
	

	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	Npc_SetToFistMode(self);
	daily_routine = Rtn_start_scav4;
};

FUNC VOID Rtn_Start_scav4()
{
	TA_GetBH	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_GetBH	(21,00,06,00,"SEE_VOR_STADT_06"); 
};