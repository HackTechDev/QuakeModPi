/*

==============================================================================

Shocking Grasp

==============================================================================

*/


float Kick_em = 0;		// ==1, when touched, kicks that player/monster

//--------------------------------------------------------------------
// Fire Shock
//--------------------------------------------------------------------

void() PlayerTouch =
{
 if(other.takedamage != DAMAGE_AIM)
   return;
 if(!Kick_em)
   return;
   
 // boot them in the rear!
 if(other.classname == "player")	// only advertise player kicking
 {
  bprint(self.netname);
  bprint(" gives ");
  bprint(other.netname);
  bprint(" the boot.\n");
 }
 other.velocity_x = other.velocity_x + self.velocity_x;
 other.velocity_y = other.velocity_y + self.velocity_y;

 other.velocity_z = other.velocity_z + 100;	// add lift
 
 if(other.flags & FL_ONGROUND)
   other.flags = other.flags - FL_ONGROUND;
};



//--------------------------------------------------------------------
// Checks if Shock can be fired
//--------------------------------------------------------------------
void() ShockingC = 
{
	Kick_em = 1;
//	else
//	  Kick_em = 0;
//	return;

	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);

};
