//------------ ENDE -----------------
instance DIA_DIC_Kamakk_Exit (C_INFO)
	{
	npc = DIC_2014_Kamakk;
	nr = 999;
	condition = DIA_DIC_Kamakk_Exit_Condition;
	information = DIA_DIC_Kamakk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Kamakk_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Kamakk_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

// ------------- Brauch starke Droge ----------------
INSTANCE DIA_DIC_Kamakk_Wein (C_INFO)
	{
	npc = dic_2014_Kamakk;
	nr = 1;
	condition = DIA_DIC_Kamakk_Wein_Condition;
	information = DIA_DIC_Kamakk_Wein_Info;
	permanent = 1;
	description = "Ich brauch einen starken Tropfen.";
	};

func int DIA_DIC_Kamakk_Wein_Condition ()
	{
	if  (Npc_HasItems(other, Ta_Buch) >= 1 && Npc_KnowsInfo(other, DIA_DIC_Slade_Buch))
		{
		return 1;
		};
	};

func void DIA_DIC_Kamakk_Wein_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Wein_15_00"); //Hey Karmakk. Ich brauch einen starken Tropfen. Etwas, das nach dem ersten Schluck schon reinhaut.
	AI_Output (self, other, "DIA_DIC_Kamakk_Wein_01_01"); //Da hab ich was. Doomtré. Ein ganz besonderer Wein. Ich geb dir mal eine Probeflasche. Die ist auch nicht so teuer. Hast du die 80 Silber dafür?

	Info_AddChoice (DIA_DIC_Kamakk_Wein, "Ja hier.", DIA_DIC_Kamakk_Kaufen);
	Info_AddChoice (DIA_DIC_Kamakk_Wein, "Nein.", DIA_DIC_Kamakk_Ablehnen);
	};

func void DIA_DIC_Kamakk_Kaufen ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Kaufen_15_00"); //Ja hier.

	if (Npc_HasItems(other, ItMiNugget) >= 80)
		{
		CreateInvItem	(self, Doomtre);
		B_GiveInvItems(other, self,itminugget,80);
		B_GiveInvItems(self, other,Doomtre,1);
		B_GiveXP (150);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Kamakk_Kaufen_01_01"); //Verarsch mich nicht!
		};

	Info_ClearChoices (DIA_DIC_Kamakk_Wein);
	AI_StopProcessInfos (self);
	};

func void DIA_DIC_Kamakk_Ablehnen ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Ablehnen_15_00"); //Nein.
	AI_Output (self, other, "DIA_DIC_Kamakk_Ablehnen_01_01"); //Dann komm wieder, wenn du sie hast!

	Info_ClearChoices (DIA_DIC_Kamakk_Wein);
	AI_StopProcessInfos (self);
	};

// ---------- Du suchst Scavhorn ------------
instance DIA_DIC_Kamakk_Horn (C_INFO)
	{
	npc = DIC_2014_Kamakk;
	nr = 2;
	condition = DIA_DIC_Kamakk_Horn_Condition;
	information = DIA_DIC_Kamakk_Horn_Info;
	permanent = 0;
	important = 0;
	description = "Du vermisst ein Ruf Horn für Scavenger?";
	};

func int DIA_DIC_Kamakk_Horn_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Alwin_Horn))
		{
		return 1;
		};
	};

func void DIA_DIC_Kamakk_Horn_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Horn_15_00"); //Ich habe gehört du hast ein Ruf-Horn für Scavenger verloren?
	AI_Output (self, other, "DIA_DIC_Kamakk_Horn_01_01"); //Ja das stimmt. Hast du es?
	
	B_LogEntry (KarmakkHorn, "Kamakk sucht wirklich das magische Horn.");
	};

// ------- Junge hat schon Horn --------
instance DIA_DIC_Kamakk_Besitzt (C_INFO)
	{
	npc = DIC_2014_Kamakk;
	nr = 3;
	condition = DIA_DIC_Kamakk_Besitzt_Condition;
	information = DIA_DIC_Kamakk_Besitzt_Info;
	permanent = 0;
	important = 0;
	description = "Ja hier ist es.";
	};

func int DIA_DIC_Kamakk_Besitzt_Condition ()
	{
	if (Npc_HasItems(other, ScavHorn) >= 1 && !(Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Suchen)) && Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Horn))
		{
		return 1;
		};
	};

