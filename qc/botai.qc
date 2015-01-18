/*
==============================================================================

BOT AI

==============================================================================
*/

// Prototypes

void	()								bot_ai_stand;
void	()								bot_ai_turn;
void	(float dist)					bot_ai_walk;
void	(float dist)					man_bot_ai_walk;
void	(float dist)					bot_ai_run;
void	(float dist)					man_bot_ai_run;
void	(float dist)					bot_ai_follow;
void	(entity attacker, float damage)	bot_pain;
void	()								bot_die;
void	()								bot_fire;

void	(vector org, vector vec)		LaunchLaser;


// Frame macros

$cd /raid/quake/id1/models/enforcer
$origin 0 -6 24
$base base		
$skin skin

$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7

$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 walk10
$frame walk11 walk12 walk13 walk14 walk15 walk16

$frame run1 run2 run3 run4 run5 run6 run7 run8

$frame attack1 attack2 attack3 attack4 attack5 attack6
$frame attack7 attack8 attack9 attack10

$frame death1 death2 death3 death4 death5 death6 death7 death8
$frame death9 death10 death11 death12 death13 death14

$frame fdeath1 fdeath2 fdeath3 fdeath4 fdeath5 fdeath6 fdeath7 fdeath8
$frame fdeath9 fdeath10 fdeath11

$frame paina1 paina2 paina3 paina4

$frame painb1 painb2 painb3 painb4 painb5

$frame painc1 painc2 painc3 painc4 painc5 painc6 painc7 painc8

$frame paind1 paind2 paind3 paind4 paind5 paind6 paind7 paind8
$frame paind9 paind10 paind11 paind12 paind13 paind14 paind15 paind16
$frame paind17 paind18 paind19

void()	bot_stand1	=[	$stand1,	bot_stand2	] {bot_ai_stand();};
void()	bot_stand2	=[	$stand2,	bot_stand3	] {bot_ai_stand();};
void()	bot_stand3	=[	$stand3,	bot_stand4	] {bot_ai_stand();};
void()	bot_stand4	=[	$stand4,	bot_stand5	] {bot_ai_stand();};
void()	bot_stand5	=[	$stand5,	bot_stand6	] {bot_ai_stand();};
void()	bot_stand6	=[	$stand6,	bot_stand7	] {bot_ai_stand();};
void()	bot_stand7	=[	$stand7,	bot_stand1	] {bot_ai_stand();};

void()	man_bot_stand1	=[	$stand1,	man_bot_stand2	] {ChangeYaw();};
void()	man_bot_stand2	=[	$stand2,	man_bot_stand3	] {ChangeYaw();};
void()	man_bot_stand3	=[	$stand3,	man_bot_stand4	] {ChangeYaw();};
void()	man_bot_stand4	=[	$stand4,	man_bot_stand5	] {ChangeYaw();};
void()	man_bot_stand5	=[	$stand5,	man_bot_stand6	] {ChangeYaw();};
void()	man_bot_stand6	=[	$stand6,	man_bot_stand7	] {ChangeYaw();};
void()	man_bot_stand7	=[	$stand7,	man_bot_stand1	] {ChangeYaw();};

void()	bot_walk1	=[	$walk1 ,	bot_walk2	]
{
	if (random() < 0.2)
		sound (self, CHAN_VOICE, "enforcer/idle1.wav", 1, ATTN_IDLE);
	bot_ai_walk(6);
};
void()	bot_walk2	=[	$walk2 ,	bot_walk3	] {bot_ai_walk(12);};
void()	bot_walk3	=[	$walk3 ,	bot_walk4	] {bot_ai_walk(12);};
void()	bot_walk4	=[	$walk4 ,	bot_walk5	] {bot_ai_walk(9);};
void()	bot_walk5	=[	$walk5 ,	bot_walk6	] {bot_ai_walk(3);};
void()	bot_walk6	=[	$walk6 ,	bot_walk7	] {bot_ai_walk(6);};
void()	bot_walk7	=[	$walk7 ,	bot_walk8	] {bot_ai_walk(6);};
void()	bot_walk8	=[	$walk8 ,	bot_walk9	] {bot_ai_walk(3);};
void()	bot_walk9	=[	$walk9 ,	bot_walk10	] {bot_ai_walk(6);};
void()	bot_walk10	=[	$walk10,	bot_walk11	] {bot_ai_walk(12);};
void()	bot_walk11	=[	$walk11,	bot_walk12	] {bot_ai_walk(12);};
void()	bot_walk12	=[	$walk12,	bot_walk13	] {bot_ai_walk(3);};
void()	bot_walk13	=[	$walk13,	bot_walk14	] {bot_ai_walk(6);};
void()	bot_walk14	=[	$walk14,	bot_walk15	] {bot_ai_walk(9);};
void()	bot_walk15	=[	$walk15,	bot_walk16	] {bot_ai_walk(12);};
void()	bot_walk16	=[	$walk16,	bot_walk1	] {bot_ai_walk(6);};

