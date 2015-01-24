/*
================================
MENUMODS.QC
This is where everything mod-specific happens.  You will be doing most of your display 
work here.  In addition, any new functions that MENUCORE.QC calls should be placed here.

The following functions are currently in MENUMODS.QC:
bound_self_ammo
AllocateCredits
CreditCheat
BuyAble
BuyArmor
BuyAmmo
BuyWeapon
BuySpecial
ShowMainMenu
ShowArmorMenu
ShowAmmoMenu
ShowWeapons1Menu
ShowWeapons2Menu
ShowSpecialMenu
================================
*/

/*
===========
DECLARATIONS
===========
*/
.float	credits;

/*
===========
PROTOTYPES
===========
*/
void() W_SetCurrentAmmo;



/*
===========
bound_self_ammo
This is ripped from bound_other_ammo in ITEMS.QC and changed so it affects "self",
  not "other".
===========
*/
void() bound_self_ammo =
{
if (self.ammo_shells > 100)
	self.ammo_shells = 100;
if (self.ammo_nails > 200)
	self.ammo_nails = 200;
if (self.ammo_rockets > 100)
	self.ammo_rockets = 100;		
if (self.ammo_cells > 100)
	self.ammo_cells = 100;		
};



/*
===========
AllocateCredits
Called by COMBAT.QC:Killed
===========
*/
void(entity killer, entity victim) AllocateCredits =
{
local float value;
local float bonus;
bonus = 1;
local float score;
score = victim.frags;
if (score < 0)
	score = 0;
if (victim.classname == "player")
	{
	value = 1;
	bonus = 0.25;
	}
else if (victim.classname == "monster_army")
	value = 1;
else if (victim.classname == "monster_demon1")
	value = 5;
else if (victim.classname == "monster_dog")
	value = 1;
else if (victim.classname == "monster_enforcer")
	value = 2;
else if (victim.classname == "monster_rotfish")
	value = 1;
else if (victim.classname == "monster_hell_knight")
	value = 5;
else if (victim.classname == "monster_knight")
	value = 3;
else if (victim.classname == "monster_ogre")
	value = 3;
else if (victim.classname == "monster_shalrath")
	value = 8;
else if (victim.classname == "monster_shambler")
	value = 10;
else if (victim.classname == "monster_tarbaby")
	value = 6;
else if (victim.classname == "monster_wizard")
	value = 2;
else if (victim.classname == "monster_zombie")
	value = 4;
// Add the dead guy's frags, plus a percentage of the dead guy's credits, plus the
//    natural "value" of the dead guy to the credits of the killer.
//    Dead monsters give up all the credits they've allocated, but dead players
//    only lose 25% of their credits.
killer.credits = killer.credits + score + floor(victim.credits*bonus) + value;
victim.credits = victim.credits*(1-bonus);

// No one can have more than 200 credits;
if (killer.credits > 200)
	killer.credits = 200;
};

/*
===========
CreditCheat
This single-player-only cheat sets the player's credits to 200.
===========
*/
void() CreditCheat =
{
	if (deathmatch || coop)
		return;
	bprint("Credits set to 200.\n");
	self.credits = 200;
};


/*
===========
This checks to see if we have enough money.  If we do, then we subtract the cost from
  our credits and return TRUE.  If we don't, then we return FALSE.
===========
*/
float Buyable(float cost) =
{
if (cost <= self.credits)
	{
	self.credits = self.credits - cost;
	return TRUE;
	}
centerprint (self, "Not enough credits.\n");
self.menu = MENU_OFF;
stuffcmd(self, "play misc/menu2.wav\n");
return FALSE;
};


/*
===========
BuyArmor
This is the basic routine for buying armor.
"cost" is how many credits the armor requires.
"type" is the ability of the armor to deflect damage.  This is what fraction of damage
    the armor absorbs.  Green armor has a type of 0.3, Yellow a type of 0.6,
    and Red a type of 0.8.
"value" is how much of this armor you start with. Green has a value of 100, Yellow a
    value of 150, and Red a value of 200.
===========
*/
void BuyArmor(float cost, float type, float value, float bit) =
{
if (!(Buyable(cost)))
	return;
MenuQuit();
if (value < self.armorvalue)
	{
	centerprint(self, "Your current armor is superior.\n");
	self.credits = self.credits + cost;
	stuffcmd(self, "play misc/menu2.wav\n");
	return;
	}
self.armortype = type;
self.armorvalue = value;
self.items = self.items - (self.items & (IT_ARMOR1 | IT_ARMOR2 | IT_ARMOR3)) + bit;
stuffcmd(self, "play items/armor1.wav;bf\n");
};

