Object = require "classic"
require('objects/pokemon')
require('objects/moves')
require('objects/battle')

_moves = {}
movecount = 0

function love.load()
	math.randomseed(os.time())
	love.graphics.setNewFont(18)
	_moves[movecount] = Move("hit",40,0,0,0)
	movecount = movecount+1
	pok1 = Pokemon("Batman",30,56,35,72,10)
	pok1:addmove(0)
	pok2 = Pokemon("Buttman",20,56,35,72,4)
	pok2:addmove(0)
	battle = Battle(pok1,pok2)
end

function love.update(dt)
	battle:update(dt)
end

function love.draw()
	love.graphics.print("LOVE",love.graphics.getWidth()-60,10)
	battle:draw()
end

function love.keyreleased(key)
	if(battle.state==0 and key=="1")then
		battle.key = 1
	end
end
