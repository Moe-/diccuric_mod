// ************************ EXIT **************************

instance DIA_2504_Angarr_Exit (C_INFO)
{
	npc			= Dic_2504_Asarend;
	nr			= 999;
	condition	= DIA_2504_Asarend_Exit_Condition;
	information	= DIA_2504_Asarend_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_2504_Asarend_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_2504_Asarend_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Später Trainer 
// ************************

instance DIA_2504_Asarend_LaterTrainer (C_INFO)
{
	npc			= Dic_2504_Asarend;
	nr			= 1;
	condition	= DIA_2504_Asarend_LaterTrainer_Condition;
	information	= DIA_2504_Asarend_LaterTrainer_Info;
	permanent	= 0;
	description = "Kannst du mir was beibringen?";
};                       

FUNC int DIA_2504_Asarend_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_2504_Asarend_LaterTrainer_Info()
{
	AI_Output (other, self,"DIA_DIC_2050_Jaeger_Lernen_15_00"); //Kannst du mir was beibringen?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Du willst ein starker Kämpfer werden, und bist auf der Suche nach jemandem, der dich unterweist.
	AI_Output(self,other,"GUR_1202_Asarend_LaterTrainer_08_02"); //Das ist gut.
	
	if (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_TURM1_01")>300)
	&& (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_MAUER_012")>300)
	&& (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_TURM1_01")>300)
	{
	AI_Output(self,other,"GUR_1202_Asarend_LaterTrainer_08_03"); //Aber hier nicht!
	};
};


//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE DIA_2504_Asarend_Teach(C_INFO)
{
	npc			= Dic_2504_Asarend;
	nr			= 10;
	condition	= DIA_2504_Asarend_Teach_Condition;
	information	= DIA_2504_Asarend_Teach_Info;
	permanent	= 1;
	description = "Kannst du meine Stärke und mein Geschick trainieren?";
};                       

FUNC INT DIA_2504_Asarend_Teach_Condition()
{
	if (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_TURM1_01")<300) 
	&& (Npc_KnowsInfo (hero,DIA_2504_Asarend_LaterTrainer))
	{
		return TRUE;
	};
};

FUNC VOID DIA_2504_Asarend_Teach_Info()
{
	AI_Output(other,self,"DIA_2504_Asarend_Teach_15_00"); //Kannst du meine Stärke und mein Geschick trainieren?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Kampfkraft und Wendigkeit sind die Vorraussetzungen für jeden Kämpfer.
	
	Info_ClearChoices	(DIA_2504_Asarend_Teach);
	Info_AddChoice		(DIA_2504_Asarend_Teach,DIALOG_BACK									,DIA_2504_Asarend_Teach_BACK);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_2504_Asarend_Teach_STR_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_2504_Asarend_Teach_STR_1);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_1);
};

func void DIA_2504_Asarend_Teach_BACK()
{
	Info_ClearChoices	(DIA_2504_Asarend_Teach);
};

func void DIA_2504_Asarend_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(DIA_2504_Asarend_Teach);
	Info_AddChoice		(DIA_2504_Asarend_Teach,DIALOG_BACK									,DIA_2504_Asarend_Teach_BACK);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_2504_Asarend_Teach_STR_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_2504_Asarend_Teach_STR_1);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_1);
};

func void DIA_2504_Asarend_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(DIA_2504_Asarend_Teach);
	Info_AddChoice		(DIA_2504_Asarend_Teach,DIALOG_BACK									,DIA_2504_Asarend_Teach_BACK);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,DIA_2504_Asarend_Teach_STR_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,DIA_2504_Asarend_Teach_STR_1);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_1);
};

func void DIA_2504_Asarend_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(DIA_2504_Asarend_Teach);
	Info_AddChoice		(DIA_2504_Asarend_Teach,DIALOG_BACK									,DIA_2504_Asarend_Teach_BACK);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,DIA_2504_Asarend_Teach_STR_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_2504_Asarend_Teach_STR_1);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_1);
};

func void DIA_2504_Asarend_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(DIA_2504_Asarend_Teach);
	Info_AddChoice		(DIA_2504_Asarend_Teach,DIALOG_BACK									,DIA_2504_Asarend_Teach_BACK);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_2504_Asarend_Teach_STR_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,DIA_2504_Asarend_Teach_STR_1);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_5);
	Info_AddChoice		(DIA_2504_Asarend_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,DIA_2504_Asarend_Teach_DEX_1);
};


