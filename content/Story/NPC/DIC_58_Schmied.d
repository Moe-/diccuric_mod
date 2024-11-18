instance Schmied (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Albros";
	npctype		= 	npctype_main;
	guild 		=	GIL_SLD;
	level 		=	15;
	voice 		=	6;
	id 			=	2158;
	flags       =   NPC_FLAG_IMMORTAL;	
		
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
	Mdl_SetVisualBody (self,"hum_Body_CookSmith", 1, 1,"Hum_Head_Pony", 16,  4,-1);
        
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
	daily_routine = Rtn_start_2158;
};

FUNC VOID Rtn_work_2158 ()
{
	TA_Smith_Fire	(08,00,08,10,"B_24");
	TA_Smith_Anvil	(08,10,08,20,"B_24");
	TA_Smith_Fire	(08,20,08,30,"B_24");
	TA_Smith_Anvil	(08,30,08,40,"B_24");
	TA_Smith_Cool	(08,40,08,50,"B_24");
        TA_Smith_Sharp	(08,50,08,55,"B_24");
        TA_SitAround	(08,55,09,00,"B_24");

	TA_Smith_Fire	(09,00,09,10,"SCHMIED_01");
	TA_Smith_Anvil	(09,10,09,20,"SCHMIED_01");
	TA_Smith_Fire	(09,20,09,30,"SCHMIED_01");
	TA_Smith_Anvil	(09,30,09,40,"SCHMIED_01");
	TA_Smith_Cool	(09,40,09,50,"SCHMIED_01");
        TA_Smith_Sharp	(09,50,09,55,"SCHMIED_01");
        TA_SitAround	(09,55,10,00,"SCHMIED_01");

	TA_Smith_Fire	(10,00,10,10,"B_24");
	TA_Smith_Anvil	(10,10,10,20,"B_24");
	TA_Smith_Fire	(10,20,10,30,"B_24");
	TA_Smith_Anvil	(10,30,10,40,"B_24");
	TA_Smith_Cool	(10,40,10,50,"B_24");
        TA_Smith_Sharp	(10,50,10,55,"B_24");
        TA_SitAround	(10,55,11,00,"B_24");
          
	TA_Smith_Fire	(11,00,11,10,"SCHMIED_01");
	TA_Smith_Anvil	(11,10,11,20,"SCHMIED_01");
	TA_Smith_Fire	(11,20,11,30,"SCHMIED_01");
	TA_Smith_Anvil	(11,30,11,40,"SCHMIED_01");
	TA_Smith_Cool	(11,40,11,50,"SCHMIED_01");
        TA_Smith_Sharp	(11,50,11,55,"SCHMIED_01");
        TA_SitAround	(11,55,12,00,"SCHMIED_01");

	TA_Smith_Fire	(12,00,12,10,"B_24");
	TA_Smith_Anvil	(12,10,12,20,"B_24");
	TA_Smith_Fire	(12,20,12,30,"B_24");
	TA_Smith_Anvil	(12,30,12,40,"B_24");
	TA_Smith_Cool	(12,40,12,50,"B_24");
        TA_Smith_Sharp	(12,50,12,55,"B_24");
        TA_SitAround	(12,55,13,00,"B_24");
          
	TA_Smith_Fire	(13,00,13,10,"SCHMIED_01");
	TA_Smith_Anvil	(13,10,13,20,"SCHMIED_01");
	TA_Smith_Fire	(13,20,13,30,"SCHMIED_01");
	TA_Smith_Anvil	(13,30,13,40,"SCHMIED_01");
	TA_Smith_Cool	(13,40,13,50,"SCHMIED_01");
        TA_Smith_Sharp	(13,50,13,55,"SCHMIED_01");
        TA_SitAround	(13,55,14,00,"SCHMIED_01");

	TA_Smith_Fire	(14,00,14,10,"B_24");
	TA_Smith_Anvil	(14,10,14,20,"B_24");
	TA_Smith_Fire	(14,20,14,30,"B_24");
	TA_Smith_Anvil	(14,30,14,40,"B_24");
	TA_Smith_Cool	(14,40,14,50,"B_24");
        TA_Smith_Sharp	(14,50,14,55,"B_24");
        TA_SitAround	(14,55,15,00,"B_24");

	TA_Smith_Fire	(15,00,15,10,"SCHMIED_01");
	TA_Smith_Anvil	(15,10,15,20,"SCHMIED_01");
	TA_Smith_Fire	(15,20,15,30,"SCHMIED_01");
	TA_Smith_Anvil	(15,30,15,40,"SCHMIED_01");
	TA_Smith_Cool	(15,40,15,50,"SCHMIED_01");
        TA_Smith_Sharp	(15,50,15,55,"SCHMIED_01");
        TA_SitAround	(15,55,16,00,"SCHMIED_01");

	TA_Smith_Fire	(16,00,16,10,"B_24");
	TA_Smith_Anvil	(16,10,16,20,"B_24");
	TA_Smith_Fire	(16,20,16,30,"B_24");
	TA_Smith_Anvil	(16,30,16,40,"B_24");
	TA_Smith_Cool	(16,40,16,50,"B_24");
        TA_Smith_Sharp	(16,50,16,55,"B_24");
        TA_SitAround	(16,55,17,00,"B_24");

	TA_Smith_Fire	(17,00,17,10,"SCHMIED_01");
	TA_Smith_Anvil	(17,10,17,20,"SCHMIED_01");
	TA_Smith_Fire	(17,20,17,30,"SCHMIED_01");
	TA_Smith_Anvil	(17,30,17,40,"SCHMIED_01");
	TA_Smith_Cool	(17,40,17,50,"SCHMIED_01");
        TA_Smith_Sharp	(17,50,17,55,"SCHMIED_01");
        TA_SitAround	(17,55,18,00,"SCHMIED_01");

	TA_Smith_Fire	(18,00,18,10,"B_24");
	TA_Smith_Anvil	(18,10,18,20,"B_24");
	TA_Smith_Fire	(18,20,18,30,"B_24");
	TA_Smith_Anvil	(18,30,18,40,"B_24");
	TA_Smith_Cool	(18,40,18,50,"B_24");
        TA_Smith_Sharp	(18,50,18,55,"B_24");
        TA_SitAround	(18,55,19,00,"B_24");

	TA_Smith_Fire	(19,00,19,10,"SCHMIED_01");
	TA_Smith_Anvil	(19,10,19,20,"SCHMIED_01");
	TA_Smith_Fire	(19,20,19,30,"SCHMIED_01");
	TA_Smith_Anvil	(19,30,19,40,"SCHMIED_01");
	TA_Smith_Cool	(19,40,19,50,"SCHMIED_01");
        TA_Smith_Sharp	(19,50,19,55,"SCHMIED_01");
        TA_SitAround	(19,55,20,05,"SCHMIED_01");
   
	TA_Smalltalk	(20,05,01,05,"OCR_ARENABATTLE"); //mit Scorpio

	TA_Sleep		(01,05,08,00,"B_HAUS1_06");
};

FUNC VOID Rtn_start_2158 ()
{
	TA_StandAround (07,00,20,00,"SCHMIED_01");
	TA_StandAround (20,00,07,00,"B_24");
};

FUNC VOID Rtn_kiste_2158 ()
{
	//TA_GuardDC (20,00,06,00,"BRUECKE_002");
	//TA_GuardDC (06,00,20,00,"BRUECKE_002");
	TA_KisteSehen (20,00,06,00,"BRUECKE_002");
	TA_KisteSehen (06,00,20,00,"BRUECKE_002");
};

func void Rtn_Lehrling_2158 ()
{
	TA_StandAround (07,00,20,00,"SCHMIED_01");
	TA_StandAround (20,00,07,00,"SCHMIED_01");
};