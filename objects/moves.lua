Move = Object:extend()

function Move:new(name,power,nature,min,max,priority,stat,statpower)
	self.name = name
	self.power = power
	self.nature = nature
	self.min = min
	self.max = max
	--added priorities
	self.priority = priority
	--added stats adjust
	self.stat = stat
	self.statpower = statpower
end
