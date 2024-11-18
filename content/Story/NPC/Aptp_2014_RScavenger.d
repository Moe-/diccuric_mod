/*************************************************************************
**	Riesen Scavenger 						**
*************************************************************************/

instance APTP_2014_RScavenger (Npc_Default)		
{
	name			=	"Riesen Scavenger";
	Npctype 		=	NPCTYPE_Main;
	guild			=	GIL_TROLL;
	level			=	500;
	voice 		=		17;
	ID			= 	2214;

//---------------------------------------------------------

	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	30;

	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]		=	200;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]		=	0;
	protection	[PROT_FLY]		=	0;
	protection	[PROT_MAGIC]		=	30;
//---------------------------------------------------------
	damagetype 					=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range			= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 800;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] 	= TRUE;

//---------------------------------------------------------	
	start_aistate			= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]	= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;
	aivar[AIV_SPECIALCOMBATDAMAGEREACTION] = TRUE;
	aivar[AIV_TALKBEFOREATTACK] = TRUE;

	Set_Scavenger_Visuals();
	Mdl_SetVisualBody		(self,	"Sca_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	Mdl_SetModelScale(self, 2, 2, 2);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 5);
	CreateInvItem (self,Amulett_Leo);


};
//---------------------------------------------------------	
