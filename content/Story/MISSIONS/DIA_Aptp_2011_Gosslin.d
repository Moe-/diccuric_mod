// **************************************************
// *			EXIT			    *
// **************************************************

instance  DIA_Gosslin_Exit (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 999;
	condition	= DIA_GOSSLIN_Exit_Condition;
	information	= DIA_GOSSLIN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC int  DIA_Gosslin_Exit_Condition()
{
	
		return 1;
	
};

FUNC VOID  DIA_Gosslin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// *		Auf Truhe aufpassen		    *
// **************************************************

instance  Info_Gosslin_Truhe_chek (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 997;
	condition	= Info_GOSSLIN_Truhe_chek_Condition;
	information	= Info_GOSSLIN_Truhe_chek_Info;
	important	= 1;	
	permanent	= 1;

};                       

FUNC int  Info_GOSSLIN_Truhe_chek_Condition()
{


	if ( Npc_IsDetectedMobOwnedByNpc(PC_HERO,PC_HERO))
	&& (Npc_GetDistToWP(hero,"PTP_KEY1")<500)
	&& (!Npc_HasItems(other,KDFVB_ARMOR))
	{
	INFO_Truhe = 1;
	return 1;
	};
};

FUNC VOID  Info_GOSSLIN_Truhe_chek_Info()
{


};


instance  Info_Gosslin_Truhe (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 996;
	condition	= Info_GOSSLIN_Truhe_Condition;
	information	= Info_GOSSLIN_Truhe_Info;
	important	= 1;	
	permanent	= 1;

};                       

FUNC int  Info_GOSSLIN_Truhe_Condition()
{


	if (INFO_Truhe == 1 )

	{
	return 1;
	};
};

FUNC VOID  Info_GOSSLIN_Truhe_Info()
{

	AI_Output(self,hero,"Info_Gosslin_Truhe_11_00"); //Hey!!! Finger weg!
	INFO_Truhe = 0;
	AI_StopProcessInfos	( self );

	Log_CreateTopic		(pt1_Key_Truhe, LOG_NOTE);
	B_LogEntry		(pt1_Key_Truhe,"Upps, irgendwie hat Gosslin was dagegen in diese Truhe zu schauen. Ob da was brauchbares drinn ist?");

};
// **************************************************
// *		Auf Schlüssel aufpassen		    *
// **************************************************

instance  Info_Gosslin_Key (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_GOSSLIN_Key_Condition;
	information	= Info_GOSSLIN_Key_Info;
	important	= 1;	
	permanent	= 1;

};                       

FUNC int  Info_Gosslin_Key_Condition()
{


	if (Npc_HasItems(other,ItKeKey1))
	&& (Npc_GetDistToWP(hero,"PTP_KEY1")<500)
	&& (!Npc_HasItems(other,KDFVB_ARMOR))
	{
	return 1;
	};
};

FUNC VOID  Info_Gosslin_Key_Info()
{


	AI_Output(self,hero,"Info_Gosslin_Key_11_00"); //Sag mal!? Du mußt doch denken ich merk gar nichts mehr. Leg den Schlüssel wieder hin! Die Kiste und der Schlüssel gehör'n mir. Die hab ich auf der Insel gefunden und jetzt ist es mein Eigentum, also Finger weg!	Npc_RemoveInvItem(hero, ItKeKey1);
	Npc_RemoveInvItem(hero, ItKeKey1);
	Wld_InsertItem (ItKeKey1, "PTP_KEY1");
	AI_StopProcessInfos	( self );

	Log_CreateTopic		(pt1_Key_Truhe, LOG_NOTE);
	B_LogEntry		(pt1_Key_Truhe,"Den Schlüssel für die Truhe gibt er nicht her. Irgendwie muss ich ihn hier weglocken.");

};


// **************************************************
// *			Auftrag			    *
// **************************************************

instance  Info_Gosslin_Auftrag (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_GOSSLIN_Auftrag_Condition;
	information	= Info_GOSSLIN_Auftrag_Info;
	important	= 1;
	permanent	= 0;

};                       

FUNC int  Info_Gosslin_Auftrag_Condition()
{
	return 1;
};

FUNC VOID  Info_Gosslin_Auftrag_Info()
{

	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_00"); //Ahh, Timoth - bist du auch endlich angekommen!?
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_01"); //Ja, es ist...
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_03"); //Ach, lass gut sein. Du kannst mir später dein Leid klagen.	...Es hat lange gedauert, bis unsere Späher ihn ausfindig gemacht haben. Aber jetzt haben wir ihn.
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_04"); //Ich weiß, aber Carl ist auch kein Leichtgewicht.
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_05"); //Du bist nach ihm erst in die Bruderschaft aufgenommen worden und kanntest ihn gar nicht, oder?
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_06"); //Nur vom Hörensagen.
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_07"); //Aber dass er kein Leichtgewicht ist, stimmt. Er hat immerhin zwei Templer und Guru BaalTaran im Sumpflager getötet, und dann einige wichtige Magie-Formeln gestohlen.
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_08"); //Was für Formeln?
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_09"); //Das frag lieber Gor Na Jan. Mir hat er nichts darüber gesagt. Vielleicht sagt er es dir ja.
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_10"); //So,  und du meinst ich kann mit mein Schwert, gegen ihn ankommen?
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_11"); //Ja. Wie du weist ist das Schwert von unserem besten Schmied im Lager in Monatelanger arbeit angefertigt worden. - Das du es für diese Misson tragen darfst ist eine Ehre.
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_12"); //Ich weis, ich denk ich werde einfaches Spiel mit Carl haben.
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_13"); //Nun werd nicht leichtsinnig! Du wirst immer noch sehr hart kämpfen müssen wenn due ihn besiegen willst. Sei vorsichtig.
	AI_Output(hero,self,"Info_Gosslin_Auftrag_15_14"); //Und was machst du in der Zeit?
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_15"); //Falls er hier unten ankommt, übernehme ich den Rest. Ich hoffe du hasst ihn soweit zugesetzt, dass er stark geschwächt ist.
	AI_Output(self,hero,"Info_Gosslin_Auftrag_11_16"); //Alleine werde ich gegen ihn nicht gewinnen können.

	Log_CreateTopic		(pt1_Carl, LOG_MISSION);
	B_LogEntry		(pt1_Carl,"Gosslin hat mich beauftragt Carl den Verräter von diesen Großen Baum zu locken und ihn dabei möglichst zu schwächen.");
	Log_SetTopicStatus	(pt1_Carl, LOG_RUNNING);

};

instance  Info_Gosslin_Woist_Carl (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 3;
	condition	= Info_GOSSLIN_Woist_Carl_Condition;
	information	= Info_GOSSLIN_Woist_Carl_Info;
	permanent	= 0;
	description 	= "Wo ist Carl?";

};                       

FUNC int  Info_Gosslin_Woist_Carl_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag))
	&& (!Npc_KnowsInfo(hero,Info_Carl_BH))
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Woist_Carl_Info()
{

	AI_Output(hero,self,"Info_Gosslin_Woist_Carl_15_00"); //Ach ja, Wo hat sich der Bursche eigentlich versteckt?
	AI_Output(self,hero,"Info_Gosslin_Woist_Carl_11_01"); //Der hat sich hier auf den Riesen von einem Baum versteckt!
	AI_Output(self,hero,"Info_Gosslin_Woist_Carl_11_02"); //Nur, schlau war er nicht gerade. Den Schlüssel hat er stecken lassen.
	AI_Output(self,hero,"Info_Gosslin_Woist_Carl_11_03"); //Nun sitzt er in der Falle.
};

