// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Info_Schmied_Exit (C_INFO)
{
	npc			= Schmied;
	nr			= 999;
	condition	= Info_Schmied_Exit_Condition;
	information	= Info_Schmied_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT Info_Schmied_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_Schmied_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************************
// 							Auftrag 2
// *****************************************************************

INSTANCE Info_Schmied_Mission2 (C_INFO)
{
	npc			= Schmied;
	nr			= 1;
	condition	= Info_Schmied_Mission2_Condition;
	information	= Info_Schmied_Mission2_Info;
	important   = 0;
	permanent	= 0;
	description = "Hi. Ich sollte mich bei dir melden.";
};

FUNC INT Info_Schmied_Mission2_Condition()
{
	//if((DC_1_Tower == -1)||(DC_1_Tower == 3))  //erster Quest darf net(mehr) laufen

	if (Npc_KnowsInfo(other, Info_Grd1_MeetSchmied))   	//Bei der Bed. von Alex muss man über die Brücke gehen und
								//mit den Söldner gesprochen haben...berücksichtigt also
								//keine anderen Wege und macht das weiterspielen unmöglich
								// => hab das mal geändert (Moe)
		{
		return 1;
		};
};

FUNC VOID Info_Schmied_Mission2_Info()
{
	AI_Output (other,self,"Info_Schmied_Mission2_Info_06_00"); //Hi. Ich sollte mich bei dir melden. hat einer der Wachen gesagt...
	AI_Output (self,other,"Info_Schmied_Mission2_Info_06_01"); //Ah, endlich. Graveyarn hat gesagt, du bist eingeteilt für alles, was im Lager so an Kleinkram anfällt. Nun gut.
	AI_Output (self,other,"Info_Schmied_Mission2_Info_06_02"); //Ich habe eine Aufgabe für dich. Geh zur alten Mine und hol dort eine Kiste mit Rohstahl ab und bring sie zu mir oder zu meiner Schmiede in der Burg. Je früher du hier bist, desto früher kann ich mit meiner Arbeit anfangen.

	Info_ClearChoices(Info_Schmied_Mission2);
	Info_AddChoice(Info_Schmied_Mission2,"Steck dir deinen Auftrag sonst wo hin.",Schmied_Mission2_Info_No);
	Info_AddChoice(Info_Schmied_Mission2,"Ok...",Schmied_Mission2_Info_Yes);
	Info_AddChoice(Info_Schmied_Mission2,"Gibt es niemand anderen?",Schmied_Mission2_Info_Maybe);
	
	if !Npc_KnowsInfo(other, Info_Grd1_WhereSchmied)
	{
		Log_CreateTopic (BekanntePersonen, LOG_MISSION);
		Log_SetTopicStatus (BekanntePersonen, LOG_OBSOLETE);
		B_LogEntry(BekanntePersonen, "Der Schmied - Er ist entweder bei seinem Lehrling in der Stadt oder in der Burgschmiede.");
	};
	
};

FUNC VOID Schmied_Mission2_Info_No()
{
	AI_Output (other,self,"Schmied_Mission2_Info_No_15_00"); //Steck dir deinen Auftrag sonst wo hin. Ich bin nicht dein Laufbursche. Wenn ich für jemanden arbeite dann für Graveyarn und nicht für dich.
	AI_Output (self,other,"Schmied_Mission2_Info_No_06_01"); //Du Göre. Das werden wir ja sehen für wen du arbeitest. Bring die Kiste!
	// ------Aufgabe machen ------------
	DC_2_Smith = 1;

	// ------Tagebucheinträge ----------
	Log_CreateTopic (OM_MISSION1,LOG_MISSION);
	Log_SetTopicStatus(OM_MISSION1, LOG_RUNNING);
	B_LogEntry (OM_MISSION1, "Der Schmied will das ich für ihn eine Kiste am Eingang zur alten Mine abhole und zu ihm bringe.");

	AI_Teleport(DIC_2003_Alwin,"B_00");
	Npc_ExchangeRoutine(DIC_2003_Alwin,"TAUCH");     //Alles für Tauchquest vorberiten
	AI_ContinueRoutine(DIC_2003_Alwin);
	AI_StopProcessInfos(self);
};

FUNC VOID Schmied_Mission2_Info_Yes()
{
	AI_Output (other,self,"Schmied_Mission2_Info_Yes_15_00"); //Ich mache es. Ich werde mich beeilen.
	AI_Output (self,other,"Schmied_Mission2_Info_Yes_06_01"); //Gut.

	// -------------Story var setzen--------------
	DC_2_Smith = 1;

	// -------------Tagebucheintrag---------------
	Log_CreateTopic (OM_MISSION1,LOG_MISSION);
	Log_SetTopicStatus(OM_MISSION1, LOG_RUNNING);
	B_LogEntry (OM_MISSION1, "Der Schmied will das ich für ihn eine Kiste am Eingang zur alten Mine abhole und zu ihm bringe.");

	// -------------TA von Alwin ändern-----------
	B_ExchangeRoutine(DIC_2003_Alwin,"TAUCH");     //Alles für Tauchquest vorberiten

	AI_StopProcessInfos(self);
};

FUNC VOID Schmied_Mission2_Info_Maybe()
{
	AI_Output (other,self,"Schmied_Mission2_Info_Maybe_15_00"); //Gibt es niemand anderen, der das für dich tun könnte? Ich hab gerade etwas anderes zu tun.
	AI_Output (self,other,"Schmied_Mission2_Info_Maybe_06_01"); //Nein. Sonst hätte ich ja jemand anderen gefragt. Also was ist jetzt?
};

// ---------------- Wo ist die Mine? -----------------
instance DIA_DIC_Schmied_WegZurMine (C_INFO)
	{
	npc			= Schmied;
	nr			= 1;
	condition	= DIA_DIC_Schmied_WegZurMine_Condition;
	information	= DIA_DIC_Schmied_WegZurMine_Info;
	permanent	= 0;
	description = "Wie gehts zur Mine?";
};

func int DIA_DIC_Schmied_WegZurMine_Condition ()
	{
	if (DC_2_Smith == 1 && !Npc_KnowsInfo(other, DIA_DIC_Worker_Alwin) && !Npc_KnowsInfo(other, M_Worker_Kiste))
		{
		return 1;
		};
	};
	
func void DIA_DIC_Schmied_WegZurMine_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schmied_WegZurMine_15_00"); //Wie komme ich zur Mine?
	AI_Output (self, other, "DIA_DIC_Schmied_WegZurMine_06_01"); //Der Weg ist ganz einfach. Du gehst durch eins der beiden Tore der Stadtmauer raus, gehst nach rechts und folgst dem Weg auf den Berg. Nach einiger Zeit solltest du zur Mine kommen.
	
	B_LogEntry (OM_MISSION1, "Um zur Mine zu kommen, muss ich das Lager verlassen, rechts abbiegen und dem Weg auf den Berg folgen. Irgendwann sollte ich dann auf die Mine stoßen.");
	};

