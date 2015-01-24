float(float v) anglemod;
string(float yaw) YawToDir;

void() CallRadar =
{
        local entity head, selected;
        local float dist, d, y;
        local vector vdir;
        local string str;

/*
        if( self.ammo_cells < 5 )
        {
                dprint("Radar:  Out of juice\n");
                return;
        }

        self.ammo_cells = self.ammo_cells - 5;
*/
	dprint("Radar");
        dist = 5000;
        selected = world;

        head = findradius(self.origin, dist);

        while(head)
        {
                vdir = head.origin - self.origin;
                d = vlen(vdir);
                traceline(self.origin, head.origin, TRUE, self);
                if( (head != self) && (d < dist) && ( ( trace_fraction < 1 ) || ( head.items & IT_INVISIBILITY ) ) && ( head.health > 0 ) && ( head.classname != "door" ) && ( head.classname != "trigger_multiple" ) )
                {
                        selected = head;
                        dist = d;
                }
        head = head.chain;
        }
        
        if( selected == world )
        {
                dprint("Radar:  Nothing Detected\n");
                return;
        }

        vdir = selected.origin - self.origin;
        vdir = normalize(vdir);
        y = vectoyaw(vdir);
        dprint("Radar:  Detects ");

        if(selected.classname == "player")
                dprint(selected.netname);
        else
                dprint(selected.classname);

        dprint(" ");
        str = ftos(dist);
        dprint(str);
        dprint(" units to your ");
        str = YawToDir(y);
        dprint(str);
        dprint("\n");
};

string(float yaw) YawToDir =
{
        local float pyaw, diff;
        local string dir;

        makevectors(self.angles);
        pyaw = vectoyaw(v_forward);

        diff = pyaw - yaw;
        diff = anglemod(diff);

        if( ( diff < 15 ) || ( diff > 345 ) )
                dir = "North";
        else if( diff < 75 )
                dir = "NorthEast";
        else if( diff < 105 )
                dir = "East";
        else if( diff < 165 )
                dir = "SouthEast";
        else if( diff < 195 )
                dir = "South";
        else if( diff < 255 )
                dir = "SouthWest";
        else if( diff < 285 )
                dir = "West";
        else if( diff <= 345 )
                dir = "NorthWest";
        else
                dir = "ERROR";

        return dir;
};

