// -------------- Exit --------------


INSTANCE DIA_dic_Taliasan_Exit (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 999;
	condition = DIA_dic_Taliasan_Exit_Condition;
	information = DIA_dic_Taliasan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_dic_Taliasan_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_dic_Taliasan_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ----------------- Hi / keine Info ---------------------

instance DIA_dic_Taliasan_Hi (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_dic_Taliasan_Hi_Condition;
	information = DIA_dic_Taliasan_Hi_Info;
	permanent = 0;
	important = 1;
	};

func int DIA_dic_Taliasan_Hi_Condition()
	{
	if (!Npc_KnowsInfo(hero, DIA_DIC_Alwin_THilfe)
		&& !Npc_KnowsInfo(hero,DIA_Leofwin_Wanzeinfo))
		{
		return 1;
		};
	};

func void DIA_dic_Taliasan_Hi_Info()
	{
	AI_Output (self, other, "DIA_dic_Taliasan_Hi_03_00"); //Was willst du?
	AI_Output (other, self, "DIA_DIC_2052_Waechter_Nichts_15_01"); //Nichts.
	AI_Output (self, other, "DIA_dic_Taliasan_Hi_03_02"); //Dann verschwinde!
	AI_StopProcessInfos	(self);
	};


// ----------------- Hi / mit Info ---------------------

instance DIA_dic_Taliasan_Wasist (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_dic_Taliasan_Wasist_Condition;
	information = DIA_dic_Taliasan_Wasist_Info;
	permanent = 0;
	important = 1;
	};

func int DIA_dic_Taliasan_Wasist_Condition()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Alwin_THilfe)) || ((Npc_KnowsInfo(hero,DIA_Leofwin_Wanzeinfo)) && (!Npc_IsDead(Soeldnerwanze)))
	&& (!Npc_KnowsInfo(hero, DIA_dic_Taliasan_Hi))
		{
		return 1;
		};
	};

func void DIA_dic_Taliasan_Wasist_Info()
	{
	AI_Output (self, other, "DIA_dic_Taliasan_03_00"); //Was willst du?
	if (!Npc_KnowsInfo(other, DIA_Taliasan_Soeldnerwanze))
		{
		AI_Output (self, other, "DIA_dic_Taliasan_03_02"); //Woher kennst du mich? Wer hat dich geschickt und was weißt du über mich? Was willst du hier?
		};
	};

// ----------------- Hilfe ---------------------

instance DIA_dic_Taliasan_Hallo (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_dic_Taliasan_Hallo_Condition;
	information = DIA_dic_Taliasan_Hallo_Info;
	permanent = 0;
	description ="Hilfe wegen Aufträge";
	};

func int DIA_dic_Taliasan_Hallo_Condition()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Alwin_THilfe) && !(Npc_KnowsInfo(hero, DIA_DIC_Graveyarn_Repariert)))
		{
		return 1;
		};
	};


func void DIA_dic_Taliasan_Hallo_Info()
	{
	//AI_Output (self, other, "DIA_dic_Taliasan_03_00"); //Was willst du?
	AI_Output (other, self, "DIA_dic_Taliasan_15_01"); //Ich brauche deine Hilfe.
	//AI_Output (self, other, "DIA_dic_Taliasan_03_02"); //Woher kennst du mich? Wer hat dich geschickt und was weißt du über mich? Was willst du hier?
	AI_Output (other, self, "DIA_dic_Taliasan_15_03"); //Ich soll für Graveyarn einige Aufträge erledigen und da...
	AI_Output (self, other, "DIA_dic_Taliasan_03_04"); //Wenn Graveyarn dich geschickt hat, dann verschwinde hier, hau ab.
	AI_Output (other, self, "DIA_dic_Taliasan_15_05"); //Nein, Graveyarn weiß nicht, dass ich hier bin. Seine Aufträge sind meine Prüfungen, und ich kann mir keine Fehler erlauben. Ich nehme jede Hilfe an. Alwin riet mir, nicht zu dir zu gehen. Er glaubt, dass du schnell ein falsches Spiel mit einem treibst.
	AI_Output (other, self, "DIA_dic_Taliasan_15_06"); //Und Alwin sagte mir, du könntest mir vielleicht helfen. Aber er sagte auch, dass ich nicht zu dir gehen sollte. Er glaubt, dass du schnell ein falsches Spiel mit einem treibst.
	AI_Output (self, other, "DIA_dic_Taliasan_03_07"); //Gut Junge. Du bist ehrlich. Graveyarns Schinderaufträge kenne ich noch von anderen Schülern. Was Alwin sagt ist das, was alle hier über mich denken. Diese Dummköpfe... also du willst meine Hilfe. Gut.
	AI_Output (self, other, "DIA_dic_Taliasan_03_08"); //Wenn ich dir helfen soll, wirst du mir auch helfen. Fangen wir mit dir an: Was erwartest du von mir?
	AI_Output (other, self, "DIA_dic_Taliasan_15_09"); //Vielleicht kannst du mir einige Zauber geben, die mich stärker und geschickter machen.
	AI_Output (self, other, "DIA_dic_Taliasan_03_10"); //Hm. Stärker und geschickter... hm hm. Hör zu. Ich mache dir einen Vorschlag. Anstatt das du für Graveyarn Prüfungen ablegst, wirst du für mich drei Aufträge erledigen.
	AI_Output (self, other, "DIA_dic_Taliasan_03_11"); //Gelingt es dir, werde ich dir etwas geben, was Graveyarn beeindrucken wird. Prüfungen brauchst du dann nicht mehr für ihn bestehen, das verspreche ich dir. Denn für Graveyarn wird es so sein, als hättest du sie bestanden.
	AI_Output (other, self, "DIA_dic_Taliasan_15_12"); //Das klingt nicht nach einem ehrlichen Weg.
	AI_Output (self, other, "DIA_dic_Taliasan_03_13"); //Nein, dieser Weg ist nicht ehrlich. Aber er verspricht dir den Erfolg. Und bedenke eines: Wenn du meine Aufgaben nicht bewältigst, werde ich dich nicht fallen lassen, so wie Graveyarn es tun würde.
	AI_Output (self, other, "DIA_dic_Taliasan_03_14"); //Wenn du meinem Weg folgst, wirst du nicht nur Graveyarn dazu bringen, dich bei Berengar in den höchsten Tönen zu loben, sondern du wirst außerdem einige starke Zauber von mir erhalten. Zauber, mit denen du dir Respekt im Lager verschaffen kannst. 
	AI_Output (self, other, "DIA_dic_Taliasan_03_15"); //Und wer weiß, vielleicht wirst du ohne meine Zauber den bald anstehenden Prüfungen Berengars nicht gewachsen sein.
	};

// ----------------------- Annehmen -----------------

instance DIA_dic_Taliasan_Annehmen (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 2;
	condition = DIA_dic_Taliasan_Annehmen_Condition;
	information = DIA_dic_Taliasan_Annehmen_Info;
	permanent = 0;
	important = 0;
	description ="Ich werde annehmen.";
	};

func int DIA_dic_Taliasan_Annehmen_Condition()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Taliasan_Hallo) && !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_RepariertJa)
		&& !Npc_KnowsInfo(other, DIA_dic_Taliasan_Ablehnen))
		{
		return 1;
		};
	};

func int DIA_dic_Taliasan_Annehmen_Info()
	{
	AI_Output (other, self, "DIA_dic_Taliasan_Annehmen_15_00"); //Auch wenn es ein Risiko ist: Ich werde für dich arbeiten. Was soll ich tun?
	AI_Output (self, other, "DIA_dic_Taliasan_Annehmen_03_01"); //Gut. Wie alle hier, möchte auch ich wieder in Berengars Ansehen steigen. Ich will wieder für ihn arbeiten.
	AI_Output (self, other, "DIA_dic_Taliasan_Annehmen_03_02"); //Doch Maldive, der verlogene Bastard, steht im Dienste Berengars. Doch gibt es drei Leute hier, die großen Einfluss auf unseren Anführer haben. Sie gelten als seine persönlichen Berater. Und sie könnten mir helfen.
	AI_Output (other, self, "DIA_dic_Taliasan_Annehmen_15_03"); //Wer sind diese Leute?
	AI_Output (self, other, "DIA_dic_Taliasan_Annehmen_03_04"); //Raffa, Pyt und Slade. Biete ihnen deine Hilfe an und sage, dass du für sie arbeitest, wenn sie bei Berengar ein gutes Wort für mich einlegen. 
	AI_Output (other, self, "DIA_dic_Taliasan_Annehmen_15_05"); //Was könnte ich schon für diese Männer tun? Ich schätze, sie pflegen ihre Arbeit selbst zu erledigen. Oder sie haben Handlanger, die für sie schuften.
	AI_Output (self, other, "DIA_dic_Taliasan_Annehmen_03_06"); //Das kann alles sein. Aber glaub mir, sie haben immer irgendwelche Pläne, bei denen ihn ein unschuldig wirkender Jugendlicher wie du gerade gerufen kommt. Niemand würde vermuten, dass du in ein unsauberes Geschäft verwickelt bist, und diesen Vorteil werden sie nutzen. 
	AI_Output (other, self, "DIA_dic_Taliasan_Annehmen_15_07"); //Gut. Ich werde es versuchen.
	AI_Output (self, other, "DIA_dic_Taliasan_Annehmen_03_08"); //Allerdings habe ich nur dann einen Nutzen davon, wenn du anstatt des Lohns, jeden von ihnen einen Brief schreiben lässt. Einen Brief, in dem sie meine Fähigkeiten loben. 

	Log_CreateTopic (TaliasansNeueAuftraege,  LOG_MISSION);
	Log_SetTopicStatus (TaliasansNeueAuftraege, LOG_RUNNING);
	B_LogEntry (TaliasansNeueAuftraege, "Taliasan bietet seine Hilfe an. Allerdings soll ich für ihn drei Aufträge erledigen. Die Prüfungen Graveyarns werde ich dadurch ebenfalls gemeistert haben. Was er genau damit meint weiß ich nicht. Taliasan sagt, dass ich Raffa, Pyt und Slade aufsuchen soll. Ihnen soll ich helfen und von jedem der drei mir einen Brief als Lohn mitgeben lassen. In den Briefen soll Taliasan vor Berengar lobend erwähnt werden.");
	
	B_LogEntry (GY_PR_1, "Da ich nun für Taliasan arbeite, brauche ich die Rampe nicht mehr reparieren. Das werden die beiden Arbeiter auch ohne mich schaffen.");
	TaliasanAuftraege = 1;
	B_GiveXP (250);
	Npc_ExchangeRoutine	(DIC_2015_Arbeiter,"TALIASAN");
	Npc_ExchangeRoutine	(DIC_2016_Arbeiter,"TALIASAN");
	Npc_ExchangeRoutine	(DIC_2012_Slade,"TALIASAN");
	RampeRepariert = 5; 
	CreateInvItem (Dic_2034_Homer, Graveyarn_Karte);
	};

// --------------- Ablehnen ---------------

instance DIA_dic_Taliasan_Ablehnen (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 3;
	condition = DIA_dic_Taliasan_Ablehnen_Condition;
	information = DIA_dic_Taliasan_Ablehnen_Info;
	permanent = 0;
	important = 0;
	description = "Ich werde nicht für dich arbeiten.";
	};

func int DIA_dic_Taliasan_Ablehnen_Condition()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Taliasan_Hallo) && !(Npc_KnowsInfo(hero, DIA_DIC_Taliasan_Annehmen))
		&& !Npc_KnowsInfo(other, DIA_DIC_Graveyarn_RepariertJa))
		{
		return 1;
		};
	};


func void DIA_dic_Taliasan_Ablehnen_Info()
	{
	AI_Output (other, self, "DIA_dic_Taliasan_Ablehnen_15_00"); //Das ist mir alles zu undurchsichtig.  Für dich will ich nicht arbeiten.
	AI_Output (self, other, "DIA_dic_Taliasan_Ablehnen_03_01"); //Dann solltest du jetzt gehen. Erzählst du irgendjemandem von meinem Angebot, wirst du es bereuen. Wenn ich wütend bin, unterscheide ich nicht zwischen Zauber gegen Erwachsene oder jüngere Menschen. 
	};

// -------- Robe dabei ---------------
instance DIA_DIC_Taliasan_Robe (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 4;
	condition = DIA_DIC_Taliasan_Robe_Condition;
	information = DIA_DIC_Taliasan_Robe_Info;
	permanent = 0;
	description = "Ich habe eine Robe für dich.";
	};

