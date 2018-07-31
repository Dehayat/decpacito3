pokstats = Object:extend()

function pokstats:new()
  self.name = nil
  self.baseHp = nil
  self.baseAttack = nil
  self.baseDefense = nil
  self.baseSpeed = nil
  self.baseSpAttack = nil
  self.baseSpDefense = nil
  self.type1 = nil
  self.type2 = nil
  self.baseExp = nil
  self.gender = nil -- % of being male
  self.frontpic = nil
  self.backpic = nil
end
