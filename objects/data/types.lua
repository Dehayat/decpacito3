types_effect = {} --[Attacking , Defending]
types_effect [TYPE_NORMAL]={}
types_effect [TYPE_NORMAL][TYPE_NORMAL] = 2
types_effect [TYPE_NORMAL][TYPE_GRASS] = 2
types_effect [TYPE_NORMAL][TYPE_FIRE] = 2
types_effect [TYPE_NORMAL][TYPE_WATER] = 2
types_effect [TYPE_NORMAL][TYPE_PSYCHIC] = 2

types_effect [TYPE_GRASS]={}
types_effect [TYPE_GRASS][TYPE_NORMAL] = 2
types_effect [TYPE_GRASS][TYPE_GRASS] = 1
types_effect [TYPE_GRASS][TYPE_FIRE] = 1
types_effect [TYPE_GRASS][TYPE_WATER] = 4
types_effect [TYPE_GRASS][TYPE_PSYCHIC] = 2

types_effect [TYPE_FIRE]={}
types_effect [TYPE_FIRE][TYPE_NORMAL] = 2
types_effect [TYPE_FIRE][TYPE_GRASS] = 4
types_effect [TYPE_FIRE][TYPE_FIRE] = 1
types_effect [TYPE_FIRE][TYPE_WATER] = 1
types_effect [TYPE_FIRE][TYPE_PSYCHIC] = 2

types_effect [TYPE_WATER]={}
types_effect [TYPE_WATER][TYPE_NORMAL] = 2
types_effect [TYPE_WATER][TYPE_GRASS] = 1
types_effect [TYPE_WATER][TYPE_FIRE] = 4
types_effect [TYPE_WATER][TYPE_WATER] = 1
types_effect [TYPE_WATER][TYPE_PSYCHIC] = 2

types_effect [TYPE_PSYCHIC]={}
types_effect [TYPE_PSYCHIC][TYPE_NORMAL] = 2
types_effect [TYPE_PSYCHIC][TYPE_GRASS] = 2
types_effect [TYPE_PSYCHIC][TYPE_FIRE] = 2
types_effect [TYPE_PSYCHIC][TYPE_WATER] = 2
types_effect [TYPE_PSYCHIC][TYPE_PSYCHIC] = 1

_types = {}

_types[TYPE_NORMAL] = "Normal"
_types[TYPE_FIRE] = "Fire"
_types[TYPE_WATER] = "Water"
_types[TYPE_GRASS] = "Grass"
_types[TYPE_PSYCHIC] = "Psychic "

function get_type_effect(t1,t2,t3)
  local ans = types_effect[t1][t2]/2
  if(t3)then
    ans = ans * types_effect[t1][t3]/2
  end
  return ans
end
