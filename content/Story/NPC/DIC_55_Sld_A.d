//Added TMonk: Nur was geändert!

instance Sld_A (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Dabnor";              //NAME_Brueckenwache;
	npctype		= 	npctype_guard;
	guild 		=	GIL_SLD;
	level 		=	10;
	voice 		=	6;
	id 			=	2155;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, SLD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
    	senses_range = 9500;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	EquipItem	(self, ItRw_Bow_Small_04);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);	
	CreateInvItems	(self, ItAmArrow, 100);	        
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2155;
};

//FUNC VOID Rtn_wait_2155 ()
//{
//	TA_Stand	(06,00,21,00,"SEE_VOR_STADT_25"); 
//	TA_Stand	(21,00,06,00,"SEE_VOR_STADT_25"); 
//};

func void Rtn_start_2155 ()
{
	TA_StandBH	(06,00,21,00,"SEE_VOR_STADT_11"); 
	TA_StandBH	(21,00,06,00,"SEE_VOR_STADT_11"); 
};

FUNC VOID Rtn_Follow_2155 ()
{
	TA_FollowBH	(23,00,16,00,"SEE_VOR_STADT_11");
	TA_FollowBH	(16,00,23,00,"SEE_VOR_STADT_11");
};



FUNC VOID Rtn_RAL_2155()				//Lauf zum AL(Verarschquest)
{
	TA_RunAL	(23,00,16,00,"BRUECKE_001");
	TA_RunAL	(16,00,23,00,"BRUECKE_001");
};

FUNC VOID Rtn_EndBH_2155 ()		//Bleiben an der Brücke stehen...
{
	TA_Guard	(23,00,16,00,"BRUECKE_001");
	TA_Guard	(16,00,23,00,"BRUECKE_001");
};