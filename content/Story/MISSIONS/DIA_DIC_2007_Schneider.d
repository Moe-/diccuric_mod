// -------------- Exit --------------


INSTANCE DIA_DIC_Schneider_Exit (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 999;
	condition = DIA_dic_Schneider_Exit_Condition;
	information = DIA_dic_Schneider_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_dic_Schneider_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_dic_Schneider_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};

// ---------------  Junge trifft auf Schneider ---------
instance DIA_DIC_Schneider_Robe (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 1;
	condition = DIA_DIC_Schneider_Robe_Condition;
	information = DIA_DIC_Schneider_Robe_Info;
	description = "Hallo.";
	};

func int DIA_DIC_Schneider_Robe_Condition()
	{
	return 1;
	};

func void DIA_DIC_Schneider_Robe_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schneider_Robe_15_00"); //Hallo.
	AI_Output (self, other, "DIA_DIC_Schneider_Robe_11_01"); //Was willst du? Es ist noch nichts fertig. Du kannst also noch nichts abholen.
	};

instance DIA_DIC_Schneider_Kaufen (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 2;
	condition = DIA_DIC_Schneider_Kaufen_Condition;
	information = DIA_DIC_Schneider_Kaufen_Info;
	description = "Ich will etwas kaufen.";
	};

func int DIA_DIC_Schneider_Kaufen_Condition()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Raffa_Hallo))
		{
		return 1;
		};
	};

func void DIA_DIC_Schneider_Kaufen_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schneider_Kaufen_15_00"); //Ich will nichts abholen. Ich will etwas von dir kaufen.
	AI_Output (self, other, "DIA_DIC_Schneider_Kaufen_11_01"); //Du willst etwas kaufen? Du hast doch gar kein Silber. Für das, was du besitzt, kann ich dir höchstens ein paar Stofffetzen heraussuchen. 
	AI_StopProcessInfos	(self);
	};

instance DIA_DIC_Schneider_Arbeit (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 3;
	condition = DIA_DIC_Schneider_Arbeit_Condition;
	information = DIA_DIC_Schneider_Arbeit_Info;
	description = "Was für Gewänder fertigst du an?";
	};

func int DIA_DIC_Schneider_Arbeit_Condition ()
	{
	if (Npc_KnowsInfo (hero, DIA_DIC_Schneider_Robe))
		{
		return 1;
		};
	};

func void DIA_DIC_Schneider_Arbeit_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schneider_Arbeit_15_00"); //Ich bewundere deine kunstvolle Arbeit. Was für Gewänder fertigst du an?
	AI_Output (self, other, "DIA_DIC_Schneider_Arbeit_11_01"); //Ich schneidere und nähe die Roben für die Magier.
	AI_Output (other, self, "DIA_DIC_Schneider_Arbeit_15_02"); //Kannst du mir eine verkaufen?
	AI_Output (self, other, "DIA_DIC_Schneider_Arbeit_11_03"); //Wenn du ein Magier bist, bekommst du sie ohne ein einziges Silber zu zahlen. Kaufen kann man sie nicht. Sonst könnte ja jeder mit einem Magier verwechselt werden, und hier überall rein und rausspazieren.
	};

instance DIA_DIC_Schneider_Taliasan (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 4;
	condition = DIA_DIC_Schneider_Taliasan_Condition;
	information = DIA_DIC_Schneider_Taliasan_Info;
	description = "Ich werde bald Taliasans Lehrling.";
	};

func int DIA_DIC_Schneider_Taliasan_Condition ()
	{
	if (Npc_KnowsInfo(hero, DIA_DIC_Schneider_Arbeit) && (TaliasanAuftraege > 0))
		{
		return 1;
		};
	};

func void DIA_DIC_Schneider_Taliasan_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schneider_Taliasan_15_00"); //Ich werde bald ein Lehrling Taliasans. Eine Robe ist doch ein passendes Geschenk. Dadurch wird mir Taliasan schon vom ersten Tag an wohlgesonnen sein.
	AI_Output (self, other, "DIA_DIC_Schneider_Taliasan_11_01"); //Wozu braucht Taliasan eine Robe? Was Berengar für ihn zu tun hat, kann er auch im Schlafrock erledigen, das heißt, wenn ihm Berengar etwas zu tun gäbe. Aber Handel ist Handel, und da Taliasan kein anerkannter Magier ist, muss er zahlen. Bring mir hundert Silbermünzen und du kriegst deine Robe.
	AI_Output (other, self, "DIA_DIC_Schneider_Taliasan_15_02"); //Ok.
	};