// **************************************************
// *		Auftrag annehmen		    *
// **************************************************

instance  Info_Gosslin_Auftrag_nehm (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_GOSSLIN_Auftrag_nehm_Condition;
	information	= Info_GOSSLIN_Auftrag_nehm_Info;
	permanent	= 0;
	description 	= "Ich werde das schon machen.";

};                       

FUNC int  Info_Gosslin_Auftrag_nehm_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag))
	&& ( !Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag_wieso))
	&& ( !Npc_KnowsInfo(hero,Info_Gosslin_Carl))
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Auftrag_nehm_Info()
{

	AI_Output(hero,self,"Info_Gosslin_Auftrag_nehm_15_00"); //Ich werde das schon machen.
	B_LogEntry		(pt1_Carl,"Ok, dann mal los. Irgendwie werd ich den Burschen schon vom Baum holen.");
};

instance  Info_Gosslin_Auftrag_wieso (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 2;
	condition	= Info_GOSSLIN_Auftrag_wieso_Condition;
	information	= Info_GOSSLIN_Auftrag_wieso_Info;
	permanent	= 0;
	description 	= "Wieso hab ich mich bloß für den Auftrag gemeldet?";

};                       

FUNC int  Info_Gosslin_Auftrag_wieso_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag))
	&& ( !Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag_nehm))
	&& ( !Npc_KnowsInfo(hero,Info_Gosslin_Carl))
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Auftrag_wieso_Info()
{

	AI_Output(hero,self,"Info_Gosslin_Auftrag_wieso_15_00"); //Wieso hab ich mich bloß für den Auftrag gemeldet?
	AI_Output(self,hero,"Info_Gosslin_Auftrag_wieso_11_01"); //Was hast du gesagt?
	AI_Output(hero,self,"Info_Gosslin_Auftrag_wieso_15_03"); //Ach, nur, Gut das ich mich für den Auftrag gemeldet hab. Dann kann ich zeigen wie gut ich bin...
	AI_Output(self,hero,"Info_Gosslin_Auftrag_wieso_11_04"); //So kenne ich dich.
	B_LogEntry		(pt1_Carl,"Oh man, worauf hab ich mich da bloß eingelassen. Aber nun muss ich da durch. Gosslin zählt auf mich.");
};


