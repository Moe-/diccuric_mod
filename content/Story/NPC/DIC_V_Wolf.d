//Leitwolf!!
instance V_WOLF1 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Wolf";              //NAME_Brueckenwache;
	npctype		= 	npctype_ambient;
	guild 		=	GIL_WOLF;
	level 		=	9;
	id 			=	2510;
		
	//-------- abilities --------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	damagetype 						=	DAM_EDGE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m
    fight_tactic				=	FAI_WOLF;


	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;	
	//-------- Talente -------- 
	Npc_SetToFistMode(self);			
	//-------------Daily Routine-------------
	//start_aistate				= TA_GoBH;
	//aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	daily_routine = Rtn_start_2510;
};

FUNC VOID Rtn_Start_2510()
{
	TA_GoBH	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_GoBH	(21,00,06,00,"SEE_VOR_STADT_06"); 
};

FUNC VOID Rtn_Normal_2510()
{
	TA_Normal	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_Normal	(21,00,06,00,"SEE_VOR_STADT_06"); 
};


// Wolf2
instance V_WOLF2 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Wolf";              //NAME_Brueckenwache;
	npctype		= 	npctype_ambient;
	guild 		=	GIL_WOLF;
	level 		=	9;
	id 			=	11;
		
	//-------- abilities --------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	damagetype 						=	DAM_EDGE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m
    fight_tactic				=	FAI_WOLF;


	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;	
	//-------- Talente -------- 
	Npc_SetToFistMode(self);			
	//-------------Daily Routine-------------
	
	start_aistate				= ZS_FollowW;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	//daily_routine = Rtn_start_wol2; 
};

FUNC VOID Rtn_Normal_wol2()
{
	TA_Normal	(06,00,21,00,"SEE_VOR_STADT_05"); 
	TA_Normal	(21,00,06,00,"SEE_VOR_STADT_05"); 
};


//Wolf 3
instance V_WOLF3 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Wolf";              //NAME_Brueckenwache;
	npctype		= 	npctype_ambient;
	guild 		=	GIL_WOLF;
	level 		=	9;
	id 			=	12;
		
	//-------- abilities --------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	damagetype 						=	DAM_EDGE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m
    fight_tactic				=	FAI_WOLF;


	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;	
	//-------- Talente -------- 
	Npc_SetToFistMode(self);			
	//-------------Daily Routine-------------
	start_aistate				= ZS_FollowW;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	//daily_routine = Rtn_start_wol2;
};




FUNC VOID Rtn_Normal_wol3()
{
	TA_Normal	(06,00,21,00,"SEE_VOR_STADT_05"); 
	TA_Normal	(21,00,06,00,"SEE_VOR_STADT_05"); 
};


//Wolf 4
instance V_WOLF4 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Wolf";              //NAME_Brueckenwache;
	npctype		= 	npctype_ambient;
	guild 		=	GIL_WOLF;
	level 		=	9;
	id 			=	13;
		
	//-------- abilities --------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	damagetype 						=	DAM_EDGE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m
    fight_tactic				=	FAI_WOLF;


	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;	
	//-------- Talente -------- 
	Npc_SetToFistMode(self);			
	//-------------Daily Routine-------------
	start_aistate				= ZS_FollowW;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	//daily_routine = Rtn_start_wol2;
};

FUNC VOID Rtn_Normal_wol4()
{
	TA_Normal	(06,00,21,00,"SEE_VOR_STADT_05"); 
	TA_Normal	(21,00,06,00,"SEE_VOR_STADT_05"); 
};


//Wolf 5
instance V_WOLF5 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Wolf";              //NAME_Brueckenwache;
	npctype		= 	npctype_ambient;
	guild 		=	GIL_WOLF;
	level 		=	9;
	id 			=	14;
		
	//-------- abilities --------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	damagetype 						=	DAM_EDGE;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m
    fight_tactic				=	FAI_WOLF;


	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;	
	//-------- Talente -------- 
	Npc_SetToFistMode(self);			
	//-------------Daily Routine-------------
	start_aistate				= ZS_FollowW;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	//daily_routine = Rtn_start_wol2;
};
/*
FUNC VOID Rtn_Start_wol5()
{
	TA_GoBH	(06,00,21,00,"SEE_VOR_STADT_06"); 
	TA_GoBH	(21,00,06,00,"SEE_VOR_STADT_06"); 
};
*/