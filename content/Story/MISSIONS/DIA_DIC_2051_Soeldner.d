// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_DIC_2051_Soeldner_Exit (C_INFO)
	{
	npc			= DIC_2051_Soeldner;
	nr			= 999;
	condition	= DIA_DIC_2051_Soeldner_Exit_Condition;
	information	= DIA_DIC_2051_Soeldner_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
	};

FUNC INT DIA_DIC_2051_Soeldner_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_2051_Soeldner_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// --------------- was beibringen ----------
instance DIA_DIC_2051_Soeldner_Lernen (C_INFO)
	{
		npc = DIC_2051_Soeldner;
		nr = 1;
		condition = DIA_DIC_2051_Soeldner_Lernen_Condition;
		information = DIA_DIC_2051_Soeldner_Lernen_Info;
		permanent = 0;
		important = 0;
		description = "Kannst du mir was beibringen?";
	};

func int DIA_DIC_2051_Soeldner_Lernen_Condition ()
	{
		if (Npc_KnowsInfo(other, DIA_DIC_Verwalter_Lernen))
			{
				return 1;
			};
	};

func void DIA_DIC_2051_Soeldner_Lernen_Info ()
	{
		AI_Output (other, self, "DIA_DIC_Narrow_Ausbilden_15_00"); //Kannst du mir etwas beibringen?
		//AI_Output (self, other, "DIA_DIC_2051_Soeldner_Lernen_08_01"); //Wenn du soweit bist, kann ich dich mit dem Zweihänder und der Armbrust ausbilden.
	};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  DIC_2051_Soeldner_ZWEIHAND1 (C_INFO)
	{
	npc				= DIC_2051_Soeldner;
	condition		= DIC_2051_Soeldner_ZWEIHAND1_Condition;
	information		= DIC_2051_Soeldner_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0);
	};

FUNC int  DIC_2051_Soeldner_ZWEIHAND1_Condition()
	{
	if 	(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1 && (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
		&& Npc_KnowsInfo (other, DIA_DIC_2051_Soeldner_Lernen))
		{
		return 1;
		};
	};

FUNC void  DIC_2051_Soeldner_ZWEIHAND1_Info()
	{
	AI_Output			(other, self,"DIA_2504_Asarend_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit Zweihändern lernen.

	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
		{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //Nun, dann gehen wir zuerst die Grundbegriffe durch.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Halte das Schwert waagerecht. Um den Gegner mit einer großen Waffe anzugreifen, brauchst du viel Schwung.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Hole mit der Waffe aus und schlage am besten direkt von oben. Meistens reicht das aus, um den Gegner zu Boden zu strecken.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Nutze den Schwung, wenn die Waffe unten ist, um direkt wieder nach oben zu schlagen.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Seitliche Schläge lassen sich ausgezeichnet mit einem Zweihänder koordinieren. Damit hältst du dir die Gegner vom Hals.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //Das sollte erst einmal reichen. Übe das!

		DIC_2051_Soeldner_ZWEIHAND1.permanent = 0;
		};
	};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance DIC_2051_Soeldner_ZWEIHAND2 (C_INFO)
	{
	npc				= DIC_2051_Soeldner;
	condition		= DIC_2051_Soeldner_ZWEIHAND2_Condition;
	information		= DIC_2051_Soeldner_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0);
	};

FUNC int  DIC_2051_Soeldner_ZWEIHAND2_Condition()
	{
	if	(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1
			&& Npc_KnowsInfo (other, DIA_DIC_2051_Soeldner_Lernen))
		{
		return 1;
		};
	};

FUNC void  DIC_2051_Soeldner_ZWEIHAND2_Info()
	{
	AI_Output			(other, self,"DIA_2504_Asarend_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.

	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
		{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Ändere zunächst deine Grundhaltung. Halte das Schwert aufrecht, fasse den Griff mit beiden Händen und halte es seitlich am Körper.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Schlage schnell von oben und lass die Klinge über deine Schulter gleiten. Nun hast du die Möglichkeit, einen schnellen Schlag nach rechts zu machen.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Damit bietest du dem Gegner keine Chance, an dich ranzukommen.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Sonst schlage wieder von links oben nach vorne, um so den Gegner zurückzutreiben.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Eine schnelle Körperdrehung verleiht deinem nächsten Schlag die nötige Wucht, um den Gegner zu Boden zu zwingen.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //Falls das nicht ausreichen sollte, dann nutze den übrigen Schwung, um die Klinge noch einmal tanzen zu lassen.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Geh nach deinem Angriff in den Block und suche eine Lücke, damit du erneut zuschlagen kannst.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Abwechslung in den Kampfbewegungen und Positionswechsel sind der Schlüssel zum Sieg.

		DIC_2051_Soeldner_ZWEIHAND2.permanent = 0;
		};
	};

/*------------------------------------------------------------------------
							ARMBRUST TALK
------------------------------------------------------------------------*/

instance  DIC_2051_Soeldner_CROSSBOW (C_INFO)
	{
	npc				= DIC_2051_Soeldner;
	condition		= DIC_2051_Soeldner_CROSSBOW_Condition;
	information		= DIC_2051_Soeldner_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Bring mir was mit der Armbrust bei.";
	};

FUNC int  DIC_2051_Soeldner_CROSSBOW_Condition()
	{
		if (Npc_GetTalentSkill  (hero,NPC_TALENT_BOW) == 2
			&& Npc_KnowsInfo (other, DIA_DIC_2051_Soeldner_Lernen))
			{
				return 1;
			};
	};

FUNC void  DIC_2051_Soeldner_CROSSBOW_Info()
	{
	AI_Output (other, self,"DIC_2051_Soeldner_CROSSBOW_Info_15_01"); //Bring mir was mit der Armbrust bei.

	Info_ClearChoices (DIC_2051_Soeldner_CROSSBOW);
	Info_Addchoice 	(DIC_2051_Soeldner_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),DIC_2051_Soeldner_CROSSBOW_OK);
	Info_Addchoice 	(DIC_2051_Soeldner_CROSSBOW,DIALOG_BACK,DIC_2051_Soeldner_CROSSBOW_BACK);
	};

func void DIC_2051_Soeldner_CROSSBOW_BACK()
	{
	Info_ClearChoices	(DIC_2051_Soeldner_CROSSBOW );
	};

func void DIC_2051_Soeldner_CROSSBOW_OK()
	{
	AI_Output (other, self,"DIC_2051_Soeldner_CROSSBOW_OK_15_01"); //Zeig mir den Umgang mit der Armbrust.
	if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Gut, fangen wir direkt an.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Fasse die Armbrust am Schaft an, um ruhig zielen zu können, drücke sie an deine Schulter.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //In den ersten paar Tagen wirst du ein Gefühl haben, als ob dir die Schulter abfällt.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Aber schon nach einer Woche hast du eine Schulter wie aus Stein!
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Visier dein Ziel an und zieh durch. Der Bolzen bekommt mehr Kraft als ein Pfeil durch einen gespannten Bogen, von daher richtest du mehr Schaden an!
			DIC_2051_Soeldner_CROSSBOW.permanent = 0;
		};
	};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2
