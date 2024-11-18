func int TraenkeBrauen ()
	{
		if Npc_IsPlayer	(self)
		{
		LaborBenutzt = 2;
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
		var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
		if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
			||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
			{	
	    	//WICHTIG: Damit nicht immer die Menupunkte vom Labor
			//         dazwischen rumgurken! 
	    	use_Lab=FALSE;
			//self.aivar[AIV_INVINCIBLE]=TRUE;
			
			Ai_ProcessInfos (her);
			
			PrintDebugNpc	(PD_ITEM_MOBSI,	"...bedienbar");
			return 			TRUE;
			};
		}
		else
		{
			PrintDebugNpc	(PD_ITEM_MOBSI,	"...bedienbar");
			return 			TRUE;
		};
	};

	
	
//-------------------- Ani einleiten -------------------------
INSTANCE Labani (c_Info)
	{
	npc				= PC_Hero;
	nr				= 1;
	condition		= Labani_Condition;
	information		= Labani_Info;
	important		= 1;
	permanent		= 1;
	description		= DIALOG_ENDE; 
	};

FUNC INT Labani_Condition()
	{		
	if(LaborBenutzt == 2)
		{
	 return 1;
  	  	};
	};

func VOID Labani_Info()
	{
	Snd_Play      ("PsiLab_PourLiquid");
	LaborBenutzt = 1;
	AI_PlayAni(self,"T_LAB_S0_2_S1");
	};
			
//-------------------- Gar nicht brauen -------------------------
INSTANCE Kein_Trank (c_Info)
	{
	npc				= PC_Hero;
	nr				= 999;
	condition		= Kein_Trank_Condition;
	information		= Kein_Trank_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE; 
	};

FUNC INT Kein_Trank_Condition()
	{		
	if(LaborBenutzt == 1)
		{
	 return 1;
  	  	};
	};

func VOID Kein_Trank_Info()
	{
	Snd_Play      ("PsiLab_Drawliquid");
	AI_PlayAni(self,"T_LAB_S0_2_STAND");
	LaborBenutzt = 0;
	AI_StopProcessInfos (self);

	};
	
// ------------- kl. Manatrank brauen -----------------------	
instance Kl_Mana_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Kl_Mana_Brauen_Condition;
	information		= Kl_Mana_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Essenz magischer Energie brauen"; 
	};

FUNC INT Kl_Mana_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (ManaBrauen & 1) == 1)
		{
	 return 1;
    	};
	};

func VOID Kl_Mana_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_RavenHerb_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_RavenHerb_01, 1); //Benötigte Pflanze
			PrintScreen	("Essenz magischer Energie gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Mana_01);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- mit. Manatrank brauen -----------------------	
instance Mi_Mana_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Mi_Mana_Brauen_Condition;
	information		= Mi_Mana_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Extrakt magischer Energie brauen"; 
	};

FUNC INT Mi_Mana_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (ManaBrauen & 2) == 2)
		{
	 return 1;
    	};
	};

func VOID Mi_Mana_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_RavenHerb_02) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_RavenHerb_02, 1); //Benötigte Pflanze
			PrintScreen	("Extrakt magischer Energie gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Mana_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- gr. Manatrank brauen -----------------------	
instance Gr_Mana_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Gr_Mana_Brauen_Condition;
	information		= Gr_Mana_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Elixier magischer Energie brauen"; 
	};

FUNC INT Gr_Mana_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (ManaBrauen & 4) == 4)
		{
	 return 1;
    	};
	};

func VOID Gr_Mana_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_Stoneroot_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_Stoneroot_01, 1); //Benötigte Pflanze
			PrintScreen	("Elixier magischer Energie gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Mana_03);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- perm. Manatrank brauen -----------------------	
instance Perm_Mana_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Perm_Mana_Brauen_Condition;
	information		= Perm_Mana_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Extrakt des Geistes brauen"; 
	};

FUNC INT Perm_Mana_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (ManaBrauen & 8) == 8)
		{
	 return 1;
    	};
	};

