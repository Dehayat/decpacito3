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
--added accuracy and evasiveness
function modifiers:new()
  self.speed = 0
  self.atk = 0
  self.def = 0
  self.spatk = 0
  self.spdef = 0
  self.acc = 0
  self.evas = 0
end

mods_name = {}
mods_name[STAT_SPEED] = "speed"
mods_name[STAT_ATTACK] = "atk"
mods_name[STAT_DEFENSE] = "def"
mods_name[STAT_SPATTACK] = "spatk"
mods_name[STAT_SPDEFENSE] = "spdef"
mods_name[STAT_ACCURACY] = "acc"
mods_name[STAT_EVASE] = "evas"

status_name = {}
status_name[STATUS_SLP] = "SLP"
status_name[STATUS_PAR] = "PAR"
status_name[STATUS_BRN] = "BRN"
status_name[STATUS_PSN] = "PSN"
status_name[STATUS_FRZ] = "FRZ"
