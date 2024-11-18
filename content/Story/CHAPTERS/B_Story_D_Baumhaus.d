Func void BH_WolfSpawn()
{
	Wld_InsertNpc(V_Wolf1,"SEE_VOR_STADT_06");
	Wld_InsertNpc(V_Wolf2,"SEE_VOR_STADT_06");
	Wld_InsertNpc(V_Wolf3,"SEE_VOR_STADT_06");
	Wld_InsertNpc(V_Wolf4,"SEE_VOR_STADT_06");
};

//--------- TA-wechsel der V_Wölfe ------------

FUNC int WolfTA ()
{
	
	Npc_PercEnable		(V_Wolf2, PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable		(V_Wolf2, PERC_ASSESSOTHERSDAMAGE,	B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(V_Wolf2, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(V_Wolf2, PERC_ASSESSWARN,		B_MM_AssessWarn);
	Npc_PercEnable		(V_Wolf2, PERC_ASSESSBODY,		B_MM_AssessBody);
	Npc_PercEnable		(V_Wolf2, PERC_ASSESSENEMY,		B_MM_AssessEnemy);

	Npc_PercEnable		(V_Wolf3, PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable		(V_Wolf3, PERC_ASSESSOTHERSDAMAGE,	B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(V_Wolf3, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(V_Wolf3, PERC_ASSESSWARN,		B_MM_AssessWarn);
	Npc_PercEnable		(V_Wolf3, PERC_ASSESSBODY,		B_MM_AssessBody);
	Npc_PercEnable		(V_Wolf3, PERC_ASSESSENEMY,		B_MM_AssessEnemy);

	Npc_PercEnable		(V_Wolf4, PERC_ASSESSDAMAGE,		ZS_ReactToDamage);
	Npc_PercEnable		(V_Wolf4, PERC_ASSESSOTHERSDAMAGE,	B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(V_Wolf4, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(V_Wolf4, PERC_ASSESSWARN,		B_MM_AssessWarn);
	Npc_PercEnable		(V_Wolf4, PERC_ASSESSBODY,		B_MM_AssessBody);
	Npc_PercEnable		(V_Wolf4, PERC_ASSESSENEMY,		B_MM_AssessEnemy);

	AI_StartState(V_Wolf2, ZS_MM_Rtn_Roam, 0, "SEE_VOR_STADT_06");
	AI_StartState(V_Wolf3, ZS_MM_Rtn_Roam, 0, "SEE_VOR_STADT_06");
	AI_StartState(V_Wolf4, ZS_MM_Rtn_Roam, 0, "SEE_VOR_STADT_06");
	
	
	Npc_ExchangeRoutine(V_Wolf1,"NORMAL");
	
	var C_NPC c_wolf;
	c_wolf = Hlp_GetNPC(V_Wolf1); c_wolf.aivar[AIV_MM_PercRange] = 1500;
	c_wolf = Hlp_GetNPC(V_Wolf2); c_wolf.aivar[AIV_MM_PercRange] = 1500;
	c_wolf = Hlp_GetNPC(V_Wolf3); c_wolf.aivar[AIV_MM_PercRange] = 1500;
	c_wolf = Hlp_GetNPC(V_Wolf4); c_wolf.aivar[AIV_MM_PercRange] = 1500;
	
	// PrintScreen("Wolf TA", -1,-1,"font_old_20_white.tga",3);

};
