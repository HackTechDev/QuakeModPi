/*
==============================================================================

BOT AI 2

==============================================================================
*/

// Prototypes

float	()								BotFindTarget;
float	()								DMFindTarget;
float	()								CoOpFindTarget;
void	()								BotFoundTarget;
void	()								BotSightSound;
void	()								BotHuntTarget;
void	(void () thinkst)				BotCheckRefire;
void	()								BotSelfDeActivate;
float	(vector fire_angles)			BotFireClear;


//=============================================================
// BotFindTarget - bot tries to find a target
// Will not currently target other players
// Sets self.enemy and returns TRUE if an enemy was sighted
// Sets self.enemy to world and returns FALSE if no enemy sighted
//=============================================================
float () BotFindTarget =
{
	if (self.tm_flags & TM_DEATHMATCH)
		return DMFindTarget();
	else
		return CoOpFindTarget();
};


//=============================================================
// CoOpFindTarget - bot tries to find a target
// Will not target other players or bots
// Sets self.enemy and returns TRUE if an enemy was sighted
// Sets self.enemy to world and returns FALSE if no enemy sighted
//=============================================================
float () CoOpFindTarget =
{
	local entity head, selected;
	local float dist;

	dist = 1500;	// awareness radius of bot, increasing it slows down game
	selected = world;

	head = findradius(self.origin, 1500);
	while(head)
	{
		if(!(head.flags & FL_NOTARGET) && (head.flags & FL_MONSTER))
			if (visible(head))
				if (trace_plane_dist < dist)
					if ((head.health > 0) && (head !=self))
					{
						selected = head;
						dist = trace_plane_dist;
					}
		head = head.chain;
	}

	self.enemy = selected;
		
	if (self.enemy == world)
		return FALSE;
	else
	{
		BotFoundTarget();
		return TRUE;
	}
};


//=============================================================
// DMFindTarget - bot tries to find a target
// Will target other players & bots, but no monsters
// Sets self.enemy and returns TRUE if an enemy was sighted
// Sets self.enemy to world and returns FALSE if no enemy sighted
//=============================================================
float () DMFindTarget =
{
	local entity head, selected;
	local float dist;

	dist = 2000;	// Range of the bot, can set to anything you like
	selected = world;

	head = find (world, classname, "player");
	while (head)
	{
		if (!(head.flags & FL_NOTARGET) && (head.team != self.team)
			&& (head.health > 0))
			if (visible (head))
				if (trace_plane_dist < dist)
				{
					selected = head;
					dist = trace_plane_dist;
				}
		head = find (head, classname, "player");
	}

	head = find (world, classname, "bot");
	while (head)
	{
		if (!(head.flags & FL_NOTARGET) && (head.team != self.team)
			&& (head.health > 0))
			if (visible (head))
				if (trace_plane_dist < dist)
				{
					selected = head;
					dist = trace_plane_dist;
				}
		head = find (head, classname, "bot");
	}

	self.enemy = selected;
		
	if (self.enemy == world)
		return FALSE;
	else
	{
		BotFoundTarget();
		return TRUE;
	}
};



//=============================================================
// BotSightSound
//=============================================================
void() BotSightSound =
{
	local float	rsnd;

	rsnd = rint(random() * 3);			
	if (rsnd == 1)
		sound (self, CHAN_VOICE, "enforcer/sight1.wav", 1, ATTN_NORM);
	else if (rsnd == 2)
		sound (self, CHAN_VOICE, "enforcer/sight2.wav", 1, ATTN_NORM);
	else if (rsnd == 0)
		sound (self, CHAN_VOICE, "enforcer/sight3.wav", 1, ATTN_NORM);
	else
		sound (self, CHAN_VOICE, "enforcer/sight4.wav", 1, ATTN_NORM);
};


//=============================================================
// BotHuntTarget
//=============================================================
void() BotHuntTarget =
{
	self.goalentity = self.enemy;
	self.think = self.th_run;
	self.ideal_yaw = vectoyaw(self.enemy.origin - self.origin);
	self.nextthink = time + 0.1;
	SUB_AttackFinished (0.5);	// wait a while before first attack
};


//=============================================================
// BotFoundTarget
//=============================================================
void() BotFoundTarget =
{
	local float f_dist;
	local string s_dist;
	f_dist = vlen (self.enemy.origin - self.origin);
	s_dist = ftos (f_dist);

	self.show_hostile = time + 1;		// wake up other monsters
	
	sprint (self.bot, "targetting: ");
	if (self.enemy.classname == "player")
		sprint (self.bot, self.enemy.netname);
	else if (self.enemy.classname == "bot")
	{
		sprint (self.bot, self.enemy.bot.netname);
		sprint (self.bot, "'s bot");
	}
	else
		sprint (self.bot, self.enemy.classname);
	sprint (self.bot, "\n");
	sprint (self.bot, "  distance: ");
	sprint (self.bot, s_dist);
	sprint (self.bot, "\n");
	BotSightSound ();
	BotHuntTarget ();
};


//=============================================================
// BotCheckRefire
//=============================================================
void (void () thinkst) BotCheckRefire =
{
	if (!visible (self.enemy) || (self.enemy.health <= 0))
		return;
	self.think = thinkst;
};


//=============================================================
// BotSelfDeActivate - Bot deactivates itself
//=============================================================
void () BotSelfDeActivate =
{
	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_TELEPORT);
	WriteCoord (MSG_BROADCAST, self.origin_x);
	WriteCoord (MSG_BROADCAST, self.origin_y);
	WriteCoord (MSG_BROADCAST, self.origin_z);
	sound (self, CHAN_BODY, "misc/r_tele1.wav", 1, ATTN_NORM);
	self.nextthink = time + 0.1;
	self.think = SUB_Remove;
	self.bot.bot = world;
	centerprint(self.bot, "Bot deactivated\n");
};


//=============================================================
// BotFireClear - Checks the field of view for absence of
// friendlies
//=============================================================
float (vector fire_angles) BotFireClear =
{
	return TRUE;
};
