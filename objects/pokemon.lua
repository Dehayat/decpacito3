Pokemon = Object:extend()

function Pokemon:new(name,hp,atk,def,speed,level)
	self.name = name
	self.curhp = hp
	self.maxhp = hp
	self.atk = atk
	self.def = def
	self.speed = speed
	self.level = level
	self.moves = 0
	self.moveset = {}
	self.movepp = {}
	self.movemaxpp = {}
	--added number of times move repeated
	self.lastmove = ""
	self.moverepeat = 0
	--added protection
	self.protected = false
end

function Pokemon:addmove(p)
	self.moveset[self.moves] = p
	self.movepp[self.moves]=p.pp
	self.movemaxpp[self.moves]=p.pp
	self.moves = self.moves+1
end

function Pokemon:damage(dmg)
	take = min(dmg,self.curhp)
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
