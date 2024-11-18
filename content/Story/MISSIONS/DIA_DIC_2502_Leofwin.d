//------------ ENDE -----------------
instance DIA_Leofwin_Exit (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 999;
	condition 	= DIA_Leofwin_Exit_Condition;
	information 	= DIA_Leofwin_Exit_Info;
	permanent 	= 1;
	description 	= DIALOG_ENDE;
	};
	
func int DIA_Leofwin_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_Leofwin_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};

//-------------------Auf Wanze aufpassen ---------------

instance DIA_Leofwin_Aufpass (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Aufpass_Condition;
	information	= DIA_Leofwin_Aufpass_Info;
	important	= 1;
	permanent 	= 0;
	};

func int DIA_Leofwin_Aufpass_Condition ()
{	
	if (Npc_GetDistToNpc(Soeldnerwanze,hero)<300)	
	&& (Npc_IsInFightMode(hero, FMODE_FAR ) || Npc_IsInFightMode(hero, FMODE_MAGIC) ||Npc_IsInFightMode (hero,FMODE_MELEE ) || Npc_IsInFightMode (hero,FMODE_FIST ))
	&& ( !Npc_KnowsInfo(hero,DIA_Leofwin_Wanzeinfo))

	{
	return 1;
	};
};	
func void DIA_Leofwin_Aufpass_Info ()
	{
	AI_Output(self,hero,"DIA_Leofwin_Aufpass_14_00"); //Hey! Steck deine Waffe ein!
	AI_RemoveWeapon (hero);
	AI_Output(hero,self,"DIA_Leofwin_Aufpass_15_01"); //Äää? Kein Problem. Ich ich wo_wollte nur mal bei dir das Ungeziefer entfernen
	};
	
//----------------------------------

instance DIA_Leofwin_Wasist (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Wasist_Condition;
	information	= DIA_Leofwin_Wasist_Info;
	permanent	= 0;
	description 	= "Was ist mit dir?";
	};

func int DIA_Leofwin_Wasist_Condition ()
{	
	if ( !Npc_KnowsInfo(hero,DIA_Leofwin_Aufpass))
	&& ( !Npc_KnowsInfo(hero,DIA_Leofwin_Wanzeinfo))
	&&  (!Npc_IsDead(Soeldnerwanze))
	{
	return 1;
	};
};	
func void DIA_Leofwin_Wasist_Info ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Wasist_15_00"); //Du siehst so betrübt aus. Kann ich dir helfen?
	AI_Output(self,hero,"DIA_Leofwin_Wasist_14_01"); //Siehst du die Wanze da? Irgendwas ist an ihr anders!
	AI_TurnToNpc(hero,Soeldnerwanze);
	AI_StopProcessInfos	( self );
	};

//----------------------------------

	
instance DIA_Leofwin_Wanzetot (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Wanzetot_Condition;
	information	= DIA_Leofwin_Wanzetot_Info;
	important	= 1;
	permanent 	= 0;

	};

func int DIA_Leofwin_Wanzetot_Condition ()
{	
	if (Npc_IsDead(Soeldnerwanze))
	&& (Npc_KnowsInfo(hero,DIA_Leofwin_Aufpass))
	&& (!Npc_KnowsInfo(hero,DIA_Hamond_Hallo))
	{
	return 1;
	};
};	
func void DIA_Leofwin_Wanzetot_Info ()
	{
	AI_DrawWeapon		(self);
	AI_Output(self,hero,"DIA_Leofwin_Wanzetot_14_00"); //Das hättest du nicht tun sollen. Nun bist du dran.
	Npc_SetTempAttitude 	(self, ATT_HOSTILE);
	AI_StopProcessInfos	( self );
	};
	

//----------------------------------

	
instance DIA_Leofwin_Wanzeinfo (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Wanzeinfo_Condition;
	information	= DIA_Leofwin_Wanzeinfo_Info;
	permanent 	= 0;
	description 	= "Ist doch nur ne Wanze?!";
	};