func int DIA_DIC_Taliasan_Robe_Condition ()
	{
	if (Npc_HasItems(other, Snd_Robe) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Robe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Robe_15_00"); //Taliasan, ich habe eine Robe für dich. Ein Geschenk.
	AI_Output (self, other, "DIA_DIC_Taliasan_Robe_03_01"); //Laufe ich nackt rum? Brauche ich eine Robe? Du verschwendest deine und meine Zeit. Soweit ich weiß, hast du etwas zu tun. Also kümmer dich um deinen Auftrag.
	};

// -------- Brief von Raffa ---------------
instance DIA_DIC_Taliasan_Brief (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 5;
	condition = DIA_DIC_Taliasan_Brief_Condition;
	information = DIA_DIC_Taliasan_Brief_Info;
	permanent = 0;
	description = "Hier ist Raffas Brief.";
	};

func int DIA_DIC_Taliasan_Brief_Condition ()
	{
	if (Npc_HasItems(other, Ra_Empf) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Brief_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Brief_15_00"); //Den Brief von Raffa habe ich erhalten. 
	
	if (Npc_KnowsInfo(other, DIA_DIC_Taliasan_PBrief) && Npc_KnowsInfo(other, DIA_DIC_Taliasan_SBrief))
		{
		AI_StopProcessInfos(self);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Taliasan_Brief_03_01"); //Sehr Gut. Gute Arbeit. Aber denke daran, ich brauche insgesamt drei Schriftstücke.
		};

	B_GiveInvItems(other, self,Ra_Empf,1);
	B_LogEntry (TaliasansNeueAuftraege, "Den Brief von Raffa habe ich erhalten und Taliasan gegeben. Insgesamt benötige ich aber drei.");
	B_GiveXP (250);
	};

// -------- Brief von Pyt ---------------
instance DIA_DIC_Taliasan_PBrief (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 6;
	condition = DIA_DIC_Taliasan_PBrief_Condition;
	information = DIA_DIC_Taliasan_PBrief_Info;
	permanent = 0;
	description = "Hier ist der Brief von Pyt.";
	};

func int DIA_DIC_Taliasan_PBrief_Condition ()
	{
	if (Npc_HasItems(other, Py_Empf) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_PBrief_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_PBrief_15_00"); //Hier.ist der Brief von Pyt.
	
	if (Npc_KnowsInfo(other, DIA_DIC_Taliasan_Brief) && Npc_KnowsInfo(other, DIA_DIC_Taliasan_SBrief))
		{
		AI_StopProcessInfos(self);
		}
	else
		{
		AI_Output (self, other, "DIA_DIC_Taliasan_PBrief_03_01"); //Gut, gut. Aber denke daran, es sind insgesamt drei Briefe, die ich brauche. Also beschaffe die fehlenden.
		}; 

	B_GiveInvItems(other, self,Py_Empf,1);
	B_LogEntry (TaliasansNeueAuftraege, "Den Brief von Pyt habe ich erhalten und Taliasan gegeben. Aber alle drei Briefe habe ich immer noch nicht zusammen.");
	B_GiveXP (350);
	};

// ------------- Kann Slade nicht finden ----------
instance DIA_DIC_Taliasan_Slade (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 7;
	condition = DIA_DIC_Taliasan_Slade_Condition;
	information = DIA_DIC_Taliasan_Slade_Info;
	permanent = 0;
	description = "Ich kann Slade nicht finden.";
	};

func int DIA_DIC_Taliasan_Slade_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Alwin_Slade) && !(Npc_KnowsInfo(other, DIA_DIC_Slade_Buch)))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Slade_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Slade_15_00"); //Ich kann Slade nicht finden.
	AI_Output (self, other, "DIA_DIC_Taliasan_Slade_03_01"); //Slade bleibt nie lange im Lager. Seine Aufgaben führen ihn durchs ganze Land. Wenn du ihn jetzt nicht erwischst, wirst du lange auf ihn warten müssen. Aber lass es dir gesagt sein, einen anderen Auftrag gibt es nicht. Slades Stimme ist ungemein wichtig! 

	Info_AddChoice (DIA_DIC_Taliasan_Slade, "Wo finde ich ihn?", DIA_DIC_Taliasan_Slade_Wo);
	Info_AddChoice (DIA_DIC_Taliasan_Slade, "Wo verlässt er das Lager?", DIA_DIC_Taliasan_Slade_Lager);
	};

func void DIA_DIC_Taliasan_Slade_Wo ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Slade_Wo_15_00"); //Wo finde ich ihn, wenn er noch im Lager ist?
	AI_Output (self, other, "DIA_DIC_Taliasan_Slade_Wo_03_01"); //Das weiß ich nicht.
	};

func void DIA_DIC_Taliasan_Slade_Lager ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Slade_Lager_15_00"); //Welchen Weg nimmt er, wenn er das Lager verlässt?
	AI_Output (self, other, "DIA_DIC_Taliasan_Slade_Wo_03_01"); //Das weiß ich nicht.
	};

// ------------- Slade will Buch ----------
instance DIA_DIC_Taliasan_Buch (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 8;
	condition = DIA_DIC_Taliasan_Buch_Condition;
	information = DIA_DIC_Taliasan_Buch_Info;
	permanent = 0;
	description = "Slade will ein Buch.";
	};

func int DIA_DIC_Taliasan_Buch_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Slade_Buch) && !Npc_KnowsInfo(other, DIA_DIC_Slade_Wein))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Buch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Buch_15_00"); //Taliasan. Slade will das Buch "Die Anfänge der Magie" haben. Nur dann schreibt er den Lobesbrief über dich.
	AI_Output (self, other, "DIA_DIC_Taliasan_Buch_03_01"); //Ich wusste es. Mit einer List versuchst du dir die Fähigkeiten der Magie zu verschaffen. Dir steht doch der Sinn nach dem Buch, nur damit du dir selbst die Regeln der Magie beibringen kannst. Oder stimmt das etwa nicht?
	AI_Output (other, self, "DIA_DIC_Taliasan_Buch_15_02"); //Nein Taliasan. Slade hat mir als Bedingung...
	AI_Output (self, other, "DIA_DIC_Taliasan_Buch_03_03"); //Schweig. Ich werte diesen Versuch von dir als einmaliges Versehen. Also geh los, und hol mir den Brief von Slade.

	B_LogEntry (SladeQuest, "Taliasan will mir das Buch nicht geben. Er ist so misstrauisch, dass ich nicht einmal mir die Bücher in seinen Regalen anschauen darf.");
	};

// ---------- Nähe Schrank A -------------
instance DIA_DIC_Taliasan_Schrank_A (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 9;
	condition = DIA_DIC_Taliasan_Schrank_A_Condition;
	information = DIA_DIC_Taliasan_Schrank_A_Info;
	permanent = 0;
	important = 1;
	description = "Faß das nicht an.";
	};

func int DIA_DIC_Taliasan_Schrank_A_Condition ()
	{
	if (SchrankA == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Schrank_A_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Taliasan_Schrank_A_03_00"); //Fass das nicht an. Wenn dort auch nur ein Buch fehlt, merke ich das sofort.
	};

// ---------- Nähe Schrank B -------------
instance DIA_DIC_Taliasan_Schrank_B (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 10;
	condition = DIA_DIC_Taliasan_Schrank_B_Condition;
	information = DIA_DIC_Taliasan_Schrank_B_Info;
	permanent = 0;
	important = 1;
	description = "Finger weg.";
	};

func int DIA_DIC_Taliasan_Schrank_B_Condition ()
	{
	if (SchrankB == 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Schrank_B_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Taliasan_Schrank_B_03_00"); //Auch, wenn sich in diesem Regal nur meine Schundbücher stapeln. Finger weg.
	};

// -------------- Benchol will was --------
instance DIA_DIC_Taliasan_Benchol (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 11;
	condition = DIA_DIC_Taliasan_Benchol_Condition;
	information = DIA_DIC_Taliasan_Benchol_Info;
	permanent = 0;
	description = "Ein paar Leute waren auf deine Lieferung.";
	};

func int DIA_DIC_Taliasan_Benchol_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Benchol_Wein))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Benchol_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_Benchol_15_00"); //Drüben bei Benchols Hütte warten ein paar Leute auf eine Lieferung von dir. Womit, haben sie mir nicht gesagt.
	AI_Output (self, other, "DIA_DIC_Taliasan_Benchol_03_01"); //Oh, sie warten auf einige Pflanzen die ich züchte und verkaufe. Vor lauter Arbeit habe ich sie ganz vergessen. Da muss ich kurz hin. Stell dich an den Eingang und pass auf, dass niemand hier herein geht.

	B_GiveXP (150);

	Npc_ExchangeRoutine	(self,"BENCHOL");
	AI_StopProcessInfos	(self);
	
	B_LogEntry (SladeQuest, "Taliasan ist los, um bei Benchol eine Lieferung abzugeben.");

	//AI_GotoWP(self, "STADT_WEG_056"); 		//frißt nicht "AI_GotoNpc (self, DIC_2013_Benchol);", also Notlösung!!!
	};
	
/*
// ---------- Npc hebt ein Buch auf -------
instance DIA_DIC_Taliasan_Dieb (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr =  12;
	condition = DIA_DIC_Taliasan_Dieb_Condition;
	information = DIA_DIC_Taliasan_Dieb_Info;
	permanent = 1;
	important = 1;
	description = "Hey, lass mein Buch liegen!";
	};

func int DIA_DIC_Taliasan_Dieb_Condition ()
	{
	//if (C_BodyStateContains(hero,BS_TakeItem))
	//if (Wld_DetectNpc (self, hero, BS_TAKEITEM, -1)) //AI_TakeItem(hero,Ta_Buch), -1))
	if ((Npc_HasItems(other, Ta_Buch) >= 1) && !(Npc_KnowsInfo(hero,DIA_DIC_Taliasan_Benchol)))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Dieb_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Taliasan_Dieb_03_00"); //Hey, das ist mein Buch. Gib es her!

	B_GiveInvItems(other, self,Ta_Buch,1);
	Wld_InsertItem	(Ta_Buch,"SHUETTE303_REGAL");
	AI_StopProcessInfos (self);
	};
*/

// ---------- Npc hebt ein Buch auf -------
instance DIA_DIC_Taliasan_Dieb (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr =  12;
	condition = DIA_DIC_Taliasan_Dieb_Condition;
	information = DIA_DIC_Taliasan_Dieb_Info;
	permanent = 1;
	important = 1;
	description = "Hey, lass mein Buch liegen!";
	};

func int DIA_DIC_Taliasan_Dieb_Condition ()
	{
	//if (C_BodyStateContains(hero,BS_TakeItem))
	//if (Wld_DetectNpc (self, hero, BS_TAKEITEM, -1)) //AI_TakeItem(hero,Ta_Buch), -1))
	if ((Npc_HasItems(other, Ta_Buch) >= 1) && !(Npc_KnowsInfo(hero,DIA_DIC_Taliasan_Benchol)))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Dieb_Info ()
	{
//	AI_GotoNpc (dic_2002_Taliasan, hero);		// schade! leider kann das game hierbei hängenbleiben -Harri
	AI_Output (self, other, "DIA_DIC_Taliasan_Dieb_03_00"); //Hey, das ist mein Buch. Geb es her!
	B_GiveInvItems(other, self,Ta_Buch,1);
	
	AI_GotoWP (dic_2002_Taliasan,"SHUETTE303_REGAL");
	Wld_InsertItem	(Ta_Buch,"SHUETTE303_BUCH");
	Npc_RemoveInvItem (self, Ta_Buch);
	AI_StopProcessInfos (self);
	};

// ----------- Taliasan kommt wieder zurück --------
instance DIA_DIC_Taliasan_Zurueck (C_INFO)
	{
	npc  = dic_2002_Taliasan;
	nr = 13;
	condition = DIA_DIC_Taliasan_Zurueck_Condition;
	information = DIA_DIC_Taliasan_Zurueck_Info;
	permanent = 0;
	important = 1;
	description = "Kannst jetzt wieder gehen.";
	};

func int DIA_DIC_Taliasan_Zurueck_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Taliasan_Benchol) && (Npc_HasItems(other, Ta_Buch) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_Zurueck_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Taliasan_Zurueck_03_01"); //Kannst jetzt wieder gehen. Hab grad ein paar neue Kunden gewonnen.
	AI_StopProcessInfos (self);
	
	B_LogEntry (SladeQuest, "Taliasan ist wieder zurück.");
	};

// ------------- Slades Brief ----------------------
instance DIA_DIC_Taliasan_SBrief (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 14;
	condition = DIA_DIC_Taliasan_SBrief_Condition;
	information = DIA_DIC_Taliasan_SBrief_Info;
	permanent = 0;
	important = 0;
	description = "Hier ist der Brief von Slade.";
	};

func int DIA_DIC_Taliasan_SBrief_Condition ()
	{
	if (Npc_HasItems(other, Sl_Empf) >= 1)
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_SBrief_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taliasan_SBrief_15_00"); //Hier. Hier ist der Brief von Slade.
	AI_Output (self, other, "DIA_DIC_Taliasan_SBrief_03_01"); //Danke. Ich dachte, dass es am schwersten wäre, eine Empfehlung von Slade zu bekommen.

	B_GiveInvItems(other, self,Sl_Empf,1);
	B_LogEntry (TaliasansNeueAuftraege, "Ich habe Taliasan Slades Brief gegeben.");
	B_GiveXP (450);
	};

// ------------ Taliasan hat alle drei Briefe -------------
instance DIA_DIC_Taliasan_DreiB (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 15;
	condition = DIA_DIC_Taliasan_DreiB_Condition;
	information = DIA_DIC_Taliasan_DreiB_Info;
	permanent = 0;
	important = 1;
	description = "Ich habe dir alle drei Briefe gebracht!";
	};

func int DIA_DIC_Taliasan_DreiB_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Taliasan_Brief) && Npc_KnowsInfo(other, DIA_DIC_Taliasan_PBrief) && Npc_KnowsInfo(other, DIA_DIC_Taliasan_SBrief))
		{
		return 1;
		};
	};

func void DIA_DIC_Taliasan_DreiB_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Taliasan_DreiB_03_00"); //Hm. Du hast es geschafft. Du wirst es mir nicht glauben, aber schon als du hier zum ersten Mal eingetreten bist, wusste ich, dass du meinen Aufgaben gewachsen bist. Ich habe ein Gespür für sowas. 
	AI_Output (self, other, "DIA_DIC_Taliasan_DreiB_03_01"); //Nun gut... Hier ist der Zauber, der dir hilft, Graveyarn zu überzeugen, dass du seine Anforderungen erfüllt hast. Und hier sind einige Schriftrollen der Magie.

	B_LogEntry (TaliasansNeueAuftraege, "Ich habe Taliasan den letzten Brief gegeben den er haben wollte. Es scheint als hätte dieser misstrauische Mensch sein Wort gehalten: er hat mir mehrere Zauber mitgegeben. Einer davon soll mir helfen Graveyarn nachhaltig zu überzeugen, dass ich großes für ihn geleistet habe.");
	B_LogEntry(BekanntePersonen, "Raffa - ein Vertrauter Berengars");
	B_LogEntry(BekanntePersonen, "Pyt - ein Vartrauter Berengars");
	B_LogEntry(BekanntePersonen, "Slade - arbeitet in Außenmissionen für Berengar, ist derzeit außerhalb des Lagers");
	CreateInvItem	(self, ItArScrollFirebolt);
	CreateInvItem	(self, ItArScrollHeal);
	CreateInvItem	(self, ItArScrollThunderbolt);
	CreateInvItem	(self, TalZauber);

	B_GiveInvItems(self, other, ItArScrollFirebolt, 1);
	B_GiveInvItems(self, other, ItArScrollHeal, 1);
	B_GiveInvItems(self, other, ItArScrollThunderbolt, 1);
	B_GiveInvItems(self, other, TalZauber, 1);
	
	Npc_ExchangeRoutine(DIC_2012_Slade,"GEGANGEN");
	AI_ContinueRoutine	(DIC_2012_Slade);
	AI_Teleport (DIC_2012_Slade, "UNTERWORLD");

	B_GiveXP (500);
	};
	
