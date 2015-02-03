/*----------------------------------------------------------------------
 Globe.qc - Stan Smith  (StoshSmith@worldnet.att.net) - 16 August 1996

This code adds a light-globe that shines ahead of you like a flashlight.
        Watch your aim; it'll anger any creature it's pointed at!
Since it's not intended to be a true flashlight, There isn't a source
        light near the player.  If you want the player to also be lit,
        (nice target for multiplayer games) just uncomment the two lines
        that reference self.effects.  Note that this doesn't add a
        separate light source-it just makes the globe's user cast light.
If you have any questions, either email me, or visit any of the
        excellent Quake pages online (such as http://www.nuc.net/quake).

---DIRECTIONS FOR INSTALLATION:-----------------------------------------
** Add the following line to the 'player only fields' in defs.qc:
	.float globe_power;
** Add the following line to W_Precache() in weapons.qc:
	precache_sound("buttons/Switch21.wav");
   and the following 2 lines to ImpulseCommands() in weapons.qc:
 	if(self.impulse==13)
 		Globe_toggle();
** Modify progs.src to insert the line globe.qc before weapons.qc
** Modify the config.cfg in your game source directory to add:
	bind l "impulse 13"  (change l to the key you want to use)
----------------------------------------------------------------------*/
void() Globe_aim={
	local vector src;
	local entity me;
	me=self.owner;
	if(!me.globe_power){
		remove(self);
		return;}
	makevectors(me.v_angle);
	src=me.origin+v_forward*10;
	src_z=me.absmin_z+me.size_z*0.7;
	traceline(src,src+v_forward*2048,FALSE,me);
	setorigin(self,trace_endpos-v_forward*10);
	self.nextthink=time+0.1;
	if(!me.deadflag&&trace_ent.flags&FL_MONSTER&&!trace_ent.enemy){
		trace_ent.enemy=me;
		trace_ent.nextthink=time+0.2;
		trace_ent.think=FoundTarget;}};

void() Globe_toggle={
	local entity temp;
	if(self.globe_power){
		sprint(self,"Light globe off\n");
		sound(self,CHAN_WEAPON,"buttons/Switch21.wav",1,ATTN_NORM);
//		if(self.effects&EF_DIMLIGHT) self.effects=self.effects-EF_DIMLIGHT;
		self.globe_power=0;}
	else{
		sprint(self,"Light globe on\n");
		sound(self,CHAN_VOICE,"buttons/Switch21.wav",1,ATTN_NORM);
		self.globe_power=1;
//		self.effects=self.effects|EF_DIMLIGHT;
		temp=spawn();
		setorigin(temp,self.origin);
		setmodel(temp,"progs/s_bubble.spr");
		setsize(temp,'0 0 0','0 0 0');
		temp.classname="LightGlobe";
		temp.movetype=MOVETYPE_NONE;
		temp.solid=SOLID_NOT;
		temp.effects=EF_DIMLIGHT;
		temp.owner=self;
		temp.nextthink=time+0.1;
		temp.think=Globe_aim;}};
