func void TauchenGegenstand()
	{
	PrintDebugNpc (PD_ITEM_MOBSI,	"TauchenGegenstand"); //Debugmessage
	//CreateInvItems		(hero, ItFo_Potion_Water_01, 12);
	//Wld_InsertItem		(ItFo_Potion_Water_01, "VM_EING_TEICH");
	Wld_InsertNpc (Minecrawler, "VM_EING_TEICH");
	};