//****************************************************
//**************** Wanzen Quest ***********************
//****************************************************

// ------------ Frage wegen Söldnerwanze -------------

instance DIA_Taliasan_Soeldnerwanze (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_Soeldnerwanze_Condition;
	information = DIA_Taliasan_Soeldnerwanze_Info;
	permanent = 0;
	description = "Du kannst Leute verwandeln?";
	};

func int DIA_Taliasan_Soeldnerwanze_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Leofwin_Wanzeinfo))
	&&  (!Npc_IsDead(Soeldnerwanze))
		{
		return 1;
		};
	};

func void DIA_Taliasan_Soeldnerwanze_Info ()
	{
	AI_Output (hero,self,  "DIA_Taliasan_Soeldnerwanze_15_00"); //Man erzählt sich das du Menschen verwandeln kannst?
	AI_Output (self,hero,  "DIA_Taliasan_Soeldnerwanze_03_01"); //So? Hmm, Die Leute erzählen viel.
	};

// ------------ wegen Söldnerwanze - ertappt-------------

instance DIA_Taliasan_Soeldnerverwandelt (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_Soeldnerverwandelt_Condition;
	information = DIA_Taliasan_Soeldnerverwandelt_Info;
	permanent = 0;
	description = "Leofwin meint.";
	};

func int DIA_Taliasan_Soeldnerverwandelt_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_Soeldnerwanze))
		{
		return 1;
		};
	};

func void DIA_Taliasan_Soeldnerverwandelt_Info ()
	{
	AI_Output (hero, self,  "DIA_Taliasan_Soeldnerverwandelt_15_00"); //Ich war in der Hütte von Leofwin. Er behauptet du hättest seinen Kumpel Hamond in eine Wanze verwandelt. 
	AI_Output (hero, self,  "DIA_Taliasan_Soeldnerverwandelt_15_01"); //Leofwin ist sich sicher, dass du deine Finger da im Spiel hattest. Erst kürzlich hat er mitangehört wie du mit Hamond in Streit geraten bist.
	AI_Output (self, hero,  "DIA_Taliasan_Soeldnerverwandelt_03_02"); //Der ist immer noch verwandelt? Ich hätte schwören können, ich hätte einen anderen Zauber gewählt.
	AI_Output (hero, self,  "DIA_Taliasan_Soeldnerverwandelt_15_03"); //Dann warst du es also DOCH!?
	AI_Output (self, hero,  "DIA_Taliasan_Soeldnerverwandelt_03_04"); //Ja..ja! Da ist er aber selber schuld! Hamond wollte mir beweisen, dass ich keinerlei Respekt verdiene. Das war sein Fehler.
	AI_Output (hero, self,  "DIA_Taliasan_Soeldnerverwandelt_15_05"); //Soll er nun ewig sein Leben als Wanze fristen? Irgendwann tritt noch jemand auf ihn drauf!Und wenn Berengar von deinen Machenschaften erfährt!
	AI_Output (self, hero,  "DIA_Taliasan_Soeldnerverwandelt_03_06"); //Wag es ja nicht!!
	AI_Output (hero, self,  "DIA_Taliasan_Soeldnerverwandelt_15_07"); //Ich werde mich hüten, oder glaubst du ich möchte mich bald als Wurm durch die Erde graben? Aber es gibt noch andere die davon wissen.
	AI_Output (self, hero,  "DIA_Taliasan_Soeldnerverwandelt_03_08"); //Hmm...cht, da hast du recht. Du musst mir helfen!
	AI_Output (hero, self,  "DIA_Taliasan_Soeldnerverwandelt_15_09"); //Muß? Was hab ich davon?
	AI_Output (self, hero,  "DIA_Taliasan_Soeldnerverwandelt_03_10"); //Es soll dein Schaden nicht sein. Ich gebe dir 500 Silber dafür. Wenn du mir hilfst. 
	B_LogEntry		(WANZENQUEST, "Ich soll Taliasan bei sein Problem helfen. Es soll auch nicht umsonst sein.");

	};

// ------------ Angebot - Helfen oder nicht-------------

instance DIA_Taliasan_HilfeHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_HilfeHamond_Condition;
	information = DIA_Taliasan_HilfeHamond_Info;
	permanent = 0;
	description = "wegen dem Angebot.";
	};

func int DIA_Taliasan_HilfeHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_Soeldnerverwandelt))
		{
		return 1;
		};
	};

func void DIA_Taliasan_HilfeHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_15_00"); //Wegen dem Angebot.
	AI_Output (self,hero,  "DIA_Taliasan_HilfeHamond_03_01"); //Ja...

	Info_AddChoice(DIA_Taliasan_HilfeHamond, "Wie war dein Angebot?", DIA_Taliasan_HilfeHamond_nochmal);
	Info_AddChoice(DIA_Taliasan_HilfeHamond, "In Ordnung?", DIA_Taliasan_HilfeHamond_500);
	Info_AddChoice(DIA_Taliasan_HilfeHamond, "Will mehr.", DIA_Taliasan_HilfeHamond_mehr);
	Info_AddChoice(DIA_Taliasan_HilfeHamond, "Will was anderes?", DIA_Taliasan_HilfeHamond_anderes);
	Info_AddChoice(DIA_Taliasan_HilfeHamond, "Kein Interesse.", DIA_Taliasan_HilfeHamond_no);
	};

// ---- Angebot wiederholen ----
func void DIA_Taliasan_HilfeHamond_nochmal ()
	{
	AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_nochmal_15_00"); //Wie war dein Angebot noch mal?
	AI_Output (self,hero,  "DIA_Taliasan_HilfeHamond_nochmal_03_01"); //Du bekommst 500 Silber von mir. Wenn du mir hilfst. Entscheide dich jetzt!
	};

// ---- 500 Silber ----
func void DIA_Taliasan_HilfeHamond_500 ()
	{
	AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_500_15_00"); //Na dann mal her mit den 500 Silber.
	Hamond_Wanze = 1;
	B_LogEntry		(WANZENQUEST, "Taliasan gibt mir 500 Silber und ich werde ihm helfen.");
	Info_ClearChoices (DIA_Taliasan_HilfeHamond);
	};

// ---- mehr Silber ----
func void DIA_Taliasan_HilfeHamond_mehr ()
	{
	AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_mehr_15_00"); //Das ist mir zu wenig. Ich will mehr.
	AI_Output (self, hero,  "DIA_Taliasan_HilfeHamond_mehr_03_01"); //Eines scheinst du ja schnell gelernt zu haben: Wie man die missliche Lage anderer Leute ausnutzt.
	AI_Output (self, hero,  "DIA_Taliasan_HilfeHamond_mehr_03_02"); //Na gut ich erhöhe auf 750 Silber. Aber mehr ist nicht drin.
	Info_ClearChoices (DIA_Taliasan_HilfeHamond);

		Info_AddChoice(DIA_Taliasan_HilfeHamond, "In Ordnung?", DIA_Taliasan_HilfeHamond_750);
		Info_AddChoice(DIA_Taliasan_HilfeHamond, "Will noch mehr.", DIA_Taliasan_HilfeHamond_nochmehr);
	};

// ----- noch mehr Silber ----
	func void DIA_Taliasan_HilfeHamond_750 ()
		{
		AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_750_15_00"); //Na dann mal her mit den 750 Silber
		Hamond_Wanze = 2;
		B_LogEntry		(WANZENQUEST, "Taliasan gibt mir 750 Silber und ich werde ihn helfen.");
		Info_ClearChoices (DIA_Taliasan_HilfeHamond);
		};

// ----- zuviel Silber gefordert----
	func void DIA_Taliasan_HilfeHamond_nochmehr ()
		{
		AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_nochmehr_15_00"); //Nein das reicht mir immer noch nicht.
		AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_nochmehr_03_01"); //Deine Gier wird noch dein Verderben sein. Ich hatte dir ja gesagt, dass nicht mehr drin ist
		AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_nochmehr_03_02"); //Dann werde ich mich eben selbst darum kümmern müssen. Aber gleich komme ich nicht dazu.
		Info_ClearChoices (DIA_Taliasan_HilfeHamond);
		B_LogEntry		(WANZENQUEST, "Ich hab's übertrieben. Nun kümmert sich Taliasan selber darum.");
		Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);
		};


// ---- was anderes ----
func void DIA_Taliasan_HilfeHamond_anderes ()
	{
	AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_anderes_15_00"); //Ich bin nicht an Silber interessiert. Hast du noch was anderes zu bieten?
	AI_Output (self, hero,  "DIA_Taliasan_HilfeHamond_anderes_03_01"); //Na ja ... hmm ... da hätte ich noch ein paar magische Tränke zur Auswahl die deine Leistung verbessern.
	AI_Output (hero, self,  "DIA_Taliasan_HilfeHamond_anderes_15_02"); //Was bewirken die Tränke?
	AI_Output (self, hero,  "DIA_Taliasan_HilfeHamond_anderes_03_03"); //Deine Stärke oder deine Geschicklichkeit werden erhöht. Jeweils um 8 oder Magie um 10. Und? Ist das was für dich?
	Info_ClearChoices (DIA_Taliasan_HilfeHamond);

		Info_AddChoice(DIA_Taliasan_HilfeHamond, "Gib mir einen Trank?", DIA_Taliasan_HilfeHamond_Trank);
		Info_AddChoice(DIA_Taliasan_HilfeHamond, "Ist immer noch nicht das richtige?", DIA_Taliasan_HilfeHamond_nochanderes);
	};

// ----- Trank nehmen ----
	func void DIA_Taliasan_HilfeHamond_Trank ()
		{
		AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_Trank_15_00"); //Gib mir den Trank.
		AI_Output (self, hero,  "DIA_Taliasan_HilfeHamond_Trank_03_01"); //Also gut. Du sollst deinen Trank bekommen.
		Hamond_Wanze = 3;
		B_LogEntry		(WANZENQUEST, "Ich hab mich für den Trank entschieden und werde ihn helfen.");
		Info_ClearChoices (DIA_Taliasan_HilfeHamond);
		};
// ----- noch was anderes ----

	func void DIA_Taliasan_HilfeHamond_nochanderes ()
		{
		AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_nochanderes_15_00"); //Das ist alles nichts Besonderes mit dem du aufwartest. Ich verlange etwas, was nur du mir bieten kannst.
		AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_nochanderes_03_01"); //hä hä *grins* Du willst also bei mir in die Lehre gehen?
		Info_ClearChoices (DIA_Taliasan_HilfeHamond);

			Info_AddChoice(DIA_Taliasan_HilfeHamond, "In die Lehre gehen?", DIA_Taliasan_HilfeHamond_Lehre);
			Info_AddChoice(DIA_Taliasan_HilfeHamond, "Will auf die anderen Angebote zurück?", DIA_Taliasan_HilfeHamond_zurueck);
			Info_AddChoice(DIA_Taliasan_HilfeHamond, "Kümmre dich selbst drum?", DIA_Taliasan_HilfeHamond_ende);
		};
// ----- für die Lehre ----
		func void DIA_Taliasan_HilfeHamond_Lehre ()
			{
			AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_Lehre_15_00"); //Du hast es erfasst. Ich will in der Magie unterwiesen werden.
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_Lehre_03_01"); //Ich sehe, ich hab dich unterschätzt. Du hast die beste Entscheidung getroffen.
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_Lehre_03_02"); //Wissen ist mehr als Silber und Reichtum. Reichtum ist lediglich das unvermeidliche Beiwerk herausragender Fähigkeiten.
			Hamond_Wanze = 4;
			B_LogEntry		(WANZENQUEST, "Wenn ich Taliasan helfe, wird er mich in die Geheimnisse der Magie unterweisen.");
			Info_ClearChoices (DIA_Taliasan_HilfeHamond);
			};

// ----- vorhergehendes Angebot ----
		func void DIA_Taliasan_HilfeHamond_zurueck ()
			{
			AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_zurueck_15_00"); //Wenn ich es mir recht überlege, halte ich die magische Kunst doch für unwichtig. Ich will auf das Angebot mit dem Silber zurückkommen.
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_zurueck_03_01"); //WAASS!! Du willst mich wohl zum Narren halten?!
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_zurueck_03_02"); //Nein so läuft da nicht. Du hattest deine Chance!
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_zurueck_03_03"); //Ich mach das doch lieber selbst. Du scheinst nicht reif für so eine Aufgabe zu sein.
			B_LogEntry		(WANZENQUEST, "Ich hab ihn enttäuscht. Nun kümmert sich Taliasan selber darum.");
			Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);
			Info_ClearChoices (DIA_Taliasan_HilfeHamond);
			};

// ----- alles abgeschlagen ----
		func void DIA_Taliasan_HilfeHamond_ende ()
			{
			AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_ende_15_00"); //Ach weist du. Irgendwie habe ich keine richtige Lust darauf.
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_ende_03_01"); //Du bist nicht in der Lage dich zu entscheiden und kannst nicht einmal ermessen, welches Angebot du gerade verworfen hast. Und weißt du was, mich belustigt das alles. Wieso gehst du nicht zum Hoffnarr in die Lehre? (lacht)			
			AI_Output (self, hero, "DIA_Taliasan_HilfeHamond_ende_03_02"); //Mit dieser Einstellung kommst du nicht weit. Ich werde mich selbst darum kümmern. Aber jetzt sofort komme ich nicht dazu.
			B_LogEntry		(WANZENQUEST, "Ich hab ihn enttäuscht. Nun kümmert sich Taliasan selber darum.");
			Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);
			Info_ClearChoices (DIA_Taliasan_HilfeHamond);
			};