void()	man_bot_walk1	=[	$walk1 ,	man_bot_walk2	]
{
	if (random() < 0.2)
		sound (self, CHAN_VOICE, "enforcer/idle1.wav", 1, ATTN_IDLE);
	man_bot_ai_walk(4);
};
void()	man_bot_walk2	=[	$walk2 ,	man_bot_walk3	] {man_bot_ai_walk(8);};
void()	man_bot_walk3	=[	$walk3 ,	man_bot_walk4	] {man_bot_ai_walk(8);};
void()	man_bot_walk4	=[	$walk4 ,	man_bot_walk5	] {man_bot_ai_walk(6);};
void()	man_bot_walk5	=[	$walk5 ,	man_bot_walk6	] {man_bot_ai_walk(2);};
void()	man_bot_walk6	=[	$walk6 ,	man_bot_walk7	] {man_bot_ai_walk(4);};
void()	man_bot_walk7	=[	$walk7 ,	man_bot_walk8	] {man_bot_ai_walk(4);};
void()	man_bot_walk8	=[	$walk8 ,	man_bot_walk9	] {man_bot_ai_walk(2);};
void()	man_bot_walk9	=[	$walk9 ,	man_bot_walk10	] {man_bot_ai_walk(4);};
void()	man_bot_walk10	=[	$walk10,	man_bot_walk11	] {man_bot_ai_walk(8);};
void()	man_bot_walk11	=[	$walk11,	man_bot_walk12	] {man_bot_ai_walk(8);};
void()	man_bot_walk12	=[	$walk12,	man_bot_walk13	] {man_bot_ai_walk(2);};
void()	man_bot_walk13	=[	$walk13,	man_bot_walk14	] {man_bot_ai_walk(4);};
void()	man_bot_walk14	=[	$walk14,	man_bot_walk15	] {man_bot_ai_walk(6);};
void()	man_bot_walk15	=[	$walk15,	man_bot_walk16	] {man_bot_ai_walk(8);};
void()	man_bot_walk16	=[	$walk16,	man_bot_walk1	] {man_bot_ai_walk(4);};

void()	bot_run1	=[	$run1  ,	bot_run2	]
{
	if (random() < 0.2)
		sound (self, CHAN_VOICE, "enforcer/idle1.wav", 1, ATTN_IDLE);
	bot_ai_run(18);
};
void()	bot_run2	=[	$run2  ,	bot_run3	] {bot_ai_run(14);};
void()	bot_run3	=[	$run3  ,	bot_run4	] {bot_ai_run(7);};
void()	bot_run4	=[	$run4  ,	bot_run5	] {bot_ai_run(12);};
void()	bot_run5	=[	$run5  ,	bot_run6	] {bot_ai_run(14);};
void()	bot_run6	=[	$run6  ,	bot_run7	] {bot_ai_run(14);};
void()	bot_run7	=[	$run7  ,	bot_run8	] {bot_ai_run(7);};
void()	bot_run8	=[	$run8  ,	bot_run1	] {bot_ai_run(11);};

void()	man_bot_run1	=[	$run1  ,	man_bot_run2	]
{
	if (random() < 0.2)
		sound (self, CHAN_VOICE, "enforcer/idle1.wav", 1, ATTN_IDLE);
	man_bot_ai_run(18);
};
void()	man_bot_run2	=[	$run2  ,	man_bot_run3	] {man_bot_ai_run(14);};
void()	man_bot_run3	=[	$run3  ,	man_bot_run4	] {man_bot_ai_run(7);};
void()	man_bot_run4	=[	$run4  ,	man_bot_run5	] {man_bot_ai_run(12);};
void()	man_bot_run5	=[	$run5  ,	man_bot_run6	] {man_bot_ai_run(14);};
void()	man_bot_run6	=[	$run6  ,	man_bot_run7	] {man_bot_ai_run(14);};
void()	man_bot_run7	=[	$run7  ,	man_bot_run8	] {man_bot_ai_run(7);};
void()	man_bot_run8	=[	$run8  ,	man_bot_run1	] {man_bot_ai_run(11);};

