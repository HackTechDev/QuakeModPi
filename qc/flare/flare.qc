/*======================================================================
Launch_flare - Stan Smith (mailto:StoshSmith@worldnet.att.net) 25 Aug 96

	This routine just shoots a flare straight ahead; it'll burn bright
for 15 game seconds, then dim for 5 more and fizz out.
	Only one thing I don't like about it; if you shoot a flare into a
door, then open the door, the flare is left hanging in space.  Not sure
how to make it move with the door; not even sure it's possible!  Any
suggestions?

---DIRECTIONS FOR INSTALLATION:-----------------------------------------
**** Add the following line to the W_Precache function in weapons.qc:
	precache_model ("progs/laser.mdl"); // Enforcer laser for flare
**** Add the following 2 lines to Impulse_Commands in weapons.qc:
	if(self.impulse==20)
		W_FireFlare();
	(note: change the impulse #20 to something else if you're already
	 using it in another mod!)
**** Modify config.cfg to bind the key you want to launch a flare, ex:
bind f "impulse 20"
**** Modify progs.src to add (immediately before the weapons.qc line) a
	line which reads:
flare.qc

Then compile everything and you're ready to go!!!!!
(this function is a rework of both Id's missle launch code and
	a Flare routine by Wedge, a.k.a. Steve Bond- wedge@nuc.net)
======================================================================*/
void() flare_off={
	sound(self,CHAN_WEAPON,"misc/power.wav",1,ATTN_NORM);
	self.effects=EF_BRIGHTLIGHT;
	self.nextthink=time+0.3;
	self.think=SUB_Remove;
	particle(self.origin+'0 0 1','0 0 150',111,150);
	particle(self.origin+'0 0 1','0 0 120',73,200);};

void() flare_dim={
	self.effects=EF_DIMLIGHT;
	self.nextthink=time+5;
	self.think=flare_off;};

void() flare_bright={
	self.effects=EF_BRIGHTLIGHT;
	self.nextthink=time+15;
	self.think=flare_dim;
	sound(self,CHAN_WEAPON,"misc/power.wav",1,ATTN_NORM);
	particle(self.origin+'0 0 1','0 0 150',111,150);
	particle(self.origin+'0 0 1','0 0 120',73,200);};

void() flare_touch={
	if(other==self.owner) return;
	if(pointcontents(self.origin)==CONTENT_SKY){
		remove(self);
		return;}
	if(other.solid==SOLID_TRIGGER) return;
	if(other.takedamage){
		T_Damage(other,self,self.owner,1);
		if(self.velocity!='0 0 0') remove(self);}
	else{
		WriteByte(MSG_BROADCAST,SVC_TEMPENTITY);
		WriteByte(MSG_BROADCAST,TE_SPIKE);
		WriteCoord(MSG_BROADCAST,self.origin_x);
		WriteCoord(MSG_BROADCAST,self.origin_y);
		WriteCoord(MSG_BROADCAST,self.origin_z);}
	self.movetype=MOVETYPE_NONE;
	self.velocity='0 0 0';
	self.touch=SUB_Null;};

void() W_FireFlare={
	local entity flare;
	makevectors(self.v_angle);
	self.attack_finished=time+2;
	flare=spawn();
	flare.owner=self;
	flare.movetype=MOVETYPE_FLYMISSILE;
	flare.solid=SOLID_BBOX;
	flare.touch=flare_touch;
	flare.classname="Flare";
	flare.think=flare_bright;
	flare.nextthink=time+2;
	setmodel(flare,"progs/laser.mdl");
	flare.effects=EF_DIMLIGHT;
	makevectors(self.v_angle);
	flare.velocity=aim(self,1000);
	flare.velocity=flare.velocity*1000;
	flare.angles=vectoangles(flare.velocity);
	setsize(flare,'0 0 0','0 0 0');            
	setorigin(flare,self.origin+v_forward*8);
	self.punchangle_x=-1;
	sound(self,CHAN_WEAPON,"weapons/grenade.wav",1,ATTN_NORM);
	sprint(self,"Flare lanched\n");};
