June 7th, 2003
"Items Shop" v1.00
A modification for Quake, by Jason Michl (jasonmichl@ix.netcom.com)



**** Copyrights:
All source code in the supplied .QC files is copyrighted by me, Jason Michl.

I developed this menu system and provided the source code in the hopes that people
would use it in their own modifications.  As such, feel free to copy and utterly mangle 
the code as you please.  Nevertheless, if you use this code in your mod, I would 
appreciate receiving credit for the menu system.  Something as simple as "Menu system 
provided by Jason Michl" would be sufficient, and sending me an email to say "Hey, your 
menu is being used somewhere!" would be even better.



**** Description:
A few days ago, I was browsing through the tutorials on Inside3D.  I discovered that one 
of the tutorials (Counterstrike Clone Tutorial #1, by Koolio/Kools) happened to use some 
code from a menu system I made a while back.  Outside of the version of Duel of the Fates 
I worked on, I've never seen anyone use this menu system, which I think is a shame because 
it's a very nice setup.  Because I can't make the menu's original source code available (having lost it), I decided to write a little menu system that people can
put into their mods.

The menu system turned out to be not so little.  The entire package of new code and 
documentation is 34kb, larger than CLIENT.QC is.  However, the result is exactly 
as I intended.  Herein lies the source code to a menu system that is not only easy 
for players to use, but easy for programmers to include in their own Quake mods.

In order to demonstrate everything this menu system can do, it comes in the form of
an item shop mod.  This shop has seventeen items to purchase, spread across four menus.
One command ("menu_shop") turns the shop on and goes through the list of options.  
Options are selected with a second command ("+attack").  That's it.

The code is broken into four .QC files: MENUDEFS, MENUSUBS, MENUMODS, and MENUCORE.
Some editing will be done in MENUDEFS, but most of it will be done in MENUMODS and
MENUCORE.  MENUSUBS has all of the basic operating functions, and changing or deleting 
them is not recommended.

Altered versions of CLIENT.QC, COMBAT.QC, PROGS.SRC, and WEAPONS.QC have been included,
so you can immediately compile the mod.



**** Playing Instructions:
The console command "menu_shop" will bring up a menu for you to buy stuff.  The stuff
is organized into four categories: Armor, Ammunition, Weapons, and Specials.  "menu_shop"
not only brings up the menu, but also cycles through the menu options.  Press the fire
button to actually buy something.  If you can't buy something, you will be told why you
can't.  (You may have better armor, have enough of that ammo, already have that weapon
or powerup, or you just might not have enough credits).

If you're playing in single-player mode, you can give yourself 200 credits by typing in
the console command "credit_cheat".  Note that you can never carry more than 200 credits.

You gain credits legitimately by killing things.  More difficult monsters yield more
credits -- a Shambler gives up ten, while a Scrag only gives two.  Monsters also 
gain credits by killing things.  Whenever a monster is killed, the killer gets all of
the credits the monster was hoarding.

Players are also worth credits.  More dangerous players are worth more credits as well.  
The killer gets a number of credits equal to the number of frags his victim has (assuming 
his victim has a score greater than 0, that is.)  As a bonus, the killer steals 25% of his 
victim's credits.



**** Bugs:
Quake may not automatically load up the proper aliases for menu_shop and credit_cheat.
An autoexec.cfg file has been provided if this is the case.



**** Installation Notes:
This "shop" system is designed as a QuakeC plugin -- that is, if you want it in your
own modification, just read through the rest of this document.  It will tell you what files I changed, what QuakeC functions I put code in, and where exactly I placed them in the original code.

Or, if you haven't made changes yet to any of the QuakeC files, you can just copy the ones I've included in this ZIP.



**** Description of files:
README.TXT	-	This is what you're reading right now.
PROGS.SRC	-	Source file for your QuakeC compiler. Tells it what files to compile.
MENUDEFS.QC	-	This defines all of the important menu stuff. You'll need to change
			this if you want to modify the menu any.
MENUSUBS.QC -	This defines all of the basic menu operations.  Unless you change
			the values of MENU_ON or MENU_MAIN_START, you won't need to touch
			this file.
MENUMODS.QC -	This is where you make most of your changes to the menu.  Your
			menu displays should be put in this file, as well as any functions
			that you want to call by menu.
MENUCORE.QC -	This is the core of the menu system.  The functions within determine
			which menus are displayed and which options are selected.  You will
			need to account for any changes to MENUDEFS or MENUMODS by changing
			this file.
AUTOEXEC.CFG-	If "menu_shop" and "credit_cheat" do not work, copy this file into
			this mod's folder.