/*
===========
BuyAmmo
This is the basic routine for buying ammunition.
"cost" is how many credits the ammo requires.
"type" is what kind of ammo you are buying.
"value" is how much of it you are buying.
===========
*/
void BuyAmmo(float cost, float type, float value)
{
if(!(Buyable(cost)))
	return;
MenuQuit();
if (type == IT_SHELLS && self.ammo_shells < 100)
	self.ammo_shells = self.ammo_shells + value;
else if (type == IT_NAILS && self.ammo_nails < 200)
	self.ammo_nails = self.ammo_nails + value;
else if (type == IT_ROCKETS && self.ammo_rockets < 100)
	self.ammo_rockets = self.ammo_rockets + value;
else if (type == IT_CELLS && self.ammo_cells < 100)
	self.ammo_cells = self.ammo_cells + value;
else
	{
	centerprint(self, "You already have enough ammo.");
	self.credits = self.credits + cost;
	stuffcmd(self, "play misc/menu2.wav\n");
	return;
	}
bound_self_ammo();
W_SetCurrentAmmo();
stuffcmd(self, "play weapons/lock4.wav;bf\n");
};

/*
===========
BuyWeapon
This is the basic routine for buying weapons.
"cost" is how many credits the weapon requires.
"type" is what the weapon is.
===========
*/
void BuyWeapon(float cost, float type)
{
if (!(Buyable(cost)))
	return;
MenuQuit();
if (self.items & type)
	{
	centerprint(self, "You already have this weapon!");
	self.credits = self.credits + cost;
	stuffcmd(self, "play misc/menu2.wav\n");
	return;
	}
self.items = self.items | type;
self.weapon = type;
W_SetCurrentAmmo();
stuffcmd(self, "play weapons/pkup;bf\n");
};

/*
===========
BuySpecial
This is the basic routine for buying special items.
"cost" is how many credits the item requires.
"type" is what the item is.
===========
*/
void(float cost, float type) BuySpecial =
{
if (!(Buyable(cost)))
	return;
MenuQuit();
if (self.items & type)
	{
	centerprint(self, "You already have this powerup!");
	self.credits = self.credits + cost;
	stuffcmd(self, "play misc/menu2.wav\n");
	return;
	}
self.items = self.items | type;
if (type == IT_QUAD)
	{
	sound (self, CHAN_VOICE, "items/damage.wav", 1, ATTN_NORM);
	stuffcmd(self, "bf\n");
	self.super_time = 1;
	self.super_damage_finished = time + 30;
	}
if (type == IT_INVISIBILITY)
	{
	sound (self, CHAN_VOICE, "items/inv1.wav", 1, ATTN_NORM);
	stuffcmd(self, "bf\n");
	self.invisible_time = 1;
	self.invisible_finished = time + 30;
	}
if (type == IT_INVULNERABILITY)
	{
	sound (self, CHAN_VOICE, "items/protect.wav", 1, ATTN_NORM);
	stuffcmd(self, "bf\n");
	self.invincible_time = 1;
	self.invincible_finished = time + 30;
	}
if (type == IT_SUIT)
	{
	sound (self, CHAN_VOICE, "items/suit.wav", 1, ATTN_NORM);
	stuffcmd(self, "bf\n");
	self.rad_time = 1;
	self.radsuit_finished = time + 30;
	}
};


/*
===========
ShowMainMenu
This displays the main menu, which shows all the other menus.
===========
*/
void() ShowMainMenu =
{
	string s1,s2,s3,s4,s5,s6,s7;
		s1 = ftos(self.credits);
		s2 = " cr.\n";
	if (SelectedOption(MENU_MAIN_TO_ARMOR))
		s3 = " Buy Armor        \n";
	else
		s3 = "  Buy Armor        \n";

	if (SelectedOption(MENU_MAIN_TO_AMMO))
		s4 = " Buy Ammo         \n";
	else
		s4 = "  Buy Ammo         \n";

	if (SelectedOption(MENU_MAIN_TO_WEAPONS))
		s5 = " Buy Weapons      \n";
	else
		s5 = "  Buy Weapons      \n";

	if (SelectedOption(MENU_MAIN_TO_SPECIAL))
		s6 = " Buy Special Items\n";
	else
		s6 = "  Buy Special Items\n";

	if (SelectedOption(MENU_MAIN_QUIT))
		s7 = " Quit             \n";
	else
		s7 = "  Quit             \n";
	centerprint7(self, s1, s2, s3, s4, s5, s6, s7);
};

/*
===========
ShowArmorMenu
This shows you what types of armor you can buy.
===========
*/
void() ShowArmorMenu =
{
	string s1,s2,s3,s4,s5,s6;
		s1 = ftos(self.credits);
		s2 = " cr.\n";
	if (SelectedOption(MENU_ARMOR_GREEN))
		s3 = " Green Armor.....5 cr.\n";
	else
		s3 = "  Green Armor.....5 cr.\n";

	if (SelectedOption(MENU_ARMOR_YELLOW))
		s4 = " Yellow Armor...10 cr.\n";
	else
		s4 = "  Yellow Armor...10 cr.\n";

	if (SelectedOption(MENU_ARMOR_RED))
		s5 = " Red Armor......15 cr.\n";
	else
		s5 = "  Red Armor......15 cr.\n";

	if (SelectedOption(MENU_ARMOR_QUIT))
		s6 = " Quit                 \n";
	else
		s6 = "  Quit                 \n";
	centerprint6(self, s1, s2, s3, s4, s5, s6);
};

