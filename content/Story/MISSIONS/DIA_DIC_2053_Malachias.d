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
	AI_Output (self, other, "DIA_DIC_Malachias_Wer_07_01"); //Oh, die Jugend! Da steht sie vor mir, und doch weiß sie nicht, wie weit entfernt sie von mir ist. Ich bin Malachias von Benthein, junger Mann.
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
	AI_Output (self, other, "DIA_DIC_Malachias_Welchen_07_01"); //Aufgaben? Ich unterstehe keinerlei Verpflichtungen, außer meinen eigenen.
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
	AI_Output (self, other, "DIA_DIC_Malachias_Tust_07_01"); //Ruf die Wachen, junger Mann. Rufe sie. Ich bin zu alt, als das der Tod durch ein Schwert mich schreckt. Manchmal weiß ich nicht, ob ich lebe, oder schon tot bin. Sollen die Klingen der Söldner es mir sagen.
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
	AI_Output (self, other, "DIA_DIC_Malachias_Was_07_01"); //Ich bin ein Pilger. ...Ah, gibt es hier Steinbinsen-Kraut? Mein Rücken schmerzt. Als Sud gekocht hilft das Kraut gegen Schmerzen... ah, ah.  Was ich hier tue:  Ich bin auf dem Weg zum Heiligtum von Banachia. Es sind noch etwa achtzig Meilen nördlich bis dorthin. Meine Pilgerfahrt ist nach einem Kodex vorgeschrieben. Und mein Weg führt mich durch diese Burg.
	AI_Output (self, other, "DIA_DIC_Malachias_Was_07_02"); //Vor vielen Jahren war ich schon einmal hier: Damals war ich auf der Suche nach Reliquien zu Ehren Gottes. Einst war es hier sehr still. Die einzigen Lebwesen, die ich hier antraf, waren nistende Vögel zwischen den Turmzinnen. Dort, wo jetzt die Lanzen der Wächter hervorragen. Eine seltsame Welt ist es, die ihr Ungläubigen euch erbaut. Eine seltsame Welt.
	};
	
// -------------- Dann noch viel Glück auf deinem Weg... --------------
INSTANCE DIA_DIC_Malachias_Weg (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 6;
	condition = DIA_DIC_Malachias_Weg_Condition;
	information = DIA_DIC_Malachias_Weg_Info;
	permanent = 0;
	important = 0;
	description = "Dann noch viel Glück auf deinem Weg...";
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
	AI_Output (other, self, "DIA_DIC_Malachias_Weg_15_00"); //Dann noch viel Glück auf deinem Weg...
	
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
	AI_Output (self, other, "DIA_DIC_Malachias_LangenA_07_01"); //Ich habe gegen eine Regel des Klosters verstoßen. Ich bin ein Sünder. Ich habe das Amt missbraucht, dass nur Auserwählten bestimmt ist. Ich habe Unglück heraufbeschworen, als wählte ich das Böse zum Freund.
	AI_Output (self, other, "DIA_DIC_Malachias_LangenB_07_01"); //Jetzt werde ich Buße tun: Nur wenn ich Banachia erreiche und ein Opfer für Gott erbringe, werde ich von meiner Sünde befreit. Doch bis dahin bin ich unwürdig, auch nur den Namen des Gottes zu erwähnen, dem ich diene.
	AI_Output (other, self, "DIA_DIC_Malachias_Langen_15_02"); //Was hast du für ein Verbrechen begangen?
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_03"); //Nach zwanzig Jahren ergebenen Dienstes, ernannte man mich zum Wächter des Himmels. In jeder großen Stadt in der unser Orden heimisch ist, gibt es dieses Amt. Meine Aufgabe bestand darin, von Beginn der Abenddämmerung bis zum Untergang der Sonne, auf dem Glockenturm des Klosters Wache zu halten. Doch nicht mit Lanzen, sondern mit den Augen und dem Verstand.
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_04"); //Nach einer alten Legende heißt es, dass ein Bote Gottes in Gestalt eines silbernen Vogels in der Zeit zwischen Dämmerung und Sonnenuntergang erscheinen wird. Er wird im Licht fliegen und dem Wächter des Himmels eine Botschaft Gottes überbringen. Und dies ist der Tag, an dem die Welt in göttliches Licht gehüllt sein wird. Und von da an, wird ewige Glückseligkeit herrschen.
	AI_Output (other, self, "DIA_DIC_Malachias_Langen_15_05"); //Aber was war dein Vergehen?
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_06"); // Ich habe den Turm verlassen. Schande über mich. Schreie klangen von unten herauf, und ich erkannte in ihnen die Stimme einer Frau die mir Tage zuvor ihre Not schilderte. Etwas, worüber ich aufgrund eines Gelübdes nicht sprechen darf.
	AI_Output (self, other, "DIA_DIC_Malachias_Langen_07_07"); //Ihr eilte ich zur Hilfe, denn sie wurde bis in die Kirche, in der sie Schutz suchte, verfolgt, und ihr Leben war bedroht. Doch ein Ordensbruder hatte gesehen, wie ich den Turm verließ. Zum Glück meldete er meine Schandtat dem Obersten des Ordens, und jetzt bin ich auf meiner Reise.
	};
	
