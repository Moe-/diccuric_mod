instance DIC_2044_Lagariman (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Lagariman";
	npctype		=	NPCTYPE_FRIEND;
	guild 		=	GIL_Tpl;
	level 		= 	20;	
	voice 		=	7;
	id 			=	2044;
	flags			= NPC_FLAG_IMMORTAL;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 300;
	attribute[ATR_HITPOINTS] 	= 300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 2, 1,"Hum_Head_Fighter", 7,  1, GRD_ARMOR_H);
         
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Axe_03);
	EquipItem		(self, ItRw_Crossbow_03);
	CreateInvItems	(self, ItAmBolt, 15);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2044;
	};

func void Rtn_Start_2044 ()
	{
	/*	
	TA_SitAround	(06,00,18,00, "BHOF1_05");
	TA_Stand	(18,00,22,00, "BHOF1_05");
	TA_Sleep	(22,00,06,00, "BHOF1_05");
	*/
	TA_Guard		(06,00,18,00,"GRAB01_00");
	TA_Guard		(18,00,06,00,"GRAB01_00");
	};

FUNC VOID Rtn_Quest_2044 ()
	{
	TA_Stand		(06,00,18,00,"GRAB01_00");
	TA_StandAround	(18,00,06,00,"GRAB01_00");
	};
	
func void Rtn_Fuehren_2044 ()
	{
	TA_GuidePC	(23,00,16,00,"ZUR_H06_16");
	TA_GuidePC	(16,00,23,00,"ZUR_H06_16");
	};