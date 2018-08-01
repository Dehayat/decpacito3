pokdata = Object:extend()

function pokdata:new(_species)

    --basestats
    self.base = mon_base[_species]

    --stuff
    self.species = _species
    self.gender = nil
    if(math.random(1,100)<self.base.gender) then
      self.gender = GENDER_MALE
    else
      self.gender = GENDER_FEMALE
    end

    --IV's
    self.IVHp = math.random(0,31)
    self.IVAttack = math.random(0,31)
    self.IVDefense = math.random(0,31)
    self.IVSpeed = math.random(0,31)
    self.IVSpAttack = math.random(0,31)
    self.IVSpDefense = math.random(0,31)

end

function pokdata:getname()
  return self.base.name
end

function pokdata:getgender()
  return self.gender
end

function pokdata:getpic(front)
  if(front==1)then
    return self.base.frontpic
  else
    return self.base.backpic
  end
end

function pokdata:getstats()
  return 2*self.base.baseHp+self.IVHp,2*self.base.baseAttack+self.IVAttack,2*self.base.baseDefense+self.IVDefense,2*self.base.baseSpAttack+self.IVSpAttack,2*self.base.baseSpDefense+self.IVSpDefense,2*self.base.baseSpeed+self.IVSpeed
end

function pokdata:gettype()
	return self.base.type1
end

function pokdata:gettype2()
	return self.base.type2
end