func int DIA_Leofwin_Wanzeinfo_Condition ()
{	
	if ( Npc_KnowsInfo(hero,DIA_Leofwin_Wasist) ||  Npc_KnowsInfo(hero,DIA_Leofwin_Aufpass))
	&&  (!Npc_IsDead(Soeldnerwanze))
	{
	return 1;
	};
};	
func void DIA_Leofwin_Wanzeinfo_Info ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Wanzeinfo_15_00"); //Wo ist das Problem mit der Wanze? Ich sehe nur Ungeziefer.
	AI_Output(self,hero,"DIA_Leofwin_Wanzeinfo_14_01"); //Siehst du nicht wie sie sich bewegt? Irgendwas ist mit der Wanze anders.
	AI_Output(hero,self,"DIA_Leofwin_Wanzeinfo_15_02"); //Also ich kann beim besten Willen nix anderes als eine Wanze sehen.
	AI_Output(self,hero,"DIA_Leofwin_Wanzeinfo_14_03"); //Hmm....ch hab einen schlimmen verdacht.
	AI_Output(hero,self,"DIA_Leofwin_Wanzeinfo_15_04"); //Soo? Ich glaube nun wird es doch interessant. Nun sprich schon.
	AI_Output(self,hero,"DIA_Leofwin_Wanzeinfo_14_05"); //Ich hab davon gehört, dass Taliasan aus Rache manchmal Leute verwandelt.
	AI_Output(self,hero,"DIA_Leofwin_Wanzeinfo_14_06"); //Und Hamond hat ihn kürzlich beleidigt. Außerdem wollte ich mich hier mit Hamond treffen.
	AI_Output(hero,self,"DIA_Leofwin_Wanzeinfo_15_07"); //Haha... und du denkst das da ist Hamond. Göörg göörg, und ich bin ein Huhn, haha.
	AI_DrawWeapon		(self);
	AI_Output(self,hero,"DIA_Leofwin_Wanzeinfo_14_08"); //Mach dich nicht lustig! Sonst werd ich dich auch wie ein Huhn aufspießen!
	AI_Output(hero,self,"DIA_Leofwin_Wanzeinfo_15_09"); //Schon gut, schon gut, ich glaub dir ja. Du hast mich überzeugt.
	AI_RemoveWeapon 	(self);
	AI_Output(self,hero,"DIA_Leofwin_Wanzeinfo_14_10"); //Wenn du hier was werden willst solltest du lernen anderen zu zuhören und gewissen Leuten Respekt zu zöllen.
	AI_Output(hero,self,"DIA_Leofwin_Wanzeinfo_15_11"); //Hmm....ja, Leofwin, du hast recht. Ich werde mich bessern.
	
	Log_CreateTopic		(WANZENQUEST, LOG_MISSION);
	B_LogEntry		(WANZENQUEST, "Leofwin vermutet, dass die Wanze in seiner Hütte Hamond ist. Verwandelt von Taliasan. Ich sollte vielleicht der Sache mal nachgehen.");
	Log_SetTopicStatus	(WANZENQUEST, LOG_RUNNING);
	};

//---------- beeindruckt hamond wieder da ------------------

	
instance DIA_Leofwin_beeindruckt (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_beeindruckt_Condition;
	information	= DIA_Leofwin_beeindruckt_Info;
	permanent 	= 0;
	important 	= 1;
	};

func int DIA_Leofwin_beeindruckt_Condition ()
{	
	if ( Npc_KnowsInfo(hero,DIA_Hamond_Hallo))
	{
	return 1;
	};
};	
func void DIA_Leofwin_beeindruckt_Info ()
	{
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_00"); //Mann, ich bin beeindruckt. Wusste garnicht, dass du sowas drauf hast?
	AI_Output(hero,self,"DIA_Leofwin_beeindruckt_15_01"); //Na ja nicht ganz. Taliasan hat mir geholfen.
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_02"); //Was, dieser Magier schon wieder.
	AI_Output(hero,self,"DIA_Leofwin_beeindruckt_15_03"); //Ja, ich hab ihn überzeugt, dass es besser wäre die Sache zu bereinigen.
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_04"); //Hmm.... wenigstens hat er mal was vernünftiges gemacht.
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_05"); //Nun kann ich wieder mit Hamond auf Patrouille gehen.
	AI_Output(hero,self,"DIA_Leofwin_beeindruckt_15_06"); //Wo patrouilliert ihr denn?
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_07"); //Zwischen der Stadt und der Mine.
	AI_Output(hero,self,"DIA_Leofwin_beeindruckt_15_08"); //Miene? Wo? welche Miene?
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_09"); //Na unsere Erzmine. Nordwestlich der Stadt. Dort wo die Rampe hinführt.
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_10"); //Wenn man mutig genug ist und was drauf hat, kann man mit der Rampe hochgefahren. Das ist aber ziemlich gefährlich.
	AI_Output(hero,self,"DIA_Leofwin_beeindruckt_15_11"); //Was soll daran schon so gefährlich sein?     
	AI_Output(self,hero,"DIA_Leofwin_beeindruckt_14_12"); //Unterschätz das nicht. Man muss ständig seine Position auf der Kiste halten und wenn man da abstürzt überlebt man das nur selten.
	B_LogEntry		(WANZENQUEST, "Leofwin war beeindruck, wie ich Hamond geholfen hatte. Nun können beide wieder zur Mine patrouillieren und zurück.");
	Log_SetTopicStatus	(WANZENQUEST, LOG_SUCCESS);
	B_GiveXP(200);
	Npc_ExchangeRoutine (self,"patroul");
	Npc_ExchangeRoutine (DIC_2501_Hamond,"patroul");
	};
	
