/*
==============================================================================

BOT

==============================================================================
*/

// Prototypes

void	()		Bot_Precache;
vector	()		BotStartPosition;
float	(vector spawn_point)
				BotCheckPosition;
void	()		BotActivate;
void	()		BotDeActivate;
void	()		BotToggle;
void	()		BotAutoToggle;
void	()		BotMoveToggle;
void	()		BotTurnRight;
void	()		BotTurnLeft;
void	()		BotFireToggle;
void	()		BotFire;
void	()		BotTeleportHome;
void	()		BotDMToggle;

void	(vector org, vector vec)
				LaunchLaser;
void	(vector org)
				spawn_tfog;
void	()		ai_face;


//=============================================================
// Bot_Precache - called by Worldspawn in world.qc
//=============================================================
void () Bot_Precache =
{
	precache_model2 ("progs/enforcer.mdl");
	precache_model2 ("progs/h_mega.mdl");
	precache_model2 ("progs/laser.mdl");

	precache_sound2 ("enforcer/death1.wav");
	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("enforcer/idle1.wav");
	precache_sound2 ("enforcer/pain1.wav");
	precache_sound2 ("enforcer/pain2.wav");
	precache_sound2 ("enforcer/sight1.wav");
	precache_sound2 ("enforcer/sight2.wav");
	precache_sound2 ("enforcer/sight3.wav");
	precache_sound2 ("enforcer/sight4.wav");
};


//=============================================================
// BotStartPosition - returns a position the Bot can start at
// returns '0 0 0' if no position can be found
//=============================================================
vector () BotStartPosition =
{
// Note:	The size of the bot is '-16 -16 -24', '16 16 40'
//      	The size of the player is '-16 -16 -24', '16 16 32'

	local vector	org_vec, temp_vec,
					front_vec, right_vec, up_vec;
	org_vec = self.origin;

// Note: The large values for the directional front_vec, right_vec,
// etc. are because I don't think the bounding boxes of the entities
// rotate along with the angles or v_angles field settings.

	makevectors (self.angles);
	front_vec = 46 * normalize (v_forward);
	right_vec = 46 * normalize (v_right);
	up_vec = 80 * normalize (v_up);

	temp_vec = org_vec + front_vec;		// Check in front of player first
	if (BotCheckPosition (temp_vec))
		return temp_vec;
	
	temp_vec = org_vec + right_vec;		// Then check to the right
	if (BotCheckPosition (temp_vec))
		return temp_vec;

	temp_vec = org_vec - right_vec;		// Then to the left
	if (BotCheckPosition (temp_vec))
		return temp_vec;

	temp_vec = org_vec - front_vec;		// Then behind the player
	if (BotCheckPosition (temp_vec))
		return temp_vec;

	temp_vec = org_vec + up_vec;		// Finally, check above the player
	if (BotCheckPosition (temp_vec))	// Note: this would make the bot appear
		return temp_vec;				//       on top of the player's head
		
// You can check below the player too,
// but I got tired of this function
// and decided to give up here
	return '0 0 0';
};


