local playerkeyboardMv = { }
local min
min = math.min
local max
max = math.max
local floor
floor = math.floor
local abs
abs = math.abs
local Keyboard = love.keyboard
local mouvementDir
mouvementDir = function(entity, ctrls)
  if Keyboard.isDown(ctrls.up) then
    entity.dy = -1
    entity.dx = 0
  else
    if Keyboard.isDown(ctrls.down) then
      entity.dy = 1
      entity.dx = 0
    else
      if Keyboard.isDown(ctrls.right) then
        entity.dx = 1
        entity.dy = 0
      else
        if Keyboard.isDown(ctrls.left) then
          entity.dx = -1
          entity.dy = 0
        else
          if Keyboard.isDown(ctrls.stop) then
            entity.dx = 0
            entity.dy = 0
          end
        end
      end
    end
  end
end
do
  playerkeyboardMv.controls = {
    up = 'z',
    down = 's',
    left = 'q',
    right = 'd',
    stop = 'space'
  }
  playerkeyboardMv.getCtrls = function(self)
    return self.controls
  end
  playerkeyboardMv.update = function(entity, dt)
    mouvementDir(entity, playerkeyboardMv:getCtrls())
    local x, y = entity.x, entity.y
    if entity.dy < 0 then
      y = max(entity.h * entity.dy, entity.y + (entity.dy * entity.speed * dt))
    elseif entity.dy > 0 then
      y = min(VIRTUAL_HEIGHT + entity.h, entity.y + (entity.dy * entity.speed * dt))
    elseif entity.dx < 0 then
      x = max(entity.w * entity.dx, entity.x + (entity.dx * entity.speed * dt))
    elseif entity.dx > 0 then
      x = min(VIRTUAL_WIDTH + entity.w, entity.x + (entity.dx * entity.speed * dt))
    end
    return x, y
  end
  playerkeyboardMv.setCtrls = function(self, u, d, l, r, s)
    self.controls.up = u or self.controls.up
    self.controls.down = d or self.controls.down
    self.controls.left = l or self.controls.left
    self.controls.right = r or self.controls.right
    self.controls.stop = s or self.controls.stop
  end
end
return playerkeyboardMv