// ------------  Junge Schneider Teil 2 -------
instance DIA_DIC_Schneider_Erz (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 5;
	condition = DIA_DIC_Schneider_Erz_Condition;
	information = DIA_DIC_Schneider_Erz_Info;
	permanent = 1;
	description = "Hier ist das Silber.";
	};

func int DIA_DIC_Schneider_Erz_Condition ()
	{
	if (NPC_KnowsInfo(hero, DIA_DIC_Schneider_Taliasan) 
			&& !(Npc_HasItems(other, Snd_Robe) >= 1)
			&& !(Npc_HasItems(DIC_2005_Lynn, Snd_Robe) >= 1))
		{
		return 1;
		};
	};

func void DIA_DIC_Schneider_Erz_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Schneider_Erz_15_00"); //Hier ist das Silber.
	if (Npc_HasItems(other, ItMiNugget) >= 100)
		{
		AI_Output (self, other, "DIA_DIC_Schneider_Erz_11_01"); //Wenn du das Silber von Taliasan hast, sag mir nicht, wo er es aufgetrieben hat. Ich will in nichts reingezogen werden. Hier, die Robe.
		//AI_Output (self, other, "DIA_DIC_Schneider_Erz_11_02"); //Sei aber bloß vorsichtig. Diese Robe hat besondere Fähigkeiten gegenüber mancher Personen...
		B_GiveInvItems(other, self,itminugget,100);
		B_GiveInvItems(self, other,Snd_Robe,1);
		
		B_LogEntry (TaliasansNeueAuftraege, "Ich habe mir eine Magierrobe gekauft. Aber irgendwas sagt mir, dass ich sie noch für etwas brauchen werde...");
		}
	else
		{
		AI_Output (self, other,  "DIA_DIC_Scheider_Erz_11_03"); //Du hast wohl noch nicht mit Taliasan über das Silber geredet...
		};
	};

// ---------- Was ist  mit Pyt -------------
instance DIA_DIC_Taylor_Pyt (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 6;
	condition = DIA_DIC_Taylor_Pyt_Condition;
	information = DIA_DIC_Taylor_Pyt_Info;
	permanent = 0;
	description = "Hey, ich hab dich schonmal mit Pyt gesehen.";
	};

func int DIA_DIC_Taylor_Pyt_Condition ()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Pyt_Helfen))
		{
		return 1;
		};
	};

func void DIA_DIC_Taylor_Pyt_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taylor_Pyt_15_00"); //Hey. Du stehst doch öfter mit Pyt zusammen rum oder? 
	AI_Output (self, other, "DIA_DIC_Taylor_Pyt_07_01"); //Und?
	AI_Output (other, self, "DIA_DIC_Taylor_Pyt_15_02"); //Ihr seit befreundet, stimmt's?
	AI_Output (self, other, "DIA_DIC_Taylor_Pyt_07_03"); //Ja. Und?
	AI_Output (other, self, "DIA_DIC_Taylor_Pyt_15_04"); //Ich habe gerade versucht, mit Pyt zu reden. Aber mehr als Beleidigungen bekam ich von ihm nicht zu hören. Er hat wohl einen schlechten Tag?
	AI_Output (self, other, "DIA_DIC_Taylor_Pyt_07_05"); //Pyt hat zurzeit nur schlechte Tage. 
	AI_Output (other, self, "DIA_DIC_Taylor_Pyt_15_06"); //Warum?
	AI_Output (self, other, "DIA_DIC_Taylor_Pyt_07_07"); //Vor kurzem hat man ihn nachts an der Schildmauer überfallen. Überlebt hat er nur, weil ihn der Dieb für tot hielt. Nach dem Überfall lag Pyt Stunden vor der Burg, bewusstlos und schwerverletzt. 
	AI_Output (self, other, "DIA_DIC_Taylor_Pyt_07_08"); //Sein gesamtes Silber hat der Dieb ihm genommen. Aber was für Pyt schwerer wiegt: Sein Schwert "Glücksbringer" ist auch gestohlen.
	AI_Output (other, self, "DIA_DIC_Taylor_Pyt_15_09"); //Ich wusste gar nicht, dass durch dieses Land Räuber ziehen.
	AI_Output (self, other, "DIA_DIC_Taylor_Pyt_07_10"); //Es sind auch keine Räuber. Hierher trauen sich nicht viele. Es ist einer von den Söldnern gewesen, Rotrou.

	B_GiveXP (50);
	
	B_LogEntry (PytQuest, "Na also, Pyt ist so sauer, weil ihm sein Schwert Glücksbringer gestohlen wurde. Taylor sagte, dass es Rotrou gewesen sein soll.");
	Info_AddChoice (DIA_DIC_Taylor_Pyt,"Was weißt du über diesen Ort?", DIA_DIC_Taylor_Ort);
	Info_AddChoice (DIA_DIC_Taylor_Pyt,"Was soll ich tun?", DIA_DIC_Taylor_Tun);
	Info_AddChoice (DIA_DIC_Taylor_Pyt,"Woher weißt du, das er es war?", DIA_DIC_Taylor_Wer);
	Info_AddChoice (DIA_DIC_Taylor_Pyt,"Wieso holt sich Pyt nicht sein Schwert?", DIA_DIC_Taylor_Wieso);
	TaylorPyt = 0;
	};