//---------- Mutprobe ------------------

	
instance DIA_Leofwin_Rampe (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Rampe_Condition;
	information	= DIA_Leofwin_Rampe_Info;
	permanent 	= 0;
	description 	= "Das mit der Rampe kann ich auch.";
	};

func int DIA_Leofwin_Rampe_Condition ()
{	
	if ( Npc_KnowsInfo(hero,DIA_Leofwin_beeindruckt))
	{
	return 1;
	};
};	
func void DIA_Leofwin_Rampe_Info ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Rampe_15_00"); //Also, so'n bissel Rampe hochfahren? Ha, das kann ich auch!
	AI_Output(self,hero,"DIA_Leofwin_Rampe_14_01"); //Du nimmst den Mund ziemlich voll. Das solltest du dir noch mal überlegen!
	AI_Output(self,hero,"DIA_Leofwin_Rampe_14_02"); //Aber wenn du es doch schaffst, dann bist du würdig für eine weiter Ausbildung.
	AI_Output(hero,self,"DIA_Leofwin_Rampe_15_03"); //Ahja, und was kannst du mir beibringen?
	AI_Output(self,hero,"DIA_Leofwin_Rampe_14_04"); //Ich kann dich in die Kunst der Akrobatik unterweisen.
	
	Log_CreateTopic		(MUTPROBE, LOG_MISSION);
	B_LogEntry		(MUTPROBE, "Leofwin kann mich in Akrobatik unterweisen, wenn ich mutig genug bin mit der Rampe nach oben zu fahren.");
	Log_SetTopicStatus	(MUTPROBE, LOG_RUNNING);
	
		Info_AddChoice(DIA_Leofwin_Rampe, "Ich schaff das", DIA_Leofwin_Rampe_ja);
		Info_AddChoice(DIA_Leofwin_Rampe, "Ist mir doch zu gefährlich", DIA_Leofwin_Rampe_nein);
	};
	
func void DIA_Leofwin_Rampe_ja ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Rampe_ja_15_00"); //Ich bin gut genug diese Mutprobe zu bestehen.
	AI_Output(self,hero,"DIA_Leofwin_Rampe_ja_14_01"); //Du willst es also unbedingt wissen?!
	AI_Output(hero,self,"DIA_Leofwin_Rampe_ja_15_02"); //Ja!
	AI_Output(self,hero,"DIA_Leofwin_Rampe_ja_14_03"); //Wie du willst. Die Sache läuft folgendermaßen ab:
	AI_Output(self,hero,"DIA_Leofwin_Rampe_ja_14_04"); //Ich patrouilliere mit Hamond zur Mine. wir sind jeweils mittags dort oben und bleiben da eine Stunde.
	AI_Output(self,hero,"DIA_Leofwin_Rampe_ja_14_05"); //Ich werde aufpassen. Wenn ich dich die Rampe raufkommen sehe hast du es geschafft.
	AI_Output(hero,self,"DIA_Leofwin_Rampe_ja_15_06"); //Das wirst du.
	Info_ClearChoices (DIA_Leofwin_Rampe);
	B_LogEntry		(MUTPROBE, "Ich hab das Angebot angenommen und werde die Mutprobe bestehen.");
	Leofwin_Mutprobe = 1;
	};
	
func void DIA_Leofwin_Rampe_nein ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Rampe_nein_15_00"); //Ich glaube das ist mir doch etwas zu gefährlich. Ich werde es lassen. 
    AI_Output(self,hero,"DIA_Leofwin_Rampe_nein_14_01"); //Dachte ich mir schon, dass du kneifst. Das ist eben nur was für richtige Männer.
	Info_ClearChoices (DIA_Leofwin_Rampe);
	B_LogEntry		(MUTPROBE, "Die Mutprobe ist mir doch zu gefährlich. Ich werde es doch lieber lassen");
	Log_SetTopicStatus	(MUTPROBE, LOG_FAILED);
	};
	
//---------- bis dann ------------------

	
instance DIA_Leofwin_patroulgo (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_patroulgo_Condition;
	information	= DIA_Leofwin_patroulgo_Info;
	permanent 	= 0;
	important 	= 1;
	};

func int DIA_Leofwin_patroulgo_Condition ()
{	
	if ( Npc_KnowsInfo(hero,DIA_Leofwin_Rampe))
	{
	return 1;
	};
};	
func void DIA_Leofwin_patroulgo_Info ()
	{
	AI_Output(self,hero,"DIA_Leofwin_patroulgo_14_00"); //Na dann. Wir sehen uns dann irgendwann mal kurtz nach Mittag oben bei der Rampe.
	AI_Output(hero,self,"DIA_Leofwin_patroulgo_15_01"); //Jo, wir sehe'n uns.
	AI_StopProcessInfos	( self );
	};


