// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Carl_Exit (C_INFO)
{
	npc		= Aptp_2013_Carl;
	nr		= 999;
	condition	= DIA_Carl_Exit_Condition;
	information	= DIA_Carl_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC int  DIA_Carl_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Carl_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// *			Wird überredet		    *
// **************************************************

instance  Info_Carl_BH (C_INFO)
{
	npc		= Aptp_2013_Carl;
	nr		= 1;
	condition	= Info_Carl_BH_Condition;
	information	= Info_Carl_BH_Info;
	important	= 1;	
	permanent	= 0;

};                       

FUNC int  Info_Carl_BH_Condition()
{
	return 1;
};

FUNC VOID  Info_Carl_BH_Info()
{
	AI_Output(hero,self,"Info_Carl_BH_15_00"); //Steh auf und stelle dich dem Kampf.
	AI_Output(self,hero,"Info_Carl_BH_03_01"); //Wie, was...? Kampf? Wer bist du... ?
	AI_Output(hero,self,"Info_Carl_BH_15_02"); //Ich bin Timoth, ein Mitglied der Bruderschaft.
	AI_Output(self,hero,"Info_Carl_BH_03_03"); //Welche.... welche Bruderschaft?
	AI_Output(hero,self,"Info_Carl_BH_15_04"); //Die Bruderschaft, die durch deine Untreue und Hinterlist schwer geschädigt wurde. Und nun stell dich den Kampf!
	AI_Output(self,hero,"Info_Carl_BH_03_05"); //Nein, Warte! Ich bin nur ein Fischer. Mein Name ist Aventus. Ich hab hier eine gute Stelle zum fischen gefunden.
	self.name="Fischer";
	AI_Output(self,hero,"Info_Carl_BH_03_06"); //Aber mein Boot hat sich im Sturm, vor ein paar Tagen von der Vertäung gelöst und wurde weggetrieben. Jetzt sitze ich auf dieser Insel fest.
	AI_Output(self,hero,"Info_Carl_BH_03_07"); //... ihr müsst mich mit jemandem verwechseln... ich weiß nicht wer sonst hier wohnt.. ... Verschont mich... eure Bruderschaft kenne ich nicht
	AI_Output(hero,self,"Info_Carl_BH_15_08"); //Mmm? Du siehst wirklich nicht aus wie ein Magier.
	AI_Output(self,hero,"Info_Carl_BH_03_09"); //Magier, ich? Nein, Ich hab Frau und Kinder die ich versorgen muß.
	AI_Output(hero,self,"Info_Carl_BH_15_10"); //Wahrscheinlich beschuldige ich dich zu Unrecht. Am besten du kommst mal mit nach unten. Ein Freund von mir wird dir noch einige Fragen stellen wollen. 
	AI_Output(self,hero,"Info_Carl_BH_03_11"); //Was für....was für Fragen?
	AI_Output(hero,self,"Info_Carl_BH_15_12"); //Na ja, vielleicht hast du den Mann, den wir suchen ja gesehen, oder irgend etwas gefunden was uns helfen könnte. Komm einfach mit.
	AI_Output(self,hero,"Info_Carl_BH_03_13"); //Gut, ich wollte sowieso gerade runter gehen und fischen.
	AI_Output(hero,self,"Info_Carl_BH_15_14"); //Aber du gehst voran und wartest unten.
	AI_Output(self,hero,"Info_Carl_BH_03_15"); //Kein Problem, ich geh ja schon.
	AI_Output(self,hero,"Info_Carl_BH_03_16"); //Warte aber jedes Mal bis ich von der Leiter bin, die sehen ziemlich verrottet aus.

	B_LogEntry		(pt1_Carl,"Ich hab Carl gefunden, d.h. Aventus. Er sagt er ist nur ein Fischer");
	Npc_ExchangeRoutine	(APTP_2011_GOSSLIN,"WAIT");	
	Npc_ExchangeRoutine 	(self,"runter");
	AI_StopProcessInfos	( self );

};

instance  Info_Carl_folgen (C_INFO)
{
	npc		= Aptp_2013_Carl;
	nr		= 2;
	condition	= Info_Carl_folgen_Condition;
	information	= Info_Carl_folgen_Info;
	important	= 1;	
	permanent	= 0;

};                       

FUNC int  Info_Carl_folgen_Condition()
{
	if (Npc_GetDistToWP(hero,"BH_00")<300)
	{
	return 1;
	};
};

FUNC VOID  Info_Carl_folgen_Info()
{

	AI_Output(hero,self,"Info_Carl_folgen_15_00"); //So,    folge mir.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	AI_StopProcessInfos	(self);

};

instance  Info_Carl_folgenaus (C_INFO)
{
	npc		= Aptp_2013_Carl;
	nr		= 2;
	condition	= Info_Carl_folgenaus_Condition;
	information	= Info_Carl_folgenaus_Info;
	important	= 1;	
	permanent	= 0;

};                       

FUNC int  Info_Carl_folgenaus_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Gosslin_Carl))
	{
	return 1;
	};
};

FUNC VOID  Info_Carl_folgenaus_Info()
{

	AI_Output(self,hero,"Info_Carl_folgenaus_15_00"); //Haha, ihr Narren, ihr entkommt mir nicht.
	AI_PlayAni 		(self,"T_PRACTICEMAGIC5");
	AI_StopProcessInfos	(self);

};
