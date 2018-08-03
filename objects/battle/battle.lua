ARROW_INVERT_TIME = 0.5
DIALOGUE_CLEAR_TIME = 1.5
HITS_LENGTH = 1
FAINT_TIME = 1

Battle = Object:extend()

function Battle:new(pok1,pok2)
  self.mon1 = pokbattle(pok1,0)
  self.mon1.x = 20
  self.mon1.y = 120
  self.mon2 = pokbattle(pok2,1)
  self.mon2.x = 380
  self.mon2.y = 30
  self.state = STATE_WAIT
  --arrow and chosen moves
  self.movearrow = 0
  self.enemymove = nil
  self.key = nil

  --arrow time stuff
  self.arrow_time_left = ARROW_INVERT_TIME
  self.fill = 'fill'
  self.dialogue = "."

  self.anim = nil

  self.arrow_press_y = 440
end

function Battle:drawbase()

  --mon2

	love.graphics.setFont(medfont)
  local nameplace = self.mon2:getname()
  if(self.mon2:getgender())then
    if(self.mon2:getgender()==GENDER_MALE) then
      nameplace = nameplace .. " !"
    else
      nameplace = nameplace .. " O"
    end
  end

  love.graphics.setColor(0.85,0.85,0.85)
  love.graphics.rectangle( "fill",20, 40, 270, 80)
  love.graphics.setColor(0.1,0.1,0.1)

  love.graphics.rectangle( "line",20, 40, 270, 80)

	love.graphics.print(nameplace,35,50)

	love.graphics.print("Lv" .. self.mon2:getlevel(),220,50)
	love.graphics.setFont(smallfont)

  if(self.mon2:getstatus())then love.graphics.print(status_name[self.mon2:getstatus()],80,75)
  else love.graphics.print("HP:",80,75) end
  love.graphics.rectangle( "line", 120, 80.5, 155, 15)

  if(self.mon2:getcurhp()/self.mon2:getmaxhp()>0.5) then
	 love.graphics.setColor(0.1,0.6,0.1)
  elseif(self.mon2:getcurhp()/self.mon2:getmaxhp()>0.15) then
	 love.graphics.setColor(0.9,0.4,0.05)
  else
	 love.graphics.setColor(0.8,0.1,0.1)
  end
  love.graphics.rectangle( "fill", 122, 82, 151*self.mon2:getcurhp()/self.mon2:getmaxhp(), 11)
	love.graphics.setColor(0.1,0.1,0.1)

	love.graphics.setColor(1,1,1)
  love.graphics.draw(self.mon2.pic,self.mon2.x,self.mon2.y,0,0.45,0.45)
	love.graphics.setColor(0.1,0.1,0.1)

  --mon1

	love.graphics.setFont(medfont)
  nameplace = self.mon1:getname()
  if(self.mon1:getgender())then
    if(self.mon1:getgender()==GENDER_MALE) then
      nameplace = nameplace .. " !"
    else
      nameplace = nameplace .. " O"
    end
  end

  love.graphics.setColor(0.85,0.85,0.85)
  love.graphics.rectangle( "fill",350, 240, 270, 90)
  love.graphics.setColor(0.1,0.1,0.1)

  love.graphics.rectangle( "line",350, 240, 270, 90)

	love.graphics.print(nameplace,365,250)

	love.graphics.print("Lv" .. self.mon1:getlevel(),555,250)
	love.graphics.setFont(smallfont)

  if(self.mon1:getstatus())then love.graphics.print(status_name[self.mon1:getstatus()],80,75)
  else love.graphics.print("HP:",410,275) end
  love.graphics.rectangle( "line", 450, 280, 155, 15)

  if(self.mon1:getcurhp()/self.mon1:getmaxhp()>0.5) then
	 love.graphics.setColor(0.1,0.6,0.1)
  elseif(self.mon1:getcurhp()/self.mon1:getmaxhp()>0.15) then
	 love.graphics.setColor(0.9,0.4,0.05)
  else
	 love.graphics.setColor(0.8,0.1,0.1)
  end
  love.graphics.rectangle( "fill", 452, 282, 151*self.mon1:getcurhp()/self.mon1:getmaxhp(), 11)
	love.graphics.setColor(0.1,0.1,0.1)
	love.graphics.print(math.floor(self.mon1:getcurhp()) .. "/" .. self.mon1:getmaxhp(),500,300)

	love.graphics.setColor(1,1,1)
  love.graphics.draw(self.mon1.pic,self.mon1.x,self.mon1.y,0,0.6,0.6)
	love.graphics.setColor(0.1,0.1,0.1)

  if(self.anim)then
    self.anim()
  end



  --dialogue box

  love.graphics.setColor(0.9,0.9,0.9)
  love.graphics.rectangle( "fill",2.5, 337.5, 635, 140)
  love.graphics.setColor(0.1,0.1,0.1)

  local w = love.graphics.getLineWidth()
  love.graphics.setLineWidth(5)
  love.graphics.rectangle( "line",2.5, 337.5, 635, 140)
  love.graphics.setLineWidth(w)
