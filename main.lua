Object = require "classic"
Timer = require "timer"

require('objects/data/states')
require('objects/data/types')
require('objects/data/modifiers')

require('objects/pokemon/pokstats')
require('objects/pokemon/pokdata')
require('objects/pokemon/pokemon')
require('objects/data/pokemon/base_stats')


require('objects/move')
require('objects/data/moves')

require('objects/battle/pokbattle')
require('objects/battle/battle')
require('objects/battle/battle2')
require('objects/battle/battle_anim')
require('objects/data/battle_anims')

function love.load()
	timer = Timer()
	math.randomseed(os.time())
	smallfont= love.graphics.newFont(18)
	medfont= love.graphics.newFont(24)
	bigfont= love.graphics.newFont(30)
	love.graphics.setFont(smallfont)
	--Pokemon(name,hp,atk,def,spatk,spdef,speed,level,type)
	pok1 = Pokemon(MON_FIREMELON,5,7)
	pok1:addmove(_moves[MOVE_ANIM_HITS])
	pok1:addmove(_moves[MOVE_FASTEN])
	pok1:addmove(_moves[MOVE_SNOOZE])
	pok1:addmove(_moves[MOVE_BE_STILL])
	--pok1:addmove(_moves[6])
	pok2 = Pokemon(MON_FIREMELON,3,6)
	pok2:addmove(_moves[0])
	Battle(pok1,pok2)
	battle = Battle(pok1,pok2)
	love.graphics.setBackgroundColor(0.8,0.8,0.8)
end

function love.update(dt)
	timer:update(dt)
	battle:update(dt)
end

function love.draw()
	love.graphics.setColor(0.7,0.1,0.7)
	love.graphics.print("LOVE",love.graphics.getWidth()-60,10)
	love.graphics.setColor(0.1,0.1,0.1)
	battle:draw()
end

function love.keypressed(key)
	battle.key=key
end