void()	bot_follow1	=[	$run1  ,	bot_follow2	]
{
	if (random() < 0.2)
		sound (self, CHAN_VOICE, "enforcer/idle1.wav", 1, ATTN_IDLE);
	self.goalentity = self.movetarget = self.bot;
	bot_ai_follow(18);
};
void()	bot_follow2	=[	$run2  ,	bot_follow3	] {bot_ai_follow(14);};
void()	bot_follow3	=[	$run3  ,	bot_follow4	] {bot_ai_follow(7);};
void()	bot_follow4	=[	$run4  ,	bot_follow5	] {bot_ai_follow(12);};
void()	bot_follow5	=[	$run5  ,	bot_follow6	] {bot_ai_follow(14);};
void()	bot_follow6	=[	$run6  ,	bot_follow7	] {bot_ai_follow(14);};
void()	bot_follow7	=[	$run7  ,	bot_follow8	] {bot_ai_follow(7);};
void()	bot_follow8	=[	$run8  ,	bot_follow1	] {bot_ai_follow(11);};

void()	bot_atk1	=[	$attack1,	bot_atk2	] {ai_face();};
void()	bot_atk2	=[	$attack2,	bot_atk3	] {ai_face();};
void()	bot_atk3	=[	$attack3,	bot_atk4	] {ai_face();};
void()	bot_atk4	=[	$attack4,	bot_atk5	] {ai_face();};
void()	bot_atk5	=[	$attack5,	bot_atk6	] {ai_face();};
void()	bot_atk6	=[	$attack6,	bot_atk7	] {bot_fire();};
void()	bot_atk7	=[	$attack7,	bot_atk8	] {ai_face();};
void()	bot_atk8	=[	$attack8,	bot_atk9	] {ai_face();};
void()	bot_atk9	=[	$attack5,	bot_atk10	] {ai_face();};
void()	bot_atk10	=[	$attack6,	bot_atk11	] {bot_fire();};
void()	bot_atk11	=[	$attack7,	bot_atk12	] {ai_face();};
void()	bot_atk12	=[	$attack8,	bot_atk13	] {ai_face();};
void()	bot_atk13	=[	$attack9,	bot_atk14	] {ai_face();};
void()	bot_atk14	=[	$attack10,	bot_run1	]
{
	ai_face();
	BotCheckRefire (bot_atk1);
};

void()	bot_paina1	=[	$paina1,	bot_paina2	] {};
void()	bot_paina2	=[	$paina2,	bot_paina3	] {};
void()	bot_paina3	=[	$paina3,	bot_paina4	] {};
void()	bot_paina4	=[	$paina4,	bot_run1	] {};

void()	bot_painb1	=[	$painb1,	bot_painb2	] {};
void()	bot_painb2	=[	$painb2,	bot_painb3	] {};
void()	bot_painb3	=[	$painb3,	bot_painb4	] {};
void()	bot_painb4	=[	$painb4,	bot_painb5	] {};
void()	bot_painb5	=[	$painb5,	bot_run1	] {};

void()	bot_painc1	=[	$painc1,	bot_painc2	] {};
void()	bot_painc2	=[	$painc2,	bot_painc3	] {};
void()	bot_painc3	=[	$painc3,	bot_painc4	] {};
void()	bot_painc4	=[	$painc4,	bot_painc5	] {};
void()	bot_painc5	=[	$painc5,	bot_painc6	] {};
void()	bot_painc6	=[	$painc6,	bot_painc7	] {};
void()	bot_painc7	=[	$painc7,	bot_painc8	] {};
void()	bot_painc8	=[	$painc8,	bot_run1	] {};

void()	bot_paind1	=[	$paind1,	bot_paind2	] {};
void()	bot_paind2	=[	$paind2,	bot_paind3	] {};
void()	bot_paind3	=[	$paind3,	bot_paind4	] {};
void()	bot_paind4	=[	$paind4,	bot_paind5	] {ai_painforward(2);};
void()	bot_paind5	=[	$paind5,	bot_paind6	] {ai_painforward(1);};
void()	bot_paind6	=[	$paind6,	bot_paind7	] {};
void()	bot_paind7	=[	$paind7,	bot_paind8	] {};
void()	bot_paind8	=[	$paind8,	bot_paind9	] {};
void()	bot_paind9	=[	$paind9,	bot_paind10	] {};
void()	bot_paind10	=[	$paind10,	bot_paind11	] {};
void()	bot_paind11	=[	$paind11,	bot_paind12	] {ai_painforward(1);};
void()	bot_paind12	=[	$paind12,	bot_paind13	] {ai_painforward(1);};
void()	bot_paind13	=[	$paind13,	bot_paind14	] {ai_painforward(1);};
void()	bot_paind14	=[	$paind14,	bot_paind15	] {};
void()	bot_paind15	=[	$paind15,	bot_paind16	] {};
void()	bot_paind16	=[	$paind16,	bot_paind17	] {ai_pain(1);};
void()	bot_paind17	=[	$paind17,	bot_paind18	] {ai_pain(1);};
void()	bot_paind18	=[	$paind18,	bot_paind19	] {};
void()	bot_paind19	=[	$paind19,	bot_run1	] {};

