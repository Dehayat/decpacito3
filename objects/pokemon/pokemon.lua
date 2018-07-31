Pokemon = Object:extend()

function Pokemon:new(_species,minlvl,maxlvl)

	--pokdata
	self.data = pokdata(_species)

	self.level = math.random(minlvl,maxlvl)

	--changing
	self.curhp = hp
	self.movepp = {}
	self.status = nil
	self.sleepturns = nil

  --EV's
  self.EVHp = 0
  self.EVAttack = 0
  self.EVDefense = 0
  self.EVSpeed = 0
  self.EVSpAttack = 0
  self.EVSpDefense = 0

  --stats
	self.maxhp = nil
	self.atk = nil
	self.def = nil
	self.spatk = nil
	self.spdef = nil
	self.speed = nil
	self:updatestats()

	self.curhp = self.maxhp


  --moveset
	self.moves = 0
	self.moveset = {}
	self.movemaxpp = {}


end

function Pokemon:getname()
	return self.data:getname()
end

function Pokemon:getlevel()
	return self.level
end

function Pokemon:getcurhp()
	return self.curhp
end

function Pokemon:getmaxhp()
	return self.maxhp
end

function Pokemon:getpic(front)
	return self.data:getpic(front)
end

function Pokemon:getgender()
	return self.data.gender
end

function Pokemon:gettype()
	return self.data:gettype()
end

function Pokemon:updatestats()
	local _hp,_atk,_def,_spatk,_spdef,_speed = self.data:getstats()
	self.maxhp = math.floor((_hp+math.floor(self.EVHp/4))/100)+self.level+10
	self.atk = math.floor((_atk+math.floor(self.EVAttack/4))*self.level/100)+5
	self.def = math.floor((_def+math.floor(self.EVDefense/4))*self.level/100)+5
	self.spatk = math.floor((_spatk+math.floor(self.EVSpAttack/4))*self.level/100)+5
	self.spdef = math.floor((_spdef+math.floor(self.EVSpDefense/4))*self.level/100)+5
	self.speed = math.floor((_speed+math.floor(self.EVSpeed/4))*self.level/100)+5
end

function Pokemon:addmove(p)
	self.moveset[self.moves] = p
	self.movepp[self.moves]=p.pp
	self.movemaxpp[self.moves]=p.pp
	self.moves = self.moves+1
end

function Pokemon:damage(dmg)
	take = math.min(dmg,self.curhp)
	self.curhp= self.curhp - take
	if(self.curhp==0) then
		return false
	else
		return true
	end
end

function Pokemon:isdead()
	if(self.curhp==0)then
		return true
	end
		return false
end
