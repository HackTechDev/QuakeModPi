/*

==============================================================================

ARMOR SPELL

==============================================================================

*/


//--------------------------------------------------------------------
// Gives 40 armor  (AC 6)
//--------------------------------------------------------------------
void(entity self) castarmor =
{

        self.armorvalue = 40;

};



//--------------------------------------------------------------------
// Checks if holograph should be activated
//--------------------------------------------------------------------
void() ArmorC = 
{
	if (self.ammo_cells < 10)
	{
		sprint(self,"cells are low\n");
		return;
	}
      self.currentammo = self.ammo_cells = self.ammo_cells - 10;
	W_SetCurrentAmmo();

	sound (self, CHAN_WEAPON, "shalrath/attack2.wav", 1, ATTN_NORM);
	castarmor (self);
}; 
