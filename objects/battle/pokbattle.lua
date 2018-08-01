pokbattle = Object:extend()

function pokbattle:new(pok,front)
  self.mods = modifiers()
  self.pok = pok
  self.move = nil
  self.movei = nil
  self.lastmove = nil
  self.moverepeat = nil
  self.protected = nil
  self.pic = love.graphics.newImage(self.pok:getpic(front))
  self.x = nil
  self.y = nil
end

function pokbattle:getname()
  return self.pok:getname()
end

function pokbattle:getlevel()
  return self.pok:getlevel()
end

function pokbattle:getcurhp()
  return self.pok:getcurhp()
end

function pokbattle:getmaxhp()
  return self.pok:getmaxhp()
end

function pokbattle:getmove(i)
  return self.pok.moveset[i]
end

function pokbattle:getgender()
  return self.pok:getgender()
end

function pokbattle:getcurpp(i)
  return self.pok.movepp[i]
end

function pokbattle:getmaxpp(i)
  return self.pok.movemaxpp[i]
end

function pokbattle:getmovesnum()
  return self.pok.moves
end

function pokbattle:getstat(stat)
  if(stat == STAT_SPEED)then
    local speed = self.pok.speed*modifiers_multiplier[self.mods.speed]/100;
    if(self.pok.status==STATUS_PAR)then
      speed = speed*0.5
    end
    return math.floor(speed)
  elseif(stat==STAT_ATTACK) then return self.pok.atk*modifiers_multiplier[self.mods.atk]/100
  elseif(stat==STAT_DEFENSE) then return self.pok.def*modifiers_multiplier[self.mods.def]/100
  elseif(stat==STAT_SPATTACK) then return self.pok.spatk*modifiers_multiplier[self.mods.spatk]/100
  elseif(stat==STAT_SPDEFENSE) then return self.pok.spdef*modifiers_multiplier[self.mods.spdef]/100
  end
end

function pokbattle:getstatus()
  return self.pok.status
end

function pokbattle:removestatus()
  self.pok.status = nil
end

function pokbattle:turn()
  if(self.pok.status==STATUS_SLP)then
    self.pok.sleepturns = self.pok.sleepturns
    if(self.pok.sleepturns==0)then
      self.pok.status = nil
    end
  end
end

function pokbattle:dmg(d)
  self.pok:damage(d)
end

function pokbattle:gettype()
  return self.pok:gettype()
end

function pokbattle:gettype2()
  return self.pok:gettype2()
end

function pokbattle:endturn()
  self.protected = nil
  self.lastmove =self.move.name
end

function pokbattle:getmod(s)
  return self.mods[mods_name[s]]
end

function pokbattle:modstats(m)
  local old = self.mods[mods_name[m.stat]]
  self.mods[mods_name[m.stat]] = math.min(6,math.max(-6,old+m.stage))
  if(self.mods[mods_name[m.stat]]==old)then
    return false
  else
    return true
  end
end
