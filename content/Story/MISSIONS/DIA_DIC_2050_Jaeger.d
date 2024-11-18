// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_DIC_2050_Jaeger_Exit (C_INFO)
	{
	npc			= DIC_2050_Jaeger;
	nr			= 999;
	condition	= DIA_DIC_2050_Jaeger_Exit_Condition;
	information	= DIA_DIC_2050_Jaeger_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
	};

FUNC INT DIA_DIC_2050_Jaeger_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_2050_Jaeger_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_DIC_2050_Jaeger_Hello (C_INFO)
	{
	npc				= DIC_2050_Jaeger;
	nr				= 1;
	condition		= DIA_DIC_2050_Jaeger_Hello_Condition;
	information		= DIA_DIC_2050_Jaeger_Hello_Info;
	permanent		= 0;
	description		= "Wer bist du?";
	};

FUNC int  DIA_DIC_2050_Jaeger_Hello_Condition()
	{
	return 1;
	};

func void  DIA_DIC_2050_Jaeger_Hello_Info()
	{
	AI_Output (other, self,"DIA_DIC_2050_Jaeger_Hello_15_00"); //Wer bist du?
	AI_Output (self, other,"DIA_DIC_2050_Jaeger_Hello_13_01"); //Ich bin ein J�ger. Zusammen mit den anderen J�gern, sind wir daf�r verantworlich Nahrung f�r die Stadt und die Festung zu beschaffen. Zum Gl�ck unterst�tzt uns der Bauernhof.
	AI_Output (other, self,"DIA_DIC_2050_Jaeger_Hello_15_02"); //Warum braucht ihr deren Hilfe?
	AI_Output (self, other,"DIA_DIC_2050_Jaeger_Hello_13_03"); //Seitdem diese gro�e Gruppe S�ldner hier ist, geht uns langsam die Beute aus...ich w�nschte, sie w�ren erst gar nicht gekommen. 
	};

// ****************************************
// 				was beibringen?
// ****************************************

instance DIA_DIC_2050_Jaeger_Lernen (C_INFO)
	{
	npc				= DIC_2050_Jaeger;
	nr				= 2;
	condition		= DIA_DIC_2050_Jaeger_Lernen_Condition;
	information		= DIA_DIC_2050_Jaeger_Lernen_Info;
	permanent		= 0;
	description		= "Kannst du mir was beibringen?";
	};

FUNC int  DIA_DIC_2050_Jaeger_Lernen_Condition()
	{
		if (Npc_KnowsInfo(other, DIA_DIC_Verwalter_Lernen))
			{
				return 1;
			};
	};

func void  DIA_DIC_2050_Jaeger_Lernen_Info()
	{
	AI_Output (other, self,"DIA_DIC_Narrow_Ausbilden_15_00"); //Kannst du mir was beibringen?
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Ich kann dir beibringen, Tiere auszuschlachten.
	};

// **************************************************
//				Animaltrophies
// **************************************************

instance  DIC_2050_Jaeger_Creatures (C_INFO)
	{
	npc			= DIC_2050_Jaeger;
	nr			= 1;
	condition	= DIC_2050_Jaeger_Creatures_Condition;
	information	= DIC_2050_Jaeger_Creatures_Info;
	permanent	= 1;
	description = "Ich will lernen, Tiere auszuschlachten.";
	};

FUNC int  DIC_2050_Jaeger_Creatures_Condition()
	{
	if ( Npc_KnowsInfo(hero, DIA_DIC_2050_Jaeger_Lernen))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
		{
		return 1;
		};
	};

FUNC VOID  DIC_2050_Jaeger_Creatures_Info()
	{
	AI_Output (other, self,"DIC_2050_Jaeger_Creatures_15_00"); //Ich will lernen, Tiere auszuschlachten.

	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
		{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Was willst du wissen?

		Info_ClearChoices(DIC_2050_Jaeger_Creatures);
		Info_AddChoice   (DIC_2050_Jaeger_Creatures, DIALOG_BACK ,DIC_2050_Jaeger_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
			{
			Info_AddChoice   (DIC_2050_Jaeger_Creatures, "Z�hne entfernen (Kosten: 1 LP)" 		,DIC_2050_Jaeger_Creatures_Zahn);
			};
		if (Knows_GetFur == FALSE)
			{
			Info_AddChoice	 (DIC_2050_Jaeger_Creatures, "Fell abziehen (Kosten: 1 LP)"			,DIC_2050_Jaeger_Creatures_Fell);
			};
		if (Knows_GetClaws == FALSE)
			{
			Info_AddChoice	 (DIC_2050_Jaeger_Creatures, "Krallen abzuziehen (Kosten: 1 LP)" 	,DIC_2050_Jaeger_Creatures_Kralle);
			};
		if (Knows_GetHide == FALSE)
			{
			Info_AddChoice	 (DIC_2050_Jaeger_Creatures, "H�uten von Reptilien (Kosten: 1 LP)"	,DIC_2050_Jaeger_Creatures_Haut);
			};
		}
	else
		{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Ich habe dir alles beigebracht, was ich wei�.
		};
	};

func void DIC_2050_Jaeger_Creatures_BACK()
	{
	Info_ClearChoices(DIC_2050_Jaeger_Creatures);
	};

func void DIC_2050_Jaeger_Creatures_Zahn()
	{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Wie komme ich an die Z�hne?

		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			PrintScreen	("Lerne: Z�hne nehmen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Du musst vor allem darauf achten, dass die Z�hne nicht splittern. Um das zu verhindern, musst du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Z�hne kannst du von W�lfen, Schattenl�ufern oder Snappern nehmen.

			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen �ber Z�hne entfernen - Wolf, Orkhund, Snapper, Beisser, Bluthund, Schattenl�ufer.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			//PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	};

func void DIC_2050_Jaeger_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Wie kann ich den Viechern das Fell abziehen?

	if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			PrintScreen	("Lerne: Fell abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Das Fell von W�lfen oder Schattenl�ufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.

			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen �ber Fell abziehen - Wolf, Orkhund, Schattenl�ufer, Troll");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			//PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	};

func void DIC_2050_Jaeger_Creatures_Kralle()
	{
	if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			PrintScreen	("Lerne: Krallen abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Bring mir bei, Krallen abzuziehen!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Ist im Grunde ganz einfach, wenn du wei�t, wie's geht. Du musst die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.

			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen �ber Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			//PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	};

func void DIC_2050_Jaeger_Creatures_Haut()
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;

			PrintScreen	("Lerne: Echsen h�uten", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Worauf muss ich beim H�uten von Reptilien achten?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Die einzigen Reptilien, die daf�r geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Wenn du die Haut an den Seiten anschneidest, l�st sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu h�uten.

			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen �ber H�uten - Lurker, Sumpfhai");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Du musst mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			//PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	};