------------------------------------------------------------------------*/
instance  DIC_2051_Soeldner_CROSSBOW2 (C_INFO)
	{
	npc				= DIC_2051_Soeldner;
	condition		= DIC_2051_Soeldner_CROSSBOW2_Condition;
	information		= DIC_2051_Soeldner_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeige mir mehr über den Umgang mit der Armbrust";
	};

FUNC int  DIC_2051_Soeldner_CROSSBOW2_Condition()
	{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1)
		{
		return 1;
		};
	};

FUNC void  DIC_2051_Soeldner_CROSSBOW2_Info()
	{
	AI_Output (other, self,"DIC_2051_Soeldner_CROSSBOW2_Info_15_01"); //Zeige mir mehr über den Umgang mit der Armbrust

	Info_ClearChoices (DIC_2051_Soeldner_CROSSBOW2);
	Info_Addchoice 	(DIC_2051_Soeldner_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),DIC_2051_Soeldner_CROSSBOW2_OK);
	Info_Addchoice 	(DIC_2051_Soeldner_CROSSBOW2,DIALOG_BACK,  DIC_2051_Soeldner_CROSSBOW2_BACK);
	};

func void DIC_2051_Soeldner_CROSSBOW2_BACK()
	{
	Info_ClearChoices (DIC_2051_Soeldner_CROSSBOW);
	};

func void DIC_2051_Soeldner_CROSSBOW2_OK()
	{
	AI_Output (other, self,"DIC_2051_Soeldner_CROSSBOW2_OK_15_01"); //Lass uns direkt anfangen.
	if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Gut. Du bekommst mehr Treffsicherheit und Ruhe, wenn du beim Schuss in die Knie gehst
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Lerne die Geschwindigkeit von beweglichen Zielen einzuschätzen.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Schieß in die Laufbahn des Zieles, dann wirst du es treffen und es dadurch auch in seiner Bewegung aufhalten.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Wenn du mehrere Ziele hast, dann verschwende keine Zeit, sondern nagel' alle Ziele mit gezielten Schüssen fest und strecke sie abwechselnd nieder.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		DIC_2051_Soeldner_CROSSBOW2.permanent = 0;
		};
	};