// **************************************************
// *	Wo ist der Schlüssel			    *
// **************************************************
instance  Info_Gosslin_DOOR_CLOSE (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_Gosslin_DOOR_CLOSE_Condition;
	information	= Info_Gosslin_DOOR_CLOSE_Info;
	permanent	= 0;
	description 	= "Die Tür ist verschlossen!?";

};                       

FUNC int  Info_Gosslin_DOOR_CLOSE_Condition()
{
	if (( Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag_nehm)) || ( Npc_KnowsInfo(hero,Info_GOSSLIN_Auftrag_wieso)))
	&& ( Npc_KnowsInfo(hero,Info_GOSSLIN_Woist_Carl))
	&& (Npc_HasItems(other,ItKeLockpick)<3)

	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_DOOR_CLOSE_Info()
{

	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_00"); //Hast du nicht gesagt das du die Tür zugeschlossen hast?
	AI_Output(self,hero,"Info_Gosslin_DOOR_CLOSE_11_01"); //Ach so, --- jaaaa,-- die Tür.-- Ich dachte du bekommst die so auf.
	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_02"); //Das hab ich versucht. Aber meine Dietriche brechen alle ab. 
	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_03"); //Wie Komme ich da bloß rein!!?!?
	AI_Output(self,hero,"Info_Gosslin_DOOR_CLOSE_11_04"); //Nun ja, Ich hatte einen Schlüssel dafür.
	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_05"); //Was Wie? Du hattest einen. Hast du den etwa aufgegessen?
	AI_Output(self,hero,"Info_Gosslin_DOOR_CLOSE_11_06"); //...So falsch liegst du gar nicht. Denn hat mir so ein Riiieesenscavenger weg geschnappt.
	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_07"); //Riesenscavenger?
	AI_Output(self,hero,"Info_Gosslin_DOOR_CLOSE_11_08"); //Ja, als ich mir eines seiner Riesenküken zum Frühstück erlegt hatte kam Mama-Vogel.
	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_09"); //(lacht sich kapput) *gggggggggg
	AI_Output(self,hero,"Info_Gosslin_DOOR_CLOSE_11_10"); //Ja, ja - lach nur. Beim Kampf jedenfalls hat der nicht nur meine Rüstung zerrissen, sondern auch den Schlüssel geschnappt.
	AI_Output(hero,self,"Info_Gosslin_DOOR_CLOSE_15_11"); //Was nun? Soll ich warten bis er ein Haufen setzt und den durchwühlen?
	AI_Output(self,hero,"Info_Gosslin_DOOR_CLOSE_11_12"); //*ggg    Soviel zeit haben wir nicht. Lass dir was einfallen. Jetzt kannst du beweisen ob du was drauf hast.
	AI_StopProcessInfos	( self );

	Log_CreateTopic		(pt1_Key_bh, LOG_NOTE);
	B_LogEntry		(pt1_Key_bh,"Gosslin hat sich den Schlüssel von so einen Riesenscavenger wegschnappen lassen. Nun muß ich ihn wieder beschaffen");

};
// **************************************************
// *			Vogel			    *
// **************************************************
instance  Info_Gosslin_Vogel (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 4;
	condition	= Info_Gosslin_Vogel_Condition;
	information	= Info_Gosslin_Vogel_Info;
	permanent	= 0;
	description 	= "Der Riesenscavener ist wohl unbezwingbar?";

};                       

