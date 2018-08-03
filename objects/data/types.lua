types_effect = {} --[Attacking , Defending]
types_effect [TYPE_NORMAL]={}
for i=0,16 do
  types_effect[i] = {}
  for j=0,16 do
    types_effect[i][j] = 2
  end
end

types_effect [TYPE_NORMAL][TYPE_GHOST] = 0
types_effect [TYPE_NORMAL][TYPE_STEEL] = 1
types_effect [TYPE_NORMAL][TYPE_ROCK] = 1

types_effect [TYPE_GRASS][TYPE_GRASS] = 1
types_effect [TYPE_GRASS][TYPE_FIRE] = 1
types_effect [TYPE_GRASS][TYPE_WATER] = 4
types_effect [TYPE_GRASS][TYPE_GROUND] = 4
types_effect [TYPE_GRASS][TYPE_FLYING] = 1
types_effect [TYPE_GRASS][TYPE_ROCK] = 4
types_effect [TYPE_GRASS][TYPE_DRAGON] = 1
types_effect [TYPE_GRASS][TYPE_STEEL] = 1
types_effect [TYPE_GRASS][TYPE_BUG] = 1
types_effect [TYPE_GRASS][TYPE_POISON] = 1

types_effect [TYPE_FIRE][TYPE_GRASS] = 4
types_effect [TYPE_FIRE][TYPE_FIRE] = 1
types_effect [TYPE_FIRE][TYPE_WATER] = 1
types_effect [TYPE_FIRE][TYPE_ICE] = 4
types_effect [TYPE_FIRE][TYPE_ROCK] = 1
types_effect [TYPE_FIRE][TYPE_STEEL] = 4
types_effect [TYPE_FIRE][TYPE_BUG] = 4

types_effect [TYPE_WATER][TYPE_GRASS] = 1
types_effect [TYPE_WATER][TYPE_FIRE] = 4
types_effect [TYPE_WATER][TYPE_WATER] = 1
types_effect [TYPE_WATER][TYPE_GROUND] = 4
types_effect [TYPE_WATER][TYPE_ROCK] = 4
types_effect [TYPE_WATER][TYPE_DRAGON] = 1

types_effect [TYPE_PSYCHIC][TYPE_PSYCHIC] = 1
types_effect [TYPE_PSYCHIC][TYPE_DARK] = 0
types_effect [TYPE_PSYCHIC][TYPE_STEEL] = 1
types_effect [TYPE_PSYCHIC][TYPE_FIGHTING] = 4
types_effect [TYPE_PSYCHIC][TYPE_POISON] = 4

types_effect [TYPE_FLYING][TYPE_ELECTRIC] = 1
types_effect [TYPE_FLYING][TYPE_GRASS] = 4
types_effect [TYPE_FLYING][TYPE_ROCK] = 1
types_effect [TYPE_FLYING][TYPE_STEEL] = 1
types_effect [TYPE_FLYING][TYPE_BUG] = 4
types_effect [TYPE_FLYING][TYPE_FIGHTING] = 4

types_effect [TYPE_DARK][TYPE_PSYCHIC] = 4
types_effect [TYPE_DARK][TYPE_GHOST] = 4
types_effect [TYPE_DARK][TYPE_FIGHTING] = 1

types_effect [TYPE_ROCK][TYPE_FIRE] = 4
types_effect [TYPE_ROCK][TYPE_ICE] = 4
types_effect [TYPE_ROCK][TYPE_GROUND] = 1
types_effect [TYPE_ROCK][TYPE_FLYING] = 4
types_effect [TYPE_ROCK][TYPE_STEEL] = 1
types_effect [TYPE_ROCK][TYPE_BUG] = 4
types_effect [TYPE_ROCK][TYPE_FIGHTING] = 1

types_effect [TYPE_GHOST][TYPE_NORMAL] = 0
types_effect [TYPE_GHOST][TYPE_PSYCHIC] = 4
types_effect [TYPE_GHOST][TYPE_GHOST] = 4
types_effect [TYPE_GHOST][TYPE_DARK] = 1

types_effect [TYPE_ELECTRIC][TYPE_WATER] = 4
types_effect [TYPE_ELECTRIC][TYPE_ELECTRIC] = 1
types_effect [TYPE_ELECTRIC][TYPE_GRASS] = 1
types_effect [TYPE_ELECTRIC][TYPE_GROUND] = 0
types_effect [TYPE_ELECTRIC][TYPE_FLYING] = 4
types_effect [TYPE_ELECTRIC][TYPE_DRAGON] = 1

