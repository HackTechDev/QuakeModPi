/*
==============================================================================

EXPERIENCE SYSTEM A - POINTS PER KILL

==============================================================================
*/

void(entity person, float expamt) AddExp =
{
    local string tally;

    if (person.classname != "player") return;

    person.has_exp = person.has_exp + expamt;   

    tally = ftos(person.has_exp);

    if (person.classname == "player")
    {
        sprint(person, "You now have ");
        sprint(person, tally);
        sprint(person, " Experience Points\n");
    }

};

void(entity person) PrintExp =
{
    local string tally;

    tally = ftos(self.has_exp);

    if (person.classname == "player")
    {
        sprint(self, "You now have ");
        sprint(self, tally);
        sprint(self, " Experience Points\n");
    }

};