func void DIA_DIC_Taylor_Ort ()
	{
	AI_Output (other, self, "DIA_DIC_Taylor_Ort_15_00"); //Was weißt du über diesen Ort?
	AI_Output (self, other, "DIA_DIC_Taylor_Ort_07_01"); //Nichts. Wie alle hier.
	TaylorPyt = TaylorPyt + 1;
	};

func void DIA_DIC_Taylor_Tun ()
	{
	AI_Output (other, self, "DIA_DIC_Taylor_Tun_15_00"); //Was soll ich tun?
	AI_Output (self, other, "DIA_DIC_Taylor_Tun_07_01"); //Was du tun sollst? Diese Geschichte nicht noch weiter rumerzählen. Obwohl, es weiß ja eh schon fast jeder. 
	TaylorPyt = TaylorPyt + 1;
	};

func void DIA_DIC_Taylor_Wer ()
	{
	AI_Output (other, self, "DIA_DIC_Taylor_Wer_15_00"); //Woher weißt du, dass es Rotrou war?
	AI_Output (self, other, "DIA_DIC_Taylor_Wer_07_01"); //Ich kenne die Vorgeschichte. Pyt hat auch Schindluder getrieben. Er hat Rotrou beim Kartenspiel ausgenommen, obwohl Pyt ehrlich gespielt hat. Nur hat Pyt später rumerzählt, Rotrou wäre jetzt so arm, dass er die dreckigsten Fleischwanzen isst, um was zu Beißen zu haben. 
	AI_Output (self, other, "DIA_DIC_Taylor_Wer_07_02"); //Ziemlich übermütig. Aber Rotrou war der Dieb, ohne Zweifel. Er hatte schon immer ein Auge auf Pyts Schwert gehabt. 
	TaylorPyt = TaylorPyt + 1;
	};

func void DIA_DIC_Taylor_Wieso ()
	{
	AI_Output (other, self, "DIA_DIC_Taylor_Wieso_15_00"); //Wieso geht Pyt nicht zu Rotrou und erstreitet sich sein Recht?
	AI_Output (self, other, "DIA_DIC_Taylor_Wieso_07_01"); //Pyt und sein Aberglaube. Er denkt, ohne SEIN Schwert kann er keinen Kampf mehr gewinnen. So ist er eben.
	TaylorPyt = TaylorPyt + 1;
	};

// -------- Junge nimmt Auftrag an ----------
instance DIA_DIC_Taylor_Auftrag (C_INFO)
	{
	npc = DIC_2007_Schneider;
	nr = 7;
	condition = DIA_DIC_Taylor_Auftrag_Condition;
	information = DIA_DIC_Taylor_Auftrag_Info;
	permanent = 0;
	description = "Ok. Ich werde sehen, was ich ausrichten kann.";
	};

func int DIA_DIC_Taylor_Auftrag_Condition ()
	{
	if (TaylorPyt == 4)
		{
		return 1;
		};
	};

func void DIA_DIC_Taylor_Auftrag_Info ()
	{
	AI_Output (other, self, "DIA_DIC_Taylor_Auftrag_15_00"); //Ich werde sehen, was ich ausrichten kann. 
	AI_Output (self, other, "DIA_DIC_Taylor_Auftrag_07_01"); //Genau. Setz dich in die Sonne und genieße den Tag, solange du noch Zeit dazu hast.
	};