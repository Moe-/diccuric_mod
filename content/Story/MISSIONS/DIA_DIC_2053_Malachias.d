// -------------- Exit --------------
INSTANCE DIA_DIC_Malachias_Exit (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 999;
	condition = DIA_DIC_Malachias_Exit_Condition;
	information = DIA_DIC_Malachias_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
	};

FUNC int DIA_DIC_Malachias_Exit_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_Malachias_Exit_Info()
	{
	AI_StopProcessInfos	(self);
	};
	
// -------------- Wer bist du? --------------
INSTANCE DIA_DIC_Malachias_Wer (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 1;
	condition = DIA_DIC_Malachias_Wer_Condition;
	information = DIA_DIC_Malachias_Wer_Info;
	permanent = 0;
	important = 0;
	description = "Wer bist du?";
	};

FUNC int DIA_DIC_Malachias_Wer_Condition()
	{
	return 1;
	};

FUNC VOID DIA_DIC_Malachias_Wer_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Wer_15_00"); //Wer bist du?
	AI_Output (self, other, "DIA_DIC_Malachias_Wer_07_01"); //Oh, die Jugend! Da steht sie vor mir, und doch wei� sie nicht, wie weit entfernt sie von mir ist. Ich bin Malachias von Benthein, junger Mann.
	DIC_2053_Malachias.name = "Malachias von Benthein";
	};
	
// -------------- Welchen Aufgaben gehst du im Lager nach? --------------
INSTANCE DIA_DIC_Malachias_Welchen (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 2;
	condition = DIA_DIC_Malachias_Welchen_Condition;
	information = DIA_DIC_Malachias_Welchen_Info;
	permanent = 0;
	important = 0;
	description = "Welchen Aufgaben gehst du im Lager nach?";
	};

FUNC int DIA_DIC_Malachias_Welchen_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Wer))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Welchen_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Welchen_15_00"); //Welchen Aufgaben gehst du im Lager nach?
	AI_Output (self, other, "DIA_DIC_Malachias_Welchen_07_01"); //Aufgaben? Ich unterstehe keinerlei Verpflichtungen, au�er meinen eigenen.
	};
	
// -------------- Sag mir was du hier tust, sonst rufe ich die Wachen. --------------
INSTANCE DIA_DIC_Malachias_Tust (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 3;
	condition = DIA_DIC_Malachias_Tust_Condition;
	information = DIA_DIC_Malachias_Tust_Info;
	permanent = 0;
	important = 0;
	description = "Sag mir was du hier tust, sonst rufe ich die Wachen.";
	};

FUNC int DIA_DIC_Malachias_Tust_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Welchen))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Tust_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Tust_15_00"); //Sag mir was du hier tust, sonst rufe ich die Wachen.
	AI_Output (self, other, "DIA_DIC_Malachias_Tust_07_01"); //Ruf die Wachen, junger Mann. Rufe sie. Ich bin zu alt, als das der Tod durch ein Schwert mich schreckt. Manchmal wei� ich nicht, ob ich lebe, oder schon tot bin. Sollen die Klingen der S�ldner es mir sagen.
	};
	
// -------------- Ich rufe jetzt die Wachen --------------
INSTANCE DIA_DIC_Malachias_Wachen (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 9;
	condition = DIA_DIC_Malachias_Wachen_Condition;
	information = DIA_DIC_Malachias_Wachen_Info;
	permanent = 0;
	important = 0;
	description = "Ich rufe jetzt die Wachen!";
	};

FUNC int DIA_DIC_Malachias_Wachen_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Tust))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Wachen_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Wachen_15_00"); //Ich rufe jetzt die Wachen!
	AI_Output (other, self, "DIA_DIC_Malachias_Wachen_15_01"); //WACHEN!! Hier ist ein Eindringling!
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(DIC_2318_Wache,"ANGRIFF");
	AI_ContinueRoutine	(DIC_2318_Wache);
	Npc_ExchangeRoutine(DIC_2319_Wache,"ANGRIFF");
	AI_ContinueRoutine	(DIC_2319_Wache);
	};
	
