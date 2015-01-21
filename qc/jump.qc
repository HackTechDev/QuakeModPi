/*

==============================================================================

JUMP SPELL

==============================================================================

*/


//--------------------------------------------------------------------
// Demon jump
//--------------------------------------------------------------------



void() player_demon_jump = {
	makevectors(self.v_angle);
	self.origin_z = self.origin_z + 1;
	self.velocity = v_forward * 800 + '0 0 350';
	sound(self, CHAN_BODY, "hknight/slash1.wav", 1, ATTN_NORM);

};






//--------------------------------------------------------------------
// Check if Jump spell can be used
//--------------------------------------------------------------------

void() JumpC = 
{
	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();
	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);

	player_demon_jump ();
}; 