FUNC int  Info_Gosslin_Vogel_Condition()
{
	if ( Npc_KnowsPlayer(hero,Aptp_2014_RScavenger))
	&& !Npc_IsDead(Aptp_2014_RScavenger)
	&& ( Npc_KnowsInfo(hero,Info_Gosslin_DOOR_CLOSE))
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Vogel_Info()
{

	AI_Output(hero,self,"Info_Gosslin_Vogel_15_00"); //Den Riesenscavenger scheinen wohl Schwerter nicht anzuhaben?
	AI_Output(self,hero,"Info_Gosslin_Vogel_11_01"); //Das hab ich bei meiner Begegnung mit dem Vieh auch schon feststellen müssen.
 	AI_Output(hero,self,"Info_Gosslin_Vogel_15_02"); //Und das sagst du mir erst jetzt!
	AI_Output(self,hero,"Info_Gosslin_Vogel_11_03"); //Ich hab gedacht du schaffst das schon. Schließlich ist den Schwert auch......
 	AI_Output(hero,self,"Info_Gosslin_Vogel_15_04"); //Ach, erzähl nicht! der hätte mich fast zum Frühstück verspeist.
	AI_Output(self,hero,"Info_Gosslin_Vogel_11_05"); //(ha ha) Das kommt mir bekannt vor. Ich möchte den Vieh jedenfalls nicht mehr begegnen.
 	AI_Output(hero,self,"Info_Gosslin_Vogel_15_06"); //So? Aber ich soll? Und wie kann man den Riesenscavenger bezwingen?
	AI_Output(self,hero,"Info_Gosslin_Vogel_11_07"); //Nun ja, du brauchst irgendwie eine andere Waffe. Oder mach ihm etwas Feuer unterm Hintern. *gggg
	AI_Output(self,hero,"Info_Gosslin_Vogel_11_08"); //Egal wie, irgendwie mußt du es schaffen. Vielleicht findest du etwas brauchbares auf dieser Insel.

	B_LogEntry		(pt1_Key_bh,"So einfach will der Riesenscavenger den Schlüssel nicht hergeben. Sein dickes Federkleid läst kein Schwert durchdringen.");
	B_LogEntry		(pt1_Key_bh,"Irgendwie muß ich mich hier nach einer geeigneten Waffe umsehen. mmm, irgendwo müssen Federn ja eine Schwäche haben!?");
};

// **************************************************
// *			Finale			    *
// **************************************************

instance  Info_Gosslin_Carl (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_Gosslin_Carl_Condition;
	information	= Info_Gosslin_Carl_Info;
	important	= 1;
	permanent	= 0;

};                       

FUNC int  Info_Gosslin_Carl_Condition()
{
	if (Npc_GetDistToWP(Aptp_2013_Carl,"PTP_KEY1")<500)

	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Carl_Info()
{

	AI_Output(hero,self,"Info_Gosslin_Carl_15_00"); //  
	AI_Output(self,hero,"Info_Gosslin_Carl_11_00"); //Wer ist das, Timoth?
	AI_Output(hero,self,"Info_Gosslin_Carl_15_01"); //Um ein Haar hätte ich diesen Fischer fast umgebracht.
	AI_Output(self,hero,"Info_Gosslin_Carl_11_02"); //Was?            .
	AI_Output(hero,self,"Info_Gosslin_Carl_15_03"); // Du hast richtig verstanden, Carl ist nicht mehr oben im Baumhaus. Nur diesen Fischer habe ich vorgefunden. Die Späher haben stümperhaft gearbeitet und ich hätte diesen Unschuldigen um ein Harr ermordet.
	AI_DrawWeapon		(self);
	AI_Output(self,hero,"Info_Gosslin_Carl_11_04"); //Zieh dein Schwert.
	AI_Output(hero,self,"Info_Gosslin_Carl_15_05"); //Was?            .
	AI_Output(self,hero,"Info_Gosslin_Carl_11_06"); //Zieh dein Schwert! Du hast IHN gefunden. Das ist der Magier. Er hat deine Sinne getäuscht.Er muß die Magie der Verwandlung gestohlen haben. 
	AI_Output(self,hero,"Info_Gosslin_Carl_11_07"); //Ich erkenne ihn. Er trägt den Ring von BaalTaran.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"Carl");
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine	(Aptp_2013_Carl,"Ende");

};

//******************************
//
//******************************

instance  Info_Gosslin_help (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_Gosslin_help_Condition;
	information	= Info_Gosslin_help_Info;
	important	= 1;
	permanent	= 0;

}; 

FUNC int  Info_Gosslin_help_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Carl_folgenaus))
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_help_Info()
{
	AI_Teleport		(Aptp_2013_Carl,"PTP_CARL");
	AI_Output(hero,self,"Info_Gosslin_help_15_00"); // Pass auf! Jetzt zeigt er sein wahres Gesicht!  
	B_LogEntry		(pt1_Carl,"Gosslin hat Carl erkannt. Er hat mich getäucht");
	AI_Teleport		(Aptp_2013_Carl,"PTP_CARL");
	AI_StopProcessInfos	( self );
	AI_Teleport		(Aptp_2013_Carl,"PTP_CARL");
	Npc_ExchangeRoutine	(Aptp_2013_Carl,"Ende1");
	Wld_InsertNpc		(Aptp_2012_Carlorg,"PTP_27");

};
instance  Info_Gosslin_Carlraus (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_Gosslin_Carlraus_Condition;
	information	= Info_Gosslin_Carlraus_Info;
	important	= 1;
	permanent	= 1;

}; 

