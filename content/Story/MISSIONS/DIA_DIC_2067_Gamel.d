//------------ ENDE -----------------
instance DIA_DIC_Gamel_Exit (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 999;
	condition = DIA_DIC_Gamel_Exit_Condition;
	information = DIA_DIC_Gamel_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

func int DIA_DIC_Gamel_Exit_Condition ()
	{
	return 1;
	};

func void DIA_DIC_Gamel_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};
	
//------------ Freund -----------------
instance DIA_DIC_Gamel_Freund (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 1;
	condition = DIA_DIC_Gamel_Freund_Condition;
	information = DIA_DIC_Gamel_Freund_Info;
	permanent = 0;
	important = 1;
	description = "Freund";
	};

func int DIA_DIC_Gamel_Freund_Condition ()
	{
	if (Npc_IsInState(self, ZS_Talk) && Npc_KnowsInfo(other, DIA_DIC_Amalric_Hilfe))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Freund_Info ()
	{
	AI_Output (self, other, "DIA_DIC_Gamel_Freund_12_00"); //Ich habe schon gehört, dass du mit Amalric gesprochen hast! Aber ich will mich zuerst mit dir unterhalten, bevor wir über andere Dinge reden. Und was gibt es schöneres, als über Leben und Tod zu sprechen. Worüber möchtest du mit mir reden?
	};
	
//------------ Leben. -----------------
instance DIA_DIC_Gamel_Leben (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 2;
	condition = DIA_DIC_Gamel_Leben_Condition;
	information = DIA_DIC_Gamel_Leben_Info;
	permanent = 0;
	important = 0;
	description = "Leben.";
	};

func int DIA_DIC_Gamel_Leben_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Gamel_Freund) && !Npc_KnowsInfo(other, DIA_DIC_Gamel_Anderes))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Leben_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Leben_13_00"); //Leben.
	AI_Output (self, other, "DIA_DIC_Gamel_Leben_15_01"); //Das Leben ist, wie in ein Boot zu steigen, das aufs Meer hinausfährt und ewig weiterfährt. Was denkst du darüber?
	};
	
//------------ Ja, so sehe ich das auch. -----------------
instance DIA_DIC_Gamel_Weitergehen (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 3;
	condition = DIA_DIC_Gamel_Weitergehen_Condition;
	information = DIA_DIC_Gamel_Weitergehen_Info;
	permanent = 0;
	important = 0;
	description = "Ja, so sehe ich das auch.";
	};

func int DIA_DIC_Gamel_Weitergehen_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Gamel_Leben) && !Npc_KnowsInfo(other, DIA_DIC_Gamel_Unlogisch))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Weitergehen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Weitergehen_13_00"); //Ja, so sehe ich das auch. Es muss immer weitergehen!
	AI_Output (self, other, "DIA_DIC_Gamel_Weitergehen_15_01"); //Aha, dann geh du auch mal weiter und lass mich mit meinen Überlegungen alleine.
	};
	
//------------ Nein, ich glaube das ist unlogisch. -----------------
instance DIA_DIC_Gamel_Unlogisch (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 4;
	condition = DIA_DIC_Gamel_Unlogisch_Condition;
	information = DIA_DIC_Gamel_Unlogisch_Info;
	permanent = 0;
	important = 0;
	description = "Nein, ich glaube das ist unlogisch.";
	};

func int DIA_DIC_Gamel_Unlogisch_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Gamel_Leben)  && !Npc_KnowsInfo(other, DIA_DIC_Gamel_Weitergehen))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Unlogisch_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Unlogisch_13_00"); //Nein, ich glaube das ist unlogisch. Das Leben geht ja nicht immer weiter. Zumindest wird es durch den Tod unterbrochen. Deswegen müsste der Vers doch heißen: Das Leben ist, wie in ein Boot zu steigen, das aufs Meer hinausfährt und sinkt.
	AI_Output (self, other, "DIA_DIC_Gamel_Unlogisch_15_01"); //Ein interessanter Gedanke, den du da hervorgebracht hast. Da ich schon weiß, was du mit Amalric besprochen hast, brauchst du mich gar nicht fragen. Ich werde euch beistehen. Aber ich benötige einen Zauber mit dem ich den Wind lenken kann. Ohne ihn werde ich im Kampf nichts ausrichten.
	};
	
//------------ Tod. -----------------
instance DIA_DIC_Gamel_Tod (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 5;
	condition = DIA_DIC_Gamel_Tod_Condition;
	information = DIA_DIC_Gamel_Tod_Info;
	permanent = 0;
	important = 0;
	description = "Tod.";
	};