// ---- Kein Interesse ----
func void DIA_Taliasan_HilfeHamond_no ()
	{
	AI_Output (hero, self, "DIA_Taliasan_HilfeHamond_no_15_00"); //Das ist mir zu heikel. Du musst selber zusehen, wie du das wieder in den Griff bekommst.
	AI_Output (self, hero,  "DIA_Taliasan_HilfeHamond_no_03_01"); //Wie du willst. Dann werde ich mich selbst darum kümmern müssen. Aber gleich komme ich nicht dazu.
	Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);
	Info_ClearChoices (DIA_Taliasan_HilfeHamond);
	};


// ------------ Belohnung fordern-------------

instance DIA_Taliasan_BelohnungHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_BelohnungHamond_Condition;
	information = DIA_Taliasan_BelohnungHamond_Info;
	permanent = 0;
	description = "Wegen der Belohnung.";
	};

func int DIA_Taliasan_BelohnungHamond_Condition ()
	{
	if Hamond_Wanze != 0 && Hamond_Wanze < 5
	&& (!Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
		{
		return 1;
		};
	};

func void DIA_Taliasan_BelohnungHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_BelohnungHamond_15_00"); //Was ist mit meiner Belohnung?
	AI_Output (self, hero, "DIA_Taliasan_BelohnungHamond_03_01"); //Belohnung? Hast du schon was geleistet?
	AI_Output (self, hero, "DIA_Taliasan_BelohnungHamond_03_02"); //Ohne Arbeit kein Lohn! Schon mal was davon gehört?
	};

// ------------ Nachfragen-------------

instance DIA_Taliasan_NachfragenHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 2;
	condition = DIA_Taliasan_NachfragenHamond_Condition;
	information = DIA_Taliasan_NachfragenHamond_Info;
	permanent = 0;
	description = "Nachfragen.";
	};

func int DIA_Taliasan_NachfragenHamond_Condition ()
	{
	if Hamond_Wanze != 0 && Hamond_Wanze < 5
	&& (!Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
		{
		return 1;
		};
	};

func void DIA_Taliasan_NachfragenHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_NachfragenHamond_15_00"); //Zuvor möchte ich aber noch ein - zwei Sachen wissen.
	AI_Output (self, hero, "DIA_Taliasan_NachfragenHamond_03_01"); //So? Und was?
	AI_Output (hero, self, "DIA_Taliasan_NachfragenHamond_15_02"); //Wieso bereinigst du die Sache nicht selbst?
	AI_Output (self, hero, "DIA_Taliasan_NachfragenHamond_03_03"); //Du hast ja keine Ahnung, wie langwierig die Zusammenstellugn eines Gegenzaubers ist.
	AI_Output (self, hero, "DIA_Taliasan_NachfragenHamond_03_04"); //Gewöhnlich ist die Verwandlung nicht von Dauer. Zwei, drei Stunden, danach verliert der Zauber seine Wirkung, gewöhnlich jedenfalls. 
	AI_Output (self, hero, "DIA_Taliasan_NachfragenHamond_03_05"); //Meine Wut hat mir wohl meine Worte im Mund verdreht. Und so habe ich einen zu starken Zauber gewirkt. Nur mit großem Aufwand läßt sich der Zauber rückgängig machen.
	AI_Output (hero, self, "DIA_Taliasan_NachfragenHamond_15_06"); //Da hast du aber richtig was verbockt!
	AI_Output (self, hero, "DIA_Taliasan_NachfragenHamond_03_07"); //Hör mal zu mein Jungchen! Es steht dir nicht zu über mich zu richten. Mach einfach das was ich dir sage und die Sache wird aus der Welt geschafft!
	B_LogEntry		(WANZENQUEST, "Taliasan hat Mist verbockt bei der Verwandlung. Nun will er ein speziellen Trank brauen denn ich dann über die Wanze - ich meine Hamond - schütten soll");
	};

// ------------ Auftrag wegen Hamond-------------

instance DIA_Taliasan_AuftragHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 2;
	condition = DIA_Taliasan_AuftragHamond_Condition;
	information = DIA_Taliasan_AuftragHamond_Info;
	permanent = 0;
	description = "Was muss ich nun tun wegen Hamond.";
	};

func int DIA_Taliasan_AuftragHamond_Condition ()
	{
	if !Hamond_Wanze == 0
		{
		return 1;
		};
	};

func void DIA_Taliasan_AuftragHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_AuftragHamond_15_01"); //Und was soll ich nun tun?
	AI_Output (self, hero, "DIA_Taliasan_AuftragHamond_03_02"); //Ich muss einen Trank brauen. Dafür brauche ich ein paar seltene Ingredienzien.
	AI_Output (self, hero, "DIA_Taliasan_AuftragHamond_03_03"); //Sobald der Trank fertig ist, kippst du ihn einfach über die Schnabelkerfe in der Hoffnung das es davon trinkt. he he oder sollte ich er sagen?
	AI_Output (hero, self, "DIA_Taliasan_AuftragHamond_15_04"); //Bis jetzt klingt das ziemlich einfach.
	};

// ------------ Auftrag Hamond Zutaten-------------

instance DIA_Taliasan_ZutatenHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_ZutatenHamond_Condition;
	information = DIA_Taliasan_ZutatenHamond_Info;
	permanent = 0;
	description = "Was für Ingredienzien.";
	};

func int DIA_Taliasan_ZutatenHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_AuftragHamond))
		{
		return 1;
		};
	};

func void DIA_Taliasan_ZutatenHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_ZutatenHamond_15_00"); //Was für Ingredienzien.sind das, die du brauchst?
	AI_Output (self, hero, "DIA_Taliasan_ZutatenHamond_03_01"); //Bring mir: 5 Höllenpilze, 1 Bergmoos, 1 Grabmoos, 2 Steinwurzel, 1 Flammenzunge eines Feuerwarans, 2 Stacheln einer Blutfliege und 3 Reisschnaps.
	AI_Output (hero, self, "DIA_Taliasan_ZutatenHamond_15_02"); //Ohh! Das ist doch ne Menge Zeugs. Und Reisschnaps willst du da auch reinschütten?
	AI_Output (self, hero, "DIA_Taliasan_ZutatenHamond_03_03"); //Ne der ist für mich. Nervenmedizin (grins)
	AI_Output (hero, self, "DIA_Taliasan_ZutatenHamond_15_04"); //Wo soll ich denn das alles herbekommen?
	AI_Output (self, hero, "DIA_Taliasan_ZutatenHamond_03_05"); //Ich sagte ja. Ich hab nicht soviel Zeit. Deswegen sollst du das ja machen.
	AI_Output (self, hero, "DIA_Taliasan_ZutatenHamond_03_06"); //Und damit du nichts vergisst, werde ich dir eine Zutatenliste mitgeben.
	B_LogEntry		(WANZENQUEST, "Ich hab nun eine Zutatenliste. Auf der steht ziemlich viel");
	B_GiveInvItems (self, other, Ha_list,1);
	};

// ------------ Auftrag Ultimatum -------------

instance DIA_Taliasan_UltimHamond (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_UltimHamond_Condition;
	information 	= DIA_Taliasan_UltimHamond_Info;
	permanent 	= 0;
	important 	= 1;
	};

func int DIA_Taliasan_UltimHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_ZutatenHamond))
	&& (!Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
		{
		return 1;
		};
	};

func void DIA_Taliasan_UltimHamond_Info ()
	{
	AI_Output (self, hero, "DIA_Taliasan_UltimHamond_03_00"); //Ach ja. Beinahe hätte ich es vergessen.
	AI_Output (hero, self, "DIA_Taliasan_UltimHamond_15_01"); //Was denn nun noch?
	AI_Output (self, hero, "DIA_Taliasan_UltimHamond_03_02"); //In spätestens einer Woche musst du die Sachen beschafft haben.
	AI_Output (hero, self, "DIA_Taliasan_UltimHamond_15_03"); //Wieso nun die Eile?
	AI_Output (self, hero, "DIA_Taliasan_UltimHamond_03_04"); //Sonst ist es für Hamond zu spät und er bleibt ewig eine Wanze!
	AI_Output (hero, self, "DIA_Taliasan_UltimHamond_15_05"); //Schon gut. Ich werd das schon schaffen.
	Hamond_Auftrag_Day = Wld_GetDay();
	B_LogEntry		(WANZENQUEST, "Nun muss ich das auch noch in 7 Tagen geschafft haben. Na ja ich werde das schon machen");
	};


// ------------ Auftrag zu Spät -------------

instance DIA_Taliasan_TooLateHamond (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_TooLateHamond_Condition;
	information 	= DIA_Taliasan_TooLateHamond_Info;
	permanent 	= 0;
	important 	= 1;
	};

func int DIA_Taliasan_TooLateHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_ZutatenHamond))
	&& (Hamond_Auftrag_Day<=(Wld_GetDay()-8))
	&& (!Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
		{
		return 1;
		};
	};

func void DIA_Taliasan_TooLateHamond_Info ()
	{
	AI_Output (self, hero, "DIA_Taliasan_TooLateHamond_03_00"); //Wo treibst du dich denn überall rum? Hast du nun alle Zutaten?
	AI_Output (self, hero, "DIA_Taliasan_TooLateHamond_03_01"); //Ist eigentlich egal. Nun kannst du sie behalten.  Die Frist ist abgelaufen. Ich kann Hamond nicht mehr helfen!
	B_LogEntry		(WANZENQUEST, "Ups, nun hab ich die Zeit vergessen und Taliasan die Zutaten nicht rechtzeitig gebracht. Hamond wird nun ewig als Wanze rumlaufen.");
	Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);
	};


// ------------ Alle Zutaten mit -------------

instance DIA_Taliasan_AllesHamond (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_AllesHamond_Condition;
	information 	= DIA_Taliasan_AllesHamond_Info;
	permanent 	= 0;
	description = "Hab alle Zutaten.";
	};

func int DIA_Taliasan_AllesHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_ZutatenHamond))
	&& (Hamond_Auftrag_Day>(Wld_GetDay()-8))
	&& (Npc_HasItems(other,ItFo_Plants_mushroom_01)>=5)
	&& (Npc_HasItems(other,ItFo_Plants_mountainmoos_01)>=1)
	&& (Npc_HasItems(other,ItFo_Plants_mountainmoos_02)>=1)
	&& (Npc_HasItems(other,ItFo_Plants_Stoneroot_01)>=2)
	&& (Npc_HasItems(other,ItAt_Waran_01)>=1)
	&& (Npc_HasItems(other,ItAt_Bloodfly_02)>=2)
	&& (Npc_HasItems(other,ItFoBooze)>=3)

		{
		return 1;
		};
	};

func void DIA_Taliasan_AllesHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_AllesHamond_15_00"); //So, ich hab nun alles. Du kannst nun den Trank brauen.
	AI_Output (self, hero, "DIA_Taliasan_AllesHamond_03_01"); //Gut gemacht. Gib her.
	AI_Output (hero, self, "DIA_Taliasan_AllesHamond_15_02"); //Hier.
	B_GiveInvItems (other,self,ItFo_Plants_mushroom_01,5);
	B_GiveInvItems (other,self,ItFo_Plants_mountainmoos_01,1);
	B_GiveInvItems (other,self,ItFo_Plants_mountainmoos_02,1);
	B_GiveInvItems (other,self,ItFo_Plants_Stoneroot_01,2);
	B_GiveInvItems (other,self,ItAt_Waran_01,1);
	B_GiveInvItems (other,self,ItAt_Bloodfly_02,2);
	B_GiveInvItems (other,self,ItFoBooze,3);
	B_GiveXP(500);
	AI_Output (self, hero, "DIA_Taliasan_AllesHamond_03_03"); //Sehr gut, sehr gut, ich mache mich nun gleich an die Arbeit.
	B_LogEntry		(WANZENQUEST, "Taliasan hat nun alles was er für den Trank brauch.");
	Hamond_Trank_Day = Wld_GetDay();
	Npc_ExchangeRoutine (self,"Heiltrank");
	};


// ------------ Entlohnung bekommen-------------

instance DIA_Taliasan_EntlohnungHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_EntlohnungHamond_Condition;
	information = DIA_Taliasan_EntlohnungHamond_Info;
	permanent = 0;
	description = "Wegen der Belohnung.";
	};

func int DIA_Taliasan_EntlohnungHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
		{
		return 1;
		};
	};

func void DIA_Taliasan_EntlohnungHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_EntlohnungHamond_15_00"); //Was ist nun mit meiner Belohnung?
	AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_01"); //In Ordnung, du hast deine Belohnung verdient.

		if Hamond_Wanze == 1
		{
			AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_02"); //Hier.sind deine 500 Silber
			CreateInvItems	(self, ItMiNugget, 500);
			B_GiveInvItems	(self, other, ItMiNugget, 500);
		}

		else if Hamond_Wanze == 2
		{
			AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_03"); //Hier.sind deine 750 Silber
			CreateInvItems	(self, ItMiNugget, 750);
			B_GiveInvItems	(self, other, ItMiNugget, 750);
		}

		else if Hamond_Wanze == 3
		{
			AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_04"); //Für welchen Trank entscheidest du dich?

			Info_AddChoice(DIA_Taliasan_EntlohnungHamond, "Für den Krafttrank", DIA_Taliasan_EntlohnungHamond_Kraft);
			Info_AddChoice(DIA_Taliasan_EntlohnungHamond, "Für den Geschicklichkeitstrank", DIA_Taliasan_EntlohnungHamond_Geschick);
			Info_AddChoice(DIA_Taliasan_EntlohnungHamond, "Für den Manatrank", DIA_Taliasan_EntlohnungHamond_Mana);
		}

		else if Hamond_Wanze == 4
		{
			AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_05"); //Du wolltest eine Ausbildung? Nun so sei es.
			AI_Output (hero, self, "DIA_Taliasan_EntlohnungHamond_15_06"); //Was kannst du mir alles beibringen?
			
			if TeleAmulohn < 4802
			{
				AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_07"); //Ich kann dich den 1. Kreis der Magie lehren und dir helfen deine magische Kraft zu steigern.
				Log_CreateTopic 	(LehrerStadt,LOG_NOTE);
				B_LogEntry		(LehrerStadt,"Talisan kann mir den 1. Kreis der Magie lehren und meine magisch Kraft steigern.");
			}
			else
			{
				AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_09"); //Da du dich unter anderem für den Weg der Magie entschieden hast, biete ich dir an dich in die nächsten  Kreis der Magie zu unterweisen.
				TeleAmulohn = 4803;
				B_LogEntry		(LehrerStadt,"Talisan kann mir den 3. Kreis der Magie lehren.");
			};
			AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_03_08"); //Aber nur wenn du über genügend Erfahrung verfügst.
			
			
		};
	};