end

function Battle:drawwait()

  --movearrow
  if(self.arrow_time_left<=0)then
    self.arrow_time_left = ARROW_INVERT_TIME
    if(self.fill=='fill')then
      self.fill = 'line'
    else
      self.fill = 'fill'
    end
  end

  local w = love.graphics.getLineWidth()
  love.graphics.setLineWidth(3)
  if(self.movearrow==0)then
    love.graphics.polygon(self.fill, 30,375,30,395,45,385)
  elseif(self.movearrow==1)then
    love.graphics.polygon(self.fill, 230,375,230,395,245,385)
  elseif(self.movearrow==2)then
    love.graphics.polygon(self.fill, 30,425,30,445,45,435)
  else
    love.graphics.polygon(self.fill, 230,425,230,445,245,435)
  end
  love.graphics.setLineWidth(w)

  --moveset
	love.graphics.setFont(bigfont)

  if(self.mon1:getmove(0)) then
    	love.graphics.print(self.mon1:getmove(0).name,50,370)
  else
    	love.graphics.print("-",50,370)
  end
  if(self.mon1:getmove(1)) then
    	love.graphics.print(self.mon1:getmove(1).name,250,370)
  else
    	love.graphics.print("-",250,370)
  end
  if(self.mon1:getmove(2)) then
    	love.graphics.print(self.mon1:getmove(2).name,50,420)
  else
    	love.graphics.print("-",50,420)
  end
  if(self.mon1:getmove(3)) then
    	love.graphics.print(self.mon1:getmove(3).name,250,420)
  else
    	love.graphics.print("-",250,420)
  end

  --pp dialogue
	love.graphics.setFont(medfont)
  local w = love.graphics.getLineWidth()
  love.graphics.setLineWidth(5)
  love.graphics.rectangle( "line",432.5, 337.5, 235, 140)
  love.graphics.setLineWidth(w)

  love.graphics.print("pp ",450,370)
  love.graphics.print(self.mon1:getcurpp(self.movearrow) .. "/" .. self.mon1:getmaxpp(self.movearrow),550,370)

  love.graphics.print("type/" .. _types[self.mon1:getmove(self.movearrow).type],450,420)

	love.graphics.setFont(smallfont)
end

function Battle:drawcalc()

end

function Battle:drawdialogue()
	love.graphics.setFont(medfont)
	love.graphics.print(self.dialogue,30,360)
	love.graphics.setFont(smallfont)
end

function Battle:drawdialoguepress()
  love.graphics.polygon("fill", 575,self.arrow_press_y-5,605,self.arrow_press_y-5,590,20+self.arrow_press_y)
  if(self.arrow_press_y-0.001<=440)then
    timer:tween(0.3, self, {arrow_press_y = 450}, 'out-quad')
  elseif(self.arrow_press_y+0.001>=450) then
    timer:tween(0.3, self, {arrow_press_y = 440}, 'out-quad')
  end
end

function Battle:draw()
	self:drawbase()
	if(self.state==STATE_WAIT) then
		self:drawwait()
  elseif(self.state == STATE_CALC) then
    local a = 0
  elseif(self.state == STATE_DIALOGUE) then
    self:drawdialogue()
  elseif(self.state == STATE_DIALOGUE_PRESS) then
    self:drawdialogue()
    self:drawdialoguepress()

  end
end

