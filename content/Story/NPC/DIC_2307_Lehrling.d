instance DIC_2307_Lehrling (Npc_Default)
	{
	//-------- primary data --------
	
	name 		=	"Schmiedelehrling";
	npctype		= 	npctype_main;
	guild 		=	GIL_SLD;
	level 		=	15;
	voice 		=	3;
	id 			=	2307;
	flags       =   NPC_FLAG_IMMORTAL;	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 150;
	attribute[ATR_HITPOINTS] 	= 150;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_Body_CookSmith", 1, 1,"Hum_Head_Pony", 12,  1,-1);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	//EquipItem	(self, ItRw_Crossbow_01);
	//CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
	//DEN SCHLÜSSEL HAT SKIP
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2307;
};

FUNC VOID Rtn_start_2307 ()
{
	TA_Smith_Fire	(08,00,08,10,"SCHMIED_01");
	TA_Smith_Anvil	(08,10,08,20,"SCHMIED_01");
	TA_Smith_Fire	(08,20,08,30,"SCHMIED_01");
	TA_Smith_Anvil	(08,30,08,40,"SCHMIED_01");
	TA_Smith_Cool	(08,40,08,50,"SCHMIED_01");
        TA_Smith_Sharp	(08,50,08,55,"SCHMIED_01");
        TA_SitAround	(08,55,09,00,"SCHMIED_01");

	TA_Stand	(09,00,10,00,"SCHMIED_01");

	TA_Smith_Fire	(10,00,10,10,"SCHMIED_01");
	TA_Smith_Anvil	(10,10,10,20,"SCHMIED_01");
	TA_Smith_Fire	(10,20,10,30,"SCHMIED_01");
	TA_Smith_Anvil	(10,30,10,40,"SCHMIED_01");
	TA_Smith_Cool	(10,40,10,50,"SCHMIED_01");
        TA_Smith_Sharp	(10,50,10,55,"SCHMIED_01");
        TA_SitAround	(10,55,11,00,"SCHMIED_01");
          
	TA_Stand	(11,00,12,00,"SCHMIED_01");

	TA_Smith_Fire	(12,00,12,10,"SCHMIED_01");
	TA_Smith_Anvil	(12,10,12,20,"SCHMIED_01");
	TA_Smith_Fire	(12,20,12,30,"SCHMIED_01");
	TA_Smith_Anvil	(12,30,12,40,"SCHMIED_01");
	TA_Smith_Cool	(12,40,12,50,"SCHMIED_01");
        TA_Smith_Sharp	(12,50,12,55,"SCHMIED_01");
        TA_SitAround	(12,55,13,00,"SCHMIED_01");
          
	TA_Stand	(13,00,14,00,"SCHMIED_01");

	TA_Smith_Fire	(14,00,14,10,"SCHMIED_01");
	TA_Smith_Anvil	(14,10,14,20,"SCHMIED_01");
	TA_Smith_Fire	(14,20,14,30,"SCHMIED_01");
	TA_Smith_Anvil	(14,30,14,40,"SCHMIED_01");
	TA_Smith_Cool	(14,40,14,50,"SCHMIED_01");
        TA_Smith_Sharp	(14,50,14,55,"SCHMIED_01");
        TA_SitAround	(14,55,15,00,"SCHMIED_01");

	TA_Stand	(15,00,16,00,"SCHMIED_01");

	TA_Smith_Fire	(16,00,16,10,"SCHMIED_01");
	TA_Smith_Anvil	(16,10,16,20,"SCHMIED_01");
	TA_Smith_Fire	(16,20,16,30,"SCHMIED_01");
	TA_Smith_Anvil	(16,30,16,40,"SCHMIED_01");
	TA_Smith_Cool	(16,40,16,50,"SCHMIED_01");
        TA_Smith_Sharp	(16,50,16,55,"SCHMIED_01");
        TA_SitAround	(16,55,17,00,"SCHMIED_01");

	TA_Stand	(17,00,18,00,"SCHMIED_01");

	TA_Smith_Fire	(18,00,18,10,"SCHMIED_01");
	TA_Smith_Anvil	(18,10,18,20,"SCHMIED_01");
	TA_Smith_Fire	(18,20,18,30,"SCHMIED_01");
	TA_Smith_Anvil	(18,30,18,40,"SCHMIED_01");
	TA_Smith_Cool	(18,40,18,50,"SCHMIED_01");
        TA_Smith_Sharp	(18,50,18,55,"SCHMIED_01");
        TA_SitAround	(18,55,19,00,"SCHMIED_01");

	TA_Stand	(19,00,20,05,"SCHMIED_01");
   
	TA_Smalltalk	(20,05,01,05,"SCHMIED_01"); //mit Scorpio

	TA_Sleep		(01,05,08,00,"SCHMIED_01");
};