void()	bot_die1	=[	$death1,	bot_die2	] {};
void()	bot_die2	=[	$death2,	bot_die3	] {};
void()	bot_die3	=[	$death3,	bot_die4	]
{
	self.solid = SOLID_NOT;
	self.ammo_cells = 5;
	DropBackpack();
};
void()	bot_die4	=[	$death4,	bot_die5	] {ai_forward(14);};
void()	bot_die5	=[	$death5,	bot_die6	] {ai_forward(2);};
void()	bot_die6	=[	$death6,	bot_die7	] {};
void()	bot_die7	=[	$death7,	bot_die8	] {};
void()	bot_die8	=[	$death8,	bot_die9	] {};
void()	bot_die9	=[	$death9,	bot_die10	] {ai_forward(3);};
void()	bot_die10	=[	$death10,	bot_die11	] {ai_forward(5);};
void()	bot_die11	=[	$death11,	bot_die12	] {ai_forward(5);};
void()	bot_die12	=[	$death12,	bot_die13	] {ai_forward(5);};
void()	bot_die13	=[	$death13,	bot_die14	] {};
void()	bot_die14	=[	$death14,	bot_die14	] {BotSelfDeActivate();};

void()	bot_fdie1	=[	$fdeath1,	bot_fdie2	] {};
void()	bot_fdie2	=[	$fdeath2,	bot_fdie3	] {};
void()	bot_fdie3	=[	$fdeath3,	bot_fdie4	] 
{
	self.solid = SOLID_NOT;
	self.ammo_cells = 5;
	DropBackpack();
};
void()	bot_fdie4	=[	$fdeath4,	bot_fdie5	] {};
void()	bot_fdie5	=[	$fdeath5,	bot_fdie6	] {};
void()	bot_fdie6	=[	$fdeath6,	bot_fdie7	] {};
void()	bot_fdie7	=[	$fdeath7,	bot_fdie8	] {};
void()	bot_fdie8	=[	$fdeath8,	bot_fdie9	] {};
void()	bot_fdie9	=[	$fdeath9,	bot_fdie10	] {};
void()	bot_fdie10	=[	$fdeath10,	bot_fdie11	] {};
void()	bot_fdie11	=[	$fdeath11,	bot_fdie11	] {BotSelfDeActivate();};



//=============================================================
// bot_ai_stand - bot stands in place until target acquired,
// and starts to walk if pausetime has expired
//=============================================================
void() bot_ai_stand =
{
	if (BotFindTarget ())
		return;
	
	if (vlen (self.origin - self.bot.origin) > 500)
	{
		bot_follow1	();
		return;
	}

	if (time > self.pausetime)
	{
		self.th_walk ();
		return;
	}
};


//=============================================================
// bot_pain
//=============================================================
void(entity attacker, float damage)	bot_pain =
{
// Note: Add an enemy/goalentity/movetarget assignation
	local float r;
	local entity oldself;

	r = random ();
	if (self.pain_finished > time)
		return;

	
	if (r < 0.5)
		sound (self, CHAN_VOICE, "enforcer/pain1.wav", 1, ATTN_NORM);
	else
		sound (self, CHAN_VOICE, "enforcer/pain2.wav", 1, ATTN_NORM);


// Been hit, so go into automatic mode
	if (!(self.tm_flags & TM_AUTOMODE))
	{
		oldself = self;
		self = self.bot;
		BotAutoToggle();
		self = oldself;
	}

	if (r < 0.2)
	{
		self.pain_finished = time + 1;
		bot_paina1 ();
	}
	else if (r < 0.4)
	{
		self.pain_finished = time + 1;
		bot_painb1 ();
	}
	else if (r < 0.7)
	{
		self.pain_finished = time + 1;
		bot_painc1 ();
	}
	else
	{
		self.pain_finished = time + 2;
		bot_paind1 ();
	}

};

//=============================================================
// bot_die
//=============================================================
void() bot_die =
{
	sound (self, CHAN_VOICE, "enforcer/death1.wav", 1, ATTN_NORM);
	if (random() > 0.5)
		bot_die1 ();
	else
		bot_fdie1 ();

// death frame sequence includes bot deactivation	
};


