/*

==============================================================================

wizmark

==============================================================================

*/


float	IT_WIZMARK = 8388608;	// wizmark bit mask flag
float   IT_WIZMARK_neg = 8388607;	// negative wizmark bit mask flag


//--------------------------------------------------------------------
// When time expires wizmark gets deactivated
//--------------------------------------------------------------------
void() Removewizmark =
{
	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
        WriteByte (MSG_BROADCAST, TE_TELEPORT);
        WriteCoord (MSG_BROADCAST, self.origin_x);
        WriteCoord (MSG_BROADCAST, self.origin_y);
        WriteCoord (MSG_BROADCAST, self.origin_z);
        sound (self, CHAN_BODY, "shalrath/attack2.wav", 1, ATTN_NORM);
	SUB_Remove();
	self.owner.items = self.owner.items & IT_WIZMARK_neg;
	sprint(self.owner,"Wizard Mark expired\n");
};



//--------------------------------------------------------------------
// Spawns wizmark
//--------------------------------------------------------------------
void(entity myself) Activatewizmark =
{
	local entity	wizmark;

	wizmark = spawn();
	wizmark.solid = SOLID_NOT;
	wizmark.movetype = MOVETYPE_NOCLIP;
	wizmark.origin = (self.origin + v_forward*15 + '0 0 0');

	wizmark.avelocity = '0 0 0';

	wizmark.angles = self.angles;
	setmodel (wizmark, "progs/end3.mdl");
	wizmark.classname = "wizmark";
	wizmark.owner=myself;
	wizmark.nextthink = time + 20;	
	wizmark.think = Removewizmark;
	self.items = self.items | IT_WIZMARK;
	stuffcmd (wizmark.owner, "bf\n");
	sprint(wizmark.owner,"Wizard Mark has been placed\n");


};



//--------------------------------------------------------------------
// Checks if wizmarkgraph should be activated
//--------------------------------------------------------------------
void() WizmarkC = 
{
	if ((self.items & IT_WIZMARK) == IT_WIZMARK)
	{
		sprint(self,"An illusion has already been cast\n");
		return;
	}

	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	Activatewizmark (self);
}; 
