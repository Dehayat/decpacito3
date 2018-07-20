Move = Object:extend()

--put optional parameters at the end
--added accuracy
function Move:new(name,power,nature,special,pp,priority,type,acc,par1,par2,par3)
	self.name = name -- name
	self.power = power -- power
	self.nature = nature
	--[[
	type0: normal attack
	type1: multiple attacks
	type2: protect
	type3: stats modifiers
	type4: status modifiers
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
	self.acc = acc
	self.par1 = par1
	--[[
	type1: min number of hits
	type3: who affects
		0: self
		1: enemy
	type4: what status
		SLP: sleep
	]]
	self.par2 = par2
	--[[
	type1: max number of hits
	type3: how affects (-6,6)
	type4:
		SLP: probability (0,100)
	]]
	self.par3 = par3
	--[[
	type3: affacted stat
		speed
	]]

	self.type=type
end
