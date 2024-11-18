instance DIC_2014_Kamakk (Npc_Default)
	{
	//-------- primary data --------
	name =							"Karmakk";
	npctype =						npctype_Main;
	guild =							GIL_Sld;
	level =							5;
	
	
	voice =							1;
	id =							2014;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Hum_Body_CookSmith", 	0, 			1,			"Hum_Head_Fighter", 81, 		1, 			-1);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill	(self, NPC_TALENT_1H,1);		
	Npc_SetTalentSkill	(self,NPC_TALENT_SNEAK,	1);			
			
	
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Mace_Light_01);
	CreateInvItem	(self, ItMi_Stuff_Cup_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2014;
	};

FUNC VOID Rtn_start_2014 ()
	{
	TA_SitAround	(08,00,09,00,"HHUETTK02_EINGANG");
	TA_Pray		(09,00,16,00,"HHUETTK02_EINGANG");
	TA_StandAround  (16,00,22,00,"HHUETTK02_EINGANG");
	TA_Sleep	(22,00,08,00,"HHUETTK02_EINGANG");
	};