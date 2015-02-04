/*

    SECURITY MOTION-DETECTORS
    Author: KTGOW

    Started 08/10/96
    Version 1 ready : 08/11/96
    Version 1 released : 08/12/96
    Version 1.06 ready : 03/16/96
    Version 1.06 released : 03/16/96

    Motion detectors are small objects placed by the player.  They attach
    themselves to whatever surface they hit first (walls, ceilings, floors,
    whatever.   Not people).  Once attached, they go into "Security Mode."
    While in a security mode, the motion detector will fire a stream of
    shots at any monsters or players that are a)moving, and b)within a
    2000-unit radius.  The motion detectors do a fairly good job of
    anticipating the movement of a target.

    Motion detectors can be destroyed.  When they are destroyed, they
    explode like a grenade.

    If 2 or more motion detectors within a 750-unit radius of each other can
    see each other, each of them will destroy itself upon activation;

    Once the motion detector is attached to a surface, there is a 10-second
    delay for you to run away before it kills you.

    A motion detector requires 50 nails, 95 health, and 1 rocket to create.
    This is nonrefundable.

    Motion detectors originally start with 50 shots.  Once they are out
    of ammo, their rate of fire slows to 1 shot every 2 seconds.
    Impulse 16 reloads a Detector in 25-nail increments (taken from
    your own ammo supply).  Detectors can store a maximum of 200 shots.
    If you give a motion detector some nails, it will stop shooting for
    3 seconds in order to load the nails.

    Motion detectors kill people indiscriminantly.  A motion detector will
    kill its owner.  Nobody gets credit for a kill done by a motion detector.




    To add:
    Motion detectors attack enemy motion detectors?
      No.  Unrealistic.
    Motion detectors explode on contact with players/monsters?
      -Only while in air?
      No.  Unrealistic.  Solves a bug, though (see below).
    Motion detectors need to be given ammo?
      Done.  08/11/96
      -Different types of ammo?  Weapon cycling?
      Scary.  ...but possible.  I've started some work on this.
      -Reloads?
      Done.  08/11/96
    Living motion detectors?
      -Spawning children?
      Talk about unrealistic...
      -Generational improvements/mutations?
      Hahahahaha.
      -Regeneraing health?
      Again, talk about unrealistic...
      -Moving?
      Hmmmmmm...
    If detector fires lightning underwater, have the usual lightning effects.
      If I allow it to fire different types of weapons, I will
      do this.
    Motion detectors do damage when they explode.
      Done.  08/11/96

    Bugs:
    Motion detectors lobbed onto the top of an entity will remain floating
      in the air.  Arr.
    Sometimes motion detectors stick to walls about a foot (virtual) away
      away from the wall itself.
    Motion detectors cannot be hit by shotguns, and can only be hit by
      nailguns from certain angles.  Rockets & grenades work fine.
    Sometimes motion detectors fall out of the world when tossed.  :(

*/

// Functions called in MOTION.QC that are defined after its position in
// PROGS.SRC:
void() GrenadeExplode;
void() BecomeExplosion;
void(vector org, vector dir) launch_spike;
void(float damage) spawn_touchblood;
//void(entity targ, entity inflictor, entity attacker, float damage) T_Damage;

// Functions defined in MOTION.QC:
void() W_FireMotion;
void() MotionTouch_Moving;
void() MotionThink_Startup;
void() MotionThink_Security;
void(entity targ) MotionFire_Nailgun;
void() MotionThink_Destroy;
void() MotionTouch_Spike;
void() GiveMotionNails;
void() Motion_SwitchWeapon;


