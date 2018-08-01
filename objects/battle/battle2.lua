function Battle:attack_hit(pok1,pok2,f2)
  local base = self:getdmg(pok1,pok2)
  local crit = 0
  if(math.random(1,100)/100<=1/16)then
    crit = DIALOGUE_CLEAR_TIME
    base = base*1.5
  end
	local take = math.min(base,pok2:getcurhp())
  timer:tween(DIALOGUE_CLEAR_TIME, pok2.pok, {curhp = math.max(0,math.floor(pok2:getcurhp()-take))}, 'out-quad',
    function ()
      pok2.pok.curhp = pok2.pok.curhp + 0.1
      pok2.pok.curhp = math.max(pok2.pok.curhp,0)
      pok2.pok.curhp = math.floor(pok2.pok.curhp)
      if(crit ~=0)then
        self.dialogue = "critical hit..."
      end
      timer:after(crit,function ()
        local effective = 0
        local eff = get_type_effect(pok1.move.type,pok2:gettype(),pok2:gettype2())
        print(eff)
        if(eff>1.1)then
          self.dialogue = "it's super effective..."
          effective = DIALOGUE_CLEAR_TIME
        elseif(eff<0.9)then
          self.dialogue = "it's not very effective..."
          effective = DIALOGUE_CLEAR_TIME
        elseif(eff==0)then
          self.dialogue = "it's doesn't affect " .. pok2.getname()
          effective = DIALOGUE_CLEAR_TIME
        end
        timer:after(effective,function ()
          if(self:checkfaint(pok2))then
            return
          end
          if(f2)then
            f2()
          else
            self.state = STATE_END_TURN
          end
        end)
      end)
    end)
end

function Battle:attack_hits(pok1,pok2,f2,t,t2)
  pok2.pok.curhp = pok2.pok.curhp + 0.1
  pok2.pok.curhp = math.max(pok2.pok.curhp,0)
  pok2.pok.curhp = math.floor(pok2.pok.curhp)
  if(t)then
    if(t==-1) then
      if(f2)then
        f2()
      else
        self.state = STATE_END_TURN
      end
    elseif(t==0 or pok2:getcurhp()==0)then
      timer:after(1,function()
        self.dialogue = "hit " .. (t2-t) .. " time(s)."
        timer:after(DIALOGUE_CLEAR_TIME,function()
          local effective = 0
          local eff = get_type_effect(pok1.move.type,pok2:gettype(),pok2:gettype2())
          if(eff>1.1)then
            self.dialogue = "it's super effective..."
            effective = DIALOGUE_CLEAR_TIME
          elseif(eff<0.9)then
            self.dialogue = "it's not very effective..."
            effective = DIALOGUE_CLEAR_TIME
          elseif(eff==0)then
            self.dialogue = "it's doesn't affect " .. pok2.getname()
            effective = DIALOGUE_CLEAR_TIME
          end
          timer:after(effective,function ()
            if(not self:checkfaint(pok2)) then
              self:attack_hits(pok1,pok2,f2,-1)
            end
          end)
        end)
      end)
    else
      local base = self:getdmg(pok1,pok2)
      local crit = 0
      if(math.random(1,100)/100<=1/16)then
        crit = DIALOGUE_CLEAR_TIME/2
        base = base*1.5
      end
    	local take = math.floor(math.min(base,pok2:getcurhp()))
      timer:tween(HITS_LENGTH, pok2.pok, {curhp = pok2:getcurhp()-take}, 'out-quad', function()
        if(crit ~=0)then
          self.dialogue = "critical hit..."
        end
        timer:after(crit,function ()
          self:attack_hits(pok1,pok2,f2,t-1,t2)
        end)
      end)
    end
  else
    local times = math.random(pok1.move.minhits,pok1.move.maxhits)
    self:attack_hits(pok1,pok2,f2,times,times)
  end
end

function Battle:attack_protect(pok1,pok2,f2)
  local chance = 255
  if(pok1.lastmove==pok1.move.name)then
    rate = math.max(1/8,(1/(2 ^ pok1.moverepeat)))
    chance = chance*rate
  end
  if(f2==nil)then
    timer:after(DIALOGUE_CLEAR_TIME,function ()
      self.dialogue = "But it failed"
      timer:after(DIALOGUE_CLEAR_TIME,function() self.state = STATE_END_TURN end)
    end)
  else
    if(math.random(0,255)>chance) then
      timer:after(DIALOGUE_CLEAR_TIME,function ()
        self.dialogue = "But it failed"
        timer:after(DIALOGUE_CLEAR_TIME,f2)
      end)
    else
      pok1.protected = true
      timer:after(DIALOGUE_CLEAR_TIME,f2)
    end
  end
end

function Battle:attack_stats(pok1,pok2,f2)
  local ch = nil
  local name = nil
  if(pok1.move.who==1)then
    ch = pok1:modstats(pok1.move)
    name = pok1:getname()
  else
    ch = pok2:modstats(pok1.move)
    name = pok1:getname()
  end
  if(f2==nil)then
    f2 = function () self.state = STATE_END_TURN end
  end
  if(ch==true)then
    if(pok1.move.stage>0)then
      timer:after(DIALOGUE_CLEAR_TIME,function()
        self.dialogue = name .. "'s {stat} rose"
          timer:after(DIALOGUE_CLEAR_TIME,f2)
      end)
    else
      timer:after(DIALOGUE_CLEAR_TIME,function()
        self.dialogue = name .. "'s {stat} fell"
          timer:after(DIALOGUE_CLEAR_TIME,f2)
      end)
    end
  else
    timer:after(DIALOGUE_CLEAR_TIME,function ()
      self.dialogue = "But it failed"
      timer:after(DIALOGUE_CLEAR_TIME,f2)
    end)
  end
end

function Battle:attack_status(pok1,pok2,f2)
  if(f2==nil)then
    f2 = function () self.state = STATE_END_TURN end
  end
  if(pok2:getstatus()==pok1.move.status or math.random(1,100)>pok1.move.probability)then
    timer:after(DIALOGUE_CLEAR_TIME,function ()
      self.dialogue = "But it failed"
      timer:after(DIALOGUE_CLEAR_TIME,f2)
    end)
    return
  end
  timer:after(DIALOGUE_CLEAR_TIME,function ()
    pok2.pok.status = pok1.move.status
    if(pok1.move.status==STATUS_SLP)then
      pok2.pok.sleepturns = math.random(2,5)
      self.dialogue = pok2:getname() .. " fell asleep."
    elseif(pok1.move.status==STATUS_PAR)then
      self.dialogue = pok2:getname() .. " was paralyzed."
    elseif(pok1.move.status==STATUS_BRN)then
      self.dialogue = pok2:getname() .. " was burned."
    elseif(pok1.move.status==STATUS_PSN)then
      self.dialogue = pok2:getname() .. " was poisned."
    elseif(pok1.move.status==STATUS_FRZ)then
      self.dialogue = pok2:getname() .. " was frozen solid."
    end
    timer:after(DIALOGUE_CLEAR_TIME,f2)
  end)
end