//=============================================================
// bot_ai_walk - bot is walking, looking for enemies
//=============================================================
void(float dist) bot_ai_walk =
{
	if (BotFindTarget ())
		return;

	if (vlen (self.origin - self.bot.origin) > 500)
	{
		bot_follow1();
		return;
	}

	movetogoal (dist);
};


//=============================================================
// bot_ai_follow - bot is following player, looking for enemies
//=============================================================
void(float dist) bot_ai_follow =
{
	if (BotFindTarget ())
		return;

	if (vlen (self.origin - self.bot.origin) <= 50)
	{
		self.pausetime = time + 2;
		self.th_stand ();
		return;
	}

	movetogoal (dist);
};


//=============================================================
// man_bot_ai_walk - bot is walking
//=============================================================
void(float dist) man_bot_ai_walk =
{
	local vector	temp_vec;

	ChangeYaw();
	makevectors (self.angles);
	temp_vec = vectoangles (v_forward);
	walkmove (temp_vec_y, dist);
};


//=============================================================
// man_bot_ai_run - bot is running
//=============================================================
void(float dist) man_bot_ai_run =
{
	local entity temp_ent;
	local vector temp_vec;

	ChangeYaw();
	makevectors (self.angles);

	temp_ent = spawn();
	temp_ent.owner = self;
	temp_ent.nextthink = time + 0.1;
	temp_ent.think = SUB_Remove;
	temp_ent.takedamage = DAMAGE_NO;
	temp_ent.solid = SOLID_NOT;
	temp_ent.movetype = MOVETYPE_NONE;

	self.goalentity = self.movetarget = temp_ent;

	makevectors (self.angles);
	temp_vec = 100 * normalize (v_forward);
	temp_vec = self.origin + temp_vec;
	setorigin (temp_ent, temp_vec);

	movetogoal (dist);
};


//=============================================================
// bot_ai_turn - turn towards ideal_yaw if no enemy sighted
//=============================================================
void() bot_ai_turn =
{
	if (BotFindTarget ())
		return;
	
	ChangeYaw ();
};


//=============================================================
// bot_ai_run - still needs a little work
//=============================================================
void(float dist) bot_ai_run =
{
	local	vector	delta;
	local	float	axis;
	local	float	direct, ang_rint, ang_floor, ang_ceil;
	
	movedist = dist;

	if (self.enemy.health <= 0)
	{
		self.enemy = world;
		self.goalentity = self.movetarget = self.bot;
		if (self.oldenemy.health > 0)
		{
			self.enemy = self.oldenemy;
			BotHuntTarget ();
		}
		else
		{
			if (BotFindTarget())
				return;
			else
			{
				self.th_walk ();
				return;
			}
		}
	}

	self.show_hostile = time + 1;		// wake up other monsters

	enemy_vis = visible(self.enemy);
	if (enemy_vis)
		self.search_time = time + 5;

	enemy_infront = infront(self.enemy);
	enemy_range = range(self.enemy);
	enemy_yaw = vectoyaw(self.enemy.origin - self.origin);
	
	if (self.attack_state == AS_MISSILE)
	{
		ai_run_missile ();
		return;
	}
	if (self.attack_state == AS_MELEE)
	{
		ai_run_melee ();
		return;
	}

	if (CheckAnyAttack ())
		return;					// beginning an attack
		
	if (self.attack_state == AS_SLIDING)
	{
		ai_run_slide ();
		return;
	}
		
	movetogoal (dist);		// done in C code...
};


//=============================================================
// bot_fire
//=============================================================
void () bot_fire =
{
	local vector org1, org2, en_org1, en_org2, fire_dir;

	if (!(self.tm_flags & TM_AUTOFIRE))
		return;

// this is an attempt to avoid fruitless firing into walls and to avoid
// firing on friendlies
// BotFireClear is not yet written, so it just returns TRUE

	fire_dir = vectoangles (self.enemy.origin - self.origin);
	if (!BotFireClear (fire_dir))
		return;

	makevectors (self.angles);
	org1 = self.origin + v_forward * 30 + v_right * 6 + '0 0 16';
	org2 = self.origin + v_forward * 30 + v_right * 11 + '0 0 16';
	en_org1 = self.enemy.origin - v_right * 4;
	en_org2 = self.enemy.origin + v_right * 4;

	sound (self, CHAN_WEAPON, "enforcer/enfire.wav", 1, ATTN_NORM);
	LaunchLaser (org1, en_org1 - self.origin);
	LaunchLaser (org2, en_org2 - self.origin);
	return;
};