func void DIA_Taliasan_EntlohnungHamond_Kraft ()
	{
	AI_Output (hero, self, "DIA_Taliasan_EntlohnungHamond_Kraft_15_00"); //Ich will den Krafttrank.
	AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_Trank_03_00"); //Hier.hast du ihn.
	B_GiveInvItems	(self, other, ItFo_Potion_Strength_03, 1);
	Info_ClearChoices (DIA_Taliasan_EntlohnungHamond);
	};

func void DIA_Taliasan_EntlohnungHamond_Geschick ()
	{
	AI_Output (hero, self, "DIA_Taliasan_EntlohnungHamond_Geschick_15_00"); //Ich will den Geschicklichkeitstrank.
	AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_Trank_03_00"); //Hier.hast du ihn.
	B_GiveInvItems	(self, other, ItFo_Potion_Dex_03, 1);
	Info_ClearChoices (DIA_Taliasan_EntlohnungHamond);
	};

func void DIA_Taliasan_EntlohnungHamond_Mana ()
	{
	AI_Output (hero, self, "DIA_Taliasan_EntlohnungHamond_Mana_15_00"); //Ich will den Manatrank.
	AI_Output (self, hero, "DIA_Taliasan_EntlohnungHamond_Trank_03_00"); //Hier.hast du ihn.
	B_GiveInvItems	(self, other, ItFo_Potion_Mana_Perma_02, 1);
	Info_ClearChoices (DIA_Taliasan_EntlohnungHamond);
	};

// ------------ Verwandlungstrank bekommen-------------

instance DIA_Taliasan_VTrankHamond (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_VTrankHamond_Condition;
	information = DIA_Taliasan_VTrankHamond_Info;
	permanent = 1;
	description = "Der Verwandlungstrank.";
	};

func int DIA_Taliasan_VTrankHamond_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
	&& ((!Npc_KnowsInfo(hero,DIA_Hamond_Hallo)) || (!Npc_KnowsInfo(hero,DIA_Taliasan_AnschissHamond)))
	&& (Hamond_Trank_Day == (Wld_GetDay() ))
		{
		return 1;
		};
	};

func void DIA_Taliasan_VTrankHamond_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_VTrankHamond_15_00"); //Wo ist der Zurückverwandlungszauber für Hamond?
	AI_Output (self, hero, "DIA_Taliasan_VTrankHamond_03_01"); //Es braucht seine Zeit! Komm Morgen wieder.
	AI_StopProcessInfos	(self);


	};

instance DIA_Taliasan_VTrankHamondB (C_INFO)
	{
	npc = dic_2002_Taliasan;
	nr = 1;
	condition = DIA_Taliasan_VTrankHamondB_Condition;
	information = DIA_Taliasan_VTrankHamondB_Info;
	permanent = 0;
	description = "Der Verwandlungstrank.";
	};

func int DIA_Taliasan_VTrankHamondB_Condition ()
	{
	if (Npc_KnowsInfo(hero,DIA_Taliasan_AllesHamond))
	&& ((!Npc_KnowsInfo(hero,DIA_Hamond_Hallo)) || (!Npc_KnowsInfo(hero,DIA_Taliasan_AnschissHamond)))
	&& (Hamond_Trank_Day < (Wld_GetDay() ))
		{
		return 1;
		};
	};

func void DIA_Taliasan_VTrankHamondB_Info ()
	{
		AI_Output (hero, self, "DIA_Taliasan_VTrankHamond_15_00"); //Wo ist der Zurückverwandlungszauber für Hamond?
		AI_Output (self, hero, "DIA_Taliasan_VTrankHamond_03_02"); //Ja.. ich hab ihn fertig. Hier hast du ihn und vermassle das nicht!
		AI_Output (hero, self, "DIA_Taliasan_VTrankHamond_15_03"); //Ich werde es wohl schaffen die Mixtur über die Wanze zu schütten.
		AI_Output (self, hero, "DIA_Taliasan_VTrankHamond_03_04"); //Hmm, ist ja auch nicht wirklich schwer.
		B_GiveInvItems	(self, other, Heil_Hamond, 1);
		B_LogEntry	(WANZENQUEST, "Ich hab jetzt den Trank, aber nun schnell zu Hamond - die Wanze");
		DIA_Taliasan_VTrankHamond.permanent = 0;
		Npc_ExchangeRoutine (self,"start");
	};



//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  DIA_Taliasan_MANA (C_INFO)
{
	npc			= dic_2002_Taliasan;
	condition		= DIA_Taliasan_MANA_Condition;
	information		= DIA_Taliasan_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich benötige mehr magische Kraft";
};

func int  DIA_Taliasan_MANA_Condition()
{
	if ((Hamond_Wanze == 4)	&& (Npc_KnowsInfo(hero,DIA_Taliasan_EntlohnungHamond)))
	|| TeleAmulohn > 4801
	{
		return TRUE;
	};

};
func void  DIA_Taliasan_MANA_Info()
{
	AI_Output (other, self,"DIA_Taliasan_MANA_Info_15_01"); //Ich benötige mehr magische Kraft.
	AI_Output (self, other,"DIA_Taliasan_MANA_Info_03_02"); //Ich kann dir helfen, deine Kraft zu steigern. Wie du sie nutzt, liegt nur an dir.

	Info_ClearChoices	(DIA_Taliasan_MANA);
	Info_AddChoice		(DIA_Taliasan_MANA,DIALOG_BACK	,DIA_Taliasan_MANA_BACK);
	Info_AddChoice		(DIA_Taliasan_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,DIA_Taliasan_MANA_MAN_5);
	Info_AddChoice		(DIA_Taliasan_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,DIA_Taliasan_MANA_MAN_1);
};
func void DIA_Taliasan_MANA_BACK()
{
	Info_ClearChoices	(DIA_Taliasan_MANA);
};

func void DIA_Taliasan_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(DIA_Taliasan_MANA);
	Info_AddChoice		(DIA_Taliasan_MANA,DIALOG_BACK								,DIA_Taliasan_MANA_BACK);
	Info_AddChoice		(DIA_Taliasan_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,DIA_Taliasan_MANA_MAN_5);
	Info_AddChoice		(DIA_Taliasan_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,DIA_Taliasan_MANA_MAN_1);

};

func void DIA_Taliasan_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(DIA_Taliasan_MANA);
	Info_AddChoice		(DIA_Taliasan_MANA,DIALOG_BACK								,DIA_Taliasan_MANA_BACK);
	Info_AddChoice		(DIA_Taliasan_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,DIA_Taliasan_MANA_MAN_5);
	Info_AddChoice		(DIA_Taliasan_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,DIA_Taliasan_MANA_MAN_1);

};

//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  DIA_Taliasan_KREIS1 (C_INFO)
{
	npc			= dic_2002_Taliasan;
	condition		= DIA_Taliasan_KREIS1_Condition;
	information		= DIA_Taliasan_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0);
};

FUNC int  DIA_Taliasan_KREIS1_Condition()
{
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(((Hamond_Wanze == 4) && (Npc_KnowsInfo(hero,DIA_Taliasan_EntlohnungHamond))) || TeleAmulohn > 4801)
	{
		return TRUE;
	};

};
FUNC void  DIA_Taliasan_KREIS1_Info()
{
	AI_Output (other, self,"DIA_Taliasan_KREIS1_15_01"); //Ich bin jetzt bereit, den ersten Kreis zu erlernen.

	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_02"); //Der erste Kreis der Magie. Wenn du seine Kräfte beherrschst, ohne zu verstehen was Magie bedeutet, gefährdest du dein Leben.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_03"); //Deswegen vernehme meine Worte, deren Gültigkeit über die Zeit hinausreicht.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_04"); //Um uns leben und wirken Kräfte in der Natur die sich der alltäglichen Wahrnehmung entziehen.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_05"); //Elementare und Naturgeister sind nur eine Auswahl, aus der Schar jener, die mit ihren unsichtbaren Händen in unsere Welt greifen.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_06"); //Was der eine für sein Handeln hält, ist manchmal nur das Spiel zweier Geister.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_07"); //Der Magier ist es, der all diese Rätsel und Strömungen aufspüren muss, der erkennen muss, dass im Unsichtbaren Gesetze stecken.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_08"); //Gesetze die so feststehen, als hätte die höchste Macht selbst sie in eine Steintafel gemeißelt.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_09"); //All jene Zauber die du im ersten Kreis der Magie erlernen wirst, werden dir nach und nach helfen, die ersten Geheimnisse zu entdecken, die dich umgeben.
		AI_Output (self, other,"DIA_Taliasan_KREIS1_03_10"); //Und immer mehr wirst du lernen, sie dir zu nutze zu machen.
		DIA_Taliasan_KREIS1.permanent = 0;
	};
};


// ------------ Anschiss-------------

instance DIA_Taliasan_AnschissHamond (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_AnschissHamond_Condition;
	information 	= DIA_Taliasan_AnschissHamond_Info;
	important	= 1;

	};

func int DIA_Taliasan_AnschissHamond_Condition ()
	{
	if Hamond_Wanze > 4
		{
		return 1;
		};
	};

func void DIA_Taliasan_AnschissHamond_Info ()
	{
	AI_Output (self, hero, "DIA_Taliasan_AnschissHamond_03_00"); //Ich hab mitbekommen, das du das mit Hamond vermasselt hast?!
	AI_Output (hero, self, "DIA_Taliasan_AnschissHamond_15_01"); //Äää, ja, ich hab, ... weil...
	AI_Output (self, hero, "DIA_Taliasan_AnschissHamond_03_02"); //Ach, schweig!
	
	if Hamond_Wanze == 5
	{
	AI_Output (self, hero, "DIA_Taliasan_AnschissHamond_03_03"); //Du bist zu dumm eine Flasche über eine Wanze auszukippen. Solche Grienhörner kann ich nicht gebrauchen!
	};
	
	if TeleAmulohn < 4802
	{
	AI_Output (self, hero, "DIA_Taliasan_AnschissHamond_03_04"); //Von mir kannst du keine Ausbildung mehr erwarten.
	B_LogEntry		(LehrerStadt,"Talisan wird mir nichts mehr lehren. Aber vielleicht kann ich ihn später doch noch überzeugen");
	B_LogEntry		(WANZENQUEST, "Taliasan war sehr verärgert.");
	}
	else
	{
	B_LogEntry		(WANZENQUEST, "Taliasan war sehr verärgert. Zun Glück hab ich bei ihm ein Stein im Brett, so das er mich auch weiter unterrichten wird.");
	};
	
	Log_SetTopicStatus	(WANZENQUEST, LOG_FAILED);	
	AI_StopProcessInfos	(self);
	Hamond_Wanze = 5;
	};


//-------- seltsammes Amulett -------------

instance  DIA_Taliasan_Amulett (C_INFO)
{
	npc			= dic_2002_Taliasan;
	nr 			= 3;
	condition		= DIA_Taliasan_Amulett_Condition;
	information		= DIA_Taliasan_Amulett_Info;
	important		= 0;
	permanent		= 1;
	description		= "Wegen des Amulett";
};

FUNC int  DIA_Taliasan_Amulett_Condition()
	{
		if (Npc_HasItems(other, Amulett_Leo) >= 1)
		&& (Npc_KnowsInfo(hero,DIA_Hamond_Hallo))
		&& Hamond_Amu == 0
		{
			return TRUE;
		};

	};
FUNC void DIA_Taliasan_Amulett_Info()
	{

	Info_AddChoice (DIA_Taliasan_Amulett, "Ämm, nichts.", DIA_Taliasan_Amulett_nichts);
	Info_AddChoice (DIA_Taliasan_Amulett, "Hamond verraten.", DIA_Taliasan_Amulett_petze);
	Info_AddChoice (DIA_Taliasan_Amulett, "Amulett gefunden.", DIA_Taliasan_Amulett_find);
	};

FUNC void DIA_Taliasan_Amulett_nichts()
	{
	AI_Output (hero, self, "DIA_Taliasan_Amulett_15_00"); //Ämm ... nichts.
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_01"); //Dann belästige mich nicht!
	Info_ClearChoices	(DIA_Taliasan_Amulett);
	AI_StopProcessInfos	(self);
	};

