instance DIC_2031_Koll (Npc_Default)
	{
	//-------- primary data --------
	
	name 		= 	"Koll";
	npctype		= 	NPCTYPE_Main;
	guild 		=	GIL_NONE;
	level 		=	10;				// etwas höher sonst flieht er -Harri
	voice		=	5;
	id 			=	2031;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 10;
	attribute[ATR_MANA] 		= 10;
	attribute[ATR_HITPOINTS_MAX]= 150;
	attribute[ATR_HITPOINTS] 	= 150;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 14, 1, -1);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_01);
	EquipItem	(self, ItRw_Bow_Small_01);
	CreateInvItem	(self, ItFoMutton);
	CreateInvItems	(self, ItMiNugget,20);
	CreateInvItem	(self, ItFo_Potion_Health_01);
	CreateInvItem	(self, ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2031;
	};

FUNC VOID Rtn_start_2031 ()
	{
	TA_SitAround	(06,00,15,00,"OCR_ARENABATTLE"); 
	TA_StandAround	(15,00,22,00,"OCR_ARENABATTLE");
	TA_StandAround	(22,00,06,00,"OCR_ARENABATTLE");
	};

func void Rtn_Wald_2031 ()
	{
	TA_Stand		(08,00,20,00,"STADT_WEG_184");
	TA_Stand		(20,00,08,00,"STADT_WEG_184");
	};
	
func void Rtn_Karte_2031 ()
	{
	TA_Stand		(08,00,20,00,"PATH_SW_20");
	TA_Stand		(20,00,08,00,"PATH_SW_20");
	};
	
func void Rtn_Arena_2031 ()
	{
	TA_Stand		(08,00,20,00, "STADT_WEG_172");
	TA_Stand		(20,00,08,00, "STADT_WEG_172");
	};
	
func void Rtn_RunA_2031 ()
	{
	TA_Rennen		(08,00,20,00, "SF_BHOF1_11");
	TA_Rennen		(20,00,08,00, "SF_BHOF1_11");
	};
	
func void Rtn_RunB_2031 ()
	{
	TA_Rennen		(08,00,20,00, "PATH_SW_41");
	TA_Rennen		(20,00,08,00, "PATH_SW_41");
	};
	
func void Rtn_RunC_2031 ()
	{
	TA_Rennen		(08,00,20,00, "PATH_SW_13");
	TA_Rennen		(20,00,08,00, "PATH_SW_13");
	};