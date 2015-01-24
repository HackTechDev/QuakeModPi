/*
==================================================
Menu.qc By: Chris Voss 3-18-99
==================================================
*/
.float    count;    // for counting triggers
.float    menu_count;
.float    menu_time;
.float    class;    // object.class is what this will be
float    c_none=1;    // no class
float    c_mage=2;    // Mage class
float    c_warrior=4;    // Warrior class
void() GetClass =
{
    if (self.class==c_none)  // If they haven't chosen a class do this
    {
        if ((self.menu_count < 1) && (self.menu_time < time))
        //1 = seconds the menu will be displayed but it redisplays over and over
        {
            self.menu_time = time + 1;
            self.menu_count = self.menu_count + 1;
            centerprint(self, "(1)Be a Mage\n (2)Be a Warrior\n"); //this is what your choices are in the menu
            return;
        }

        if (self.menu_count == 1) //If they haven't chosen anything
        // then restart the display
        {
            self.menu_count = 0; // set it to 0 again
        }
    }
    else
    {
       return;
    }
};

// this is called when an impulse is called instead of regular impulses
void(float inp) ChangeClass =
{
    if (inp == 1)
    {
        self.class = c_mage; // set to mage class
        sprint (self, "You are a Mage\n");
    }
    else if (inp == 2)
    {
        self.class = c_warrior; // set to warrior class
        sprint (self, "You are a Warrior\n");
    }
};