void() W_FireMotion =
{
    local entity detector;

    // Check ammo & health requirements...
    if (self.health <= 95 || self.ammo_nails < 50 || self.ammo_rockets < 1)
    {
        sprint (self,"Sorry, you must have at least 96\n");
        sprint (self,"health, 50 nails, and 1 rocket\n"); 
        sprint (self,"to fire a Motion Detector.\n");
        return;
    }

    // Take ammo & health requirements
    self.health = self.health - 95;
    self.ammo_nails = self.ammo_nails - 50;
    self.ammo_rockets = self.ammo_rockets - 1;
    W_SetCurrentAmmo();

    sprint (self,"You now have 10 seconds before the\n");
    sprint (self,"  Motion Detector is activated.\n");

    detector = spawn();
    detector.owner = self;
    detector.movetype = MOVETYPE_TOSS;
    detector.solid = SOLID_SLIDEBOX;
    detector.classname = "motion_detector";
    detector.netname = "Healthy Detector";

    detector.ammo_nails = 50;
    detector.health = 100;
    detector.weapon = IT_NAILGUN;  // This is the start of something big.

    detector.touch = MotionTouch_Moving;
    detector.th_die = MotionThink_Destroy;
    detector.takedamage = DAMAGE_AIM;

//    makevectors (self.v_angle);
    detector.velocity = aim(self,10000) * 300;
    detector.velocity_z = detector.velocity_z + 100;

    setmodel (detector,"progs/v_spike.mdl");    // Looks like Vore's missile.
    setsize (detector, '-2 -2 -2', '2 2 2');
    setorigin (detector, self.origin);
    detector.origin_z = self.absmin_z + self.size_z * 0.7;

//    detector.think = MotionThink_Destroy;
//    detector.nextthink = 20;  // If it has not been activated after 20 seconds,
                          // assume it has fallen out of the world.  Destroy it.
};

void() MotionTouch_Moving =
{
    if(other == self.owner || other == self)
        return;
//    if(other != world)
//        return;

    self.velocity = '0 0 0';
    self.movetype = MOVETYPE_NONE;

    self.touch = SUB_Null;

    self.think = MotionThink_Startup;
    self.nextthink = time + 10;    // Startup delay
};

void() MotionThink_Startup =
{
    local entity head;

    sprint (self.owner,"The Motion Detector is now active.\n");
    self.think = MotionThink_Security;
    self.nextthink = time + 0.05;

    head = findradius (self.origin, 750);
    while(head)
    {
        if(head.classname == "motion_detector" && head != self)
        {
            traceline (self.origin, head.origin, TRUE, self);
            if (trace_fraction == 1)
            {
                if (self.think != MotionThink_Destroy)
                    sprint (self.owner, "Motion Detector destroyed by proximity.\n");
                sprint (head.owner, "Motion Detector destroyed by proximity.\n");

                self.think = MotionThink_Destroy;
//                self.nextthink = time + 0.05;
                self.takedamage = 0;
                head.think = MotionThink_Destroy;
                head.nextthink = time + 0.05 + random();
                head.takedamage = 0;
            }
        }
        head=head.chain;
    }
};

void() MotionThink_Security =
{
    local entity targ;

    self.nextthink = time + 0.05;    // Polling delay if no target
    
    targ = findradius (self.origin, 2000);
    while(targ)
    {
        if(targ.takedamage && targ.owner != self)
        {
            if (targ.velocity != '0 0 0' || targ.moving_now)
            {
                if (!(targ.flags & FL_NOTARGET))
                {
                    
                    traceline (self.origin, targ.origin, TRUE, self);   // see through other monsters
 
                    if (trace_fraction == 1)
                    {
                        // The target can be seen...  killed...
                        
                        if (self.weapon == IT_NAILGUN)
                        {
                            MotionFire_Nailgun(targ);
                            if (self.ammo_nails == 0)
                            {
                                Motion_SwitchWeapon();
                            }
                        }
                    }
                }
            }
        }

        targ=targ.chain;
    }

};

