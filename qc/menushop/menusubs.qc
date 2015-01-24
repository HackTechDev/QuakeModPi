/*
================================
MENUSUBS.QC -- Original source code by Jason Michl
This is where all of the below-the-surface stuff happens.  In all likelyhood, you will
NEVER need to modify this file.  You probably won't even need to look at it, except to
see how to use each of these functions.

The following functions are currently in MENUSUBS.QC:
MenuPrecache (Called by WEAPONS.QC:W_Precache)
SelectedOption
SelectedMenu
MenuQuit
MenuRestart
MenuCommand (Called by WEAPONS.QC:ImpulseCommands)
================================
*/

/*
===========
PROTOTYPES
===========
*/
void(entity client, string s, string s2) centerprint2 = #73;
void(entity client, string s, string s1, string s2) centerprint3 = #73;
void(entity client, string s, string s1, string s2, string s3) centerprint4 = #73;
void(entity client, string s, string s1, string s2, string s3, string s4) centerprint5 = #73;
void(entity client, string s, string s1, string s2, string s3, string s4, string s5) centerprint6 = #73;
void(entity client, string s, string s1, string s2, string s3, string s4, string s5, string s6) centerprint7 = #73;
void(entity client, string s, string s1, string s2, string s3, string s4, string s5, string s6, string s7) centerprint8 = #73;
void(entity client, string s, string s1, string s2, string s3, string s4, string s5, string s6, string s7, string s8) centerprint9 = #73;
void() ScrollMenu;
void() MenuCorePrecache;

/*
===========
MenuPrecache
Called in WEAPONS.QC:W_Precache
This makes absolutely sure that we can hear the player options sounds.
===========
*/
void() MenuPrecache =
{
	precache_sound ("misc/menu2.wav");
	precache_sound ("misc/menu3.wav");
	MenuCorePrecache ();
};


/*
===========
SelectedOption
This returns TRUE if the player has selected the current option, and FALSE otherwise.
===========
*/
float(float option) SelectedOption =
{
if (self.menu == option)
	return TRUE;
return FALSE;
};

/*
===========
SelectedMenu
Basically, this returns TRUE if the player's selected option is in the menu whose 
  values go from "start" to "end".
===========
*/
float (float start, float end) SelectedMenu =
{
if (start <= self.menu && self.menu <= end)
	return TRUE;
return FALSE;
};


/*
===========
MenuQuit
This turns the menu off and kills any text in the center of the screen.
===========
*/
void MenuQuit() =
{
self.menu = MENU_OFF;
centerprint(self, "");
};

/*
===========
MenuRestart
This sends us back to the main menu.
===========
*/
void MenuRestart() =
{
self.menu = MENU_MAIN_START;
};

/*
===========
MenuCommand
If the menu is off, then turn it on (which not-so-coincidentally also sets it to the 
    first menu).
If the menu is already on, then cycle through our available options.
===========
*/
void() MenuCommand =
{
if (!(self.menu))
	{
	stuffcmd(self, "play misc/menu2.wav\n");
	self.menu = MENU_ON;
	return;
	}
ScrollMenu();
};
