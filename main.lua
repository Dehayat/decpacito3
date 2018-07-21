Object = require "classic"
require('objects/pokemon')
require('objects/moves')
require('objects/modifiers')
require('objects/types')
require('objects/status')
require('objects/battle')

_moves = {}
movecount = 0

function love.load()
	math.randomseed(os.time())
	love.graphics.setNewFont(18)
	--Move(name,power,nature,special,pp,priority,type,acc,par1,par2,par3)
	_moves[movecount] = Move("hit",40,0,0,25,0,"normal",100)
	movecount = movecount+1
	_moves[movecount] = Move("hits",12,1,0,20,0,"normal",50,2,5)
	movecount = movecount+1
	_moves[movecount] = Move("don't hit",0,2,0,10,2,"normal",80)
	movecount = movecount+1
	_moves[movecount] = Move("fasten",0,3,0,20,0,"normal",90,0,2,"speed")
	movecount = movecount+1
	_moves[movecount] = Move("throw chairs",14,1,1,15,0,"normal",60,1,4)
	movecount = movecount+1
	_moves[movecount] = Move("snooze",0,4,2,10,0,"normal",80,"SLP",60)
	movecount = movecount+1
	_moves[movecount] = Move("be still",0,4,2,10,0,"normal",80,"PAR",60)
	movecount = movecount+1
	--Pokemon(name,hp,atk,def,spatk,spdef,speed,level,type)
	pok1 = Pokemon("Batman",30,56,35,12,18,70,5,"normal")
	pok1:addmove(_moves[0])
	pok1:addmove(_moves[1])
	pok1:addmove(_moves[3])
	pok1:addmove(_moves[6])
	pok2 = Pokemon("Buttman",20,30,20,40,35,72,4,"normal")
	pok2:addmove(_moves[5])
	pok2:addmove(_moves[4])
	--Battle(pok1,pok2)
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
	battle.key=key
end
