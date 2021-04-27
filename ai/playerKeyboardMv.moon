playerkeyboardMv = {}


import min from math
import max from math
import floor from math
import abs from math

Keyboard = love.keyboard


mouvementDir = (entity, ctrls) ->
  if Keyboard.isDown ctrls.up
    entity.dy = -1
    entity.dx = 0
    entity.spriteSheet.animation\updateState "up"
  else if Keyboard.isDown ctrls.down
    entity.dy = 1
    entity.dx = 0
    entity.spriteSheet.animation\updateState "down"
  else if Keyboard.isDown ctrls.right
    entity.dx = 1
    entity.dy = 0
    entity.spriteSheet.animation\updateState "right"
  else if Keyboard.isDown ctrls.left
    entity.dx = -1
    entity.dy = 0
    entity.spriteSheet.animation\updateState "left"
  else if Keyboard.isDown ctrls.stop
    entity.dx = 0
    entity.dy = 0
    entity.spriteSheet.animation\updateState "idle"

with playerkeyboardMv
  .controls =  {
    up: 'z',
    down: 's',
    left: 'q',
    right: 'd'
    stop: 'space'
  }
  .getCtrls = () =>
    return @controls

  -- will return the new x,y
  -- so make sure to assign them to the entities (x,y)s after bcs they are not updated here.
  .update = (entity, dt) ->
    mouvementDir entity, playerkeyboardMv\getCtrls!
    x,y = entity.x, entity.y
    if entity.dy < 0
      y = max entity.h*entity.dy + 10, entity.y + (entity.dy * entity.speed * dt)
    elseif entity.dy > 0
      y = min VIRTUAL_HEIGHT - entity.h,  entity.y + (entity.dy * entity.speed * dt)
    elseif entity.dx < 0
      x = max entity.w*entity.dx + 10, entity.x + (entity.dx * entity.speed * dt)
    elseif entity.dx > 0
      x = min VIRTUAL_WIDTH - entity.w, entity.x + (entity.dx * entity.speed * dt)
    x,y

  .setCtrls = (u, d, l, r, s) =>
    @controls.up = u or @controls.up
    @controls.down = d or @controls.down
    @controls.left = l or @controls.left
    @controls.right = r or @controls.right
    @controls.stop = s or @controls.stop




playerkeyboardMv
