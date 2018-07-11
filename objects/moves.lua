Move = Object:extend()

--put optional parameters at the end
function Move:new(name,power,nature,special,pp,priority,type,par1,par2,par3)
	self.name = name -- name
	self.power = power -- power
	self.nature = nature
	--[[
	type0: normal attack
	type1: multiple attacks
	type2: protect
	type3: stats modifiers
	]]
	--added is speical
	self.special = special
	--[[
	0:physicial
	1:special
	2:status
	]]
	self.pp=pp -- pp
	--added priorities
	self.priority = priority -- priority (-oo,oo) ignores speed
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

	self.type=type
end
