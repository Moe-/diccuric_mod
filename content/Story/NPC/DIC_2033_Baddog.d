instance DIC_2033_Baddog (Npc_Default)
	{
	//-------- primary data --------
	
	name 		= 	"Baddog";
	npctype		= 	NpcType_Main;
	guild 		=	GIL_Stt;
	level 		=	12;
	voice		=	7;
	id 			=	2033;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 75;
	attribute[ATR_DEXTERITY] 	= 75;
	attribute[ATR_MANA_MAX] 	= 10;
	attribute[ATR_MANA] 		= 10;
	attribute[ATR_HITPOINTS_MAX]= 175;
	attribute[ATR_HITPOINTS] 	= 175;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 16, 1, NOV_ARMOR_M);
        
	B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	
    fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_02);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItLsTorch);
	CreateInvItem   (self, Erzdrache);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2033;
	};

FUNC VOID Rtn_start_2033 ()
	{ 
	TA_SitAround	(06,00,22,00,"SEE_VOR_STADT_27");
	TA_Sleep	(22,00,06,00,"SEE_VOR_STADT_27"); 
	};


func void Rtn_Wala_2033 ()
	{
	TA_GuidePC	(06,00,22,00,"STADT_PATH02_07");
	TA_GuidePC	(22,00,06,00,"STADT_PATH02_07");
	};

func void Rtn_Geheilt_2033 ()
	{
	TA_Stand	(06,00,22,00,"STADT_PATH02_07");
	TA_Stand	(22,00,06,00,"STADT_PATH02_07");
	};