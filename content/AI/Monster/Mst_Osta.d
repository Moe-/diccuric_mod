
INSTANCE osta  (C_NPC)
{
    name              =   "Osta";
    guild             =   GIL_GOLEM;


    level             =   100;

//--------------------------------------------------------------

    attribute   [ATR_STRENGTH]      =   100;
    attribute   [ATR_DEXTERITY]     =   100;
    attribute   [ATR_HITPOINTS_MAX] =   500;
    attribute   [ATR_HITPOINTS]     =   500;
    attribute   [ATR_MANA_MAX]      =   0;
    attribute   [ATR_MANA]          =   0;

//--------------------------------------------------------------

    protection  [PROT_BLUNT]        =   50;              // stumpfe Waffen
    protection  [PROT_EDGE]         =   150;              // Waffen mit EDGE-Schaden (Klingen)
    protection  [PROT_POINT]        =   200;              // Waffen mit POINT-Schaden (Pfeile,Bolzen)
    protection  [PROT_FIRE]         =   999;            // Feuerschaden
    protection  [PROT_FLY]          =   999;              // FLY-Schaden,d.h. wenn die Figur weggeschleudert wird
    protection  [PROT_MAGIC]        =   10;              // Magie-Schaden

//-------------------------------------------------------------- 
    
    damagetype                      =   DAM_FLY;


//--------------------------------------------------------------
	fight_tactic			=	FAI_GOLEM;
//--------------------------------------------------------------

	senses				= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range			= 2000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater]	= TRUE;
//	aivar[AIV_MM_REAL_ID]		= ID_STONEGOLEM;

//-------------------------------------------------------------
	start_aistate			= ZS_MM_AllScheduler;

	aivar[AIV_MM_SleepStart] 	= 22;
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]	= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;
	
//	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

//-------------------------------------------------------------



	Npc_SetToFistMode(self);

	Mdl_SetVisual   (self,  "osta.mds");

	Mdl_SetVisualBody   (self,  "osta_body",     DEFAULT,    DEFAULT,    "",         DEFAULT,    DEFAULT,    -1);

//-------- inventory -----------------------------------------                                   

	
	//CreateInvItems (self, Focus_4);  // Item ist irgend wie falsch geschrieben


};

	