func int DIA_DIC_Gamel_Tod_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Gamel_Freund) && !Npc_KnowsInfo(other, DIA_DIC_Gamel_Unlogisch))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Tod_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Tod_13_00"); //Tod.
	AI_Output (self, other, "DIA_DIC_Gamel_Tod_15_01"); //Natürlich gibt es den Tod. Und es gibt nach dem Tod keinen Übergang in eine andere Welt. Was meinst du dazu?
	};
	
//------------ Ja, so sehe ich das auch. -----------------
instance DIA_DIC_Gamel_Meinung (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 6;
	condition = DIA_DIC_Gamel_Meinung_Condition;
	information = DIA_DIC_Gamel_Meinung_Info;
	permanent = 0;
	important = 0;
	description = "Ja, ganz meine Meinung!";
	};

func int DIA_DIC_Gamel_Meinung_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Gamel_Tod) && !Npc_KnowsInfo(other, DIA_DIC_Gamel_Anderes))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Meinung_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Meinung_13_00"); //Ja, ganz meine Meinung!
	AI_Output (self, other, "DIA_DIC_Gamel_Meinung_15_01"); //Hm. Gut, mit dir mal geredet zu haben. Bitte störe mich jetzt nicht weiter.
	};
	
//------------ Nein. Ich könnte mir auch etwas anderes vorstellen: -----------------
instance DIA_DIC_Gamel_Anderes (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 7;
	condition = DIA_DIC_Gamel_Anderes_Condition;
	information = DIA_DIC_Gamel_Anderes_Info;
	permanent = 0;
	important = 0;
	description = "Nein. Ich könnte mir auch etwas anderes vorstellen";
	};

func int DIA_DIC_Gamel_Anderes_Condition ()
	{
	if (Npc_KnowsInfo(other, DIA_DIC_Gamel_Tod))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Anderes_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Anderes_13_00"); //Nein. Ich könnte mir auch etwas anderes vorstellen: Durch den Tod, tritt etwas neues ein. Deswegen muss für den Menschen der stirbt nach dem Tod etwas dasein, was er noch nicht kannte, eine andere Welt.
	AI_Output (other, self, "DIA_DIC_Gamel_Anderes_13_01"); //Wie der Mensch diese Welt wahrnimmt, lässt sich nicht sagen. Wenn es aber eine andere Welt gibt, führt der Tod den Menschen dorthin. Daher würde ich deinen Gedanken so formulieren: Es gibt keinen Tod. Es gibt nur den Übergang in eine andere Welt.
	AI_Output (self, other, "DIA_DIC_Gamel_Anderes_15_02"); //Wahrhaftig, ein Gedanke, der die Sinne zu weiteren Überlegungen öffnet. Aber lass uns nicht weiter über unlösbare Rätsel der Welt sprechen, während dringlicheres ansteht und von uns Taten erfordert.
	AI_Output (self, other, "DIA_DIC_Gamel_Anderes_15_03"); //Ich habe schon gehört, was du mit Amalric besprochen hast. Und ich werde dir helfen. Aber ich benötige einen Zauber mit dem ich den Wind lenken kann. Ohne ihn werde ich im Kampf nichts ausrichten.
	};
	
//------------ Hier ist der Zauber, nach dem du fragst.  -----------------
instance DIA_DIC_Gamel_Geben (C_INFO)
	{
	npc = DIC_2067_Gamel;
	nr = 4;
	condition = DIA_DIC_Gamel_Geben_Condition;
	information = DIA_DIC_Gamel_Geben_Info;
	permanent = 0;
	important = 0;
	description = "Hier ist der Zauber, nach dem du fragst.";
	};

func int DIA_DIC_Gamel_Geben_Condition ()
	{
	if ((Npc_KnowsInfo(other, DIA_DIC_Gamel_Anderes) || Npc_KnowsInfo(other, DIA_DIC_Gamel_Unlogisch)) && 
		(Npc_HasItems (hero, ItArRuneWindfist) >= 1 || Npc_HasItems (hero, ItArScrollWindfist) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Gamel_Geben_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Gamel_Geben_15_00"); //Hier ist der Zauber, nach dem du fragst. 
	AI_Output (self, other, "DIA_DIC_Gamel_Geben_11_01"); //Du findest mich bei Amalric.
	
	// Zauber geben
	if (Npc_HasItems (hero, ItArScrollWindfist) >= 1)
		{
		B_GiveInvItems(other, self,ItArScrollWindfist,1);
		}
	else
		{
		B_GiveInvItems(other, self,ItArRuneWindfist,1);	
		};
	
	// Zu Amalric gehen
	Npc_ExchangeRoutine(self,"AMALRIC");
	
	B_LogEntry (PruefungGeist, "Auch Gamal wird uns unterstützen.");
	
	AI_StopProcessInfos (self);
	};