// -------------- Was tust du hier? --------------
INSTANCE DIA_DIC_Malachias_Was (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 5;
	condition = DIA_DIC_Malachias_Was_Condition;
	information = DIA_DIC_Malachias_Was_Info;
	permanent = 0;
	important = 0;
	description = "Was tust du hier?";
	};

FUNC int DIA_DIC_Malachias_Was_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Welchen))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Was_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Was_15_00"); //Was tust du hier?
	AI_Output (self, other, "DIA_DIC_Malachias_Was_07_01"); //Ich bin ein Pilger. ...Ah, gibt es hier Steinbinsen-Kraut? Mein R�cken schmerzt. Als Sud gekocht hilft das Kraut gegen Schmerzen... ah, ah.  Was ich hier tue:  Ich bin auf dem Weg zum Heiligtum von Banachia. Es sind noch etwa achtzig Meilen n�rdlich bis dorthin. Meine Pilgerfahrt ist nach einem Kodex vorgeschrieben. Und mein Weg f�hrt mich durch diese Burg.
	AI_Output (self, other, "DIA_DIC_Malachias_Was_07_02"); //Vor vielen Jahren war ich schon einmal hier: Damals war ich auf der Suche nach Reliquien zu Ehren Gottes. Einst war es hier sehr still. Die einzigen Lebwesen, die ich hier antraf, waren nistende V�gel zwischen den Turmzinnen. Dort, wo jetzt die Lanzen der W�chter hervorragen. Eine seltsame Welt ist es, die ihr Ungl�ubigen euch erbaut. Eine seltsame Welt.
	};
	
// -------------- Dann noch viel Gl�ck auf deinem Weg... --------------
INSTANCE DIA_DIC_Malachias_Weg (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 6;
	condition = DIA_DIC_Malachias_Weg_Condition;
	information = DIA_DIC_Malachias_Weg_Info;
	permanent = 0;
	important = 0;
	description = "Dann noch viel Gl�ck auf deinem Weg...";
	};

FUNC int DIA_DIC_Malachias_Weg_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Was))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Weg_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Weg_15_00"); //Dann noch viel Gl�ck auf deinem Weg...
	
	AI_StopProcessInfos	(self);
	};
	
// -------------- Warum musst du den langen Weg auf dich nehmen? --------------
INSTANCE DIA_DIC_Malachias_Langen (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 7;
	condition = DIA_DIC_Malachias_Langen_Condition;
	information = DIA_DIC_Malachias_Langen_Info;
	permanent = 0;
	important = 0;
	description = "Warum musst du den langen Weg auf dich nehmen?";
	};

FUNC int DIA_DIC_Malachias_Langen_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Was))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Langen_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Langen_15_00"); //Warum musst du den langen Weg auf dich nehmen?
	AI_Output (self, other, "DIA_DIC_Malachias_LangenA_07_01"); //Ich habe gegen eine Regel des Klosters versto�en. Ich bin ein S�nder. Ich habe das Amt missbraucht, dass nur Auserw�hlten bestimmt ist. Ich habe Ungl�ck heraufbeschworen, als w�hlte ich das B�se zum Freund.
	AI_Output (self, other, "DIA_DIC_Malachias_LangenB_07_01"); //Jetzt werde ich Bu�e tun: Nur wenn ich Banachia erreiche und ein Opfer f�r Gott erbringe, werde ich von meiner S�nde befreit. Doch bis dahin bin ich unw�rdig, auch nur den Namen des Gottes zu erw�hnen, dem ich diene.
	AI_Output (other, self, "DIA_DIC_Malachias_Langen_15_02"); //Was hast du f�r ein Verbrechen begangen?
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_03"); //Nach zwanzig Jahren ergebenen Dienstes, ernannte man mich zum W�chter des Himmels. In jeder gro�en Stadt in der unser Orden heimisch ist, gibt es dieses Amt. Meine Aufgabe bestand darin, von Beginn der Abendd�mmerung bis zum Untergang der Sonne, auf dem Glockenturm des Klosters Wache zu halten. Doch nicht mit Lanzen, sondern mit den Augen und dem Verstand.
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_04"); //Nach einer alten Legende hei�t es, dass ein Bote Gottes in Gestalt eines silbernen Vogels in der Zeit zwischen D�mmerung und Sonnenuntergang erscheinen wird. Er wird im Licht fliegen und dem W�chter des Himmels eine Botschaft Gottes �berbringen. Und dies ist der Tag, an dem die Welt in g�ttliches Licht geh�llt sein wird. Und von da an, wird ewige Gl�ckseligkeit herrschen.
	AI_Output (other, self, "DIA_DIC_Malachias_Langen_15_05"); //Aber was war dein Vergehen?
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_06"); // Ich habe den Turm verlassen. Schande �ber mich. Schreie klangen von unten herauf, und ich erkannte in ihnen die Stimme einer Frau die mir Tage zuvor ihre Not schilderte. Etwas, wor�ber ich aufgrund eines Gel�bdes nicht sprechen darf.
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_07"); //Ihr eilte ich zur Hilfe, denn sie wurde bis in die Kirche, in der sie Schutz suchte, verfolgt, und ihr Leben war bedroht. Doch ein Ordensbruder hatte gesehen, wie ich den Turm verlie�. Zum Gl�ck meldete er meine Schandtat dem Obersten des Ordens, und jetzt bin ich auf meiner Reise.
	};
	
