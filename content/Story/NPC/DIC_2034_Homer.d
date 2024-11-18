instance DIC_2034_Homer (Npc_Default)
	{
	//-------- primary data --------
	
	name =							"Homer";
	npctype	 =						npctype_main;
	guild =							GIL_Stt;      
	level =							6;
	flags =							0;
	
	voice =							2;
	id =							2034;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		11;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 5, 1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoBooze, 75);	
	CreateInvItems (self, ItFoRice, 5);
	CreateInvItems (self, ItAt_Wolf_01, 5);
	CreateInvItem (self, ItFoLoaf);
	//CreateInvItem (self, ItFoBooze);
	EquipItem (self, ItMw_1H_Mace_01);
	CreateInvItem (self, ItMi_Stuff_Pipe_01);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Mug_01);
	CreateInvItem (self, ItMi_Alchemy_Quicksilver_01);
	CreateInvItems (self, ItFoApple, 5);
	CreateInvItems (self, ItFoLoaf, 12);
	CreateInvItems (self, ItFoMuttonRaw, 7);
	CreateInvItems (self, ItFo_mutton_01, 4);
	CreateInvItems (self, ItFoCheese, 9);
	CreateInvItems (self, ItFoBeer, 6);
	CreateInvItems (self, ItFo_Potion_Mana_01, 25);
	CreateInvItems (self, ItFo_Potion_Mana_02, 20);
	CreateInvItems (self, ItFo_Potion_Mana_03, 15);
	CreateInvItems (self, ItFo_Potion_Health_01, 25);
	CreateInvItems (self, ItFo_Potion_Health_02, 25);
	CreateInvItems (self, ItFo_Potion_Health_03, 25);
	CreateInvItems (self, ItFo_Potion_Health_Perma_03, 2);
	CreateInvItems (self, ItFo_Potion_Mana_Perma_02, 3);
	CreateInvItems (self, ItFo_Potion_Haste_01, 10);
	CreateInvItems (self, ItFo_Potion_Haste_02, 9);
	CreateInvItems (self, ItFo_Potion_Haste_03, 11);
	CreateInvItems (self, ItWr_Book_Circle_01, 1);
	CreateInvItems (self, ItWr_Book_Circle_02, 1);
	CreateInvItems (self, ItWr_Book_Circle_03, 1);
	CreateInvItems (self, ItWr_Book_Circle_04, 1);
	CreateInvItems (self, ItWr_Book_Circle_05, 1);
	CreateInvItems (self, ItWr_Book_Circle_06, 1);
	CreateInvItems (self, ItKeLockpick, 50);
	CreateInvItems (self, ItMiFlask, 20);
	CreateInvItems (self, ItMiHammer, 2);
	CreateInvItems (self, ItMiSwordraw, 35);
	CreateInvItems (self, ItLsTorchFirespit, 2);
	CreateInvItems (self, ItMiJoint_2, 16);
	CreateInvItems (self, ItMiNugget, 550);
	CreateInvItems (self, ItLsTorch, 15);
	CreateInvItems (self, ItMi_Stuff_Cup_01, 2);
	CreateInvItems (self, ItMi_Stuff_Silverware_01, 3);
	CreateInvItems (self, ItMi_Stuff_Pan_01, 1);
	CreateInvItems (self, ItMi_Alchemy_Sulphur_01, 4);
	CreateInvItems (self, ItMi_Stuff_Mug_01, 5);
	CreateInvItems (self, ItMi_Alchemy_Salt_01, 2);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_2034;
	};

FUNC VOID Rtn_Start_2034 ()
	{
	TA_Stand	(07,30,21,30,"STADT_MARKT_05"); 
	TA_Sleep	(21,30,07,30,"SHUETTE104_EINGANG");
	};