func VOID Perm_Mana_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_Stoneroot_02) >= 2
				&& Npc_HasItems(hero, ItFo_Plants_Trollberrys_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_Stoneroot_02, 2); //Benötigte Pflanze
			Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01, 1);
			
			PrintScreen	("Extrakt des Geistes gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Mana_Perma_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- kl. Heiltrank brauen -----------------------	
instance Kl_HP_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Kl_HP_Brauen_Condition;
	information		= Kl_HP_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Essenz heilender Kraft brauen"; 
	};

FUNC INT Kl_HP_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (HPBrauen & 1) == 1)
		{
	 return 1;
    	};
	};

func VOID Kl_HP_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_Herb_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_Herb_01, 1); //Benötigte Pflanze
			PrintScreen	("Essenz heilender Kraft gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Health_01);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- mit. Heiltrank brauen -----------------------	
instance Mi_HP_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Mi_HP_Brauen_Condition;
	information		= Mi_HP_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Extrakt heilender Kraft brauen"; 
	};

FUNC INT Mi_HP_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (HPBrauen & 2) == 2)
		{
	 return 1;
    	};
	};

func VOID Mi_HP_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_Herb_02) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_Herb_02, 1); //Benötigte Pflanze
			PrintScreen	("Extrakt heilender Kraft gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Health_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- gr. Heiltrank brauen -----------------------	
instance Gr_HP_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Gr_HP_Brauen_Condition;
	information		= Gr_HP_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Elixier heilender Kraft brauen"; 
	};

FUNC INT Gr_HP_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (HPBrauen & 4) == 4)
		{
	 return 1;
    	};
	};

func VOID Gr_HP_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_Herb_03) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_Herb_03, 1); //Benötigte Pflanze
			PrintScreen	("Elixier heilender Kraft gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Health_03);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- perm. Heiltrank brauen -----------------------	
instance Perm_HP_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Perm_HP_Brauen_Condition;
	information		= Perm_HP_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Extrakt des Lebens brauen"; 
	};

FUNC INT Perm_HP_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (HPBrauen & 8) == 8)
		{
	 return 1;
    	};
	};

func VOID Perm_HP_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_OrcHerb_02) >= 2
				&& Npc_HasItems(hero, ItFo_Plants_Trollberrys_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_02, 2); //Benötigte Pflanze
			Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01, 1);
			PrintScreen	("Extrakt des Lebens gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Health_Perma_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- mit. Stärketrank brauen -----------------------	
instance Mi_Staerke_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Mi_Staerke_Brauen_Condition;
	information		= Mi_Staerke_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Extrakt der Stärke brauen"; 
	};

FUNC INT Mi_Staerke_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (SonstigesBrauen & 1) == 1)
		{
	 return 1;
    	};
	};

func VOID Mi_Staerke_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFoBooze) >= 1
				&& Npc_HasItems(hero, ItFo_Plants_mushroom_01) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_mushroom_02) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_Trollberrys_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFoBooze, 1); //Benötigte Pflanze
			Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_01, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_02, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01, 1);
			PrintScreen	("Extrakt der Stärke gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Strength_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- gr. Stärketrank brauen -----------------------	
instance Gr_Staerke_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Gr_Staerke_Brauen_Condition;
	information		= Gr_Staerke_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Elixier der Stärke brauen"; 
	};

FUNC INT Gr_Staerke_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (SonstigesBrauen & 2) == 2)
		{
	 return 1;
    	};
	};

func VOID Gr_Staerke_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFoBooze) >= 1
				&& Npc_HasItems(hero, ItFo_Plants_Seraphis_01) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_Velayis_01) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_Trollberrys_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFoBooze, 1); //Benötigte Pflanze
			Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_Velayis_01, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01, 1);
			PrintScreen	("Elixier der Stärke gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Strength_03);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- mit. Geschicktrank brauen -----------------------	
instance Mi_Geschick_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Mi_Geschick_Brauen_Condition;
	information		= Mi_Geschick_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Extrakt der Geschicklichkeit brauen"; 
	};