//---------- Mutprobe geschafft ? ---------------
	
instance DIA_Leofwin_Mutprobe (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Mutprobe_Condition;
	information	= DIA_Leofwin_Mutprobe_Info;
	permanent 	= 1;
	description 	= "Mutprobe bestanden.";
	};

func int DIA_Leofwin_Mutprobe_Condition ()
{	
	if (Leofwin_Mutprobe == 2)||(Leofwin_Mutprobe == 3)
	{
	return 1;
	};
};	
func void DIA_Leofwin_Mutprobe_Info ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Mutprobe_15_00"); //Ich hab es geschafft!
		
		if Leofwin_Mutprobe == 2
			{
			AI_Output(self, hero, "DIA_Leofwin_Mutprobe_14_00"); //Was hast du geschafft?
			AI_Output(hero, self, "DIA_Leofwin_Mutprobe_15_01"); //Na mit der Rampe. Ich bin mit der Kiste auf der Rampe bis hoch gefahren.
			AI_Output(self, hero, "DIA_Leofwin_Mutprobe_14_02"); //Ach so? Aber ich war gerade nicht da. Ich hatte dir doch gesagt. Wir sind gegen Mittag oben.
			AI_Output(self, hero, "DIA_Leofwin_Mutprobe_14_03"); //Ich muss das schon sehen, sonst zählt das nicht.
			AI_Output(hero, self, "DIA_Leofwin_Mutprobe_15_04"); //Hmm....
			Leofwin_Mutprobe = 1;
			B_LogEntry		(MUTPROBE, "Verdammt, nun hat er das nicht gesehen und ich muss das noch mal machen.");
			}
		
		else
			{
			AI_Output(self, hero, "DIA_Leofwin_Mutprobe_14_05"); //Ja, ich hab es gesehen. Du hast es geschafft. Ich hätte gedacht du kneifst.
			AI_Output(hero, self, "DIA_Leofwin_Mutprobe_15_06"); //Nein, ich hab's dir js gesagt, dass ich es schaffen kann. Aber schwer war es trotz dem.
			AI_Output(self, hero, "DIA_Leofwin_Mutprobe_14_07"); //Das hab ich mitbekommen. Du hast ganz schön gewackelt auf der Kiste.
			AI_Output(self, hero, "DIA_Leofwin_Mutprobe_14_08"); //Aber damit du so was in Zukunft besser beherrschst würde ich dir nun wie versprochen die Kunst der Akrobatik beibringen.
			B_GiveXP(800);
			B_LogEntry		(MUTPROBE, "Ja wohl!! Ich hab's geschafft.");
			Log_SetTopicStatus	(MUTPROBE, LOG_SUCCESS);
			Leofwin_Mutprobe = 8;
			Log_CreateTopic 	(LehrerStadt,LOG_NOTE);
			B_LogEntry		(LehrerStadt,"Leofwin kann mit die Kunst der Akrobatik beibringen.");
			DIA_Leofwin_Mutprobe.permanent 	= 0;
			};
	};
	
//---------- Akrobatik ? ---------------
	
instance DIA_Leofwin_Acrobatik (C_INFO)
	{
	npc 		= DIC_2502_Leofwin;
	nr 		= 1;
	condition 	= DIA_Leofwin_Acrobatik_Condition;
	information	= DIA_Leofwin_Acrobatik_Info;
	permanent 	= 1;
	description 	= "Akrobatik lernen.";
	};

func int DIA_Leofwin_Acrobatik_Condition ()
{	
	if (Leofwin_Mutprobe == 8)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0)
	{
	return 1;
	};
};	
func void DIA_Leofwin_Acrobatik_Info ()
	{
	AI_Output(hero,self,"DIA_Leofwin_Acrobatik_15_00"); //Bring mit dei Kunst der Akrobatik bei.
		if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
		{
			AI_Output (self, other,"DIA_Leofwin_Acrobatik_02_02"); //Wenn du deinen Körper beherrscht, bist du in der Lage viel weiter zu springen. 
			AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Du lernst dich richtig abzurollen und aus dem Fall heraus richtig zu landen. Aber denk daran, du bist nicht unsterblich!
			AI_Output (self, other,"DIA_Leofwin_Acrobatik_02_04"); //Auch im Kampf ist Akrobatik sehr hilfreich. Du kannst deinen Abstand zum Gegner sehr schnell verändern. Viel Glück! 
		};
	};
	
		
