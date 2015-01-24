//--------------------------------------------------------------------
// Light Spell
//--------------------------------------------------------------------


void() light_touch =
{
local float rand;

		sound (self, CHAN_WEAPON, "player/tornoff2.wav", 1, ATTN_NORM);	

	if (other == self.owner)
		return;

        if (other.classname == "door" || other.classname == "plat")
                {
                remove(self);
                return;
                }

	if (other.solid == SOLID_TRIGGER)
		return; // trigger field, do nothing

	if (pointcontents(self.origin) == CONTENT_SKY)
	{
		remove(self);
		return;
	}
	
// hit something that bleeds
	if (other.takedamage)
	{

		self.origin = other.origin + '0 0 0';
		return;
	}
	else
	{
		WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
			WriteByte (MSG_BROADCAST, TE_SPIKE);
		WriteCoord (MSG_BROADCAST, self.origin_x);
		WriteCoord (MSG_BROADCAST, self.origin_y);
		WriteCoord (MSG_BROADCAST, self.origin_z);
 }

	self.movetype = MOVETYPE_NONE;

        self.origin = self.origin - self.velocity * 0.0001;
     	self.velocity = '0 0 0';
	self.touch = SUB_Null;
};



void (vector org, vector dir) launch_light =
{
        local   entity  missile;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = MOVETYPE_FLYMISSILE;
	missile.solid = SOLID_BBOX;

	missile.angles = vectoangles(dir);

	missile.touch = light_touch;
        missile.classname = "light";

// remove light
	missile.think = SUB_Remove;
// keep light alive        
        missile.nextthink = time + 10;

	setmodel (missile, "progs/s_bubble.spr");
	setsize (missile, VEC_ORIGIN, VEC_ORIGIN);               
	setorigin (missile, org);
	missile.velocity = dir * 1000;
        missile.effects=EF_DIMLIGHT;
};




void(float ox) W_FireLight =
{
	local vector    dir;
	local entity    old;
	
	makevectors (self.v_angle);

	self.attack_finished = time + 0.5;
	dir = aim (self, 1000);
        launch_light (self.origin + '0 0 20' + v_right*ox, dir);

	self.punchangle_x = -2;
};




//--------------------------------------------------------------------
// Checks if Light can be fired
//--------------------------------------------------------------------
void() LightC = 
{
	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	W_FireLight ();
};