//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  DIA_2504_Asarend_ZWEIHAND1 (C_INFO)
{
	npc				= Dic_2504_Asarend;
	condition		= DIA_2504_Asarend_ZWEIHAND1_Condition;
	information		= DIA_2504_Asarend_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  DIA_2504_Asarend_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_MAUER_012")<300)
	&& (Npc_KnowsInfo (hero,DIA_2504_Asarend_LaterTrainer))
	{
		return TRUE;
	};

};
FUNC void  DIA_2504_Asarend_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"DIC_2051_Soeldner_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit dem Zweihänder lernen.
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) < 1)
	{
		AI_Output			(self,other,"DIA_2504_Asarend_ZWEIHAND1_Info_08_01"); //Du bist noch nicht bereit. Wenn du erfahrener geworden bist komm wieder.
	}
	
	
	else if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Der Kampf mit zweihändigen Waffen setzt nicht nur ein Mindestmaß an Stärke und Geschick voraus.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Um eine zweihändige Waffe zu führen, musst du nicht nur deinen Körper, sondern auch deinen Geist beherrschen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Nur wenn du Körper und Geist ganz beherrscht, kannst du das Talent lernen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Konzentration ist der Schlüssel. Körper und Geist verschmelzen in Konzentration zusammen.

		DIA_2504_Asarend_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  DIA_2504_Asarend_ZWEIHAND2 (C_INFO)
{
	npc				= Dic_2504_Asarend;
	condition		= DIA_2504_Asarend_ZWEIHAND2_Condition;
	information		= DIA_2504_Asarend_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  DIA_2504_Asarend_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_MAUER_012")<300)
	&& (Npc_KnowsInfo (hero,DIA_2504_Asarend_LaterTrainer))
	{
		return TRUE;
	};

};
FUNC void  DIA_2504_Asarend_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"DIA_2504_Asarend_ZWEIHAND2_Info_15_01");		//Ich möchte mehr über den zweihändigen Kampf lernen.
	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) < 2)
	{
		AI_Output			(self,other,"DIA_2504_Asarend_ZWEIHAND1_Info_08_01"); //Du bist noch nicht bereit. Wenn du erfahrener geworden bist komm wieder.
	}
	
	
	else if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Den Tanz mit der Klinge beherrscht du nun. Jetzt werde ich dir die Meisterschaft des Kampfes zeigen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Nutze deine geistige Kraft, um die Bewegungen des Gegners vor dem Angriff zu erkennen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Zu wissen, wie dein Gegner kämpft, ist der halbe Sieg über ihn.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Sei schnell, deine Bewegungen müssen überraschend und fließend sein, deine Schläge präzise und hart.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Lerne den Schmerz zu ignorieren. Dein Wille ist es, der letztendlich über den Ausgang des Kampfes entscheidet.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Bewahre die Ruhe. Nur wenn du ruhig und konzentriert in einen Kampf gehst, wirst du ihn auch überleben.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Setze dein Talent mit Vorsicht ein. Und denke daran: Wer den Kampf fordert, kommt durch den Kampf um.

		DIA_2504_Asarend_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
 //--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  DIA_2504_Asarend_MANA (C_INFO)
{
	npc				= Dic_2504_Asarend;
	nr				= 800;
	condition		= DIA_2504_Asarend_MANA_Condition;
	information		= DIA_2504_Asarend_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich benötige mehr magische Kraft"; 
};

FUNC int  DIA_2504_Asarend_MANA_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_2504_Asarend_LaterTrainer))
	&& (Npc_GetDistToWP(Dic_2504_Asarend, "STADT_TURM1_05")<300)
	{
		return TRUE;
	};

};
FUNC void  DIA_2504_Asarend_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Ich benötige mehr magische Kraft.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Ich kann dir helfen, deine Kraft zu steigern. Setze sie mit Bedacht ein!
	
	Info_ClearChoices	(DIA_2504_Asarend_MANA);
	Info_AddChoice		(DIA_2504_Asarend_MANA,DIALOG_BACK									,DIA_2504_Asarend_MANA_BACK);
	Info_AddChoice		(DIA_2504_Asarend_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,DIA_2504_Asarend_MANA_MAN_5);
	Info_AddChoice		(DIA_2504_Asarend_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,DIA_2504_Asarend_MANA_MAN_1);
};  
func void DIA_2504_Asarend_MANA_BACK()
{
	Info_ClearChoices	(DIA_2504_Asarend_MANA);
};

func void DIA_2504_Asarend_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(DIA_2504_Asarend_MANA);
	Info_AddChoice		(DIA_2504_Asarend_MANA,DIALOG_BACK									,DIA_2504_Asarend_MANA_BACK);
	Info_AddChoice		(DIA_2504_Asarend_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,DIA_2504_Asarend_MANA_MAN_5);
	Info_AddChoice		(DIA_2504_Asarend_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,DIA_2504_Asarend_MANA_MAN_1);

};

func void DIA_2504_Asarend_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(DIA_2504_Asarend_MANA);
	Info_AddChoice		(DIA_2504_Asarend_MANA,DIALOG_BACK									,DIA_2504_Asarend_MANA_BACK);
	Info_AddChoice		(DIA_2504_Asarend_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,DIA_2504_Asarend_MANA_MAN_5);
	Info_AddChoice		(DIA_2504_Asarend_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,DIA_2504_Asarend_MANA_MAN_1);

};