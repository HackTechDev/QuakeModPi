/*
==============================================================================

BOT EXTENSIONS

==============================================================================
*/

// Prototypes

void	()		bot_counter_use;
void	()		bot_trigger_onlyregistered_touch;
void	()		bot_door_touch;

void() bot_counter_use =
{
	local string junk;

	self.count = self.count - 1;
	if (self.count < 0)
		return;
	
	if (self.count != 0)
	{
		if ((self.spawnflags & SPAWNFLAG_NOMESSAGE) == 0)
		{
			sprint (activator.bot, "Incoming message from bot:\n");
			if (self.count >= 4)
				centerprint (activator.bot, "There are more to go...");
			else if (self.count == 3)
				centerprint (activator.bot, "Only 3 more to go...");
			else if (self.count == 2)
				centerprint (activator.bot, "Only 2 more to go...");
			else
				centerprint (activator.bot, "Only 1 more to go...");
		}
		return;
	}
	
// New code
	if ((self.spawnflags & SPAWNFLAG_NOMESSAGE) == 0)
	{
		sprint (activator.bot, "Incoming message from bot:\n");
		centerprint(activator.bot, "Sequence completed!");
	}
	self.enemy = activator;
	multi_trigger ();
};


void() bot_trigger_onlyregistered_touch =
{
	if (self.attack_finished > time)
		return;

	self.attack_finished = time + 2;
	if (cvar("registered"))
	{
		self.message = "";
		SUB_UseTargets ();
		remove (self);
	}
	else
	{
		if (self.message != "")
		{
			sprint (other.bot, "Incoming message from bot:\n");
			centerprint (other.bot, self.message);
			sound (other.bot, CHAN_BODY, "misc/talk.wav", 1, ATTN_NORM);
		}
	}
};


/*
================
bot_door_touch

Prints messages and opens key doors
================
*/
void() bot_door_touch =
{
	if (other.classname != "bot")
		return;
	if (self.owner.attack_finished > time)
		return;

	self.owner.attack_finished = time + 2;

	if (self.owner.message != "")
	{
		sprint (other.bot, "Incoming message from bot:\n");
		centerprint (other.bot, self.owner.message);
		sound (other.bot, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
	}
	
// key door stuff
	if (!self.items)
		return;

// FIXME: blink key on player's status bar
	if ( (self.items & other.bot.items) != self.items )
	{
		if (self.owner.message == "")
			sprint (other.bot, "Incoming message from bot:\n");
		if (self.owner.items == IT_KEY1)
		{
			if (world.worldtype == 2)
			{
				centerprint (other.bot, "You need the silver keycard");
				sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);
			}
			else if (world.worldtype == 1)
			{
				centerprint (other.bot, "You need the silver runekey");
				sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);
			}
			else if (world.worldtype == 0)
			{
				centerprint (other.bot, "You need the silver key");
				sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);
			}
		}
		else
		{
			if (world.worldtype == 2)
			{
				centerprint (other.bot, "You need the gold keycard");
				sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);
			}
			else if (world.worldtype == 1)
			{
				centerprint (other.bot, "You need the gold runekey");
				sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);			
			}
			else if (world.worldtype == 0)
			{
				centerprint (other.bot, "You need the gold key");
				sound (self, CHAN_VOICE, self.noise3, 1, ATTN_NORM);
			}
		}
		return;
	}

	other.bot.items = other.bot.items - self.items;
	self.touch = SUB_Null;
	if (self.enemy)
		self.enemy.touch = SUB_Null;	// get paired door
	door_use ();
};