// ************************************************************
// 						Kiste abgeben
// ************************************************************

INSTANCE Schmied_Gib_Kiste (C_INFO)
{
	npc			= Schmied;
	nr			= 1;
	condition	= Schmied_Gib_Kiste_Condition;
	information	= Schmied_Gib_Kiste_Info;
	permanent	= 0;
	description = "Rohstahlkiste";
};

FUNC INT Schmied_Gib_Kiste_Condition()
	{
	if (DC_2_Smith && BrueckenEinbruch == 1 || Npc_HasItems(other,DC_Rohstahlkiste) >= 1)
		{
		return 1;
		};
	};

FUNC VOID Schmied_Gib_Kiste_Info()
{
	if(Npc_HasItems(other,DC_Rohstahlkiste) >= 1)
	{
		AI_Output (other,self,"Schmied_Gib_Kiste_Info_15_00"); //Hier ist die Kiste. War ziemlich schwer.
		AI_Output (self,other,"Schmied_Gib_Kiste_Info_06_01"); //Gut. Das erhöht dein Ansehen bei Graveyarn. Mach nur weiter so...

		DC_2_Smith = 2;
		B_GiveXP (250);
		Npc_ExchangeRoutine(self,"WORK");
		B_GiveInvItems(other,self,DC_Rohstahlkiste,1);
		B_LogEntry (OM_MISSION1, "Ich habe meinen ersten Auftrag erfüllt. FREUDE!");
		B_LogEntry (OM_MISSION1, "Ich darf nicht vergessen mich bei Graveyarn zu melden.");
		Log_SetTopicStatus(OM_MISSION1, LOG_SUCCESS);
	}
	else
	{
		AI_Output (self,other,"Schmied_Gib_Kiste_Info_06_02"); //Ah da bist du ja. Wo ist die Kiste?
		AI_Output (other,self,"Schmied_Gib_Kiste_Info_15_03"); //Ich bin auf der Brücke gestürzt. Die Kiste liegt jetzt im Fluß.
		AI_Output (self,other,"Schmied_Gib_Kiste_Info_06_04"); //Dann hol sie da raus.
		AI_Output (other,self,"Schmied_Gib_Kiste_Info_15_05"); //Ich habs schon probiert. Aber das schaff ich nicht.
		AI_Output (self,other,"Schmied_Gib_Kiste_Info_06_06"); //Also, ich werde das alleine erledigen. Mir reicht es aber. Ich habe wertvolle Zeit mit dir vergeudet...

		B_LogEntry (OM_MISSION1, "Der Schmied war ziemlich sauer, dass die Kiste verloren gegangen ist...");
		B_LogEntry (OM_MISSION1, "Ich darf nicht vergessen mich bei Graveyarn zu melden.");
		Log_SetTopicStatus(OM_MISSION1, LOG_FAILED);
		B_GiveXP (50);
		if (Npc_HasItems(other,ScavHorn) >= 1)
			{
			AI_Output (self, other, "Schmied_Gib_Kiste_Info_06_07"); //Aber dafür das du mir meine Zeit gestohlen hast, schuldest du mir was: was ist das denn, das gehört doch sicherlich nicht dir und du wirst bestimmt nichts dagegen haben, wenn ich mir das mal auf unbestimmte Zeit ausleihe...
			B_GiveInvItems(other,self,ScavHorn,1);
			B_LogEntry (OM_MISSION1, "Der Schmied hat mir auch noch das Horn abgenommen.");
			};

		DC_2_Smith = 2;
		Npc_ExchangeRoutine(self,"KISTE");
		//Npc_ExchangeRoutine(self,"WORK");
	};

	AI_StopProcessInfos(self);
};

