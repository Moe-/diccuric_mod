instance DIC_2365_Natalia (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Natalia";
	npctype		= 	npctype_main;
	guild 		=	GIL_BAB;      
	level 		=	1;
	voice 		=	16;
	id 			=	2365;
	flags      	=   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH]	 		= 20;
	attribute[ATR_DEXTERITY] 		= 20;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 52;
	attribute[ATR_HITPOINTS] 		= 52;

	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0", 	0, 			0,			"Bab_Head_Hair1", 	0,  		DEFAULT,	-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//-------- Talente -------- 
	
	//-------- inventory --------                                    

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2365;
};

FUNC VOID Rtn_start_2365()
{
	TA_Babe_SitAround		(00,00,06,00,	"STADT_MITTE_026");

	TA_Babe_Fan				(06,00,07,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(07,00,08,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(08,00,09,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(09,00,10,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(10,00,11,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(11,00,12,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(12,00,13,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(13,00,14,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(14,00,15,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(15,00,16,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(16,00,17,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(17,00,18,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(18,00,19,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(19,00,20,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(20,00,21,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(21,00,22,00,	"STADT_MITTE_026");
	TA_Babe_Fan				(22,00,23,00,	"STADT_MITTE_025");   
	TA_Babe_SitAround		(23,00,00,00,	"STADT_MITTE_026");
};
