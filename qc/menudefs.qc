/*
================================
MENUDEFS.QC -- Original source code by Jason Michl
This is where everything is declared. You'll probably make heavy changes to this,
but you won't really spend a whole lot of time in here.

I make use of the following syntax in all of my declarations here:
MENU_****_START means we are at the first menu option of menu ****.
MENU_****_END means that we're at the end of menu ****, and we should go back to
	MENU_****_START.
MENU_****_TO_XXXX means we want to go to MENU_XXXX_START in ActivateOptions.
MENU_****1_NEXT means we want to change self.menu to MENU_****2_START in ActivateOptions.
MENU_****2_PREV means we want to change self.menu to MENU_****1_START in ActivateOptions.
MENU_****_QUIT means that if we select this option, call MenuQuit.
	(MenuQuit sets self.menu to 0 and clears out all the menu text)
================================
*/

.float	menu;

/*
You'll notice that I assign the same numbers to several constants. This is
done because the different names make it easier to keep track of how the number
is being used.
*/

// General menu flags -- can show up from virtually any menu.
float		MENU_OFF				=	0;	// DON'T CHANGE THIS!

// Main menu
float		MENU_ON				=	10;	// DON'T CHANGE THIS!
float		MENU_MAIN_START			=	10;	// DON'T CHANGE THIS, EITHER!
float		MENU_MAIN_TO_ARMOR		=	10;	// Change the name, NOT the number.
float		MENU_MAIN_TO_AMMO			=	11;
float		MENU_MAIN_TO_WEAPONS		=	12;
float		MENU_MAIN_TO_SPECIAL		=	13;
float		MENU_MAIN_QUIT			=	14;
float		MENU_MAIN_END			=	15;

// Menu of armor
float		MENU_ARMOR_START			=	20;
float		MENU_ARMOR_GREEN			=	20;
float		MENU_ARMOR_YELLOW			=	21;
float		MENU_ARMOR_RED			=	22;
float		MENU_ARMOR_QUIT			=	23;
float		MENU_ARMOR_END			=	24;

// Menu of ammunition
float		MENU_AMMO_START			=	30;
float		MENU_AMMO_SHELLS			=	30;
float		MENU_AMMO_NAILS			=	31;
float		MENU_AMMO_ROCKETS			=	32;
float		MENU_AMMO_CELLS			=	33;
float		MENU_AMMO_QUIT			=	34;
float		MENU_AMMO_END			=	35;

// Menu of weapons, page 1
float		MENU_WEAPONS1_START		=	40;
float		MENU_WEAPONS1_SUPER_SHOTGUN	=	40;
float		MENU_WEAPONS1_NAILGUN		=	41;
float		MENU_WEAPONS1_SUPER_NAILGUN	=	42;
float		MENU_WEAPONS1_NEXT		=	43;
float		MENU_WEAPONS1_QUIT		=	44;
float		MENU_WEAPONS1_END			=	45;

// Menu of weapons, page 2
float		MENU_WEAPONS2_START		=	50;
float		MENU_WEAPONS2_GRENADE_LAUNCHER=	50;
float		MENU_WEAPONS2_ROCKET_LAUNCHER	=	51;
float		MENU_WEAPONS2_LIGHTNING		=	52;
float		MENU_WEAPONS2_PREV		=	53;
float		MENU_WEAPONS2_QUIT		=	54;
float		MENU_WEAPONS2_END			=	55;

// Menu of special power ups
float		MENU_SPECIAL_START		=	60;
float		MENU_SPECIAL_QUAD			=	60;
float		MENU_SPECIAL_INVISIBILITY	=	61;
float		MENU_SPECIAL_INVULNERABILITY	=	62;
float		MENU_SPECIAL_SUIT			=	63;
float		MENU_SPECIAL_QUIT			=	64;
float		MENU_SPECIAL_END			=	65;