FUNC INT Mi_Geschick_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (SonstigesBrauen & 4) == 4)
		{
	 return 1;
    	};
	};

func VOID Mi_Geschick_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFoBooze) >= 1
				&& Npc_HasItems(hero, ItFo_Plants_mountainmoos_01) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_mountainmoos_02) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_Trollberrys_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFoBooze, 1); //Benötigte Pflanze
			Npc_RemoveInvItems (hero, ItFo_Plants_mountainmoos_01, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_mountainmoos_02, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01, 1);
			PrintScreen	("Extrakt der Geschicklichkeit gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Dex_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- gr. Geschicktrank brauen -----------------------	
instance Gr_Geschick_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Gr_Geschick_Brauen_Condition;
	information		= Gr_Geschick_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Elixier der Geschicklichkeit brauen"; 
	};

FUNC INT Gr_Geschick_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (SonstigesBrauen & 8) == 8)
		{
	 return 1;
    	};
	};

func VOID Gr_Geschick_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFoBooze) >= 1
				&& Npc_HasItems(hero, ItFo_Plants_Nightshadow_01) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_Nightshadow_02) >= 5
				&& Npc_HasItems(hero, ItFo_Plants_Trollberrys_01) >= 1)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFoBooze, 1); //Benötigte Pflanze
			Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_01, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_02, 5);
			Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01, 1);
			PrintScreen	("Elixier der Geschicklichkeit gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Dex_03);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- kl. Speedtrank brauen -----------------------	
instance Kl_Speed_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Kl_Speed_Brauen_Condition;
	information		= Kl_Speed_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Trank der Geschwindigkeit brauen"; 
	};

FUNC INT Kl_Speed_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (TempBrauen & 1) == 1)
		{
	 return 1;
    	};
	};

func VOID Kl_Speed_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_OrcHerb_01) >= 3)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_01, 3); //Benötigte Pflanze
			PrintScreen	("Trank der Geschwindigkeit gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Haste_01);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- mit. Manatrank brauen -----------------------	
instance Mi_Speed_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Mi_Speed_Brauen_Condition;
	information		= Mi_Speed_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Trank der Schnelligkeit brauen"; 
	};

FUNC INT Mi_Speed_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (TempBrauen & 2) == 2)
		{
	 return 1;
    	};
	};

func VOID Mi_Speed_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_OrcHerb_01) >= 5)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_01, 5); //Benötigte Pflanze
			PrintScreen	("Trank der Schnelligkeit gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Haste_02);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};
	
// ------------- gr. Manatrank brauen -----------------------	
instance Gr_Speed_Brauen (C_INFO)
	{
	npc				= PC_Hero;
	condition		= Gr_Speed_Brauen_Condition;
	information		= Gr_Speed_Brauen_Info;
	important		= 0;
	permanent		= 1;
	description		= "Trank der Eile brauen"; 
	};

FUNC INT Gr_Speed_Brauen_Condition()
	{		
	if(LaborBenutzt == 1 && (TempBrauen & 4) == 4)
		{
	 return 1;
    	};
	};

func VOID Gr_Speed_Brauen_Info()
	{
		if (Npc_HasItems(hero, ItMiFlask) >= 1 
				&& Npc_HasItems(hero, ItFo_Plants_OrcHerb_01) >= 9)
			{
			Npc_RemoveInvItems (hero, ItMiFlask, 1); //Laborflasche
			Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_01, 9); //Benötigte Pflanze
			PrintScreen	("Trank der Eile gebraut!", -1,40,"font_old_20_white.tga",3);
			CreateInvItem(hero,ItFo_Potion_Haste_03);
			Snd_Play      ("PsiLab_GetResult");
			}
		else
			{
				PrintScreen	("Zu wenig Zutaten!", -1,40,"font_old_20_white.tga",3);
				Snd_Play      ("PsiLab_GetBottle");
			};
	};