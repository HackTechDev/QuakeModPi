/*
================================
MENUCORE.QC -- Original source code by Jason Michl
This is where the important stuff happens.  Four key functions are in this file.

MenuCorePrecache is called at the start of the level, and precaches any additional
sounds our menu modification will need.

ActivateOption is called whenever the player presses the fire button. It sees what
option the player currently has selected, and calls the appropriate function.

ScrollMenu is called if a menu is up and a player uses impulse 200.  It cycles through the list of options for your current menu.

ShowMenu is called if a menu is up.  This will determine which menu you are in, and 
display the appropriate menu.

The following functions are currently in MENUCORE.QC:
MenuCorePrecache (Called by MENUSUBS.QC:MenuPrecache)
ActivateOption (Called by WEAPONS.QC:W_Attack)
ScrollMenu(Called by MENUSUBS.QC:MenuCommand)
ShowMenu (Called by CLIENT.QC:PlayerPreThink)
================================
*/

/*
===========
MenuCorePrecache
This is called from MENUSUBS.QC:MenuPrecache.  This makes sure that any sounds we are
going to need 100% of the time are precached.
===========
*/
void() MenuCorePrecache =
{
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	precache_sound ("items/suit.wav");
	precache_sound ("items/suit2.wav");
	precache_sound ("items/inv1.wav");
	precache_sound ("items/inv2.wav");
	precache_sound ("items/inv3.wav");
	precache_sound ("items/damage.wav");
	precache_sound ("items/damage2.wav");
	precache_sound ("items/damage3.wav");
	precache_sound ("weapons/pkup.wav");
	precache_sound ("items/armor1.wav");
	precache_sound ("weapons/lock4.wav");
};


/*
===========
ActivateOption
This is called from WEAPONS.QC:W_Attack. It runs through our list of options, and
does something depending on which option is selected.
Ideally, most of the options end up calling functions in MENUMODS.QC.
===========
*/
void ActivateOption() =
{
// Keeps us from cycling through selections too rapidly.
self.attack_finished = time + 0.4;

// **********
// Main Menu
// **********
if (SelectedOption(MENU_MAIN_TO_ARMOR))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_ARMOR_START;
	}
else if (SelectedOption(MENU_MAIN_TO_AMMO))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_AMMO_START;
	}
else if (SelectedOption(MENU_MAIN_TO_WEAPONS))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_WEAPONS1_START;
	}
else if (SelectedOption(MENU_MAIN_TO_SPECIAL))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_SPECIAL_START;
	}
