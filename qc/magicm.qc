/*

==============================================================================

MAGIC MISSLE

==============================================================================

*/


/*
================
HomeFindTarget by Vhold
returns the closest entity to itself that is killable, not a team member on 
self's team, ect ect....
================
*/
entity() HomeFindTarget =
{
        local entity head, selected;
        local float dist;
        dist = 100000;
        selected = world;
        head = findradius(self.origin, 100000);
        while(head)
        {
          if( (head.health > 1) && (head != self) && (head != self.owner) && !( (teamplay == 1) && (head.team > 0)&&(head.team == self.owner.team) ) && (head.classname != "door") && (head.classname != "misc_explobox") && !(head.items & IT_INVISIBILITY) )
	         {

                        traceline(self.origin,head.origin,TRUE,self);
                        if ( (trace_fraction >= 1) && (vlen(head.origin - self.origin) < dist) )
                        {
                                selected = head;
                                dist = vlen(head.origin - self.origin);
                        }
                }
                head = head.chain;
        }

/*
        if (selected != world)   // All of this is stuff you can comment out
        {
                sprint (self.owner,"Homing->");
                if (selected.classname == "player")
                {
                        sprint (self.owner,selected.netname);
                        sprint (selected,self.owner.netname);
                        sprint (selected," has a bogey on you!\n");
                }
                else
                        sprint (self.owner,selected.classname);
                sprint (self.owner,"\n");
        }
*/

        return selected;
};
/* 
===============
HomeThink by Vhold
The Think function for the Homing Missile
===============
*/
void() HomeThink =
{
        local vector needdir, currdir;
	local float needspeed, maxspeed, acceleration;
	local vector temp;

	traceline(self.origin,self.enemy.origin,TRUE,self);

        if ( (trace_fraction < 1) || !(self.enemy) || (self.enemy == world) || (self.enemy.health < 1) )
                self.enemy = HomeFindTarget();

        if (self.enemy != world) // Arr.. don't be taken on da World!
        {
		temp = normalize(self.velocity) * 100;
		traceline(self.origin,self.origin+temp,TRUE,self);
		if(trace_fraction < 1)
		{
			maxspeed = 200;
			acceleration = 300;
		}
		else
		{
			maxspeed = 400;
			acceleration = 150;
		}
                needdir = normalize((self.enemy.origin + '0 0 10') - self.origin);
                currdir = normalize(self.velocity);
                self.angles = vectoangles(needdir);

                needspeed = vlen(needdir - currdir) * acceleration;

                self.movedir = needdir * needspeed;
                self.velocity = self.velocity + self.movedir;

                if ( vlen(self.velocity) > maxspeed )
                        self.velocity = normalize(self.velocity) * maxspeed;
		self.nextthink = time + 0.1;

        }
	else
	        self.nextthink = time + 0.5;
        
	self.think=HomeThink;
};




//--------------------------------------------------------------------
// Fire Magic Missile
//--------------------------------------------------------------------
void() magicm_touch; 

void (vector org, vector dir) launch_magicm =
{
	local   entity  missile;

	missile = spawn ();
	missile.owner = self;
	missile.movetype = MOVETYPE_FLYMISSILE;
	missile.solid = SOLID_BBOX;

	missile.angles = vectoangles(dir);

	missile.touch = magicm_touch;
        missile.classname = "magicm";

// set missile duration
	missile.nextthink = time + 0.5;
	missile.think = HomeThink;
	missile.enemy = world;

// set missile speed	
	makevectors (self.v_angle);
	missile.velocity = aim(self, 1000);
	missile.velocity = missile.velocity * 400;
	missile.angles = vectoangles(missile.velocity);

	setsize (missile, '0 0 0', '0 0 0');		
	setmodel (missile, "progs/w_spike.mdl");
	setorigin (missile, org);
        missile.effects=EF_DIMLIGHT;
};




void() magicm_touch =
{
local float rand;

      sound (self, CHAN_WEAPON, "enforcer/enfstop.wav", 1, ATTN_NORM);

	if (other == self.owner)
		return;

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
//		spawn_touchblood (9);
		T_Damage (other, self, self.owner, 5);
	}
	else
	{
		WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
			WriteByte (MSG_BROADCAST, TE_SPIKE);
		WriteCoord (MSG_BROADCAST, self.origin_x);
		WriteCoord (MSG_BROADCAST, self.origin_y);
		WriteCoord (MSG_BROADCAST, self.origin_z);
	}

	remove(self);
};




void(float ox) W_FireMagicm =
{
	local vector    dir;
	local entity    old;
	
	makevectors (self.v_angle);

	self.attack_finished = time + 0.5;
	dir = aim (self, 1000);
        launch_magicm (self.origin + '0 0 20' + v_right*ox, dir);

	self.punchangle_x = -2;
};




//--------------------------------------------------------------------
// Checks if Magic Missile can be fired
//--------------------------------------------------------------------
void() MagicmC = 
{

	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	W_FireMagicm ();
};
