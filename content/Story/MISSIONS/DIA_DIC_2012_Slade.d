//------------ ENDE -----------------
instance DIA_DIC_Slade_Exit (C_INFO)
	{
	npc = DIC_2012_Slade;
	nr = 999;
	condition = DIA_DIC_Slade_Exit_Condition;
	information = DIA_DIC_Slade_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Slade_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Slade_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// -------- will Buch -------------
instance DIA_DIC_Slade_Buch (C_INFO)
	{
	npc = DIC_2012_Slade;
	nr = 1;
	condition = DIA_DIC_Slade_Buch_Condition;
	information = DIA_DIC_Slade_Buch_Info;
	permanent = 0;
	description = "Warte einen Moment";
	};

func int DIA_DIC_Slade_Buch_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Taliasan_Annehmen))
		{
		return 1;
		};
	};

func void DIA_DIC_Slade_Buch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_00"); //Hey. Warte einen Moment.
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_01"); //Was ist los?
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_02"); //Du musst mir helfen.
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_03"); //Wie kann ich dir helfen? Soll ich dir was aus dem Ausland mitbringen? Das geht nicht, au�erdem... ich komme wahrscheinlich erst in drei, vier Monaten wieder zur�ck. 
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_04"); //Ich m�chte...
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_05"); //Nein. Nein. Nein. Das geht auf gar keinen Fall. Begleiten kannst du mich nicht. Berengar hat mir ausdr�cklich untersagt, jemanden mitzunehmen.
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_06"); //Ich muss aber f�r dich arbeiten.
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_07"); //Ich sagte doch schon, dass du mich nicht begleiten kannst. Und wenn nicht an meiner Seite, wie sonst k�nntest etwas f�r mich tun?
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_08"); //Es ist so. Ich brauche einen Brief von dir, dringend. Der Brief soll an Berengar gerichtet sein. In dem Brief soll das magische K�nnen Taliasans ger�hmt werden.
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_09"); //F�r Taliasan? F�r geizigen Charlatan, soll ich etwas tun?
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_10"); //Ohne diesen Brief kann ich Graveyarns Pr�fungen nicht ablegen, und wenn ich die Pr�fungen nicht bestehe, wird mir jeder hier im Lager das Leben zur H�lle machen. 
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_11"); //Das Leben ist hart. Wenn du diese Pr�fungen nicht bestehst, sei dir sicher, es kommen andere.
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_12"); //Wieso kannst du Taliasan nicht leiden?
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_13"); //Ich habe mir von ihm ein Buch gew�nscht. Er hatte es schon l�ngst ausgemustert. Es hei�t "Die Anf�nge der Magie". Doch er verkaufte es mir nicht, einfach nur so, um sich daraus einen Spa� zu machen! Er hat mich fast betteln lassen, aber bekommen habe ich es trotzdem nicht.
	AI_Output (other, self, "DIA_DIC_Slade_Buch_15_14"); //Wenn ich dir das Buch besorge, hilfst du mir dann?
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_15"); //Ja. (zu sich selbst, fl�sternd) Berengar w�rde ein einzelner Brief niemals gen�gen, deswegen n�tzt es Taliasan auch nichts...
	AI_Output (self, other, "DIA_DIC_Slade_Buch_06_16"); //(laut) Beeil dich Junge: Ich werde den Brief schon mal schreiben, damit du ihn sofort an dich nehmen kannst. Dann verliere ich nicht noch mehr Zeit. 

	Log_CreateTopic (SladeQuest,  LOG_MISSION);
	Log_SetTopicStatus (SladeQuest, LOG_RUNNING);
	B_LogEntry (SladeQuest, "Um den Brief von Slade zu erhalten, soll ich ein Buch aus Taliasans Arbeitszimmer besorgen. Es hei�t Anf�nge der Magie.");
	};

// -------- Falsches Buch -------------
instance DIA_DIC_Slade_FalschesBuch (C_INFO)
	{
	npc = DIC_2012_Slade;
	nr = 2;
	condition = DIA_DIC_Slade_FalschesBuch_Condition;
	information = DIA_DIC_Slade_FalschesBuch_Info;
	permanent = 0;
	description = "Hier ist das Buch!";
	};

func int DIA_DIC_Slade_FalschesBuch_Condition ()
	{
	if ((Npc_HasItems(other, Ta_Buch) >= 1) && !(Npc_KnowsInfo(other, DIA_DIC_Slade_Wein))
		&& Npc_KnowsInfo(other, DIA_DIC_Slade_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Slade_FalschesBuch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Slade_FalschesBuch_15_00"); //Hier ist das Buch!
	AI_Output (self, other, "DIA_DIC_Slade_FalschesBuch_06_01"); //"Ankl�nge der Manie"? Sehe ich aus, als br�uchte ich das? Du versuchst doch nicht, mich reinzulegen, oder? Also, beschaffe das Magie-Buch. Ich muss bald aufbrechen. Wenn du dich nicht beeilst, kommen wir nicht mehr ins Gesch�ft.
	
	B_LogEntry (SladeQuest, "Slade will das falsche Buch so nicht haben...");
	};

// -------- Falsches Buch + Wein -------------
instance DIA_DIC_Slade_Wein (C_INFO)
	{
	npc = DIC_2012_Slade;
	nr = 3;
	condition = DIA_DIC_Slade_Wein_Condition;
	information = DIA_DIC_Slade_Wein_Info;
	permanent = 0;
	description = "Ich hab das Buch und noch etwas...";
	};

func int DIA_DIC_Slade_Wein_Condition ()
	{
	if ((Npc_HasItems(other, Ta_Buch) >= 1) && (Npc_HasItems(other, Doomtre) >= 1)
			&& Npc_KnowsInfo(other, DIA_DIC_Slade_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Slade_Wein_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Slade_Wein_15_00"); //Ich hab das Buch und noch etwas...
	AI_Output (self, other, "DIA_DIC_Slade_Wein_06_01"); //Was denn?
	AI_Output (other, self, "DIA_DIC_Slade_Wein_15_02"); //Berengar hat mir einen Wein f�r dich pers�nlich mitgegeben. Ein Abschiedsgeschenk. Berengar sagte, du kannst Gl�ck gebrauchen. Er empfiehlt dir, nach altem Brauch, auf das Gelingen deiner Mission anzusto�en. 
	AI_Output (self, other, "DIA_DIC_Slade_Wein_06_03"); //Ich wusste gar nicht, dass Berengar altes Brauchtum pflegt, aber man lernt ja nie aus. Na dann mal her damit. 

	B_GiveInvItems(other, self,Doomtre,1);
	AI_UseItem(self, Doomtre);

	AI_Output (self, other, "DIA_DIC_Slade_Wein_06_04"); //ahh... guter Tropfen.
	AI_Output (other, self, "DIA_DIC_Slade_Wein_15_05"); //Hier ist das Buch...

	B_GiveInvItems(other, self,Ta_Buch,1);

	AI_Output (self, other, "DIA_DIC_Slade_Wein_06_06"); //Ja, endlich hab ich es! Die "Anf�nge der Magie". Hier dein Brief.
	B_GiveInvItems(self, other,Sl_Empf,1);

	B_GiveXP (500);
	
	B_LogEntry (SladeQuest, "Ich habe Slade das falsche Buch samt einem Wein gegeben und daf�r den Brief erhalten.");
	Log_SetTopicStatus (SladeQuest, LOG_SUCCESS);
	};