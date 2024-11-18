//------------ ENDE -----------------
instance DIA_SHD_Exit (C_INFO)
	{
	npc 		= SHD;
	nr 		= 999;
	condition 	= DIA_SHD_Exit_Condition;
	information 	= DIA_SHD_Exit_Info;
	permanent 	= 1;
	description 	= DIALOG_ENDE;
	};
	
func int DIA_SHD_Exit_Condition ()
	{
	return 1;
	};
	
func void DIA_SHD_Exit_Info ()
	{
	AI_StopProcessInfos (self);
	};


//********************** Helpscript's Moe *******************************











//********************** Helpscript's Harri *******************************

//------------ Mutprobe Rampe -----------------

instance DIA_SHD_Mutprobe (C_INFO)
	{
	npc 		= SHD;
	nr 		= 1;
	condition 	= DIA_SHD_Mutprobe_Condition;
	information 	= DIA_SHD_Mutprobe_Info;
	permanent 	= 1;
	description 	= "Mutprobe Rampe";
	};
	
func int DIA_SHD_Mutprobe_Condition ()
	{
	return 1;
	};
	
func void DIA_SHD_Mutprobe_Info ()
	{
	Info_AddChoice(DIA_SHD_Mutprobe, "geschafft und nicht gesehen.", DIA_SHD_Mutprobe_1);
	Info_AddChoice(DIA_SHD_Mutprobe, "geschafft und gesehen", DIA_SHD_Mutprobe_2);
	Info_AddChoice(DIA_SHD_Mutprobe, "zurück", DIA_SHD_Mutprobe_z);
	};

func void DIA_SHD_Mutprobe_1 ()
	{
	Leofwin_Mutprobe = 2;
	};
	
func void DIA_SHD_Mutprobe_2 ()
	{
	Leofwin_Mutprobe = 3;
	};
	
func void DIA_SHD_Mutprobe_z ()
	{
	Info_ClearChoices (DIA_SHD_Mutprobe);
	};
	
	
//------------ Wanzenquest -----------------

instance DIA_SHD_Wanze (C_INFO)
	{
	npc 		= SHD;
	nr 		= 1;
	condition 	= DIA_SHD_Wanze_Condition;
	information 	= DIA_SHD_Wanze_Info;
	permanent 	= 1;
	description 	= "Wanzenquest";
	};
	
func int DIA_SHD_Wanze_Condition ()
	{
	return 1;
	};
	
func void DIA_SHD_Wanze_Info ()
	{
	Info_AddChoice(DIA_SHD_Wanze, "gib alle Zutaten.",DIA_SHD_Wanze_zut);
	Info_AddChoice(DIA_SHD_Wanze, "gib Verwandlungstrank.",DIA_SHD_Wanze_T);
	Info_AddChoice(DIA_SHD_Wanze, "insert Hamond - Stadt - ende.",DIA_SHD_Wanze_H);
	Info_AddChoice(DIA_SHD_Wanze, "vermasselt.",DIA_SHD_Wanze_v);
	Info_AddChoice(DIA_SHD_Wanze, "zurück.",DIA_SHD_Wanze_z);
	};
func void DIA_SHD_Wanze_zut ()
	{
	B_GiveInvItems (self,other,ItFo_Plants_mushroom_01,5);
	B_GiveInvItems (self,other,ItFo_Plants_mountainmoos_01,1);
	B_GiveInvItems (self,other,ItFo_Plants_mountainmoos_02,1);
	B_GiveInvItems (self,other,ItFo_Plants_Stoneroot_01,2);
	B_GiveInvItems (self,other,ItAt_Waran_01,1);
	B_GiveInvItems (self,other,ItAt_Bloodfly_02,2);
	B_GiveInvItems (self,other,ItFoBooze,3);
	};
func void DIA_SHD_Wanze_T ()
	{
	B_GiveInvItems	(self, other, Heil_Hamond, 1);
	};
func void DIA_SHD_Wanze_H ()
	{
	Wld_InsertNpc	(DIC_2501_Hamond, "STADT");
	Info_ClearChoices (DIA_SHD_Wanze);
	AI_StopProcessInfos (self);
	};
func void DIA_SHD_Wanze_v ()
	{
	Hamond_Wanze = 5;
	};
func void DIA_SHD_Wanze_z ()
	{
	Info_ClearChoices (DIA_SHD_Wanze);
	};
	
//------------ Teleporterquest -----------------

instance DIA_SHD_Tele (C_INFO)
	{
	npc 		= SHD;
	nr 		= 1;
	condition 	= DIA_SHD_Tele_Condition;
	information 	= DIA_SHD_Tele_Info;
	permanent 	= 1;
	description 	= "Tele_Amu_quest";
	};
	
func int DIA_SHD_Tele_Condition ()
	{
	return 1;
	};
	
func void DIA_SHD_Tele_Info ()
	{
	Info_AddChoice(DIA_SHD_Tele, "gib alle Tele-Amulette.",DIA_SHD_Tele_amu);
	Info_AddChoice(DIA_SHD_Tele, "Warnung gesehen.",DIA_SHD_Tele_1);
	Info_AddChoice(DIA_SHD_Tele, "Warnung gespürt",DIA_SHD_Tele_2);
	Info_AddChoice(DIA_SHD_Tele, "Teleporter benutzt",DIA_SHD_Tele_4);
	Info_AddChoice(DIA_SHD_Tele, "zurück.",DIA_SHD_Tele_z);
	};
func void DIA_SHD_Tele_amu ()
	{
	B_GiveInvItems (self,other,Amulett_Gemini,1);
	B_GiveInvItems (self,other,Amulett_Tarus,1);
	B_GiveInvItems (self,other,Amulett_Pisces,1);
	B_GiveInvItems (self,other,Amulett_Aquarius,1);
	B_GiveInvItems (self,other,Amulett_Leo,1);
	B_GiveInvItems (self,other,Amulett_Capricorn,1);
	};
	
func void DIA_SHD_Tele_1 ()
	{
	MP_CONT = MP_CONT | 1;
	};

func void DIA_SHD_Tele_2 ()
	{
	MP_CONT = MP_CONT | 2;
	};

func void DIA_SHD_Tele_4 ()
	{
	MP_CONT = MP_CONT | 4;
	};

func void DIA_SHD_Tele_z ()
	{
	Info_ClearChoices (DIA_SHD_Tele);
	};