function Battle:updatewait(dt)
  if(self.key)then
    if(self.key=="space")then
      self.state = STATE_CALC
    end
    self.arrow_time_left = ARROW_INVERT_TIME
    self.fill = 'fill'
    if(self.key=="up")then
      if(self.movearrow==2)then
        self.movearrow = 0
      elseif(self.movearrow==3)then
        self.movearrow = 1
      end
    end
    if(self.key=="left")then
      if(self.movearrow==1)then
        self.movearrow = 0
      elseif(self.movearrow==3)then
        self.movearrow = 2
      end
    end
    if(self.key=="down")then
      if(self.movearrow==0 and self.mon1:getmove(2))then
        self.movearrow = 2
      elseif(self.movearrow==1 and self.mon1:getmove(3))then
        self.movearrow = 3
      end
    end

    if(self.key=="right")then
      if(self.movearrow==0 and self.mon1:getmove(1))then
        self.movearrow = 1
      elseif(self.movearrow==2 and self.mon1:getmove(3))then
        self.movearrow = 3
      end
    end
  end
end

function Battle:updatecalc(dt)
  if(self.mon1.pok.movepp[self.movearrow]==0)then
    self.dialogue = "no pp left for that move."
    self.state = STATE_DIALOGUE_PRESS
    return
  end
  self.state = 10;
  if(self.enemymove==nil)then
    self.enemymove = math.random(0,self.mon2:getmovesnum()-1)
  end
  local speed1 = self.mon1:getstat(STAT_SPEED)
  local speed2 = self.mon2:getstat(STAT_SPEED)
  local move1 = self.mon1:getmove(self.movearrow)
  local move2 = self.mon2:getmove(self.enemymove)
  self.mon1.move = move1
  self.mon1.movei = self.movearrow
  self.mon2.move = move2
  self.mon2.movei = self.enemymove
  local move2 = self.mon2:getmove(self.enemymove)
  if(move1.priority>move2.priority or (move1.priority==move2.priority and speed1>=speed2)) then
    self:attack(self.mon1,self.mon2,1)
  else
    self:attack(self.mon2,self.mon1,1)
  end
end

function Battle:update(dt)
  self.arrow_time_left = self.arrow_time_left - dt
  if(self.state == STATE_WAIT)then
    self:updatewait(dt)
  elseif(self.state == STATE_CALC) then
    self:updatecalc(dt)
  elseif(self.state == STATE_END_TURN) then
    self:updateendturn(dt)
  elseif(self.state == STATE_DIALOGUE_PRESS and self.key) then
    self.state = STATE_WAIT
  end
  self.key = nil
end

