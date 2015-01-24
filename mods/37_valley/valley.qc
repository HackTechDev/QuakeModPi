/*

		Death Valley
		A Quake Minimod by MauveBib

		This is my attempt to come up with a new idea for quake: an Easter Egg Secret Game

		The idea is that this game could be plugged in to any mod, and when activated via an
		impulse it takes the player to a secret game, totally text based.

		If you want to use it in your mod, please be my guest! 
		
		This file is fully commented for understanding and inspiration

		All that is required to install it is a call to Valley_Stuff(); from ImpulseCommands

*/
		



.float leftwall;						// number of spaces the left wall is from the edge of the screen
.float rightwall;						// number of spaces the right wall is from the edge of the screen
.float ship;							// number of spaces the ship is from the the edge of the screen
.float valley_move;						// timer to say when the next frame is displayed
.float valleygame;						// flag to say whether the minigame is running or not
.float shipmoved;						// flag used to stop the player moving the ship more than once per minigame frame
.float valleyscore;						// number of frames passed, used as a score

void() Move_Left =						// fairly obvious I hope
{
	if (!self.shipmoved)
		self.ship = self.ship - 1;
	self.shipmoved = TRUE;
};

void() Move_Right =						// ditto
{
	if (!self.shipmoved)
		self.ship = self.ship + 1;
	self.shipmoved = TRUE;
};

void() Death_Valley =						// run every minigame frame to update the game
{
	local float i, r, deadtype, leftdir, rightdir;
	local string str;
	
	self.valleyscore = self.valleyscore + 1;		// add 1 to your score

	self.shipmoved = FALSE;					// reset the flag so that the player can move next frame

	if (self.ship == self.leftwall)				// if the ship has hit a wall, set the game flag off and set a deadtype
	{
		deadtype = 1;
		self.valleygame = FALSE;
	}
	if (self.ship == self.rightwall)
	{
		deadtype = 2;
		self.valleygame = FALSE;
	}

	if (!deadtype)						// randomly move the walls, setting the leftdir or rightdir so the correct
	{							// slanted wall can be displayed.
		if (random() < 0.5)				
		{
			if (random() < 0.5)
			{
				if (random() < 0.5)
				{
					if (self.leftwall > 1)	// obviously don't move left if already at the side of the screen
					{
						self.leftwall = self.leftwall - 1;
						leftdir = 1;
					}
				}
				else
				{
					self.leftwall = self.leftwall + 1;
					leftdir = 2;
				}
			}
			else
			{
				if (random() < 0.5)
				{
					self.rightwall = self.rightwall - 1;
					rightdir = 1;
				}
				else
				{
					self.rightwall = self.rightwall + 1;
					rightdir = 2;
				}
			}
		}
	}
	
	if (self.ship == self.leftwall)				// check for crashes again, to check if the wall has moved onto the player
	{
		deadtype = 1;
		self.valleygame = FALSE;
	}
	if (self.ship == self.rightwall)
	{
		deadtype = 2;
		self.valleygame = FALSE;
	}

	i = self.leftwall - 1;
	while (i)						// position the left wall
	{
		sprint(self, " ");
		i = i - 1;
	}
	if (deadtype == 1)					// display the correct symbol for the left wall
		sprint(self, "*");
	else if (leftdir == 1)
		sprint (self, "¯");
	else if (leftdir == 2)
		sprint (self, "Ü");
	else
		sprint (self, "ü");

	if (!deadtype)						
	{
		i = (self.ship - 1) - self.leftwall;
		while (i)					// position the ship
		{
			sprint(self, " ");
			i = i - 1;
		}
	
		sprint (self, "ƒ");				// display the ship symbol
	}
	
	if (deadtype == 2)					
		i = (self.rightwall - 1) - self.leftwall;
	else
		i = (self.rightwall - 1) - self.ship;
	while (i)						// position the right wall
	{
		sprint(self, " ");
		i = i - 1;
	}
	if (deadtype == 2)					// display the correct symbol for the right wall
		sprint(self, "*\n");
	else if (rightdir == 1)
		sprint (self, "¯\n");
	else if (rightdir == 2)
		sprint (self, "Ü\n");
	else
		sprint (self, "ü\n");

	if (deadtype)						// we've crashed, so show the score
	{
		sprint(self, "     CRASH!   Final Score ");
		str = ftos(self.valleyscore);
		sprint(self, str);
		sprint(self, "\n");
	}

	self.valley_move = time + 0.1 + (25 / (self.valleyscore + 50));				// speed up as it goes along
	
};

void() Start_Valley =						// initialises the minigame
{
	self.leftwall = 4;
	self.ship = 8;
	self.rightwall = 12;
	self.valleygame = TRUE;
	self.valleyscore = 0;
	self.valley_move = time + 0.25;
};

void() Valley_Stuff =						// called by ImpulseCommands(), controls game flow and movement
{	
	if (self.valleygame)
		if (time > self.valley_move)
			Death_Valley();
	if (self.impulse == 100)
		Start_Valley();
	if (self.impulse == 101)
		Move_Left();
	if (self.impulse == 102)
		Move_Right();
};
