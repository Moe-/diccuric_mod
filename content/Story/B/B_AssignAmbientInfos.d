FUNC VOID B_AssignAmbientInfos(var c_NPC amb_self)
	{
	if ( (amb_self.npctype==NPCTYPE_AMBIENT)||(amb_self.npctype==NPCTYPE_GUARD) ) //Alle Ambient-NPCs in den Lagern
		{	
		// Bauern
		if (amb_self.guild == GIL_BAU)
			{
			if (amb_self.voice == 2)
				{
				B_AssignAmbientInfos_Bau_2(amb_self);
				}
			else if (amb_self.voice = 16)
				{
				B_AssignAmbientInfos_Bau_16(amb_self);
				};
			}
		// Stadt
		else if (amb_self.guild == GIL_Stt)
			{
			if (amb_self.voice == 3)
				{
				B_AssignAmbientInfos_Stt_3(amb_self);
				}
			else if (amb_self.voice == 4)
				{
				B_AssignAmbientInfos_Stt_4(amb_self);
				}
			else if (amb_self.voice == 5)
				{
				B_AssignAmbientInfos_Stt_5(amb_self);
				}
			else if (amb_self.voice == 6)
				{
				B_AssignAmbientInfos_Stt_6(amb_self);
				};					
			}
		// kleine Burg
		else if (amb_self.guild == GIL_Tpl)
			{
			if (amb_self.voice == 2)
				{
				B_AssignAmbientInfos_Tpl_2(amb_self);
				}
			else if (amb_self.voice == 3)
				{
				B_AssignAmbientInfos_Tpl_3(amb_self);
				}
			// Wächter Bauernhof
			else if (amb_self.voice == 4)
				{
				B_AssignAmbientInfos_Tpl_4(amb_self);
				};					
			};		
		};
	};