function Battle:attack(pok1,pok2,f)
  pok1:turn()
  if(pok1:getstatus()==STATUS_PAR)then
    if(math.random(1,100)<=25)then
      self.state = STATE_DIALOGUE
      self.dialogue = pok1:getname() .. " is paralyzed and can't move."
      battle_anims[MOVE_ANIM_STATUS].fun(pok1,self,STATUS_PAR)
      timer:after(battle_anims[MOVE_ANIM_PROTECT].duration ,function()
        if(f)then
          timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok2,pok1) end)
        else
          timer:after(DIALOGUE_CLEAR_TIME,function() self.state = STATE_END_TURN end)
        end
      end)
      return
    end
  end
  if(pok1:getstatus()==STATUS_FRZ) then
    if(math.random(1,100)<=20)then
      pok1:removestatus()
      self.state = STATE_DIALOGUE
      self.dialogue = pok1:getname() .. " is no longer frozen."
      timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok1,pok2,f) end)
    else
      self.state = STATE_DIALOGUE
      self.dialogue = pok1:getname() .. " is frozen solid."
      if(f)then
        timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok2,pok1) end)
      else
        timer:after(DIALOGUE_CLEAR_TIME,function() self.state = STATE_END_TURN end)
      end
    end
    return
  end
  if(pok1:getstatus()==STATUS_SLP)then
    pok1.pok.sleepturns = pok1.pok.sleepturns-1
    if(pok1.pok.sleepturns==0)then
      pok1:removestatus()
      self.state = STATE_DIALOGUE
      self.dialogue = pok1:getname() .. " woke up."
      timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok1,pok2,f) end)
      return
    end
  end
  if(pok1:getstatus()==STATUS_SLP)then
    self.state = STATE_DIALOGUE
    self.dialogue = pok1:getname() .. " is fast asleep."

    battle_anims[MOVE_ANIM_STATUS].fun(pok1,self,STATUS_SLP)
    timer:after(battle_anims[MOVE_ANIM_PROTECT].duration ,function()
      if(f)then
        timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok2,pok1) end)
      else
        timer:after(DIALOGUE_CLEAR_TIME,function() self.state = STATE_END_TURN end)
      end
    end)
    return
  end
  if(pok1.lastmove==pok1.move.name)then
    pok1.moverepeat = pok1.moverepeat + 1
  else
    pok1.moverepeat = 1
  end
  if(pok1.vol[VOL_STATUS_CONFUSE])then
    pok1.vol[VOL_STATUS_CONFUSE] = nil
    pok1.confturns = pok1.confturns-1
    if(pok1.confturns==0)then
      pok1.confturns = nil
      pok1.vol[VOL_STATUS_CONFUSE] = nil
      self.state = STATE_DIALOGUE
      self.dialogue = pok1:getname() .. " snapped from its confusion."
      timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok1,pok2,f) end)
      return
    else
      self.dialogue = pok1:getname() .. " is confused."
      timer:after(DIALOGUE_CLEAR_TIME,function() self:attack(pok1,pok2,f) end)
      return
    end
  end
  if(pok1.confturns)then
    pok1.vol[VOL_STATUS_CONFUSE] = true
    if(math.random(1,100)<=50)then
      self.state = STATE_DIALOGUE
      self.dialogue = "It hurt itself in its confusion."
      if(f)then
        timer:after(DIALOGUE_CLEAR_TIME,function() self:attack_conf(pok1,function() self:attack(pok2,pok1) end )  end)
      else
        timer:after(DIALOGUE_CLEAR_TIME,function() self:attack_conf(pok1,function() self.state = STATE_END_TURN end )  end)
      end
      return
    end
  end
  self.state = STATE_DIALOGUE
  self.dialogue = pok1:getname() .. " used " ..  pok1.move.name .. "."
  pok1.pok.movepp[pok1.movei] = pok1.pok.movepp[pok1.movei] - 1
  local miss = math.floor(modifiers_multiplier[math.min(6,math.max(-6,pok1:getmod(STAT_ACCURACY)+pok2:getmod(STAT_EVASE)))]/100*pok1.move.accuracy)
  if(pok1:getstatus() == STATUS_PAR)then
    miss = math.floor(miss*0.5)
  end
  timer:after(0.8, function ()
    if(math.random(1,100)>miss or  get_type_effect(pok1.move.type,pok2:gettype(),pok2:gettype2()) == 0)then
      timer:after(DIALOGUE_CLEAR_TIME,function()
        self.dialogue = "But it missed."
        if(get_type_effect(pok1.move.type,pok2:gettype(),pok2:gettype2())==0)then self.dialogue = "it doesn't affect " .. pok2:getname() .. "." end
        timer:after(DIALOGUE_CLEAR_TIME,function()
           if(f) then
             self:attack(pok2,pok1)
           else
             self.state = STATE_END_TURN
           end
         end)
       end)
       return
    end
    local f2 = nil
    if(f)then
      local next = f2
      if(pok1.move.secondaryEffect==nil)then
        f2 = function() self:attack(pok2,pok1) end
      else
        if(pok1.move.secondaryEffect==MOVE_TYPE_STATS)then
          f2 = function() self:attack_stats(pok1,pok2,function() self:attack(pok2,pok1) end) end
        elseif(pok1.move.secondaryEffect==MOVE_TYPE_STATUS)then
          f2 = function() self:attack_status(pok1,pok2,function() self:attack(pok2,pok1) end) end
        elseif(pok1.move.secondaryEffect==MOVE_TYPE_VOL_STATUS)then
          f2 = function() self:attack_vol_status(pok1,pok2,function() self:attack(pok2,pok1) end) end
        end
      end
    end
    if(pok2.protected==true)then
      if(pok1.move.nature == MOVE_TYPE_HIT or pok1.move.nature == MOVE_TYPE_HITS or (pok1.move.nature == MOVE_TYPE_STATS and pok1.move.who==2)
      or pok1.move.nature == MOVE_TYPE_STATUS) then
        timer:after(STATE_DIALOGUE,function()
           self.dialogue = pok2:getname() .. " protected itself"
           battle_anims[MOVE_ANIM_PROTECT].fun(pok2,self)
           timer:after(battle_anims[MOVE_ANIM_PROTECT].duration ,function() self.state = STATE_END_TURN end)
          end)
        return
      end
    end
    if(pok1.move.nature==MOVE_TYPE_HIT)then
      self:attack_hit(pok1,pok2,f2)
    elseif(pok1.move.nature==MOVE_TYPE_HITS)then
      self:attack_hits(pok1,pok2,f2)
    elseif(pok1.move.nature==MOVE_TYPE_PROTECT)then
      self:attack_protect(pok1,pok2,f2)
    elseif(pok1.move.nature==MOVE_TYPE_STATS)then
      self:attack_stats(pok1,pok2,f2)
    elseif(pok1.move.nature==MOVE_TYPE_STATUS)then
      self:attack_status(pok1,pok2,f2)
    elseif(pok1.move.nature==MOVE_TYPE_VOL_STATUS)then
      self:attack_vol_status(pok1,pok2,f2)
    end
  end)