void(entity targ) MotionFire_Nailgun =
{
    local vector targ_loc,dir;
    local float move_fract;
    
    // Lead the target slightly
    // move_fract is based on the current distance to
    // target, the speed of a nail, and the current speed
    // of the target.  It should lead the target perfectly.
    //  It doesn't, though.  :(
    move_fract = vlen(targ.origin - self.origin)*1.000 / (1000.000 - vlen(targ.velocity)*1.000);
    move_fract = move_fract * 0.600;  // Correct for inaccuracy
    move_fract = move_fract + (random() / 20) - 0.025;
    targ_loc = targ.origin + targ.velocity * move_fract;
                    
    traceline (self.origin, targ_loc, TRUE, self);   // see through other monsters
                        
    if(trace_fraction == 1)
    {
        // Target can be HIT.
        dir = targ_loc - self.origin;
        dir = normalize(dir);  // VERY important.  But why?

        sound (self,CHAN_WEAPON,"weapons/spike2.wav",1,ATTN_NORM);  // super spikes
        launch_spike (self.origin, dir);
        newmis.touch = MotionTouch_Spike;

        self.nextthink = time + 0.2;

        if(self.ammo_nails > 0)
        {
            self.ammo_nails = self.ammo_nails - 1;
        } else {
            // Out of ammo.  ... slow down.  :J
            self.nextthink = time + 2;
        }
    }
};

void() MotionThink_Destroy =
{
    local entity head;

    self.netname = "Dying Detector";

    head = findradius (self.origin, 100);
    while(head)
    {
        if(head.classname == "motion_detector" && head != self)
        {
            head.think = MotionThink_Destroy;
            head.nextthink = time + 0.05 + random();
            head.takedamage = 0;
        }
        head=head.chain;
    }


    self.takedamage = 0;
    T_RadiusDamage (self, self, 120, self);

    WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
    WriteByte (MSG_BROADCAST, TE_EXPLOSION);
    WriteCoord (MSG_BROADCAST, self.origin_x);
    WriteCoord (MSG_BROADCAST, self.origin_y);
    WriteCoord (MSG_BROADCAST, self.origin_z);

    BecomeExplosion ();
    // This may do something else in the future...
};

void() MotionTouch_Spike =
{
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
        spawn_touchblood (5);
        T_Damage (other, self, self.owner, 5);
    }
    else
    {
        WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
        WriteByte (MSG_BROADCAST, TE_SUPERSPIKE);
        WriteCoord (MSG_BROADCAST, self.origin_x);
        WriteCoord (MSG_BROADCAST, self.origin_y);
        WriteCoord (MSG_BROADCAST, self.origin_z);
    }

    remove(self);
};

void() GiveMotionNails =
{
    local entity head;
    local float to_give,reset_motion;
    
    if (self.ammo_nails < 1)
    {
        sprint (self, "You have no nails to give.\n");
        return;
    }

    if (self.ammo_nails > 25)
    {
        to_give = 25;
    } else {
        to_give = self.ammo_nails;
    }

    head = findradius (self.origin, 120);
    while(head)
    {
        if (head.classname == "motion_detector")
        {
            reset_motion = 1;
            if (head.ammo_nails == 200)
            {
                sprint (self, "Motion Detector is full.\n");
                reset_motion = 0;
                to_give = 0;
            } else if (head.ammo_nails + to_give >= 200) {
                sprint (self, "Motion Detector is now full.\n");
                self.ammo_nails = self.ammo_nails - (200 - head.ammo_nails);
                head.ammo_nails = 200;
                to_give = 0;
            } else {
                self.ammo_nails = self.ammo_nails - to_give;
                head.ammo_nails = head.ammo_nails + to_give;
                sprint (self, "Gave ");
//                sprint (self, ftos (to_give));
                sprint (self, " nails to Motion Detector.\n");
                to_give = 0;
            }

            if (head.nextthink <= (time + 5.0) && reset_motion)
            {
                head.nextthink = time + 3.0;
                sprint (self, "You have 3 seconds to get away...\n");
            }
        }
        head=head.chain;
    }

    if(to_give)
    {
        sprint (self, "No Motion Detectors nearby.\n");
    }
};

void() Motion_SwitchWeapon =
{
};