FUNC void DIA_Taliasan_Amulett_petze()
	{
	Info_ClearChoices	(DIA_Taliasan_Amulett);
	AI_Output (hero, self, "DIA_Taliasan_Amulett_15_02"); //Ich weis warum Hamond dich beleidigt hat.
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_03"); //So? Warum?
	AI_Output (hero, self, "DIA_Taliasan_Amulett_15_04"); //Er hat dich damit nur abgelenkt, um dir dieses Amulett zu stehlen.
	B_GiveInvItems( other,self, Amulett_Leo,1);
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_05"); //WASS!! Der Hundesohn! Der kann was erleben, wenn ich ihn das nächste mal begegne. Er will wohl am eigenen Leib erleben, welche Insekten noch auf der Erde umherkreuchen.
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_06"); //Du hast aber auch keine Skrupel anderen in die Taschen zu greifen.
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_07"); //Hmm...ier hast du 500 Silber für deine Auskunft. Die werde ich mir schon von Hamond wiederholen.
	Hamond_Amu = 2;
	Hamond_Auftrag_Day = Wld_GetDay();
	B_GiveInvItems( self, other, ItMiNugget, 500);
	B_GiveXP (150);
	B_LogEntry		(AMULETTTELEPORT, "Taliasan weiß nun, wer sein Amulett gestohlen hat. Er hat mit 500 Silber dafür gegeben.");
	DIA_Taliasan_Amulett.permanent = 0;
	};

FUNC void DIA_Taliasan_Amulett_find()
	{	
	Info_ClearChoices	(DIA_Taliasan_Amulett);
	AI_Output (hero, self, "DIA_Taliasan_Amulett_15_08"); //Hier. schau mal was ich interessantes gefunden habe.
	B_GiveInvItems( other,self, Amulett_Leo,1);
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_09"); //Aahh mein Amulett. Du hast es gefunden, hast du gesagt.
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_10"); //Hmm...h will gar nicht erst fragen, wo du es gefunden hast.
	AI_Output (self, hero, "DIA_Taliasan_Amulett_03_11"); //Danke.
	B_GiveXP (350);
	B_LogEntry		(AMULETTTELEPORT, "Um Hamond nicht zu verraten, hab ich Taliasan gesagt, dass ich es gefunden habe. Mehr als ein 'Danke' kaum nicht.");
	Hamond_Amu = 1;
	DIA_Taliasan_Amulett.permanent = 0;
	};

// ------------ Finderlohn-------------

instance DIA_Taliasan_Finderlohn (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 3;
	condition 	= DIA_Taliasan_Finderlohn_Condition;
	information 	= DIA_Taliasan_Finderlohn_Info;
	important		= 0;
	permanent		= 0;
	description		= "Finderlohn";

	};

func int DIA_Taliasan_Finderlohn_Condition ()
	{
	if Hamond_Amu == 1
		{
		return 1;
		};
	};

func void DIA_Taliasan_Finderlohn_Info ()		//hier könnte man wieder ein Quest aufbauen - Belohnung "richtig" verdienen.
	{
	AI_Output (hero, self, "DIA_Taliasan_Finderlohn_15_00"); //Danke. Dann war das wohl nicht so wertvoll?
	AI_Output (hero, self, "DIA_Taliasan_Finderlohn_15_01"); //Ich bin überwältigt von soviel Großzügigkeit!
	AI_Output (self, hero, "DIA_Taliasan_Finderlohn_03_02"); //Ha ha, du bist ganz schön wagemutig. Aber das gefällt mir.
	AI_Output (self, hero, "DIA_Taliasan_Finderlohn_03_03"); //Du sollst dein Belohnung erhalten.
	AI_Output (self, hero, "DIA_Taliasan_Finderlohn_03_04"); //Hier. ich hab noch so ein ähnliches. Du kannst es haben. Ich hab zwei davon.
	B_GiveInvItems( self, other,Amulett_Capricorn,1);
	B_LogEntry (AMULETTTELEPORT, "Der sarkastische Dank an seine überwältigende Großzügigkeit hat ihn in gewisser Weise imponiert und gab mir dafür eine anderes ähnliches Amulett.");
	AI_Output (hero, self, "DIA_Taliasan_Finderlohn_15_05"); //Ohh... danke. Noch so ein merkwürdiges Amulett.
	};

// ------------ Info Amulett-------------

instance DIA_Taliasan_Info_Amulett (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 2;
	condition 	= DIA_Taliasan_Info_Amulett_Condition;
	information 	= DIA_Taliasan_Info_Amulett_Info;
	important	= 0;
	permanent	= 0;
	description	= "Was hat es mit den Amulett auf sich?";

	};

func int DIA_Taliasan_Info_Amulett_Condition ()
	{
	if (Hamond_Amu == 2)|| (Npc_KnowsInfo(hero,DIA_Taliasan_Finderlohn))
	&& (!Npc_KnowsInfo(hero,DIA_Taliasan_Info_AmulettvW))
		{
		return 1;
		};
	};

func void DIA_Taliasan_Info_Amulett_Info ()
	{
	if Hamond_Amu == 2
		{
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_00"); //Was hat es mit den Amulett auf sich?
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_01"); //Was soll schon damit sein? Es ist ein magisches Amulett. 
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_02"); //Siehst du das Zeichen? Es muß doch eine Bedeutung haben. Irgendwo hab ich das auch schon gesehen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_03"); //So? Hast du? Vielleicht hat es eine Bedeutung. Aber vielleicht ist es auch nur Zufall.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_04"); //Ich ämm ... weis nichts weiter darüber.
		B_LogEntry		(AMULETTTELEPORT, "Hmm? Irgendwie hab ich was falsch gemacht. Nun bin ich das Amulett los und Taliasan meint das er nichts weiter dazu weis. Aber irgendwie klingt er nicht überzeugend.");
		}
	else
		{
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_05"); //Ja..tzt gibt es schon zwei von diesen seltsamen Amuletten.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_06"); //Irgend eine höhere Bedeutung müssen die doch haben. Irgendwo habe ich die Zeichen darauf schon mal gesehen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_07"); //Na ja, abgesehen von der leichten magischen Kraft die sie ihrem Träger übergibt, scheinen die noch eine andere Bedeutung zu haben.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_08"); //Diese Zeichen finden sich auf großen Gebilden wieder.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_09"); //In alten Inschriften konnte ich rauslesen, dass sie eine Art Transportsystem darstellen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_10"); //Ja..doch mein erster Versuch das auszuprobieren, hat mich fast das Leben gekostet.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_11"); //Womöglich hast du etwas falsch gemacht.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_12"); //Ja.. ganz bestimmt. Es hat irgendwie mit den seltsamen Amuletten zu tun.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_13"); //Hast du es nicht noch mal probiert?
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_14"); //Nein, das eine mal hat mir gereicht.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_15"); //Dann werde ich es probieren. Ich hab da auch schon eine Idee.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_16"); //Da pass nur auf das es nicht das Letzte ist was du ausprobierst.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_17"); //Aber solltest du doch was rausfinden, las es mich wissen.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_18"); //Na ja, gegen eine gute Belohnung ....
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_19"); //Ja.. ja, bist du bei mir schon mal leer ausgegangen? Du wirst schon was bekommen.
		B_LogEntry		(AMULETTTELEPORT, "Nun hab ich schon zwei dieser merkwürdigen Amuletts gesehen. Taliasan hat in alten Schriften etwas über die Benutzung von Teleportern mit den Amuletten gelesen. Wenn ich mehr in Erfahrung bringen kann, wird er mich belohnen.");
		};
	};

// ------------ Hat nun eins gefunden-------------

instance DIA_Taliasan_Info_Amulette (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 3;
	condition 	= DIA_Taliasan_Info_Amulette_Condition;
	information 	= DIA_Taliasan_Info_Amulette_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich hab noch mehr seltsame Amulette.";

	};

func int DIA_Taliasan_Info_Amulette_Condition ()
	{
	if (Hamond_Amu == 2)
	&& (!Npc_KnowsInfo(hero,DIA_Taliasan_Info_AmulettvW))
	&& ((Npc_HasItems(other, Amulett_Gemini) >= 1)
	|| (Npc_HasItems(other, Amulett_Tarus) >= 1)
	|| (Npc_HasItems(other, Amulett_Pisces) >= 1)
	|| (Npc_HasItems(other, Amulett_Aquarius) >= 1)
	|| (Npc_HasItems(other, Amulett_Leo) >= 1)
	|| (Npc_HasItems(other, Amulett_Capricorn) >= 1))

		{
		return 1;
		};
	};

func void DIA_Taliasan_Info_Amulette_Info ()
{
		AI_Output (hero, self, "DIA_Taliasan_Amulett_15_10"); //Hier. schaumal nochmehr von diesen Amuletten.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_06"); //Irgend eine höhere Bedeutung müssen die doch haben. Irgendwo habe ich die Zeichen darauf schon mal gesehen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_07"); //Na ja, abgesehen von der leichten magischen Kraft die sie ihrem Träger übergibt, scheinen die noch eine andere Bedeutung zu haben.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_08"); //Diese Zeichen finden sich auf großen Gebilden wieder.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_09"); //In alten Inschriften konnte ich rauslesen, dass sie eine Art Transportsystem darstellen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_10"); //Ja..doch mein erster Versuch das auszuprobieren, hat mich fast das Leben gekostet.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_11"); //Womöglich hast du etwas falsch gemacht.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_12"); //Ja.. ganz bestimmt. Es hat irgendwie mit den seltsamen Amuletten zu tun.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_13"); //Hast du es nicht noch mal probiert?
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_14"); //Nein, das eine mal hat mir gereicht.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_15"); //Dann werde ich es probieren. Ich hab da auch schon eine Idee.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_16"); //Da pass nur auf das es nicht das Letzte ist was du ausprobierst.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_17"); //Aber solltest du doch was rausfinden, las es mich wissen.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_18"); //Na ja, gegen eine gute Belohnung ....
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_19"); //Ja.. ja, bist du bei mir schon mal leer ausgegangen? Du wirst schon was bekommen.
		B_LogEntry		(AMULETTTELEPORT, "Ein so'n merkwürdigen Amulett hab ich gefunden und Taliasan davon berichtet. Er hat in alten Schriften etwas über die Benutzung von Teleportern mit den Amuletten gelesen. Wenn ich mehr in Erfahrung bringen kann, wird er mich belohnen.");
};


// ------------ Hat Amulett vor Wanzenquest-------------

instance DIA_Taliasan_Info_AmulettvW (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 3;
	condition 	= DIA_Taliasan_Info_AmulettvW_Condition;
	information 	= DIA_Taliasan_Info_AmulettvW_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich hab hier ein seltsame Amulett.";

	};

func int DIA_Taliasan_Info_AmulettvW_Condition ()
	{
	if ((!Npc_KnowsInfo(hero,DIA_Taliasan_Info_Amulette)) && (!Npc_KnowsInfo(hero,DIA_Taliasan_Info_Amulett)))
	&& (!Npc_KnowsInfo(hero,DIA_Hamond_Hallo))
	&& ((Npc_HasItems(other, Amulett_Gemini) >= 1)
	|| (Npc_HasItems(other, Amulett_Tarus) >= 1)
	|| (Npc_HasItems(other, Amulett_Pisces) >= 1)
	|| (Npc_HasItems(other, Amulett_Aquarius) >= 1)
	|| (Npc_HasItems(other, Amulett_Leo) >= 1)
	|| (Npc_HasItems(other, Amulett_Capricorn) >= 1))

		{
		return 1;
		};
	};

func void DIA_Taliasan_Info_AmulettvW_Info ()
{
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_00"); //Was hat es mit den Amulett auf sich?
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_01"); //Was soll schon damit sein? Es ist ein magisches Amulett. 
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_02"); //Siehst du das Zeichen? Es muß doch eine Bedeutung haben. Irgendwo hab ich das auch schon gesehen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_03"); //So? Hast du? Vielleicht hat es eine Bedeutung. Aber vielleicht ist es auch nur Zufall.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_06"); //Irgend eine höhere Bedeutung müssen die doch haben. Irgendwo habe ich die Zeichen darauf schon mal gesehen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_07"); //Na ja, abgesehen von der leichten magischen Kraft die sie ihrem Träger übergibt, scheinen die noch eine andere Bedeutung zu haben.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_08"); //Diese Zeichen finden sich auf großen Gebilden wieder.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_09"); //In alten Inschriften konnte ich rauslesen, dass sie eine Art Transportsystem darstellen.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_10"); //Ja..doch mein erster Versuch das auszuprobieren, hat mich fast das Leben gekostet.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_11"); //Womöglich hast du etwas falsch gemacht.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_12"); //Ja.. ganz bestimmt. Es hat irgendwie mit den seltsamen Amuletten zu tun.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_13"); //Hast du es nicht noch mal probiert?
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_14"); //Nein, das eine mal hat mir gereicht.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_15"); //Dann werde ich es probieren. Ich hab da auch schon eine Idee.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_16"); //Da pass nur auf das es nicht das Letzte ist was du ausprobierst.
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_17"); //Aber solltest du doch was rausfinden, las es mich wissen.
		AI_Output (hero, self, "DIA_Taliasan_Info_Amulett_15_18"); //Na ja, gegen eine gute Belohnung ....
		AI_Output (self, hero, "DIA_Taliasan_Info_Amulett_03_19"); //Ja.. ja, bist du bei mir schon mal leer ausgegangen? Du wirst schon was bekommen.
		Log_CreateTopic		(AMULETTTELEPORT, LOG_MISSION);
		Log_SetTopicStatus	(AMULETTTELEPORT, LOG_RUNNING);
		B_LogEntry		(AMULETTTELEPORT, "Ich hab ein seltsammes Amulett gefunden und Taliasan davon berichtet. Er hat in alten Schriften etwas über die Benutzung von Teleportern mit den Amuletten gelesen. Wenn ich mehr in Erfahrung bringen kann, wird er mich belohnen.");
};


// ------------ Info Teleporter-------------

instance DIA_Taliasan_Teleporter (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_Teleporter_Condition;
	information 	= DIA_Taliasan_Teleporter_Info;
	important	= 0;
	permanent	= 1;
	description	= "Wegen den Teleportern?";

	};

