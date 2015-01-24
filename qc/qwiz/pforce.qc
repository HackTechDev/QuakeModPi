//---------------------------
//	Phantasmal Force spell
//
//----------------------------


float	IT_PFORCE = 8388608;	// illusion mask flag
float   IT_PFORCE_neg = 8388607;	// negative illusion bit mask flag


//--------------------------------------------------------------------
// When time expires spell is finished
//--------------------------------------------------------------------
void() RemovePforce =
{
	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
        WriteByte (MSG_BROADCAST, TE_TELEPORT);
        WriteCoord (MSG_BROADCAST, self.origin_x);
        WriteCoord (MSG_BROADCAST, self.origin_y);
        WriteCoord (MSG_BROADCAST, self.origin_z);
        sound (self, CHAN_BODY, "misc/r_tele3.wav", 1, ATTN_NORM);

	SUB_Remove();
	self.owner.items = self.owner.items & IT_PFORCE_neg;
	sprint(self.owner,"Your phantasm has expired\n");
};



//--------------------------------------------------------------------
// Cast spell
//--------------------------------------------------------------------
void(entity myself) ActivatePforce =
{
	local entity	pforce;

	pforce = spawn();
//	pforce.solid = SOLID_NOT;
	pforce.solid = SOLID_BBOX;

	pforce.movetype = MOVETYPE_NOCLIP;

	pforce.origin = (self.origin + v_forward*100 + '0 0 0');
//	pforce.origin = myself.origin;
	pforce.angles = myself.angles;
	pforce.colormap = 00;
	setmodel (pforce, "progs/player.mdl");
	pforce.classname = "pforce";
	pforce.owner=myself;
	pforce.frame=30;
	pforce.nextthink = time + 10;	
	pforce.think = RemovePforce;
	myself.items = myself.items | IT_PFORCE;
	stuffcmd (pforce.owner, "bf\n");
	sprint(pforce.owner,"Phantasmal Force has been cast\n");
};



//--------------------------------------------------------------------
// Checks if spell can be cast
//--------------------------------------------------------------------
void() PforceC = 
{
	if ((self.items & IT_PFORCE) == IT_PFORCE)
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
	ActivatePforce (self);
}; 
