Battle = Object:extend()
function Battle:new(pok1,pok2)
	self.pok1 = pok1
	self.pok2 = pok2
	self.key = nil
	self.state = 0
	self.loser = nil
	self.move1 = nil
	self.move2 = nil
end

function Battle:update(dt)
	if(self.key and self.state==0) then
	print(self.key)
		if(self.pok1.movepp[self.key-1]>0)then
			self.move1 = self.key-1
			self.pok1.movepp[self.key-1]=self.pok1.movepp[self.key-1]-1
			self.key = nil
			if(self.move1) then --TODO check if can move
				self.move2 = self:choose(self.pok2.moves)
				self.state = 1
				self:calc()
			end
		else
		print("sorry")
		self.state=3
		self.key = nil
		end
	elseif(self.key and self.state==3) then
	self.state=0
	self.key=nil
	end
end

function Battle:attack(p1,p2,m)
	if(_moves[m].nature==0) then
		self:type0(p1,p2,m)
	elseif(_moves[m].nature==1) then
		self:type1(p1,p2,m)
	end
end

function Battle:modify(p1)
	modifier = 1
	if(math.floor(math.random(0,255))<=math.floor(p1.speed/2)) then
		modifier = modifier*2
	end
	modifier = modifier*(math.random(217,255)/255)

	return modifier
end

function Battle:type0(p1,p2,m)
	base = math.floor((2*p1.level/5+2)*_moves[m].power*(p1.atk/p2.def)/50+2)
	base = math.floor(base*self:modify(p1))
	dealt = math.min(base,p2.curhp)
	p2.curhp = p2.curhp - dealt

end

function Battle:type1(p1,p2,m)
	t=math.random(_moves[m].min,_moves[m].max)
	for i=1,t do
		base = math.floor((2*p1.level/5+2)*_moves[m].power*(p1.atk/p2.def)/50+2)
		base = math.floor(base*self:modify(p1))
		dealt = math.min(base,p2.curhp)
		p2.curhp = p2.curhp - dealt

	end
end

function Battle:calc()
	if(pok1.speed>=pok2.speed)then
		self:attack(self.pok1,self.pok2,self.move1)
		if(not pok2:isdead())then
			self:attack(self.pok2,self.pok1,self.move2)
			if(not pok1:isdead()) then
				self.state = 0
				return
			else
				self.state = 2
				self.loser = pok1.name
				return
			end
		else
			self.state = 2
			self.loser = pok2.name
			return
		end
	else
		self:attack(self.pok2,self.pok1,self.move2)
		if(not pok2:isdead())then
			self:attack(self.pok1,self.pok2,self.move1)
			if(not pok2:isdead()) then
				self.state = 0
				return
			else
				self.state = 2
				self.loser= pok2.name
				return
			end
		else
			self.state = 2
			self.loser = pok1.name
			return
		end
	end
end

function Battle:choose(m)
	return math.random(0,m-1)
end

function Battle:drawbase()
	love.graphics.print(pok2.name,50,50)
	love.graphics.print("Lv" .. pok2.level,130,50)
	love.graphics.print("HP: " .. pok2.curhp .. "/" .. pok2.maxhp,80,70)
	hpbar = "["
	for i = 1,5 do
		if(math.ceil(pok2.curhp/pok2.maxhp*5)>=i)then
			hpbar = hpbar .. "="
		else
			hpbar = hpbar .. "  "
		end
	end
	love.graphics.print(hpbar .. "]",50,100)


	love.graphics.print(pok1.name,love.graphics.getWidth()-150,love.graphics.getHeight()-200)
	love.graphics.print("Lv" .. pok1.level,love.graphics.getWidth()-150+80,love.graphics.getHeight()-200)
	love.graphics.print("HP: " .. pok1.curhp .. "/" .. pok1.maxhp,love.graphics.getWidth()-150+30,love.graphics.getHeight()-200+20)

	hpbar = "["
	for i = 1,5 do
		if(math.ceil(pok1.curhp/pok1.maxhp*5)>=i)then
			hpbar = hpbar .. "="
		else
			hpbar = hpbar .. "  "
		end
	end
	love.graphics.print(hpbar .. "]",love.graphics.getWidth()-150,love.graphics.getHeight()-200+50)
end

function Battle:drawcalc()

end

function Battle:drawend()
	love.graphics.print(self.loser .. " is a me mario",50,love.graphics.getHeight()-150+25);
end

function Battle:drawpp()
	love.graphics.print("pp is no more",50,love.graphics.getHeight()-150+25);
end

function Battle:drawwait()
	for i,v in pairs(self.pok1.moveset) do
		love.graphics.print((i+1) .. "-" .. self.pok1.moveset[i].name .."  ".. self.pok1.movepp[i].."/" ..self.pok1.movemaxpp[i]   ,50,love.graphics.getHeight()-150+i*25);
	end
end

function Battle:draw()
	self:drawbase()
	if(self.state==0) then
		self:drawwait()
	elseif(self.state==1) then
		self:drawcalc()
	elseif(self.state==2)then
		self:drawend()
	else
		self:drawpp()
	end
end
