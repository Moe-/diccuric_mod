instance DIC_2083_Harlok (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Harlok";
	npctype		=	npctype_main;
	guild 		=	GIL_TPL;
	level 		=	15;
	voice 		=	6;
	id 			=	2083;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 5,  2, TPL_ARMOR_M);
        
        	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	//fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2083;
	};

FUNC VOID Rtn_start_2083 ()
	{
    TA_WalkAround		(06,00,15,00,"MINIBURG_33");
    TA_StandAround		(15,00,21,00,"MINIBURG_35");	
    TA_SitCampfire		(21,00,23,00,"MINIBURG_35");
    TA_Sleep			(23,00,06,00,"MINIBURG_52");	
	};