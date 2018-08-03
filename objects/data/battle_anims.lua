battle_anims = {}
battle_anims[MOVE_ANIM_HIT] = battle_anim()
battle_anims[MOVE_ANIM_HIT].duration = 0.5
battle_anims[MOVE_ANIM_HIT].fun = function(pok,mirror)
  timer:tween(0.2, pok, {x = pok.x+(mirror*25)}, 'out-expo',
  function ()
    timer:tween(0.3, pok, {x = pok.x-(mirror*25)}, 'in-out-quad')
  end)
end

battle_anims[MOVE_ANIM_HITS] = battle_anim()
battle_anims[MOVE_ANIM_HITS].duration = 0.3
battle_anims[MOVE_ANIM_HITS].fun = function(pok,mirror)
  timer:tween(0.1, pok, {x = pok.x+(mirror*15)}, 'out-expo',
  function ()
    timer:tween(0.2, pok, {x = pok.x-(mirror*15)}, 'in-out-quad')
  end)
end

battle_anims[MOVE_ANIM_PROTECT] = battle_anim()
battle_anims[MOVE_ANIM_PROTECT].duration = 1.5
battle_anims[MOVE_ANIM_PROTECT].fun = function(pok,battle)
  protect_rect = {x = pok.x+30,y = pok.y+30,w=250,h=0,a=0.6}
  battle.anim = function ()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.5, 0.8, 0.5, protect_rect.a)
    love.graphics.rectangle("fill", protect_rect.x, protect_rect.y, protect_rect.w, protect_rect.h)
    love.graphics.setColor(r,g,b,a)
  end
  timer:tween(1.1,protect_rect, {h = 200}, 'out-cubic',
  function ()
    timer:tween(0.4,protect_rect, {a = 0}, 'in-cubic',function () protect_rect = nil battle.anim  = nil end)
  end)
end

battle_anims[MOVE_ANIM_STAT] = battle_anim()
battle_anims[MOVE_ANIM_STAT].duration = 1.2
battle_anims[MOVE_ANIM_STAT].fun = function(pok,battle)
  stat = {}
  local sr,sg,sb = nil
  if(pok.move.stat==STAT_SPEED)then
    sr,sg,sb = 0,1,0
  else
    sr,sg,sb = 0,0,0
  end
  if(pok.move.stage>0)then
    stat = {pic = love.graphics.newImage("img/effects/stat_up.png") , x = pok.x+70 , y = pok.y+150, a = 0.8 }
    battle.anim = function ()
      local r, g, b, a = love.graphics.getColor()
      love.graphics.setColor(sr, sg, sb, stat.a)
      love.graphics.draw(stat.pic,stat.x,stat.y,0)
      love.graphics.draw(stat.pic,stat.x+50,stat.y-20,0)
      love.graphics.draw(stat.pic,stat.x+100,stat.y+5,0)
      love.graphics.setColor(r,g,b,a)
    end
    timer:tween(1,stat, {y = stat.y-130}, 'in-out-quad')
  else
    stat = {pic = love.graphics.newImage("img/effects/stat_up.png") , x = pok.x+125 , y = pok.y+80, a = 0.8}
    battle.anim = function ()
      local r, g, b, a = love.graphics.getColor()
      love.graphics.setColor(sr, sg, sb, stat.a)
      love.graphics.draw(stat.pic,stat.x,stat.y,math.pi)
      love.graphics.draw(stat.pic,stat.x+50,stat.y-20,math.pi)
      love.graphics.draw(stat.pic,stat.x+100,stat.y+5,math.pi)
      love.graphics.setColor(r,g,b,a)
    end
    timer:tween(1,stat, {y = stat.y+130}, 'in-out-quad')
  end
  timer:tween(1,stat, {a = 0}, 'in-cubic',function () stat = nil battle.anim  = nil end)
end

battle_anims[MOVE_ANIM_STATUS] = battle_anim()
battle_anims[MOVE_ANIM_STATUS].duration = 1.5
battle_anims[MOVE_ANIM_STATUS].fun = function(pok,battle,status)
  if(status==STATUS_SLP)then
    status = {pic = love.graphics.newImage("img/effects/sleep.png") , x = pok.x+130 , y = pok.y+100, a = 1 ,s = 0.3}
    battle.anim = function ()
      local r, g, b, a = love.graphics.getColor()
      love.graphics.setColor(1,1,1, status.a/2)
      love.graphics.draw(status.pic,status.x,status.y,0,status.s)
      love.graphics.setColor(r,g,b,a)
    end
    timer:tween(1.3,status, {a = 0.2}, 'in-expo')
    timer:tween(1.3,status, {s=1,y = status.y-120}, 'in-out-quad',function () status = nil battle.anim  = nil  end)
  elseif(status==STATUS_PAR)then
    status = {pic = love.graphics.newImage("img/effects/par.png") , x = pok.x , y = pok.y, a = 0.9}
    battle.anim = function ()
      local r, g, b, a = love.graphics.getColor()
      love.graphics.setColor(status.a,status.a,status.a, 1)
      love.graphics.draw(status.pic,status.x,status.y)
      love.graphics.setColor(r,g,b,a)
    end
    timer:tween(1.3,status, {a=1}, 'out-bounce',function () status = nil battle.anim  = nil  end)
  end
end
