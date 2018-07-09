Move = Object:extend()

function Move:new(name,power,nature,min,max)
	self.name = name
	self.power = power
	self.nature = nature
	self.min = min
	self.max = max
end
