instance Mine_Worker_2034(Npc_Default)
{
	//-------- primary data --------
	
	name =							"Minenarbeiter";
	npctype =						npctype_mine_ambient;
	guild =							GIL_Stt;      
	level =							8;
	
	
	voice =							1;
	id =					2134;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 74,  3, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	CreateInvItem (self, DC_Rohstahlkiste);
	//-------------Daily Routine-------------
	daily_routine = Wrk_start_2134;
};

func void Wrk_Start_2134()
{
	TA_Guard	(23,00,16,00,"ZAM_20");
	TA_Guard	(16,00,23,00,"ZAM_20"); 
};

func void Rtn_Hacken_2134()
{
	TA_PickOre (07,00,22,00,"ABANDONEDMINE_OUT1");			//Arbeiten
	TA_StandAround(22,00,07,00,"ABANDONEDMINE_OUT1");			//Ausruhen
};