types_effect [TYPE_ICE][TYPE_FIRE] = 1
types_effect [TYPE_ICE][TYPE_WATER] = 1
types_effect [TYPE_ICE][TYPE_ICE] = 1
types_effect [TYPE_ICE][TYPE_STEEL] = 1
types_effect [TYPE_ICE][TYPE_GRASS] = 4
types_effect [TYPE_ICE][TYPE_DRAGON] = 4
types_effect [TYPE_ICE][TYPE_FLYING] = 4
types_effect [TYPE_ICE][TYPE_GROUND] = 4

types_effect [TYPE_GROUND][TYPE_FIRE] = 4
types_effect [TYPE_GROUND][TYPE_ELECTRIC] = 4
types_effect [TYPE_GROUND][TYPE_STEEL] = 4
types_effect [TYPE_GROUND][TYPE_ROCK] = 4
types_effect [TYPE_GROUND][TYPE_FLYING] = 0
types_effect [TYPE_GROUND][TYPE_GRASS] = 1
types_effect [TYPE_GROUND][TYPE_BUG] = 1
types_effect [TYPE_GROUND][TYPE_POISON] = 4

types_effect [TYPE_DRAGON][TYPE_DRAGON] = 4
types_effect [TYPE_DRAGON][TYPE_STEEL] = 1

types_effect [TYPE_STEEL][TYPE_STEEL] = 1
types_effect [TYPE_STEEL][TYPE_FIRE] = 1
types_effect [TYPE_STEEL][TYPE_ELECTRIC] = 1
types_effect [TYPE_STEEL][TYPE_WATER] = 1
types_effect [TYPE_STEEL][TYPE_ICE] = 4
types_effect [TYPE_STEEL][TYPE_ROCK] = 4

types_effect [TYPE_BUG][TYPE_FIRE] = 1
types_effect [TYPE_BUG][TYPE_DARK] = 4
types_effect [TYPE_BUG][TYPE_STEEL] = 1
types_effect [TYPE_BUG][TYPE_PSYCHIC] = 4
types_effect [TYPE_BUG][TYPE_FLYING] = 1
types_effect [TYPE_BUG][TYPE_GRASS] = 4
types_effect [TYPE_BUG][TYPE_GHOST] = 1
types_effect [TYPE_BUG][TYPE_FIGHTING] = 1
types_effect [TYPE_BUG][TYPE_POISON] = 1

types_effect [TYPE_FIGHTING][TYPE_BUG] = 1
types_effect [TYPE_FIGHTING][TYPE_PSYCHIC] = 1
types_effect [TYPE_FIGHTING][TYPE_FLYING] = 1
types_effect [TYPE_FIGHTING][TYPE_POISON] = 1
types_effect [TYPE_FIGHTING][TYPE_GHOST] = 0
types_effect [TYPE_FIGHTING][TYPE_DARK] = 4
types_effect [TYPE_FIGHTING][TYPE_STEEL] = 4
types_effect [TYPE_FIGHTING][TYPE_NORMAL] = 4
types_effect [TYPE_FIGHTING][TYPE_ICE] = 0
types_effect [TYPE_FIGHTING][TYPE_ROCK] = 4

types_effect [TYPE_POISON][TYPE_GRASS] = 4
types_effect [TYPE_POISON][TYPE_ROCK] = 1
types_effect [TYPE_POISON][TYPE_GHOST] = 1
types_effect [TYPE_POISON][TYPE_POISON] = 1
types_effect [TYPE_POISON][TYPE_GROUND] = 1
types_effect [TYPE_POISON][TYPE_STEEL] = 0

_types = {}

_types[TYPE_NORMAL] = "Normal"
_types[TYPE_FIRE] = "Fire"
_types[TYPE_WATER] = "Water"
_types[TYPE_GRASS] = "Grass"
_types[TYPE_PSYCHIC] = "Psychic"
_types[TYPE_FLYING] = "Flying"
_types[TYPE_DARK] = "Dark"
_types[TYPE_ROCK] = "Water"
_types[TYPE_GHOST] = "Ghost"
_types[TYPE_ELECTRIC] = "Electric"
_types[TYPE_ICE] = "Ice"
_types[TYPE_GROUND] = "Ground"
_types[TYPE_DRAGON] = "Dragon"
_types[TYPE_STEEL] = "Steel"
_types[TYPE_BUG] = "Bug"
_types[TYPE_FIGHTING] = "Fighting"
_types[TYPE_POISON] = "Poison"

function get_type_effect(t1,t2,t3)
  local ans = types_effect[t1][t2]/2
  if(t3)then
    ans = ans * types_effect[t1][t3]/2
  end
  return ans
end
