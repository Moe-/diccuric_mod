instance DIC_2005_Lynn (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Lynn";
	npctype		= 	npctype_main;
	guild 		=	GIL_Stt;
	level 		=	1;
	voice 		=	16;
	id 			=	2005;
	flags      	=   NPC_FLAG_IMMORTAL; //Keine Todesanimationen!!!

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;

	//-------- visuals --------
	// 					animations

	// ---------- Hier kann Babe Robe anziehen, sieht dafür scheiße aus... ------
	//Mdl_SetVisual		(self,"HUMANS.MDS");
	//				Body-Mesh		Body-Tex	Skin-Color	  Head-MMS		Head-Tex	Teeth-Tex	ARMOR	
	//Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	0, 	  	4,		"Bab_Head_Hair1", 	0,  		DEFAULT, 	-1); //TAL_ROBE); Bab_body_Naked0
	//Mdl_SetModelFatness(self,-2);

	// ---------- Babe kann keine Robe anziehen,  sieht aber dafür gut aus... -------
	Mdl_SetVisual		(self,"BABE.MDS");
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0", 	2, 	  	1,		"Bab_Head_Hair1", 	3,  		DEFAULT, 	-1);

	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 		
	
	//-------- inventory --------                                    
	CreateInvItem (self, ItMiBrush);
	CreateInvItem (self, ItMiWedel);
	CreateInvItem (self, BabeRobe);			// sicherheitshalber -Harri

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2005;
};

FUNC VOID Rtn_start_2005 () //Steht in der Gegend rum, wo Waschhaus hin soll //Aktuelle World.zen -> im Waschhaus
{
	TA_Babe_Sweep 	(01,00,10,00,	"WASCHPLATZ_05");
	TA_Babe_SitAround	(10,00,11,00,	"WASCHPLATZ_05");
	TA_Babe_Sweep 	(11,00,14,00,	"WASCHPLATZ_05");
	TA_Babe_SitAround	(14,00,16,00,	"WASCHPLATZ_05");
	TA_Babe_Sweep 	(16,00,19,00,	"WASCHPLATZ_05");
	TA_Babe_SitAround	(19,00,01,00,	"WASCHPLATZ_05");
	
};

func void Rtn_Befreit_2005 () //Bei Raffa
	{
	TA_Babe_Sleep	(23,30,08,00,"B_WG_41");
	TA_Babe_SitAround	(08,00,11,30,"B_WG_41");
	TA_Babe_Dance	(11,30,13,00,"B_WG_41");
	TA_Babe_SitAround	(13,00,23,30,"B_WG_41");
	};
	
func void Rtn_Folgen_2005 () // Soll Hero folgen
	{
	TA_FollowPC(12,00,00,00,"B_01");
	TA_FollowPC(00,00,12,00,"B_01");
	};