func int DIA_Taliasan_Teleporter_Condition ()
	{   // Warnung gesehen  && noch nict berichtet || Warnung gespürt     && noch nicht berichtet   ||    geschafft         && noch nicht berichtet
	if ((((MP_CONT & 1) == 1)&&((MP_CONT & 8) != 8))||(((MP_CONT & 2) == 2)&&((MP_CONT & 16) != 16)) || (((MP_CONT & 4) == 4)&&((MP_CONT & 32) != 32)))
	&& ((((Hamond_Amu == 1) && Npc_KnowsInfo(hero,DIA_Taliasan_Info_Amulette))) || Npc_KnowsInfo(hero,DIA_Taliasan_Info_Amulett)|| Npc_KnowsInfo(hero,DIA_Taliasan_Info_AmulettvW))

		{
		return 1;
		};
	};

func void DIA_Taliasan_Teleporter_Info ()
	{
		AI_Output (hero, self, "DIA_Taliasan_Teleporter_15_00"); //Ich hab was zu den Teleportern rausgefunden.
		AI_Output (self, hero, "DIA_Taliasan_Teleporter_13_01"); //Ja..  Erzähl schon!

		if ((MP_CONT & 1) == 1)
		&& ((MP_CONT & 8) != 8)
		{
			Info_AddChoice(DIA_Taliasan_Teleporter, "Magisches rotes Feuer.", DIA_Taliasan_Teleporter_schaun);
		};
		if ((MP_CONT & 2) == 2)
		&& ((MP_CONT & 16) != 16)
		{
			Info_AddChoice(DIA_Taliasan_Teleporter, "Fehlschlag.", DIA_Taliasan_Teleporter_auwa);
		};
		if ((MP_CONT & 4) == 4)
		&& ((MP_CONT & 32) != 32)
		{
			Info_AddChoice(DIA_Taliasan_Teleporter, "Bin durchgegangen.", DIA_Taliasan_Teleporter_geschafft);
		};
	};

func void DIA_Taliasan_Teleporter_schaun ()
	{
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_schaun_15_00"); //Ich hab einen gefunden und wollte durchgehen.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_schaun_13_01"); //Ja..und?
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_schaun_15_02"); //Als ich näher kam erschien da ein rotes magisches Feuer und ein Gebrüll welches direkt aus der Hölle zu kommen schien.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_schaun_13_03"); //Da erzählst du mir nichts neues. Das kenne ich selber.
	B_GiveXP (100);
	MP_CONT = MP_CONT | 8;
	};

func void DIA_Taliasan_Teleporter_auwa ()
	{
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_auwa_15_00"); //Ich bin in das rote magische Feuer gegangen.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_auwa_13_01"); //Ha Ha ... und du hast überlebt? Man, du hast mehr Glück als Verstand.
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_auwa_15_02"); //Ohh ja, das gab einen Hieb wie von einem Troll. Ich hatte wirklich Glück.
	//AI_Output (self, hero, "DIA_Taliasan_Teleporter_auwa_13_03"); //Na, die Erfahrung habe ich selber gemacht. Komme wieder wenn du wirklich was neues herausgefunden hast.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_schaun_13_03"); //Da erzählst du mir nichts neues. Das kenne ich selber.
	B_GiveXP (250);
	B_LogEntry (AMULETTTELEPORT, "Trots warnenden Gebrülls und magischen Lichtes, wollte ich den Teleporter betreten. Mit viel Glück hab ich überlebt. Anscheint kann man ihn nicht ohne weiteres benutzen!");
	MP_CONT = MP_CONT | 16;
	};

func void DIA_Taliasan_Teleporter_geschafft ()
	{
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_00"); //Ich hab's geschafft. Ich bin durchgegangen.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_geschafft_13_01"); //Was?! Wie, du hast es geschafft?
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_02"); //Ich bin von Einem zum anderem Teleporter teleportiert worden.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_geschafft_13_03"); //Großartig! Wie hast du das geschafft?
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_04"); //Die seltsamen Amulette spielen da doch eine wichtige Rolle.
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_05"); //Man kann nur mit einen bestimmten Amulett ein bestimmtes Tor des Teleporters benutzen.
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_06"); //Und, dies scheint auch immer nur zu einen bestimmten Teleporter zu führen.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_geschafft_13_07"); //Interessant! Die früheren Bewohner nutzten dies bestimmt, um schnell von einem zum anderen Ort zu gelangen.
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_geschafft_13_08"); //Dabei war es wohl nur denen erlaubt, die die entsprechenden Amulette besaßen.
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_09"); //Dann gibt es bestimmt noch mehr von diesen Amuletten?
	AI_Output (self, hero, "DIA_Taliasan_Teleporter_geschafft_13_10"); //Ja.. Ganz bestimmt. Wenn du Glück hast findest du bestimmt noch mehr davon.
	AI_Output (hero, self, "DIA_Taliasan_Teleporter_geschafft_15_11"); //Hmm... Das wird sich auf jeden Fall lohnen.
	B_GiveXP (600);
	B_LogEntry (AMULETTTELEPORT, "Ich hab den Teleporter erfolgreich nutzen können. Man braucht für jedes Tor ein entsprechendes Amulett mit gleichartigen Zeichen.");
	MP_CONT = MP_CONT | 32;
	};

// ------------ Info Teleporter Belonung-------------

instance DIA_Taliasan_Teleporterlohn (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_Teleporterlohn_Condition;
	information 	= DIA_Taliasan_Teleporterlohn_Info;
	important	= 0;
	permanent	= 0;
	description	= "Belohnung für Teleporterinformation?";

	};

func int DIA_Taliasan_Teleporterlohn_Condition ()
	{
	if ((MP_CONT & 32) == 32)
		{
		return 1;
		};
	};

func void DIA_Taliasan_Teleporterlohn_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_Teleporterlohn_15_00"); //Hast du nicht was vergessen?
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_01"); //Nein, ich vergesse nie etwas! ... Nicht? Hehe... ein Versuch war es Wert. Also zu deiner Belohnung...	
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_02"); //Hier. Zwei Tränke zur Stärkung und zwei Zaubersprüche sind wohl angemessen.
	AI_Output (hero, self, "DIA_Leofwin_Mutprobe_15_04"); //Hmm...
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_04"); //Was ? Reicht das nicht! Hat die Gier der Söldner dich angesteckt und deinen Geist verdorben?
	AI_Output (hero, self, "DIA_Taliasan_Teleporterlohn_15_05"); //Bestimmt nicht! Aber ich habe mein Leben riskiert!
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_06"); //Unser Leben riskieren wir doch alle hier, täglich. Und du willst dir doch unter Berengar die Anerkennung eines wahren Kämpfers verdienen?
	AI_Output (hero, self, "DIA_Taliasan_Teleporterlohn_15_07"); //Ja..
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_08"); //Gut. Also pass auf! Die Bauweise der Teleporter lässt darauf schließen, dass es sechs Amulette geben muss, damit man diese Portale benutzen kann.
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_09"); //Zwei habe ich bereits! Besorge mir die restlichen vier.
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_10"); //Für das nächste Amulett zahle ich dir dreihundert Silber und für jedes weitere verdoppelt sich die Belohnung.
	AI_Output (self, hero, "DIA_Taliasan_Teleporterlohn_03_11"); //Das ist ein vielversprechendes Geschäft, oder nicht? 


	B_GiveInvItems (self, other, ItFo_Potion_Health_02,2);
	B_GiveInvItems (self, other, ItFo_Potion_Mana_02,2);
	B_GiveInvItems (self, other, ItFo_Potion_Haste_02,2);
	B_GiveInvItems (self, other, ItArScrollSummonDemon,1);
	B_GiveInvItems (self, other, ItArScrollTrfBloodfly,1);
	
	Info_AddChoice (DIA_Taliasan_Teleporterlohn, "Dann habe ich aber keine mehr.", DIA_Taliasan_Teleporterlohn_aber);
	Info_AddChoice (DIA_Taliasan_Teleporterlohn, "Ja?.", DIA_Taliasan_Teleporterlohn_ja);
	};
	
func void DIA_Taliasan_Teleporterlohn_aber ()
	{
	AI_Output (other, self, "DIA_Taliasan_Teleporterlohn_aber_15_00"); //Warum sollst du mir etwas bezahlen, was unbezahlbar ist? Die Amulette könnten mir vielleicht selbst einmal eine große Hilfe sein.
	AI_Output (self, other, "DIA_Taliasan_Teleporterlohn_aber_03_01"); //Glaubst du, dass die Portale einst nur von einem Einzigen benutzt wurden? Von den Amuletten gibt es mehrere, so wie es von ein und derselben Tür auch mehrere Schlüssel geben kann!
	AI_Output (self, other, "DIA_Taliasan_Teleporterlohn_aber_03_02"); //Also, was ist?
	
	Info_AddChoice (DIA_Taliasan_Teleporterlohn, "Nein.", DIA_Taliasan_Teleporterlohn_nein);
	};
	
func void DIA_Taliasan_Teleporterlohn_ja ()
	{
	AI_Output (other, self, "DIA_Taliasan_Teleporterlohn_ja_15_00"); //Einverstanden. Ich werde die Amulette schon auftreiben.
	AI_Output (self, other, "DIA_Taliasan_Teleporterlohn_ja_03_01"); //Gut! Aber du solltest sie mir alle beschaffen. 
	AI_Output (self, other, "DIA_Taliasan_Teleporterlohn_ja_03_02"); //Falls es dir wirklich gelingt, die restlichen vier Amulette zu finden werde ich mich besonders großzügig zeigen!
	AI_Output (other, self, "DIA_Taliasan_Teleporterlohn_ja_15_03"); //Und, was verstehst du unter Großzügigkeit?
	AI_Output (self, other, "DIA_Taliasan_Teleporterlohn_ja_03_04"); //Besorg mit die magischen Schlüssel, und du hast mein Wort; DU WIRST ES NICHT BEREUEN!
	
	Info_ClearChoices (DIA_Taliasan_Teleporterlohn);
	B_LogEntry (AMULETTTELEPORT, "Taliasan gab mir den Auftrag soviel von den Teleporteramuletten zu suchen wie ich kann. Zwei hat er schon, Capricorn und Leo. Vier fehlen noch, um den Satz zu zu vervollständigen");
	TeleAmu = 3;
	TeleAmulohn = 300;
	};
	
func void DIA_Taliasan_Teleporterlohn_nein ()
	{
	AI_Output (other, self, "DIA_Taliasan_Teleporterlohn_nein_15_00"); //Nein, die Amulette bleiben besser in meinem Besitz.
	AI_Output (self, other, "DIA_Taliasan_Teleporterlohn_nein_03_01"); //Wie du willst. Ich werde sie mir schon irgendwie besorgen!  Ich finde schnell jemand anderen,  der den Wert dieses Auftrages richtig einzuschätzen versteht.	
	
	Info_ClearChoices (DIA_Taliasan_Teleporterlohn);
	B_LogEntry (AMULETTTELEPORT, "Taliasan wollte das ich für ihn die restlichen Teleporteramulette besorge, aber da hat er falsch gedacht. Ich behalte die wertvollen Amulette lieber für mich.");
	Log_SetTopicStatus	(AMULETTTELEPORT, LOG_FAILED);
	};
	
// ------------ Info Teleporteramulettsuche-------------

instance DIA_Taliasan_TeleAmuSuche (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_TeleAmuSuche_Condition;
	information 	= DIA_Taliasan_TeleAmuSuche_Info;
	important	= 0;
	permanent	= 1;
	description	= "Ich hab Teleporteramulette für dich.";

	};

func int DIA_Taliasan_TeleAmuSuche_Condition ()
	{
	if ((Npc_HasItems(other, Amulett_Gemini) >= 1) && ((TeleAmu & 4) != 4) && TeleAmulohn != 0)
	|| ((Npc_HasItems(other, Amulett_Tarus) >= 1) && ((TeleAmu & 8) != 8) && TeleAmulohn != 0)
	|| ((Npc_HasItems(other, Amulett_Pisces) >= 1) && ((TeleAmu & 16) != 16) && TeleAmulohn != 0)
	|| ((Npc_HasItems(other, Amulett_Aquarius) >= 1) && ((TeleAmu & 32) != 32) && TeleAmulohn != 0) 

		{
		return 1;
		};
	};

func void DIA_Taliasan_TeleAmuSuche_Info ()
	{
	AI_Output (hero, self, "DIA_Taliasan_TeleAmuSuche_15_00"); //Hier.sind die Amulette für die Portale.
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuSuche_03_01"); //Ausgezeichnet! Dann lass mal sehen.
	
	if ((Npc_HasItems(other, Amulett_Gemini) >= 1) && ((TeleAmu & 4) != 4))
	{
		Info_AddChoice (DIA_Taliasan_TeleAmuSuche, "Amulett Gemini", DIA_Taliasan_TeleAmuSuche_Gemini);
	};
	
	if ((Npc_HasItems(other, Amulett_Tarus) >= 1) && ((TeleAmu & 8) != 8))
	{
		Info_AddChoice (DIA_Taliasan_TeleAmuSuche, "Amulett Tarus", DIA_Taliasan_TeleAmuSuche_Tarus);
	};
	
	if ((Npc_HasItems(other, Amulett_Pisces) >= 1) && ((TeleAmu & 16) != 16))
	{
		Info_AddChoice (DIA_Taliasan_TeleAmuSuche, "Amulett Pisces", DIA_Taliasan_TeleAmuSuche_Pisces);
	};
		
	if ((Npc_HasItems(other, Amulett_Aquarius) >= 1) && ((TeleAmu & 32) != 32)) 
	{
		Info_AddChoice (DIA_Taliasan_TeleAmuSuche, "Amulett Aquarius", DIA_Taliasan_TeleAmuSuche_Aquarius);
	};
	
	Info_AddChoice (DIA_Taliasan_TeleAmuSuche, "zurück", DIA_Taliasan_TeleAmuSuche_return);
	};