// -------------- Aber du wolltest doch jemandem helfen. Z�hlt das nicht? --------------
INSTANCE DIA_DIC_Malachias_Helfen (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 8;
	condition = DIA_DIC_Malachias_Helfen_Condition;
	information = DIA_DIC_Malachias_Helfen_Info;
	permanent = 0;
	important = 0;
	description = "Aber du wolltest doch jemandem helfen. Z�hlt das nicht?";
	};

FUNC int DIA_DIC_Malachias_Helfen_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Langen))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Helfen_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Helfen_15_00"); //Aber du wolltest doch jemandem helfen. Z�hlt das nicht?
	AI_Output (self, other, "DIA_DIC_Malachias_Helfen_07_01"); //Die Begr��ung eines g�ttlichen Boten ist bedeutsamer als ein Menschenleben. So jedenfalls haben die Weisen von jeher die Schriften ausgelegt. Und so ist es richtig. Stell dir vor was gesch�he, wenn Gott gewahr wird, dass wir seiner Ankunft mit Nachl�ssigkeit begegnen.
	AI_Output (self, other, "DIA_DIC_Malachias_Helfen_07_02"); //Wenn wir zeigen w�rden, das wir nicht mit aller Hoffnung sein Kommen erbitten. Was glaubst du steht der Menschheit dann bevor? � Dann bl�ht uns niederen Gesch�pfen eine Welt aus endlosem Unheil.
	};
	
// -------------- Wenn deine Reise wirklich in Richtung Norden geht, dann hast du einen gef�hrlichen Weg vor dir. --------------
INSTANCE DIA_DIC_Malachias_Reise (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 9;
	condition = DIA_DIC_Malachias_Reise_Condition;
	information = DIA_DIC_Malachias_Reise_Info;
	permanent = 0;
	important = 0;
	description = "Dann hast du einen gef�hrlichen Weg vor dir...";
	};

FUNC int DIA_DIC_Malachias_Reise_Condition()
	{
	if (Npc_KnowsInfo (other, DIA_DIC_Malachias_Langen))
		{
		return 1;
		};
	};

FUNC VOID DIA_DIC_Malachias_Reise_Info()
	{
	AI_Output (other, self, "DIA_DIC_Malachias_Reise_15_00"); //Wenn deine Reise wirklich in Richtung Norden geht, dann hast du einen gef�hrlichen Weg vor dir. Ich habe geh�rt, dass die S�mpfe, die auf diesem Weg liegen, widrige Echsen beherbergen. Sie gew�hren niemandem Einlass, es sei denn als Futter.
	AI_Output (self, other, "DIA_DIC_Malachias_Reise_07_01"); //Gef�hrlich? Das stimmt. Im Laufe unserer Ordensgeschichte wanderten vierzehn Br�der nach Banachia. Keiner kam je dort an. Es hei�t, Unw�rdige erreichen Banachia nicht. Aber ich werde Banachia erreichen. Ich werde um Vergebung bitten.
	};