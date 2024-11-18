//------------ ENDE -----------------
instance DIA_Hamond_Exit (C_INFO)
	{
	npc 		= DIC_2501_Hamond;
	nr 		= 999;
	condition 	= DIA_Hamond_Exit_Condition;
	information 	= DIA_Hamond_Exit_Info;
	permanent 	= 1;
	description 	= DIALOG_ENDE;
	};
	
func int DIA_Hamond_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_Hamond_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ----------------- Erlöst ---------------------

instance DIA_Hamond_Hallo (C_INFO)
	{
	npc 		= DIC_2501_Hamond;
	nr 		= 1;
	condition 	= DIA_Hamond_Hallo_Condition;
	information 	= DIA_Hamond_Hallo_Info;
	permanent 	= 0;
	important 	= 1;
	};

func int DIA_Hamond_Hallo_Condition()
	{
	return 1;
	};

func void DIA_Hamond_Hallo_Info()
	{             
	AI_Output (self, other, "DIA_Hamond_Hallo_13_00"); //Was war das? Was ist los? Wo bin ich?
	AI_Output (other, self, "DIA_Hamond_Hallo_15_01"); //Weist du nicht mehr? Du bist von Taliasan in eine Wanze verwandelt worden.
	AI_Output (self, other, "DIA_Hamond_Hallo_13_02"); //Ach ja, jetzt fällt's mir wieder ein. Oh man wie mein Schädel brummt. Man soll sich eben nicht mit einem Magier anlegen.
	AI_Output (other, self, "DIA_Hamond_Hallo_15_03"); //Was hast du den angestellt, dass er so zornig wurde?
	AI_Output (self, other, "DIA_Hamond_Hallo_13_04"); //Ich hab ihn beleidigt um ihn abzulenken.
	AI_Output (other, self, "DIA_Hamond_Hallo_15_05"); //Wozu das denn?
	AI_Output (self, other, "DIA_Hamond_Hallo_13_06"); //Um unauffällig in seinen Taschen zu kramen. Magiere haben oft wertvolle Dinge dabei.
	AI_Output (other, self, "DIA_Hamond_Hallo_15_07"); //Ach sooo, ha ha. Und? Hat es sich wenigstens gelohnt?
	AI_Output (self, other, "DIA_Hamond_Hallo_13_08"); //Na ja ich habe da so was wie ein Amulett erhascht. Hmm? Sieht aber nicht besonders wertvoll aus.
	AI_Output (self, other, "DIA_Hamond_Hallo_13_09"); //Ich kann das nicht gebrauch. Hier, ich geb's dir als Belohnung.
	B_KillNpc (Soeldnerwanze);
	B_GiveInvItems( self, other,Amulett_Leo,1);
	Log_CreateTopic		(AMULETTTELEPORT, LOG_MISSION);
	B_LogEntry		(AMULETTTELEPORT, "Ich hab von Hamond ein seltsames Amulett bekommen. Er hatte es Taliasan aus der Tasche gestohlen. Irgendwie kommt mir das Zeichen darauf bekannt vor.");
	Log_SetTopicStatus	(AMULETTTELEPORT, LOG_RUNNING);
	};

// ----------------- Taschendiebstahl ---------------------

instance DIA_Hamond_Dieb (C_INFO)
	{
	npc 		= DIC_2501_Hamond;
	nr 		= 1;
	condition 	= DIA_Hamond_Dieb_Condition;
	information 	= DIA_Hamond_Dieb_Info;
	permanent 	= 0;
	description 	= "Taschendiebstahl?.";
	};

func int DIA_Hamond_Dieb_Condition()
	{
	if (Npc_KnowsInfo(hero,DIA_Hamond_Hallo))

		{
		return 1;
		};
	};

func void DIA_Hamond_Dieb_Info()
	{             
	AI_Output (other, self, "DIA_Hamond_Dieb_15_00"); //Du scheinst da wohl dein Handwerk zu beherrschen?
	AI_Output (self, other, "DIA_Hamond_Dieb_13_01"); //Hää, welches Handwerk?
	AI_Output (other, self, "DIA_Hamond_Dieb_15_02"); //Na, anderen ihre Taschen zu erleichtern.
	AI_Output (self, other, "DIA_Hamond_Dieb_13_03"); //Ha ha, ach Taschendiebstahl. Ja da bin ich ziemlich gut darin. Ist eine gute Möglichkeit sein Vermögen etwas zu erhöhen.
	AI_Output (other, self, "DIA_Hamond_Dieb_15_04"); //Das ist aber nicht die feine Art?!
	AI_Output (self, other, "DIA_Hamond_Dieb_13_05"); //Also hör mal zu, Kleiner! Wer hier in der Welt überleben will muss sich was einfallen lassen.
	AI_Output (self, other, "DIA_Hamond_Dieb_13_06"); //Da kann man nicht zimperlich sein und nicht immer Rücksicht auf andere nehmen. 
	AI_Output (self, other, "DIA_Hamond_Dieb_13_07"); //Wenn du willst kann ich dir was beiringen?                     Interesse?
	
	Info_AddChoice		(DIA_Hamond_Dieb,"Ja, bring mir was bei."	,DIA_Hamond_Dieb_ja);
	Info_AddChoice		(DIA_Hamond_Dieb,"Nein, so was mache ich nicht."	,DIA_Hamond_Dieb_nein);
	};
	
