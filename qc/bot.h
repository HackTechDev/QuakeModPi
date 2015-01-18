/*
==============================================================================

TM BOT HEADER FILE

==============================================================================
*/

// Global Constants

float   BOT_TOGGLE				= 100;		// impulse constant
float	BOT_AUTO_TOGGLE			= 101;		// impulse constant
float	BOT_MOVE_FIRE			= 102;		// impulse constant
float 	BOT_LEFT_FIRE_TOGGLE	= 103;		// impulse constant
float	BOT_RIGHT_TELEPORT		= 104;		// impulse constant
float	BOT_DM_TOGGLE			= 105;		// impulse constant
float	TM_STAND				= 2;		// bit flag constant
float	TM_WALK					= 4;		// bit flag constant
float	TM_RUN					= 8;		// bit flag constant
float	TM_AUTOMODE				= 16;		// bit flag constant
float	TM_AUTOFIRE				= 32;		// bit flag constant
float	TM_COOP					= 64;		// bit flag constant
float	TM_DEATHMATCH			= 128;		// bit flag constant

// Bot Prototypes - called by player

void 	()	Bot_Precache;		// Precache information for the bot
vector	()	BotStartPosition;	// Returns a safe position for the bot to appear
float	(vector spawn_point)
			BotCheckPosition;	// Used by BotStartPosition
void 	()	BotActivate;		// Activate bot
void 	()	BotDeActivate;		// DeActivate bot
void 	()	BotToggle;			// Toggle bot on and off
void 	()	BotAutoToggle;		// Toggle automatic/manual control of bot
void 	()	BotMoveToggle;		// Toggle movement (walk, run, stand) in man mode
void 	()	BotTurnRight;		// Turn bot to the right by 22.5 degrees in man mode
void 	()	BotTurnLeft;		// Turn bot to the left by 22.5 degrees in man mode
void 	()	BotFireToggle;		// Toggle bot's auto-firing in auto mode
void 	()	BotFire;			// Have bot fire at its current target in auto mode
void 	()	BotTeleportHome;	// Have bot teleport back to its owner
void	()	BotDMToggle;		// Toggle between DM and Single/Co-op modes

// Botai Prototypes - called by bot (mostly modified versions of existing code)

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

// Botai2 Prototypes - called by bot

float	()								BotFindTarget;
float	()								DMFindTarget;
float	()								CoOpFindTarget;
void	()								BotFoundTarget;
void	()								BotSightSound;
void	()								BotHuntTarget;
void	(void () thinkst)				BotCheckRefire;
void	()								BotSelfDeActivate;
float	(vector fire_angles)			BotFireClear;


// Bot_ext Prototypes - called by triggers.qc and doors.qc

void	()		bot_counter_use;
void	()		bot_trigger_onlyregistered_touch;
void	()		bot_door_touch;

//	Addition entity fields
//	.entity		bot;		// bot entity
//	.float		tm_flags;	// bit flags for TM Bot
