modifiers = Object:extend()
modifiers_multiplier = {}
modifiers_multiplier[-6] = 33
modifiers_multiplier[-5] = 36
modifiers_multiplier[-4] = 43
modifiers_multiplier[-3] = 50
modifiers_multiplier[-2] = 60
modifiers_multiplier[-1] = 75
modifiers_multiplier[0] = 100
modifiers_multiplier[1] = 133
modifiers_multiplier[2] = 166
modifiers_multiplier[3] = 200
modifiers_multiplier[4] = 233
modifiers_multiplier[5] = 266
modifiers_multiplier[6] = 300
--added atk,def,spatk,spdef
function modifiers:new()
  self.speed = 0
  self.atk = 0
  self.def = 0
  self.spatk = 0
  self.spdef = 0
end