func void DIA_Hamond_Dieb_ja()
	{             
	AI_Output (other, self, "DIA_Hamond_Dieb_ja_15_00"); //Ja, was soll's. Schließlich ist das eine Raue Zeit und jeder muss selber zusehen wie er zurecht kommt.
	AI_Output (self, other, "DIA_Hamond_Dieb_ja_13_01"); //Ich merke du hast verstanden was ich meine. Man kann schließlich nicht wissen wie es einem manchmal ergeht.
	Hamond_CanTeach = 1;
	Log_CreateTopic 	(LehrerStadt,LOG_NOTE);
	B_LogEntry		(LehrerStadt,"Hamond kann mich den Taschendiebstahl und Schlösserknacken lernen.");
	Info_ClearChoices	(DIA_Hamond_Dieb );
	};
	
func void DIA_Hamond_Dieb_nein()
	{             
	AI_Output (other, self, "DIA_Hamond_Dieb_nein_15_00"); //nein, So einer bin ich nicht. Ich will es mir nicht mit anderen verderben.
	AI_Output (self, other, "DIA_Hamond_Dieb_nein_13_01"); //So so. Hmm, eine noble Einstellung. Aber weit kommst du hier damit nicht.
	Hamond_CanTeach = 0;
	Info_ClearChoices	(DIA_Hamond_Dieb );
	};

	

	
	
	
	
// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Hamond_Lehrer (C_INFO)
{
	npc			= DIC_2501_Hamond;
	nr			= 2;
	condition		= DIA_Hamond_Lehrer_Condition;
	information		= DIA_Hamond_Lehrer_Info;
	permanent		= 1;
	description		= "Was kannst du mir beibringen?"; 
};

FUNC INT DIA_Hamond_Lehrer_Condition()
{	
	if (Hamond_CanTeach == 1)
	&& ((Hamond_Amu != 2) || (Hamond_Auftrag_Day == (Wld_GetDay() )))
	{
		return 1;	
	};
};

FUNC VOID DIA_Hamond_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Hamond_Lehrer_15_00"); //Was kannst du mir beibringen?
	AI_Output (self, other,"DIA_Hamond_Lehrer_13_01"); //Kommt drauf an, was willst du wissen?



	Info_ClearChoices	(DIA_Hamond_Lehrer);
	Info_AddChoice		(DIA_Hamond_Lehrer,DIALOG_BACK																	,DIA_Hamond_Lehrer_BACK);
	Info_AddChoice		(DIA_Hamond_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Hamond_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Hamond_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Hamond_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Hamond_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Hamond_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Hamond_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Hamond_Lehrer_Lockpick);
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0)
	{
	Info_AddChoice		(DIA_Hamond_Lehrer,"Ich will lernen, mich lautlos zu bewegen." 								,DIA_Hamond_Lehrer_Schleichen);
	};
};


func void DIA_Hamond_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Hamond_Lehrer_Schleichen_15_00"); //Ich will lernen, mich lautlos zu bewegen.
	AI_Output (self, other,"DIA_Hamond_Lehrer_Schleichen_13_01"); //Schleichen? Das kann ich zwar ganz gut, aber beibringen kann ich dir das nicht gut.
	AI_Output (self, other,"DIA_Hamond_Lehrer_Schleichen_13_02"); //Da musst du dich schon nach jemand anderem umschauen. Aber frag mich nicht wer!
};

func void DIA_Hamond_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Hamond_Lehrer_Lockpick_15_00"); //Wie werde ich besser im Knacken von Schlössern?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Hamond_Lehrer_Lockpick_13_01"); //Das willst du gerne wissen, hm? Ist für den Anfang nicht so schwer.
		AI_Output (self, other,"DIA_Hamond_Lehrer_Lockpick_13_02"); //Du musst vor allem darauf achten, dass dir dein Dietrich nicht abbricht.
		AI_Output (self, other,"DIA_Hamond_Lehrer_Lockpick_13_03"); //Wenn du in Zukunft mit weniger Gewalt an die Sache rangehst, wirst du merken, dass du weniger Dietriche verbrauchst!
	};
};

