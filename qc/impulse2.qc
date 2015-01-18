/*
==============================================================================

Secondary Impulse Command Checker

==============================================================================
*/


//=============================================================
// CheckSecondaryImpulseCommands - Called by weapons.qc before
//								   processing impulses
//=============================================================
void () CheckSecondaryImpulseCommands =
{
	if (self.impulse == BOT_TOGGLE)
		BotToggle();

// Don't process any more impulses if the bot is not activated
	if (!(self.bot))
		return;

// Important !!!!!!!!!!!!!!!!!!
// Do not place any impulses above this point that
// assume that the bot is active.
// It will most likely crash your game.

	if (self.impulse == BOT_AUTO_TOGGLE)
		BotAutoToggle();
	if (self.impulse == BOT_MOVE_FIRE)
	{
		if (self.bot.tm_flags & TM_AUTOMODE)
			BotFire();
		else
			BotMoveToggle();
	}
	if (self.impulse == BOT_LEFT_FIRE_TOGGLE)
	{
		if (self.bot.tm_flags & TM_AUTOMODE)
			BotFireToggle();
		else
			BotTurnLeft();
	}
	if (self.impulse == BOT_RIGHT_TELEPORT)
	{
		if (self.bot.tm_flags & TM_AUTOMODE)
			BotTeleportHome();
		else
			BotTurnRight();
	}
	if (self.impulse == BOT_DM_TOGGLE)
		BotDMToggle();
	return;
};
