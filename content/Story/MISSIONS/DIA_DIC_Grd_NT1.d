// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Info_Grd1_Exit (C_INFO)
{
	npc			= Grd_NT1;
	nr			= 999;
	condition	= Info_Grd1_Exit_Condition;
	information	= Info_Grd1_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Info_Grd1_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_Grd1_Exit_Info()
{
	AI_StopProcessInfos(self);
};


// ************************************************************
// 								Schmied treffen, aba flott ;)
// ************************************************************
INSTANCE Info_Grd1_MeetSchmied (C_INFO)
{
	npc			= Grd_NT1;
	nr			= 1;
	condition	= Info_Grd1_MeetSchmied_Condition;
	information	= Info_Grd1_MeetSchmied_Info;
	permanent	= 0;
	important	= 1;
	//description = DIALOG_ENDE;
};

FUNC INT Info_Grd1_MeetSchmied_Condition()
{
	return true;

};

FUNC VOID Info_Grd1_MeetSchmied_Info()
{
	AI_Output (self,other,"Info_Grd1_MeetSchmied_Info_06_00"); //Hey, du sollst dich beim Schmied melden und zwar sofort!
};

// ************************************************************
// 								Wo Schmied?
// ************************************************************
INSTANCE Info_Grd1_WhereSchmied (C_INFO)
{
	npc			= Grd_NT1;
	nr			= 1;
	condition	= Info_Grd1_WhereSchmied_Condition;
	information	= Info_Grd1_WhereSchmied_Info;
	permanent	= 0;
	important	= 0;
	description = "Wo ist der Schmied?";
};

FUNC INT Info_Grd1_WhereSchmied_Condition()
{
	if !Npc_KnowsInfo(other, Info_Schmied_Mission2)
	{
		return true;
	};

};

FUNC VOID Info_Grd1_WhereSchmied_Info()
{
	AI_Output (other,self,"Info_Grd1_WhereSchmied_Info_15_00"); //Wo ist denn der Schmied?
	AI_Output (self,other,"Info_Grd1_WhereSchmied_Info_06_01"); //Das kann nicht wahr sein! Na in der Schmiede natürlich!

	Log_CreateTopic (BekanntePersonen, LOG_MISSION);
	Log_SetTopicStatus (BekanntePersonen, LOG_OBSOLETE);
	B_LogEntry(BekanntePersonen, "Der Schmied - Er ist entweder bei seinem Lehrling in der Stadt oder in der Burgschmiede.");
};