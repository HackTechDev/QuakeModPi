/*

==============================================================================

Color Spray

==============================================================================

*/


void() ColorsExplode =
{
	local vector    vel;

// Set up some red and yellow sparks
	vel = '0 0 150';
	particle (self.origin+vel*0.01,vel,111,150);
        vel = '0 0 120';
	particle (self.origin+vel*0.01,vel,73,200);

		remove(self);
};



void() colors_touch; 

void (vector org, vector dir) launch_colors =
{
	local   entity  missile;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = MOVETYPE_FLYMISSILE;
	missile.solid = SOLID_BBOX;

	missile.angles = vectoangles(dir);

	missile.touch = colors_touch;
        missile.classname = "colors";

	missile.nextthink=time+0.1;
	missile.think=ColorsExplode;

	setmodel (missile, "progs/s_bubble.spr");
	setsize (missile, VEC_ORIGIN, VEC_ORIGIN);               
	setorigin (missile, org);
	missile.velocity = dir * 1000;
        missile.effects=EF_DIMLIGHT;
};



void() colors_touch =
{
		remove(self);
		return;
};





void(float ox) W_FireColors =
{
	local vector    dir;
	local entity    old;
	
	makevectors (self.v_angle);

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	self.attack_finished = time + 0.5;
	dir = aim (self, 1000);
        launch_colors (self.origin + '0 0 20' + v_right*ox, dir);

	self.punchangle_x = -2;
};




//--------------------------------------------------------------------
// Checks if Colors can be fired
//--------------------------------------------------------------------
void() ColorsC = 
{
	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	W_FireColors ();
};