// -------------- Aber du wolltest doch jemandem helfen. Zählt das nicht? --------------
INSTANCE DIA_DIC_Malachias_Helfen (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 8;
	condition = DIA_DIC_Malachias_Helfen_Condition;
	information = DIA_DIC_Malachias_Helfen_Info;
	permanent = 0;
	important = 0;
	description = "Aber du wolltest doch jemandem helfen. Zählt das nicht?";
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
	AI_Output (other, self, "DIA_DIC_Malachias_Helfen_15_00"); //Aber du wolltest doch jemandem helfen. Zählt das nicht?
	AI_Output (self, other, "DIA_DIC_Malachias_Helfen_07_01"); //Die Begrüßung eines göttlichen Boten ist bedeutsamer als ein Menschenleben. So jedenfalls haben die Weisen von jeher die Schriften ausgelegt. Und so ist es richtig. Stell dir vor was geschähe, wenn Gott gewahr wird, dass wir seiner Ankunft mit Nachlässigkeit begegnen.
	AI_Output (self, other, "DIA_DIC_Malachias_Helfen_07_02"); //Wenn wir zeigen würden, das wir nicht mit aller Hoffnung sein Kommen erbitten. Was glaubst du steht der Menschheit dann bevor? – Dann blüht uns niederen Geschöpfen eine Welt aus endlosem Unheil.
	};
	
// -------------- Wenn deine Reise wirklich in Richtung Norden geht, dann hast du einen gefährlichen Weg vor dir. --------------
INSTANCE DIA_DIC_Malachias_Reise (C_INFO)
	{
	npc = DIC_2053_Malachias;
	nr = 9;
	condition = DIA_DIC_Malachias_Reise_Condition;
	information = DIA_DIC_Malachias_Reise_Info;
	permanent = 0;
	important = 0;
	description = "Dann hast du einen gefährlichen Weg vor dir...";
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
	AI_Output (other, self, "DIA_DIC_Malachias_Reise_15_00"); //Wenn deine Reise wirklich in Richtung Norden geht, dann hast du einen gefährlichen Weg vor dir. Ich habe gehört, dass die Sümpfe, die auf diesem Weg liegen, widrige Echsen beherbergen. Sie gewähren niemandem Einlass, es sei denn als Futter.
	AI_Output (self, other, "DIA_DIC_Malachias_Reise_07_01"); //Gefährlich? Das stimmt. Im Laufe unserer Ordensgeschichte wanderten vierzehn Brüder nach Banachia. Keiner kam je dort an. Es heißt, Unwürdige erreichen Banachia nicht. Aber ich werde Banachia erreichen. Ich werde um Vergebung bitten.
	};