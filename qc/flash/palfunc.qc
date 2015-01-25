/*
UpdatePalfrom

Updates the screenflash effect.  Place at the bottom of CheckPowerups(); in
CLIENT.QC
*/

void() UpdatePalfrom =
{
    if(self.palfintensity > 0)
     {
      stuffcmd(self, "v_cshift ");
      stuffcmd(self, ftos(self.redlev));
      stuffcmd(self, " ");
      stuffcmd(self, ftos(self.greenlev));
      stuffcmd(self, " ");
      stuffcmd(self, ftos(self.bluelev));
      stuffcmd(self, " ");
      stuffcmd(self, ftos(self.palfintensity));
      stuffcmd(self, "\n");
      self.palfintensity = self.palfintensity - self.recamount;
     }
    else
     {
      stuffcmd(self, "v_cshift 0 0 0 0\n");
     }
};

/*
Palfrom set function.  Call from whatever you want to do a screenflash effect.
Syntax:
1. dist = radial distance from specified origin defined by org.
2. amount = intensity level of palfrom.
3. org = central point of radial effect.
4. ignore = sets an entity to exclude from recieving effect.
5. rlev = amount of red to use.
6. glev = see 5.  This  is green.
7. blev = see 5.  This is blue.
8. ramt = reduction amount. Is always reduced by this amount every playerthink.
9. nostack = if set TRUE then function will not allow a new effect until the current one is finished.
*/

void(float dist, float amount, vector org, entity ignore, float rlev, float glev, float blev, float ramt, float nostack) Palfrom =
{
 local entity head;

 head = findradius(org, dist);
        
        while (head)
        {
                if (head != ignore)
                {
                 if(nostack && head.palfintensity)
                  {
                   //Developer only
                   dprint("Effect not applied\n");
                  }
                 else
                  {
                        if (head.takedamage && head.classname == "player")
                        {
                         if (CanDamage (head, self))
                          {
                           head.palfintensity = amount;
                           head.redlev = rlev;
                           head.greenlev = glev;
                           head.bluelev = blev;
                           head.recamount = ramt;
                          }
                        }
                  }
                }
                head = head.chain;
        }
};