end

function Battle:getdmg(p1,p2)
  local base = 0
	if(p1.move.special==0) then
		base = math.floor((2*p1:getlevel()/5+2)*p1.move.power*(p1:getstat(STAT_ATTACK)/p2:getstat(STAT_DEFENSE,from))/50+2)
	else
		base = math.floor((2*p1:getlevel()/5+2)*p1.move.power*(p1:getstat(STAT_SPATTACK)/p2:getstat(STAT_SPDEFENSE,from))/50+2)
	end
	if(p1.move.special==0 and p1:getstatus()==STATUS_BRN)then
		base = math.floor(base*0.5);
	end
  base = math.floor(base * (math.random(85,100)/100))
  if(p1:gettype()==p1.move.type)then
    base = math.floor(base*1.5)
  end
  base = math.floor(base * get_type_effect(p1.move.type,p2:gettype(),p2:gettype2())/2)
	return math.max(1,base)
end

function Battle:getdmg_notype(p1,p2,p)
  local base = 0
	base = math.floor((2*p1:getlevel()/5+2)*p*(p1:getstat(STAT_ATTACK)/p2:getstat(STAT_DEFENSE,from))/50+2)
	if(p1:getstatus()==STATUS_BRN)then
		base = math.floor(base*0.5);
	end
  base = math.floor(base * (math.random(85,100)/100))
	return math.max(1,base)
end

function Battle:checkfaint(mon,f)
  if(math.floor(mon:getcurhp()+0.1)==0)then
    self.dialogue = mon:getname() .. " fainted!"
    self.state = STATE_DIALOGUE
    timer:tween(FAINT_TIME, mon, {y = mon.y+200}, 'out-quad',f)
    return true
  end
  if(f)then f() end
  return false
end

function Battle:updateendturn()
  self:endturn(self.mon1,function()  self:endturn(self.mon2) end )
  self.mon1:endturn()
  self.mon2:endturn()
end

function Battle:endturn(mon,f)
  if(mon:getstatus()==STATUS_BRN)then
    self.state = STATE_DIALOGUE
    self.dialogue = mon:getname() .. " is hurt by burn."
    timer:tween(DIALOGUE_CLEAR_TIME, mon.pok, {curhp = math.max(0,math.floor(pok2:getcurhp()-math.max(1,math.floor(mon:getmaxhp()/16))))}, 'out-quad',
      function ()
        mon.pok.curhp = mon.pok.curhp + 0.1
        mon.pok.curhp = math.max(mon.pok.curhp,0)
        mon.pok.curhp = math.floor(mon.pok.curhp)
        if(f)then self:checkfaint(mon,f)
        else self:checkfaint(mon,function () self.state = STATE_WAIT end) end
      end)
  elseif(mon:getstatus()==STATUS_PSN)then
    self.state = STATE_DIALOGUE
    self.dialogue = mon:getname() .. " is hurt by poison."
    timer:tween(DIALOGUE_CLEAR_TIME, mon.pok, {curhp = math.max(0,math.floor(pok2:getcurhp()-math.max(1,math.floor(mon:getmaxhp()/16))))}, 'out-quad',
      function ()
        mon.pok.curhp = mon.pok.curhp + 0.1
        mon.pok.curhp = math.max(mon.pok.curhp,0)
        mon.pok.curhp = math.floor(mon.pok.curhp)
        if(f)then self:checkfaint(mon,f)
        else self:checkfaint(mon,function () self.state = STATE_WAIT end) end
      end)
  else
    if(f)then f()
    else self.state = STATE_WAIT end
  end
end
