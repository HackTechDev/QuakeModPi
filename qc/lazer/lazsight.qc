/****
	Laser cross hair

	By Scott Ramsay

	Use "impulse 45" to toggle sight on/off
****/




/**
  SDR_SightThink

  Updates the sights position, angle, and shape
**/

void () SDR_SightThink =
{
	local vector org;

        makevectors(self.owner.v_angle);
	org = self.owner.origin + v_up*16;

        traceline (org, org + v_forward*2048, FALSE, self);

        if (trace_fraction == 1.0)
	{
		// move sight inside player if can hit anything
        	setorigin(self, self.owner.origin );
		return;
	}

	// check if target is damageable and set proper model
	if (trace_ent.takedamage)
		setmodel (self, "progs/cross2.mdl");
	else
		setmodel (self, "progs/cross1.mdl");

	// move sight at line of sight collision
	self.angles = vectoangles(v_forward);
        setorigin(self, trace_endpos );

	// mark think to update sight position
	self.nextthink = time + 0.05;
};



/**
  SDR_SightMake

  Create the laser site entity
**/

void ()	SDR_SightMake =
{
	local entity cross;

        self.sight_out = TRUE;

	cross = spawn ();
	cross.owner = self;
	cross.movetype = MOVETYPE_NOCLIP;
	cross.solid = SOLID_NOT;

	setmodel (cross, "progs/cross1.mdl");
	cross.classname = "laser_sight";

	setorigin( cross, self.origin );

	cross.think = SDR_SightThink;
	cross.nextthink = time + 0.05;
};