func void DIA_Hamond_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Hamond_Lehrer_Lockpick2_15_00"); //Wie werde ich Meister im Öffnen von Schlössern?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Hamond_Lehrer_Lockpick2_13_01"); //Nur wer schon einige Übung hat, merkt genau, wann ihm ein Dietrich abbricht und wann nicht. Du erkennst es am Geräusch!
		AI_Output (self, other,"DIA_Hamond_Lehrer_Lockpick2_13_02"); //Ich denke, du bist jetzt so weit - lerne, auf das leise Klicken des Schlosses zu achten, und du wirst nur noch selten das Pech haben, einen Dietrich zu verlieren.
		AI_Output (self, other,"DIA_Hamond_Lehrer_Lockpick2_13_03"); //Ein Meister des Fachs hat eine gute Chance, eine Truhe zu öffnen, ohne dass sein Dietrich überhaupt abbricht.
	};
};

func void DIA_Hamond_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Hamond_Lehrer_PICKPOCKET_15_00"); //Ich will ein guter Taschendieb werden!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Hamond_Lehrer_PICKPOCKET_13_01"); //So, du willst also ein paar Leute um ihre Sachen erleichtern? Nun gut.
			AI_Output (self, other,"DIA_Hamond_Lehrer_PICKPOCKET_13_02"); //Ich werde dir beibringen, wie du besser wirst, aber es besteht immer noch eine Chance, dass du erwischt wirst.
			AI_Output (self, other,"DIA_Hamond_Lehrer_PICKPOCKET_13_03"); //Das Risiko solltest du nur eingehen, wenn außer deinem Opfer niemand sonst da ist.
			AI_Output (self, other,"DIA_Hamond_Lehrer_PICKPOCKET_13_04"); //Erst als Meister wirst du in der Lage sein, jemandem etwas aus der Tasche zu ziehen, ohne dass er es merkt!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Vergiss es! Ohne dass du schleichen kannst, wirst du NIEMALS ein geschickter Dieb.
	};
};

func void DIA_Hamond_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Hamond_Lehrer_Pickpocket2_15_00"); //Ich will ein Meister der Taschendiebe werden!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Hamond_Lehrer_Pickpocket2_13_01"); //Ich denke, du bist gut genug, um in die letzten Geheimnisse eingeweiht zu werden.
		AI_Output (self, other,"DIA_Hamond_Lehrer_Pickpocket2_13_02"); //Du solltest aber wissen, dass es selbst den Besten manchmal passiert, dass sie bemerkt werden.
		AI_Output (self, other,"DIA_Hamond_Lehrer_Pickpocket2_13_03"); //Also pass auf dich auf.
	};
};

func VOID DIA_Hamond_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Hamond_Lehrer );
};

// ------------- Rache wegen verrat -----------------

INSTANCE DIA_Hamond_Rache (C_INFO)
{
	npc			= DIC_2501_Hamond;
	nr			= 1;
	condition		= DIA_Hamond_Rache_Condition;
	information		= DIA_Hamond_Rache_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Hamond_Rache_Condition()
{	
	if (Hamond_Amu == 2)
	&& (Hamond_Auftrag_Day < (Wld_GetDay() ))
	{
		return 1;	
	};
};

FUNC VOID DIA_Hamond_Rache_Info()
{
	AI_DrawWeapon		(self);
	AI_Output (self, other, "DIA_Hamond_Rache_13_00"); //Du Verräter! Du treibst ein gefährliches und falsches Spiel. Ich glaube du brauchst mal eine Lektion.
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	AI_StopProcessInfos	( self );
	Hamond_CanTeach = 0;
};

// ------------- keine Lehre mehr -----------------

INSTANCE DIA_Hamond_verschissen (C_INFO)
{
	npc			= DIC_2501_Hamond;
	nr			= 2;
	condition		= DIA_Hamond_verschissen_Condition;
	information		= DIA_Hamond_verschissen_Info;
	permanent		= 0;
	important 		= 0;
	description		= "Was kannst du mir beibringen?";
};

FUNC INT DIA_Hamond_verschissen_Condition()
{	
	if Hamond_Amu == 2
	&& (Npc_KnowsInfo(hero,DIA_Hamond_Rache))
	{
		return 1;	
	};
};

	FUNC VOID DIA_Hamond_verschissen_Info()			//Das könnte - sollt man noch auf Leofwin ausweiten.
	{
		DIA_Hamond_Lehrer.permanent = 0;
		AI_Output (other, self, "DIA_Hamond_Lehrer_15_00"); //Was kannst du mir beibringen?
		AI_Output (self, other, "DIA_Hamond_verschissen_13_00"); //Ich kann die beibringen wie du deine Beine in die Hand nehmen kannst und ne Fliege machst!
		AI_Output (self, other, "DIA_Hamond_verschissen_13_01"); //Mach bloß das du Land gewinnst und hau ab. Mit Verrätern will ich nix zu tun haben!
		AI_StopProcessInfos	( self );
		
	};
