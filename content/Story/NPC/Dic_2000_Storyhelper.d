instance SHD (Npc_Default) 
{ 
    //-------- primary data -------- 
     
    name                = "Dic Storyhelper"; 
    Npctype               = Npctype_Main; 
    guild               = GIL_NONE; 
    level               = 10; 
    voice               = 15; 
    id                = 2000; 
          
    //-------- visuals -------- 
    //                               animations 
    Mdl_SetVisual          (self,"HUMANS.MDS"); 
    //                              Body-Mesh               Body-Tex     Skin-Color     Head-MMS              Head-Tex     Teeth-Tex      Armor-Tex 
    Mdl_SetVisualBody (self,"hum_body_Naked0",     4,               1,               "Hum_Head_Pony",     9,                0,               -1); 
     
    //-------- ai ---------- 
    start_aistate = ZS_SHD_Hangaround; 
}; 

func void ZS_SHD_Hangaround () 
{ 
    PrintDebugNpc     (PD_ZS_FRAME,     "ZS_SHD_Hangaround"); 

    Npc_PercEnable       (self,     PERC_ASSESSTALK,     B_AssessTalk          ); 
}; 

func void ZS_SHD_Hangaround_Loop () 
{ 
    PrintDebugNpc     (PD_ZS_LOOP,     "ZS_SHD_Hangaround_Loop"); 
}; 

func void ZS_SHD_Hangaround_End () 
{ 
    PrintDebugNpc     (PD_ZS_FRAME,     "ZS_SHD_Hangaround_End"); 
}; 
