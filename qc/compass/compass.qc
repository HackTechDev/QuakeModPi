/*
============
Display Compass

============
*/
void() DisplayCompass =
{
	local float dir;
	local string str;

        dir = self.v_angle_y;
	if (dir > -22.5 && dir <= 22.5)
		str = "North";
	else if (dir > 22.5 && dir <= 67.5)
		str = "Northwest";
	else if (dir > 67.5 && dir <= 112.5)
		str = "West";
	else if (dir > 112.5 && dir <= 157.5)
		str = "Southwest";
	else if (dir > 157.5 || dir <= -157.5)
		str = "South";
	else if (dir > -157.5 && dir <= -112.5)
		str = "Southeast";
	else if (dir > -112.5 && dir <= -67.5)
		str = "East";
	else 
		str = "Northeast";

	sprint(self, "Your are looking ");
	sprint(self, str);
	sprint(self, "\n");
};