else if (SelectedOption(MENU_MAIN_QUIT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	MenuQuit();
	}

// **********
// Armor
// **********
else if (SelectedOption(MENU_ARMOR_GREEN))
	BuyArmor(5,0.3,100,IT_ARMOR1);
else if (SelectedOption(MENU_ARMOR_YELLOW))
	BuyArmor(10,0.6,150,IT_ARMOR2);
else if (SelectedOption(MENU_ARMOR_RED))
	BuyArmor(15,0.8,200,IT_ARMOR3);
else if (SelectedOption(MENU_ARMOR_QUIT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	MenuQuit();
	}

// **********
// Ammo
// **********
else if (SelectedOption(MENU_AMMO_SHELLS))
	BuyAmmo(3,IT_SHELLS,20);
else if (SelectedOption(MENU_AMMO_NAILS))
	BuyAmmo(3,IT_NAILS,25);
else if (SelectedOption(MENU_AMMO_ROCKETS))
	BuyAmmo(10,IT_ROCKETS,5);
else if (SelectedOption(MENU_AMMO_CELLS))
	BuyAmmo(5,IT_CELLS,6);
else if (SelectedOption(MENU_AMMO_QUIT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	MenuQuit();
	}

// **********
// Weapons - Page 1
// **********
else if (SelectedOption(MENU_WEAPONS1_SUPER_SHOTGUN))
	BuyWeapon(10, IT_SUPER_SHOTGUN);
else if (SelectedOption(MENU_WEAPONS1_NAILGUN))
	BuyWeapon(5, IT_NAILGUN);
else if (SelectedOption(MENU_WEAPONS1_SUPER_NAILGUN))
	BuyWeapon(15, IT_SUPER_NAILGUN);
else if (SelectedOption(MENU_WEAPONS1_NEXT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_WEAPONS2_START;
	return;
	}
else if (SelectedOption(MENU_WEAPONS1_QUIT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	MenuQuit();
	}

// **********
// Weapons - Page 2
// **********
else if (SelectedOption(MENU_WEAPONS2_GRENADE_LAUNCHER))
	BuyWeapon(20, IT_GRENADE_LAUNCHER);
else if (SelectedOption(MENU_WEAPONS2_ROCKET_LAUNCHER))
	BuyWeapon(30, IT_ROCKET_LAUNCHER);
else if (SelectedOption(MENU_WEAPONS2_LIGHTNING))
	BuyWeapon(30, IT_LIGHTNING);
else if (SelectedOption(MENU_WEAPONS2_PREV))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_WEAPONS1_START;
	return;
	}
else if (SelectedOption(MENU_WEAPONS2_QUIT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	MenuQuit();
	}
// **********
// Special Items
// **********
else if (SelectedOption(MENU_SPECIAL_QUAD))
	BuySpecial(50,IT_QUAD);
else if (SelectedOption(MENU_SPECIAL_INVISIBILITY))
	BuySpecial(30, IT_INVISIBILITY);
else if (SelectedOption(MENU_SPECIAL_INVULNERABILITY))
	BuySpecial(100, IT_INVULNERABILITY);
else if (SelectedOption(MENU_SPECIAL_SUIT))
	BuySpecial(10, IT_SUIT);
else if (SelectedOption(MENU_SPECIAL_QUIT))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	MenuQuit();
	}

// And, if all else fails...
else
	MenuQuit();
};


/*
===========
ScrollMenu
This is called by MENUSUBS.QC:MenuCommand
This function advances self.menu by one, and sees what option we come up with.
If we hit a bound (MENU_*******_END) then we go to the top of our current menu.
===========
*/
void() ScrollMenu =
{
	stuffcmd(self, "play misc/menu3.wav\n");
	self.menu = self.menu + 1;
	if (self.menu == MENU_MAIN_END)
		self.menu = MENU_MAIN_START;

	else if (self.menu == MENU_ARMOR_END)
		self.menu = MENU_ARMOR_START;

	else if (self.menu == MENU_AMMO_END)
		self.menu = MENU_AMMO_START;

	else if (self.menu == MENU_WEAPONS1_END)
		self.menu = MENU_WEAPONS1_START;

	else if (self.menu == MENU_WEAPONS2_END)
		self.menu = MENU_WEAPONS2_START;

	else if (self.menu == MENU_SPECIAL_END)
		self.menu = MENU_SPECIAL_START;
};


/*
===========
ShowMenu
This is called by CLIENT.QC:PlayerPreThink
This checks which option we currently have selected, and calls up the appropriate
    menu to display.
===========
*/
void() ShowMenu =
{
	if (SelectedMenu(MENU_MAIN_START, MENU_MAIN_END))
		ShowMainMenu();
	else if (SelectedMenu(MENU_ARMOR_START, MENU_ARMOR_END))
		ShowArmorMenu();
	else if (SelectedMenu(MENU_AMMO_START, MENU_AMMO_END))
		ShowAmmoMenu();
	else if (SelectedMenu(MENU_WEAPONS1_START, MENU_WEAPONS1_END))
		ShowWeapons1Menu();
	else if (SelectedMenu(MENU_WEAPONS2_START, MENU_WEAPONS2_END))
		ShowWeapons2Menu();
	else if (SelectedMenu(MENU_SPECIAL_START, MENU_SPECIAL_END))
		ShowSpecialMenu();
};