//=============================================================
// BotCheckPosition - returns TRUE if spot is good for spawning
//                    (for the bot, not for trout)
// won't spawn in water, slime, lava, or walls
//=============================================================
float (vector spawn_point) BotCheckPosition =
{
	local float p_contents;
	local vector x_vec, y_vec, zplus_vec, zminus_vec;
	
// Note:	The size of the bot is '-16 -16 -24', '16 16 40'
// Note: Replace this with references to the size of the bot.
	x_vec = '16 0 0';
	y_vec = '0 16 0';
	zplus_vec = '0 0 40';
	zminus_vec = '0 0 -24';

// Check origin
	p_contents = pointcontents (spawn_point);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;

// Check centers of faces of the bounding box
	p_contents = pointcontents (spawn_point + x_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point - x_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point + y_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point - y_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point + zplus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point + zminus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;

// Check the vertices of the bounding box
	p_contents = pointcontents (spawn_point + x_vec + y_vec + zplus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point + x_vec + y_vec + zminus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point + x_vec - y_vec + zplus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point + x_vec - y_vec + zminus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point - x_vec + y_vec + zplus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point - x_vec + y_vec + zminus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point - x_vec - y_vec + zplus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;
	p_contents = pointcontents (spawn_point - x_vec - y_vec + zminus_vec);
	if (p_contents != CONTENT_EMPTY && p_contents != CONTENT_SKY)
		return FALSE;

// You should also check other positions within the bounding box to make
// absolutely sure that the bot does not appear within something solid.
// Random sampling might help.

	return TRUE;

};


//=============================================================
// BotActivate - Activates the bot
//=============================================================
void () BotActivate =
{
	local entity	newbot;
	local vector	bot_org;

	bot_org = BotStartPosition ();
	if (bot_org == '0 0 0')
	{
		sprint (self, "Not enough room for bot here.\n");
		return;
	}

	newbot = spawn();
	newbot.solid = SOLID_SLIDEBOX;
	newbot.movetype = MOVETYPE_STEP;
	newbot.angles_y = self.angles_y;
	newbot.classname = "bot";
	newbot.bot=self;
	self.bot=newbot;
	newbot.tm_flags = newbot.tm_flags | TM_AUTOMODE;
	newbot.tm_flags = newbot.tm_flags | TM_AUTOFIRE;
	newbot.tm_flags = newbot.tm_flags | TM_COOP;
	newbot.team = self.team;
	newbot.health = 100;
	newbot.max_health = 100;
	newbot.takedamage = DAMAGE_AIM;
    newbot.goalentity = self;
	newbot.movetarget = self;
	newbot.pausetime = time + 2;
	newbot.ideal_yaw = newbot.angles * '0 1 0';
	newbot.yaw_speed = 30;
	newbot.view_ofs = '0 0 30'; // five higher than a player's

// Set to automatic mode sequences at startup
	newbot.th_stand = bot_stand1;
	newbot.th_walk = bot_walk1;
	newbot.th_run = bot_run1;
	newbot.th_pain = bot_pain;
	newbot.th_die = bot_die;
	newbot.th_missile = bot_atk1; // need to add a melee attack

	setmodel (newbot, "progs/enforcer.mdl");
	setsize (newbot, '-16 -16 -24', '16 16 40');
	setorigin(newbot, bot_org);

	spawn_tfog (newbot.origin);

	centerprint(self, "Bot activated\n");
	
	newbot.nextthink = time + 0.1;
	newbot.think = newbot.th_stand;
};


//=============================================================
// BotDeActivate - Deactivates the bot
//=============================================================
void () BotDeActivate =
{
	spawn_tfog (self.bot.origin);
	self.bot.nextthink = time + 0.1;
	self.bot.think = SUB_Remove;
	self.bot = world;
	centerprint(self, "Bot deactivated\n");
};


//=============================================================
// BotToggle - Toggle bot on and off
//=============================================================
void () BotToggle =
{
	if (self.bot)
		BotDeActivate();
	else
		BotActivate();
};


//=============================================================
// BotAutoToggle - Toggle the bot between automatic and manual
//=============================================================
void () BotAutoToggle =
{
	if (self.bot.tm_flags & TM_AUTOMODE)
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_AUTOMODE);

	// Set to manual mode sequences
		self.bot.th_stand = man_bot_stand1;
		self.bot.th_walk = man_bot_walk1;
		self.bot.th_run = man_bot_run1;
		self.bot.th_pain = bot_pain;		// These don't need to be
		self.bot.th_die = bot_die;			// set to a special manual
		self.bot.th_missile = bot_atk1;		// version.

		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_stand;
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_RUN);
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_WALK);
		self.bot.tm_flags = self.bot.tm_flags | TM_STAND;
		centerprint (self, "Bot in manual mode\n");
	}
	else
	{
		self.bot.tm_flags = self.bot.tm_flags | TM_AUTOMODE;

		// Set to automatic mode sequences
		self.bot.th_stand = bot_stand1;
		self.bot.th_walk = bot_walk1;
		self.bot.th_run = bot_run1;
		self.bot.th_pain = bot_pain;
		self.bot.th_die = bot_die;
		self.bot.th_missile = bot_atk1;

		self.bot.movetarget = self.bot;
		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_stand;
		centerprint (self, "Bot in auto mode\n");
	}
};



