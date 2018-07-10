Move = Object:extend()

function Move:new(name,power,nature,par1,par2,par3,pp,priority)
	self.name = name -- name
	self.power = power -- power
	self.nature = nature
	--[[
	type0: normal attack
	type1: multiple attacks
	type2: protect
	type3: stats modifiers
	]]
	self.par1 = par1
	--[[
	type1: min number of hits
	type3: who affects
		0: self
		1: enemy
	]]
	self.par2 = par2
	--[[
	type1: max number of hits
	type3: how affects (-6,6)
	]]
	self.par3 = par3
	--[[
	type3: affacted stat
		speed
	]]
	self.pp=pp -- pp
	--added priorities
	self.priority = priority -- priority (-oo,oo) ignores speed
end