FUNC int  Info_Gosslin_Carlraus_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Gosslin_help))
	&& (Npc_GetDistToWP(Aptp_2013_Carl,"PTP_27")<500)
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Carlraus_Info()
{
	AI_Teleport		(Aptp_2013_Carl,"PTP_CARL");
};

//******************************
//
//******************************

instance  Info_Gosslin_Orcdead (C_INFO)
{
	npc		= APTP_2011_GOSSLIN;
	nr		= 1;
	condition	= Info_GOSSLIN_Orcdead_Condition;
	information	= Info_GOSSLIN_Orcdead_Info;
	important	= 1;
	permanent	= 0;

}; 

FUNC int  Info_Gosslin_Orcdead_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Gosslin_help))
	&& Npc_IsDead(APTP_2012_CARLORG)
	{
		return 1;
	};
};

FUNC VOID  Info_Gosslin_Orcdead_Info()
{
	AI_RemoveWeapon (hero);
	AI_Output(hero,self,"Info_Gosslin_Orcdead_15_00"); //Ohh mann, ... Das war ein harter Brocken
	AI_Output(self,hero,"Info_Gosslin_Orcdead_11_01"); //Das kannst du laut sagen. Aber nun wird er niemand mehr schaden.
	AI_Output(hero,self,"Info_Gosslin_Orcdead_15_02"); //Und was machen wir jetzt?
	AI_Output(self,hero,"Info_Gosslin_Orcdead_11_03"); //Nun, Ich lass mir mein Braten schmecken.
	AI_Output(self,hero,"Info_Gosslin_Orcdead_11_04"); //Und du?   Du kannst dich ja hier noch ein bisschen umsehen.

	B_LogEntry		(pt1_Carl,"Carl war in wirklichkeit ein Ork-Priester. Aber nun wird er niemand mehr schaden.");
	Log_SetTopicStatus	(pt1_Carl, LOG_SUCCESS);
	Log_CreateTopic 	(pt1_Credits,	LOG_NOTE);
	B_LogEntry		(pt1_Carl,"Eigentlich solltet ihr die Credits von Carlorg nehmen können. Fals das nicht mölich is, könnt ihr das Buch mit Insert ItWr_Credits einfügen.");

	Npc_ExchangeRoutine	(self,"Start");
	AI_StopProcessInfos	( self );
};