/*
===========
ShowAmmoMenu
This shows you what kinds of ammo you can buy.
===========
*/
void() ShowAmmoMenu =
{
	string s1,s2,s3,s4,s5,s6,s7;
		s1 = ftos(self.credits);
		s2 = " cr.\n";
	if (SelectedOption(MENU_AMMO_SHELLS))
		s3 = " 20 Shells.....3 cr.\n";
	else
		s3 = "  20 Shells.....3 cr.\n";

	if (SelectedOption(MENU_AMMO_NAILS))
		s4 = " 25 Nails......3 cr.\n";
	else
		s4 = "  25 Nails......3 cr.\n";

	if (SelectedOption(MENU_AMMO_ROCKETS))
		s5 = "  5 Rockets...10 cr.\n";
	else
		s5 = "   5 Rockets...10 cr.\n";

	if (SelectedOption(MENU_AMMO_CELLS))
		s6 = "  6 Cells......5 cr.\n";
	else
		s6 = "   6 Cells......5 cr.\n";

	if (SelectedOption(MENU_AMMO_QUIT))
		s7 = "  Quit              \n";
	else
		s7 = "   Quit              \n";
	centerprint7(self, s1, s2, s3, s4, s5, s6, s7);
};

/*
===========
ShowWeapons1Menu
This shows the first half of the menu for what weapons you can buy.
===========
*/
void() ShowWeapons1Menu =
{
	string s1,s2,s3,s4,s5,s6,s7;
		s1 = ftos(self.credits);
		s2 = " cr.\n";
	if (SelectedOption(MENU_WEAPONS1_SUPER_SHOTGUN))
		s3 = " Super Shotgun...10 cr.\n";
	else
		s3 = "  Super Shotgun...10 cr.\n";

	if (SelectedOption(MENU_WEAPONS1_NAILGUN))
		s4 = " Nailgun..........5 cr.\n";
	else
		s4 = "  Nailgun..........5 cr.\n";

	if (SelectedOption(MENU_WEAPONS1_SUPER_NAILGUN))
		s5 = " Super Nailgun...15 cr.\n";
	else
		s5 = "  Super Nailgun...15 cr.\n";

	if (SelectedOption(MENU_WEAPONS1_NEXT))
		s6 = " NEXT PAGE             \n";
	else
		s6 = "  NEXT PAGE             \n";

	if (SelectedOption(MENU_WEAPONS1_QUIT))
		s7 = " Quit                  \n";
	else
		s7 = "  Quit                  \n";
	centerprint7(self, s1, s2, s3, s4, s5, s6, s7);
};

/*
===========
ShowWeapons2Menu
This shows the second half of the menu for what weapons you can buy.
===========
*/
void() ShowWeapons2Menu =
{
	string s1,s2,s3,s4,s5,s6,s7;
		s1 = ftos(self.credits);
		s2 = " cr.\n";
	if (SelectedOption(MENU_WEAPONS2_GRENADE_LAUNCHER))
		s3 = " Grenade Launcher...20 cr.\n";
	else
		s3 = "  Grenade Launcher...20 cr.\n";

	if (SelectedOption(MENU_WEAPONS2_ROCKET_LAUNCHER))
		s4 = " Rocket Launcher....30 cr.\n";
	else
		s4 = "  Rocket Launcher....30 cr.\n";

	if (SelectedOption(MENU_WEAPONS2_LIGHTNING))
		s5 = " Thunderbolt........30 cr.\n";
	else
		s5 = "  Thunderbolt........30 cr.\n";

	if (SelectedOption(MENU_WEAPONS2_PREV))
		s6 = " PREVIOUS PAGE            \n";
	else
		s6 = "  PREVIOUS PAGE            \n";

	if (SelectedOption(MENU_WEAPONS2_QUIT))
		s7 = " Quit                     \n";
	else
		s7 = "  Quit                     \n";
	centerprint7(self, s1, s2, s3, s4, s5, s6, s7);
};

/*
===========
ShowSpecialMenu
This shows you what kinds of ammo you can buy.
===========
*/
void() ShowSpecialMenu =
{
	string s1,s2,s3,s4,s5,s6,s7;
		s1 = ftos(self.credits);
		s2 = " cr.\n";
	if (SelectedOption(MENU_SPECIAL_QUAD))
		s3 = " Quad Damage................50 cr.\n";
	else
		s3 = "  Quad Damage................50 cr.\n";

	if (SelectedOption(MENU_SPECIAL_INVISIBILITY))
		s4 = " Ring of Shadows............30 cr.\n";
	else
		s4 = "  Ring of Shadows............30 cr.\n";

	if (SelectedOption(MENU_SPECIAL_INVULNERABILITY))
		s5 = " Pentagram of Protection...100 cr.\n";
	else
		s5 = "  Pentagram of Protection...100 cr.\n";

	if (SelectedOption(MENU_SPECIAL_SUIT))
		s6 = " Biosuit....................10 cr.\n";
	else
		s6 = "  Biosuit....................10 cr.\n";

	if (SelectedOption(MENU_SPECIAL_QUIT))
		s7 = " Quit                             \n";
	else
		s7 = "  Quit                             \n";
	centerprint7(self, s1, s2, s3, s4, s5, s6, s7);
};