**** Editing Notes:
"centerprint"-based routines only print 6 lines of text, from the looks of it. Maybe
it's just a recurring anomaly on my machine.  Maybe your centerprint can output as many
lines of text as you like.  I'd still recommend that you use no more than 6.  In my mod,
one line is used for credits, one line is used for quitting, and the rest are used for 
whatever is needed.  Any leftover spaces are used to go back to the main menu, the 
previous page, or the next page.

The menu system looks more intimidating than it really is.  The code is reasonably well
documented, and all of the really important stuff is in a few places:
1. NEWDEFS.QC.  This file has all of the definitions for your menu options.  You can use
any range of numbers for your menu options, but you must follow the following rules:

	Your "start" number must be the same as the first option in your menu.
	Valid:
		float	MENU_GOOD_START		=	1;
		float	MENU_GOOD_GIVEKEYS	=	1;
	Invalid:
		float MENU_BAD_START		=	1;
		float	MENU_BAD_GIVEKEYS 	=	2;

	The value for any option must be equal to the value of the previous option plus one.
	Valid:
		float MENU_GOOD_GIVEKEYS	=	1;
		float MENU_GOOD_GIVEGUNS	=	2;
	Invalid:
		float MENU_BAD_GIVEKEYS		=	2;
		float MENU_BAD_GIVEGUNS		=	4;

	Your "end" number must be one greater than the last option in your menu.
	Valid:
		float MENU_GOOD_GIVEGUNS	=	2;
		float MENU_GOOD_END		=	3;
	Invalid:
		float	MENU_BAD_GIVEGUNS		=	4;
		float	MENU_BAD_END		=	6;

2. MENUCORE.QC, "MenuCorePrecache".  This just lets you precache some sounds without
messing around with W_Precache (or MenuPrecache) too badly.  For example, my shop mod
plays the armor sound if you buy armor, the Quad sound if you buy a Quad Damage, and
so forth.  Normally, these sounds are not precached (giving an error when you try to
play them) unless there is an armor or a Quad that exists in the level.

3. MENUCORE.QC, "ActivateOption". This is nothing more complicated than a massive 
if-then-else statement.  "SelectedOption" just checks to see if self.menu equals the 
current option, nothing more.

4. MENUCORE.QC, "ScrollMenu".  An explanation of how things work is included in
the comments for the function.  But basically, if self.menu equals MENU_****_END, then 
set self.menu to MENU_****_START.  Incidentally, this means it is impossible for a player 
to select an option with the same number as MENU_****_END, which is why we give it the 
number immediately after the last option.

5. MENUCORE.QC, "ShowMenu" function.  This is the core menu display function.  All it does
is use SelectedMenu to see what range our currently selected option falls under, and
calls up an appropriate display menu.  All "SelectedMenu" really is, is a shorthand 
if-then statement checking to see if self.menu is between MENU_****_START and 
MENU_****_END.

6. MENUMODS.QC.  As long as you properly account for it in MENUCORE.QC, you can do
whatever you want to this file and everything should still work.

7. MENUSUBS.QC.  Don't touch, unless you know what you're doing.

**** WHERE TO PUT STUFF:

***   PROGS.SRC   ***
Between "subs.qc" and "fight.qc"
// TUTORIAL BEGIN
	// Tell the compiler to compile these .QC files
	menudefs.qc
	menusubs.qc
	menumods.qc
	menucore.qc
// END TUTORIAL



***   COMBAT.QC   ***
Killed (At very end of function):
// TUTORIAL BEGIN
	AllocateCredits(attacker, targ);
// END TUTORIAL



***   CLIENT.QC   ***
PutClientInServer (At very end of function):
// TUTORIAL BEGIN
	stuffcmd(self, "alias menu_shop impulse 200\n");
	stuffcmd(self, "alias credit_cheat impulse 201\n");
// END TUTORIAL

PlayerPreThink (Between "self.flags = self.flags | FL_JUMPRELEASED" and the comment that
says "teleporters can force a non-moving pause time"):
// TUTORIAL BEGIN
	if (self.menu)
	{
		ShowMenu();
		return;
	}
// END TUTORIAL



***   WEAPONS.QC   ***
W_Precache (Very beginning of function):
// TUTORIAL BEGIN
	MenuPrecache();
// END TUTORIAL

W_Attack (Very beginning of function):
// TUTORIAL BEGIN
	if (self.menu)
		{
		ActivateOption();
		return;
		}
// END TUTORIAL	

ImpulseCommands (between the line that says "CycleWeaponReverseCommand ();" and the line
that says "if (self.impulse == 255)"):
// TUTORIAL BEGIN
	if (self.impulse == 200)
		MenuCommand();
	if (self.impulse == 201)
		CreditCheat();
// TUTORIAL END
