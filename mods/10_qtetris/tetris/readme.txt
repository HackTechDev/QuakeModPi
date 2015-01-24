Title    : Tetris mini-mod
Filename : tetris.zip
Version  : a23b17ne-12
Date     : 2-24-2004
Author   : Ryan "Frika C" Smith
Email    : frikac@inside3d.com
Credits  : Alexey Pajitnov for original design

Type of Mod
-----------
Quake C  : yes
Sound    : no
MDL      : no
Level    : no

Format of QuakeC (if a Quake C Mod)
-----------------------------------
unified diff  : no
context diff  : no
.qc files     : yes
progs.dat     : yes


Description of the Modification
-------------------------------

This is a recreation of the game Tetris done with centerprint (the function
normally used for messages such as "3 more to go.."), a modified font, and some
crazy ass QuakeC. The initial version of this mod was coded in around 3 hours
on the night of 2/22/2004 in the midst of an IRC discussion about text mode
Quake modding.

I originally got the inspiration to do this when viewing Frog's "pong demo",
a translation of the game pong done in centerprint. I recognized immediately
that something like tetris, which is designed for a grid, would be much better.

Anyway. To play, start this up in your favorite Quake engine. If using software
Quake you need to be in at least 320x240 video mode. 320x200 will not work.

To begin playing tetris type "impulse 100" in the console.
To exit the game at any time hit impulse 100 again.

You may now maneuver the piece with the +moveleft, +moveright (your strafe keys)
and +back (rapidly descend the piece).

You may also rotate the tetrad using +jump or +attack. (+attack rotates left 90
degrees, +jump right 90 degrees).

As you play you earn points. The scoring is:

1 line: 10 points.
2 lines: 40 points
3 lines: 90 points.
A tetris: 160 points.
Any single piece placed on the level: 1 point

Every 20 completed lines (check your line count on the right) you gain a level.
Each level increases the speed at which the tetrads fall, making it more
difficult. The high score is saved between games.

If you should fail, the game will print Game Over. To return to Quake press
impulse 100 again. To start a new game of tetris, pres the fire button.

How to Install the Modification
-------------------------------

Make a subdir of your quake directory entitled "tetris" and place all
files in this archive, using your favorite unzip utility, in that folder.
Start quake with the parameter "-game tetris". 

Technical Details
-----------------

Known Bugs
==========
None that I know of.


Availability
------------

This modification is available from the following places:

FrikaC's Project Whorehouse at http://www.inside3d.com/frikbot/