//=============================================================
// BotMoveToggle - Toggle moving (walk, run, stand) in man mode
//=============================================================
void () BotMoveToggle =
{
	if (self.bot.tm_flags & TM_STAND)
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_STAND);
		self.bot.tm_flags = self.bot.tm_flags | TM_WALK;
		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_walk;
	}
	else if (self.bot.tm_flags & TM_WALK)
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_WALK);
		self.bot.tm_flags = self.bot.tm_flags | TM_RUN;
		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_run;
	}
	else
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_RUN);
		self.bot.tm_flags = self.bot.tm_flags | TM_STAND;
		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_stand;
	}
	return;
};

//=============================================================
// BotTurnRight - Turn bot 22.5 degrees to right in man mode
//=============================================================
void () BotTurnRight =
{
	self.bot.ideal_yaw = self.bot.ideal_yaw - 22.5;
	return;
};


//=============================================================
// BotTurnLeft - Turn bot 22.5 degrees to left in man mode
//=============================================================
void () BotTurnLeft =
{
	self.bot.ideal_yaw = self.bot.ideal_yaw + 22.5;
};


//=============================================================
// BotFireToggle - Toggle auto-fire in automatic mode
//=============================================================
void () BotFireToggle =
{
	if (self.bot.tm_flags & TM_AUTOFIRE)
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_AUTOFIRE);
		centerprint (self, "Bot auto fire disabled\n");
	}
	else
	{
		self.bot.tm_flags = self.bot.tm_flags | TM_AUTOFIRE;
		centerprint (self, "Bot auto fire enabled\n");
	}

	return;
};


//=============================================================
// BotFire - Have bot fire at its current target
//=============================================================
void () BotFire =
{
	local entity oldself;
	local vector org1, org2;

	oldself = self;
	self = self.bot;

	if ((self.tm_flags & TM_AUTOMODE) && self.enemy != world && self.enemy.health > 1
		&& !(self.enemy.items & IT_INVISIBILITY) && visible(self.enemy))
	{
		ai_face ();
		bot_fire ();
	}
	else if (BotFireClear (self.angles))
	{
		self.effects = self.effects | EF_MUZZLEFLASH;
		makevectors (self.angles);
		org1 = self.origin + v_forward * 30 + v_right * 6 + '0 0 16';
		org2 = self.origin + v_forward * 30 + v_right * 11 + '0 0 16';
		sound (self, CHAN_WEAPON, "enforcer/enfire.wav", 1, ATTN_NORM);
		LaunchLaser (org1, v_forward);
		LaunchLaser (org2, v_forward);
	}

	self = oldself;
	return;
};


//=============================================================
// BotTeleportHome - Teleports bot back to its owner
//=============================================================
void () BotTeleportHome =
{
	local vector	bot_org;

	bot_org = BotStartPosition ();
	if (bot_org == '0 0 0')
	{
		centerprint (self, "Can't teleport, no room there!\n");
		return;
	}
	
	spawn_tfog (self.bot.origin);
	self.bot.ideal_yaw = self.angles * '0 1 0';
	self.bot.pausetime = time + 2;
	self.bot.nextthink = time + 0.1;
	self.bot.think = self.bot.th_stand;
	setorigin(self.bot, bot_org);
	spawn_tfog (self.bot.origin);
	self.bot.nextthink = time + 0.1;
	self.bot.think = self.bot.th_stand;
	return;
};


//=============================================================
// BotDMToggle - Toggles between Single/Co-op and DM/DM-team
//=============================================================
void () BotDMToggle =
{
	if (self.bot.tm_flags & TM_DEATHMATCH)
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_DEATHMATCH);
		self.bot.tm_flags = self.bot.tm_flags | TM_COOP;
		centerprint (self, "Co-op mode selected\n");
		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_stand;
	}
	else
	{
		self.bot.tm_flags = self.bot.tm_flags - (self.bot.tm_flags & TM_COOP);
		self.bot.tm_flags = self.bot.tm_flags | TM_DEATHMATCH;
		centerprint (self, "Deathmatch mode selected\n");
		self.bot.team = self.team;
		self.bot.nextthink = time + 0.1;
		self.bot.think = self.bot.th_stand;
	}
	return;
};