// Moes Scripte
// --------- Albros hat Horn ---------
instance DIA_DIC_Schmied_Horn (C_INFO)
	{
	npc = Schmied;
	nr = 2;
	condition = DIA_DIC_Schmied_Horn_Condition;
	information = DIA_DIC_Schmied_Horn_Info;
	permanent = 0;
	important = 0;
	description = "Rohstahlkiste";
	};

func int DIA_DIC_Schmied_Horn_Condition ()
	{
	if ((Npc_HasItems(self, ScavHorn) >= 1) && Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Suchen))
		{
		return 1;
		};
	};

func void DIA_DIC_Schmied_Horn_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schmied_Horn_15_00"); //Albros, ich weiß das du das Horn besitzt, schließlich hast du es mir abgenommen. Aber jetzt brauche ich es, denn sein rechtmäßiger Besitzer hat mich beauftragt es zu beschaffen.
	AI_Output (self, other, "DIA_DIC_Schmied_Horn_06_01"); //Ha! Du willst also das Horn wiederhaben?

	Info_AddChoice(DIA_DIC_Schmied_Horn, "Ja.", DIA_DIC_Schmied_Ja);
	Info_AddChoice(DIA_DIC_Schmied_Horn, "Du langweilst mich.", DIA_DIC_Schmied_Langweilen);
	};

func void DIA_DIC_Schmied_Ja ()
	{
	AI_Output (other, self, "DIA_DIC_Schmied_Ja_15_00"); //Ja.
	AI_Output (self, other, "DIA_DIC_Schmied_Ja_06_01"); //Du weißt das es hier im Lager nichts umsonst gibt?
	AI_Output (other, self, "DIA_DIC_Schmied_Ja_15_02"); //(stöhnt) Das habe ich mittlerweile gelernt...
	AI_Output (self, other, "DIA_DIC_Schmied_Ja_06_03"); //Und du weiß das du dafür was tun musst, wenn du das Horn wiederhaben willst?
	AI_Output (other, self, "DIA_DIC_Schmied_Ja_15_04"); //Ja. und was?
	AI_Output (self, other, "DIA_DIC_Schmied_Ja_06_05"); //Gar nichts. Ich bin es sowieso leid, diese rostige Tier-Posaune mit mir herumzuschleppen. Hier hast du sie.

	B_GiveInvItems(self, other,ScavHorn,1);
	Info_ClearChoices (DIA_DIC_Schmied_Horn);
	
	B_LogEntry (KarmakkHorn, "Albros hat mir das Horn von Kamakk zurückgegeben.");
	B_GiveXP (100);
	};

func void DIA_DIC_Schmied_Langweilen ()
	{
	AI_Output (other, self, "DIA_DIC_Schmied_Langweilen_15_00"); //Nein. Du langweilst mich. Jetzt habe ich keine Lust mehr mit dir zu reden...
	AI_Output (self, other, "DIA_DIC_Schmied_Langweilen_06_01"); //Du Früchtchen, dir werde ich Respekt beibringen.

	B_LogEntry (KarmakkHorn, "Albros hat mir das Horn nicht gegeben. Jetzt muss ich mit ihm darum kämpfen.");
	
	Info_ClearChoices (DIA_DIC_Schmied_Horn);
	AI_StopProcessInfos(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");

	};