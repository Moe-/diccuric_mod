//Added TMonk: Nur was verändert!
instance Sld_B (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kanapus";              //NAME_Brueckenwache;
	npctype		= 	npctype_guard;
	guild 		=	GIL_SLD;
	level 		=	10;
	voice 		=	6;
	id 			=	2156;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 18,  1, SLD_ARMOR_L);
        
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
	daily_routine = Rtn_start_2156;
};

FUNC VOID Rtn_start_2156 ()
{
	TA_StandBH	(06,00,21,00,"SEE_VOR_STADT_08"); 
	TA_StandBH	(21,00,06,00,"SEE_VOR_STADT_08"); 
};

FUNC VOID Rtn_RALF_2156()				//folge sld_a zum AL
{
	TA_RunAL	(23,00,16,00,"BRUECKE_001");
	TA_RunAL	(16,00,23,00,"BRUECKE_001");
};

FUNC VOID Rtn_EndBH_2156 ()
{
	TA_Guard	(23,00,16,00,"BRUECKE_001");
	TA_Guard	(16,00,23,00,"BRUECKE_001");
};