func int DIA_Taliasan_TeleAmuSuche_auszahl ()
	{
	AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_00"); //Ahh, sehrgut. Wieder eines der Amulette in meiner Sammlung.
	AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_01"); //Hier.! Wie abgesprochen: deine Belohnung!
	
	B_GiveXP(500);
	CreateInvItems	(dic_2002_Taliasan, ItMiNugget, TeleAmulohn);
	B_GiveInvItems	(dic_2002_Taliasan, hero, ItMiNugget, TeleAmulohn);
	TeleAmulohn = TeleAmulohn * 2;
	
	if TeleAmulohn != 4800
		{
		AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_02"); //Weiter so! Es müssen noch andere dieser Artefakte zu finden sein.
		}
	
	else
		{
		AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_03"); //Du hast es tatsächlich geschafft alle Amulette zu finden.
		AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_04"); //Damit hast du mir einen großen Dienst erwiesen.
		AI_Output (hero, dic_2002_Taliasan, "DIA_Taliasan_TeleAmuSuche_auszahl_15_05"); //Ach, ... kein Problem... Hab ich so nebenbei gemacht.
		AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_06"); //Nebenbei ? - Haha - 
		
		B_GiveXP(2000);
		Info_ClearChoices (DIA_Taliasan_TeleAmuSuche);
		DIA_Taliasan_TeleAmuSuche.permanent = 0;
		B_LogEntry (AMULETTTELEPORT, "Ich habe es geschafft. Nun hat Taliasan alle sechs Teleporteramulette. Nun bin ich noch gespannt welchen Bonus er mir anbietet.");
		AI_StopProcessInfos	(self);
		};
	
	if ((Npc_HasItems(hero, Amulett_Gemini) >= 1) && ((TeleAmu & 4) != 4))
	|| ((Npc_HasItems(hero, Amulett_Tarus) >= 1) && ((TeleAmu & 8) != 8))
	|| ((Npc_HasItems(hero, Amulett_Pisces) >= 1) && ((TeleAmu & 16) != 16))
	|| ((Npc_HasItems(hero, Amulett_Aquarius) >= 1) && ((TeleAmu & 32) != 32)) 
		{
		AI_Output (dic_2002_Taliasan, hero, "DIA_Taliasan_TeleAmuSuche_auszahl_03_07"); //Und, hast du noch mehr?
		}
	
	else
		{
		Info_ClearChoices (DIA_Taliasan_TeleAmuSuche);
		};
	};
	

	
func void DIA_Taliasan_TeleAmuSuche_Gemini ()
	{
	B_GiveInvItems (other, self, Amulett_Gemini,1);
	TeleAmu = TeleAmu | 4;
	B_LogEntry (AMULETTTELEPORT, "Taliasan hat von mir das Teleoprteramulett Gemini bekommen.");
	DIA_Taliasan_TeleAmuSuche_auszahl ();
	};
	
func void DIA_Taliasan_TeleAmuSuche_Tarus ()
	{
	B_GiveInvItems (other, self, Amulett_Tarus,1);
	TeleAmu = TeleAmu | 8;
	B_LogEntry (AMULETTTELEPORT, "Taliasan hat von mir das Teleoprteramulett Tarus bekommen.");
	DIA_Taliasan_TeleAmuSuche_auszahl ();
	};
	
func void DIA_Taliasan_TeleAmuSuche_Pisces ()
	{
	B_GiveInvItems (other, self, Amulett_Pisces,1);
	TeleAmu = TeleAmu | 16;
	B_LogEntry (AMULETTTELEPORT, "Taliasan hat von mir das Teleoprteramulett Pisces bekommen.");
	DIA_Taliasan_TeleAmuSuche_auszahl ();
	};
	
func void DIA_Taliasan_TeleAmuSuche_Aquarius ()
	{
	B_GiveInvItems (other, self, Amulett_Aquarius,1);
	TeleAmu = TeleAmu | 32;
	B_LogEntry (AMULETTTELEPORT, "Taliasan hat von mir das Teleoprteramulett Aquarius bekommen.");
	DIA_Taliasan_TeleAmuSuche_auszahl ();
	};
	
func void DIA_Taliasan_TeleAmuSuche_return ()
	{
	AI_Output (hero, self, "DIA_Taliasan_TeleAmuSuche_return_15_00"); //Ich glaube ich behalte vorerst noch ein Paar. Ich komme später noch mal vorbei.
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuSuche_return_03_01"); //Lass dir nicht ewig Zeit.  Vergiss nicht - es wird sich für dich lohnen.
	Info_ClearChoices (DIA_Taliasan_TeleAmuSuche);
	};
	
	
// ------------ Info Teleporteramulettsuche Bonus -------------

instance DIA_Taliasan_TeleAmuBonus (C_INFO)
	{
	npc 		= dic_2002_Taliasan;
	nr 		= 1;
	condition 	= DIA_Taliasan_TeleAmuBonus_Condition;
	information 	= DIA_Taliasan_TeleAmuBonus_Info;
	important	= 1;
	description	= "Bonus";

	};

func int DIA_Taliasan_TeleAmuBonus_Condition ()
	{
	if TeleAmulohn == 4800
		{
		return 1;
		};
	};

func void DIA_Taliasan_TeleAmuBonus_Info ()
	{
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_00"); //Nicht so voreilig!	
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_01"); //Auch wenn mein Ruf nicht der Beste ist,  mein Wort pflege ich zu halten. Du hast doch nicht vergessen das dir noch eine Belohnung zusteht?
	AI_Output (hero, self, "DIA_Taliasan_TeleAmuBonus_15_02"); //Ich weiß sehr wohl, von deinem Versprechen. Aber ich wollte dich prüfen.
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_03"); //Haha ... Du willst mich prüfen? Wenn es dir gelingt Wasser bergauf fließen zu lassen, dann kannst du es gern nochmal versuchen!
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_04"); //Dafür aber sind deine Fähigkeiten zu gering und damit sind wir auch schon bei deiner Belohnung.
	
	if Hamond_Wanze == 4	// als Magier
	|| (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	{
		AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_05"); //Da du dich unter anderem für den Weg der Magie entschieden hast, biete ich dir an dich in die nächsten zwei Kreise der Magie zu unterweisen.
		B_LogEntry (AMULETTTELEPORT, "Als Bonus kann ich zwischen mächtigen Tränken der Kraft und Geschick oder 2 weitere Kreise der Magie wählen");
	}
	else			// ist noch kein Magier
	{
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_06"); //Da ich Magier bin würde ich dich in die ersten zwei Kreise der Magie unterweisen und dein Mana steigern. Wenn du willst.	
	B_LogEntry (AMULETTTELEPORT, "Als Bonus kann ich Zwischen mächtigen Tränken der Kraft und Geschick oder der Unterweisung in die ersten 2 Kreise der Magie wählen");
	};
	
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_07"); //Oder du bist der Meinung, dass dies nicht deinen Wünschen entspricht, so kannst du von mir zwei mächtige Tränke der Kraft und der Geschicklichkeit erhalten.
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_03_08"); //Für was entscheidest du dich?
	
	Info_AddChoice (DIA_Taliasan_TeleAmuBonus, "Kreise der Magie", DIA_Taliasan_TeleAmuBonus_M);
	Info_AddChoice (DIA_Taliasan_TeleAmuBonus, "Tränke", DIA_Taliasan_TeleAmuBonus_T);
	};

func void DIA_Taliasan_TeleAmuBonus_M ()
	{
	if Hamond_Wanze == 4
	|| (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	{
	AI_Output (hero, self, "DIA_Taliasan_TeleAmuBonus_M_15_00"); //Ich möchte, dass du mich in die nächsten zwei Kreise der Magie unterweist.
		TeleAmulohn = 4803;
	B_LogEntry (AMULETTTELEPORT, "Ich habe mich für die nächsten zwei Kreise der Magie entschieden.");
	}
	else
	{
		AI_Output (hero, self, "DIA_Taliasan_TeleAmuBonus_M_15_01"); //Ja.. ich werde die Chance ergreifen. Unterweise mich in die Geheimnisse der Magie
		TeleAmulohn = 4802;
		B_LogEntry (AMULETTTELEPORT, "Ich wähle den Weg der Magie");
		Log_CreateTopic 	(LehrerStadt,LOG_NOTE);
		B_LogEntry		(LehrerStadt,"Talisan kann mir die ersten zwei Kreise der Magie lehren und meine magisch Kraft steigern.");
			
	};
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_M_03_02"); //So sei es. Wenn du bereit bist und genügend Erfahrung gesammelt hast können wir anfangen.
	Log_SetTopicStatus	(AMULETTTELEPORT, LOG_SUCCESS);
	Info_ClearChoices (DIA_Taliasan_TeleAmuBonus);
	};


func void DIA_Taliasan_TeleAmuBonus_T ()
	{
	AI_Output (hero, self, "DIA_Taliasan_TeleAmuBonus_T_15_00"); //Ich nehme lieber die Tränke. Damit kann ich schneller meine Kraft ausüben und schneller Wirkungen erzielen.
	AI_Output (self, hero, "DIA_Taliasan_TeleAmuBonus_T_03_01"); //In Ordnung - wie du willst. Hier sind die Tränke.
	
	CreateInvItems	(self, ItFo_Potion_Strength_03, 2);
	B_GiveInvItems	(self, other, ItFo_Potion_Strength_03, 2);
	Npc_RemoveInvItem (hero, ItFo_Potion_Strength_03);			// Damit als Ausgabe "2 Tränke erhalten" dasteht
	CreateInvItems	(self, ItFo_Potion_Dex_03, 2);
	B_GiveInvItems	(self, other, ItFo_Potion_Dex_03, 2);
	Npc_RemoveInvItem (hero, ItFo_Potion_Dex_03);				// Damit als Ausgabe "2 Tränke erhalten" dasteht
	B_LogEntry (AMULETTTELEPORT, "Die Tränke sind mir eine bessere Hilfe");
	Log_SetTopicStatus	(AMULETTTELEPORT, LOG_SUCCESS);
	Info_ClearChoices (DIA_Taliasan_TeleAmuBonus);
	};
	
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  DIA_Taliasan_KREIS2 (C_INFO)
{
	npc			= Dic_2002_Taliasan;
	condition		= DIA_Taliasan_KREIS2_Condition;
	information		= DIA_Taliasan_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  DIA_Taliasan_KREIS2_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& TeleAmulohn > 4801
	
	{
		return TRUE;
	};

};
FUNC void  DIA_Taliasan_KREIS2_Info()
{
	AI_Output (other, self,"DIA_Taliasan_KREIS2_15_01"); //Ich möchte den zweiten Kreis erlernen.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_02"); //Du hast ein erstes Verständnis der Magie erworben und dich darum verdient gemacht, deine Kenntnisse zu vertiefen.
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_03"); //Mit dem zweiten Kreis wirst du gleich mit einem Widerspruch in der Magie konfrontiert. Denn du wirst einerseits Zauber erlernen mit denen du die Macht hast Gegner leicht der Hand des Todes zu übergeben. 
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_04"); //Andererseits steht dir in diesem zweiten Kreis auch das Geheimnis der Heilung zur Verfügung.  Natürlich ist auch dieser zweite Kreis immer noch der Anfang in der nahezu unendlichen magischen Wissenschaft. 
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_05"); //Dennoch ist es an dir zu Erkennen das jedes neue Können, eine Prüfung in sich birgt.
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_06"); //Und deswegen werde ich mit meinen Ausführungen hier enden und ohne große Worte dir diese Macht übergeben.		
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_07"); //Nur eines will ich dir noch sagen, auch wenn es dir wahrscheinlich, wie ein Rätsel erscheint:
		AI_Output (self, other,"DIA_Taliasan_KREIS2_03_08"); //Wird dir Unheil zuteil das dich zugrunde richtet, ganz gleich von wem und ganz gleich in welcher Form, begreife das du der Ursprung dieses Unheils bist.
 		DIA_Taliasan_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  DIA_Taliasan_KREIS3 (C_INFO)
{
	npc			= Dic_2002_Taliasan;
	condition		= DIA_Taliasan_KREIS3_Condition;
	information		= DIA_Taliasan_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  DIA_Taliasan_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& TeleAmulohn > 4802
	 
	{
		return TRUE;
	};

};
FUNC void  DIA_Taliasan_KREIS3_Info()
{
	AI_Output (other, self,"DIA_Taliasan_KREIS3_15_01"); //Kannst du mich den dritten Kreis lehren?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"DIA_Taliasan_KREIS3_03_03"); //Mit Erreichen des dritten Kreises hast du gezeigt, dass du schon die Mannigfaltigkeit der Wege aus den ersten Kreisen der Magie erkundet hast.
		AI_Output (self, other,"DIA_Taliasan_KREIS3_03_04"); //Auch wenn dir jetzt neue Runen zur Verfügung stehen und du ihre Anwendung selbst erkunden wirst, möchte ich dich mit meiner Deutung des dritten Kreises der Magie vertraut machen.
		AI_Output (self, other,"DIA_Taliasan_KREIS3_03_05"); //Nutze die Magie um dir all die grobschlächtigen und rohe Naturen vom Leib zu halten. Halunken und Gauner sind es, die die Welt bevölkern. Ihre Messer durchtrennen schnell deinen Lebensfaden. Gelächter ist das einzige Mitleid das sie kennen.	
		AI_Output (self, other,"DIA_Taliasan_KREIS3_03_06"); //Zeige deine Stärke jenen die unter Freundlichkeit verborgen dir Schaden wollen. Und das sind fast alle Menschen. Schrecke sie ab!  Und töte selbst nur dann, wenn es unvermeidlich ist.	
		AI_Output (self, other,"DIA_Taliasan_KREIS3_03_07"); //Erkenne deinen Weg, indem du dich dem größten Anführer anschließt. Jemandem dessen Prinzipien machtvoll sind. Jemand der es sich zur Aufgabe gemacht hat die Welt neu zu ordnen. 
		AI_Output (self, other,"DIA_Taliasan_KREIS3_03_08"); //Einen starken Willen, ungeheuere Stärke und keine Scheu vor Grausamkeit zeichnen diesen zukünftigen Herrscher aus. Ein Herrscher wie Berengar ! In seinem Dienst solltest du deine magischen Fähigkeiten stellen.
		DIA_Taliasan_KREIS3.permanent = 0;
	};

};