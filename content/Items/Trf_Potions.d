/********************************************************************************************/
//Added TMonk: Verwandlungstrank...
/* gekickt: bringt nix! Funzt nicht!
INSTANCE Trf_Potion_W(C_Item)
{
   name				= "Zeugs";
   mainflag			= ITEM_KAT_NONE;
   flags 			=	ITEM_RING;
   value			= 12;

   //visual			= "ItFo_Potion_Mana_02.3ds";
   //material			= MAT_GLAS;
   on_equip 		= UseTrf_Potion_W;
   on_unequip		= UnUse_Trf_Potion;
   //scemeName		="";

   
};

   FUNC VOID UseTrf_Potion_W()
   {
      if(Npc_IsPlayer(self)) {return;};
	  
	  
	  
      AI_PlayAni (self,"s_TrfShoot");
	  Wld_InsertNpc(VL_Trf_Wlf,"LOCATION_11_12");
	  PrintScreen("Müsste jetzt beamen!", 0,-1,"font_old_20_white.tga",3);
	  Trf_Wolf_spawn = self.wp;
	  //trf_Caster = Hlp_GetNpc(self);
	  AI_StartState	(self, ZS_Trf_Wolf, 0, "");
	  
	  
	  //AI_Teleport(self,"LOCATION_11_12");
	  //Wld_InsertNpc(Trf_Wolf,"LOCATION_11_01");
	  //Npc_SetToFistMode(Trf_Wolf);
   };

   FUNC VOID UnUse_Trf_Potion()
   {
   };

*/

/******************************************************************
Horn, welches Scavanger anlockt
******************************************************************/
INSTANCE ScavHorn (C_Item)
{
	name 				=	"mysteriöses Horn";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Alarmhorn_01.3DS";
	material 			=	MAT_WOOD;
	scemeName			=	"HORN";
	on_state[0]			=   Use_Scavhorn;
	description			= name;
	//TEXT[0]			= "";
	////COUNT[0]		= ;
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

FUNC VOID Use_ScavHorn()
{
	if(Npc_GetDistToWP(self,"SEE_VOR_STADT_12")<=1000)
	// &&(DC_1_Tower != -1) 		By Moe: Wenn Wölfe immer kommen sollen auch Scavs immer kommen...
	&&(DC_1_Tower != 3)
	&&(!ScavHornUsed)
	{
	Wld_SetGuildAttitude(GIL_WOLF,ATT_ANGRY,GIL_SCAVENGER); //Zur Sicherheit
	Wld_InsertNpc(V_Scav1,"SEE_VOR_STADT_06");
	Wld_InsertNpc(V_Scav2,"SEE_VOR_STADT_06");
	Wld_InsertNpc(V_Scav3,"SEE_VOR_STADT_06");
	Wld_InsertNpc(V_Scav4,"SEE_VOR_STADT_06");
	ScavHornUsed = TRUE;
	Wld_SendTrigger ("TS_CAMERA_HOCHSTAND");
	}
	//else if(DC_1_Tower == 3)
	//{
	//PrintScreen("Das funzt hier nicht!", -1,-1,"font_old_20_white.tga",3);
	//}
	else
	{
	PrintScreen("Nichts passiert...", -1,-1,"font_old_20_white.tga",3);
	};
	

};