func void DIA_DIC_Kamakk_Besitzt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Besitzt_15_00"); //Ja hier.ist es.
	AI_Output (self, other, "DIA_DIC_Kamakk_Besitzt_01_01"); //Oh, vielen Dank. Dieses Horn vermisse ich schon lange. Ich werde dich dafür belohnen. 

	B_GiveInvItems(other, self,ScavHorn,1);
	CreateInvItem	(self, Doomtre);
	CreateInvItem	(self, ItMw_1H_Sword_Long_01);
	B_GiveInvItems(self, other,itminugget,80);
	B_GiveInvItems(self, other,Doomtre,1);
	B_GiveInvItems(self, other,ItMw_1H_Sword_Long_01,1);
	B_GiveXP (500);
	
	B_LogEntry (KarmakkHorn, "Ich habe Karmakk das Horn gegeben und dafür eine große Belohnung bekommen.");
	Log_SetTopicStatus (KarmakkHorn, LOG_SUCCESS);
	};

// ------- Junge muss Horn erst suchen ---------
instance DIA_DIC_Kamakk_Suchen (C_INFO)
	{
	npc = DIC_2014_Kamakk;
	nr = 4;
	condition = DIA_DIC_Kamakk_Suchen_Condition;
	information = DIA_DIC_Kamakk_Suchen_Info;
	permanent = 0;
	important = 0;
	description = "Nein, aber ich will es für dich suchen.";
	};

func int DIA_DIC_Kamakk_Suchen_Condition ()
	{
	if (!(Npc_HasItems(other, ScavHorn) >= 1) && !(Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Besitzt)) && Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Horn))
		{
		return 1;
		};
	};

func void DIA_DIC_Kamakk_Suchen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Suchen_15_00"); //Nein. aber ich will es für dich suchen, wenn ich eine kleine Belohnung dafür bekomme.
	AI_Output (self, other, "DIA_DIC_Kamakk_Suchen_01_01"); //Gut. Wenn du es mir bringst, werde ich dir das vergüten. Das Horn habe ich vermutlich in der Nähe des Hochsitzes verloren. Wenn du es suchst, sei gewarnt: Wölfe lungern dort herum. 

	AI_StopProcessInfos (self);
	};

// ------- Junge muss Horn erst suchen ---------
instance DIA_DIC_Kamakk_Tun (C_INFO)
	{
	npc = DIC_2014_Kamakk;
	nr = 5;
	condition = DIA_DIC_Kamakk_Tun_Condition;
	information = DIA_DIC_Kamakk_Tun_Info;
	permanent = 0;
	important = 0;
	description = "Ich konnte das Horn nicht finden.";
	};

func int DIA_DIC_Kamakk_Tun_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Suchen))
		{
		return 1;
		};
	};

func void DIA_DIC_Kamakk_Tun_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Tun_15_00"); //Ich konnte das Horn nicht finden. Was soll ich tun?
	AI_Output (self, other, "DIA_DIC_Kamakk_Tun_01_01"); //Wenn das Horn dort nicht liegt, vielleicht hat es jemand im Lager. Angeblich sollen einige Wanderer hier lebensmüde durch die Gegend streunen. Möglich, dass es einer von denen gefunden hat.
	};

// ------------ Junge hat Horn besorgt -------------
instance DIA_DIC_Kamakk_Besorgt (C_INFO)
	{
	npc = DIC_2014_Kamakk;
	nr = 6;
	condition = DIA_DIC_Kamakk_Besorgt_Condition;
	information = DIA_DIC_Kamakk_Besorgt_Info;
	permanent = 0;
	important = 0;
	description = "Hier, ich habe das Scavenger Horn gefunden.";
	};

func int DIA_DIC_Kamakk_Besorgt_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Kamakk_Suchen) && (Npc_HasItems(other, ScavHorn) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Kamakk_Besorgt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Kamakk_Besorgt_15_00"); //Hier, ich habe das Scavenger Horn gefunden.
	AI_Output (self, other, "DIA_DIC_Kamakk_Besorgt_01_01"); //Gut, dann kann ich bald wieder auf die Jagd gehen. Wein zu verkaufen ist zwar schön, doch ein wenig Abwechslung kann nicht schaden, und nach einer gelungen Jagd schmeckt der Wein sowieso viel besser... 
	
	B_GiveInvItems(other, self,ScavHorn,1);
	CreateInvItem	(self, Doomtre);
	CreateInvItem	(self, ItMw_1H_Sword_Long_01);
	B_GiveInvItems(self, other,itminugget,80);
	B_GiveInvItems(self, other,Doomtre,1);
	B_GiveInvItems(self, other,ItMw_1H_Sword_Long_01,1);
	B_GiveXP (750);
	
	B_LogEntry (KarmakkHorn, "Ich habe Karmakk das Horn gegeben und dafür eine große Belohnung bekommen.");
	Log_SetTopicStatus (KarmakkHorn, LOG_SUCCESS);
	};