Move = Object:extend()

function Move:new(name)

	self.name = name
	self.power = nil
	self.type = nil
	self.special = nil
	self.pp = nil
	self.priority = nil
	self.acc = nil
	self.nature = nil

end
