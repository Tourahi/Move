import min from math
import max from math

Keyboard = love.keyboard
Graphics = love.graphics

class Player

  new: (x, y, w, h, color) =>
    @x = x
    @y = y
    @w = w
    @h = h
    @color = color
    @drawType = "line"
    @speed = 90
    @dx = @speed
    @dy = @speed
    @sprite = Graphics.newImage("sprites/player.png")


  draw: () =>
    -- Graphics.setColor unpack @color, 1
    --Graphics.rectangle @drawType, @x, @y, @w, @h
    Graphics.draw @sprite, @x, @y, nil, nil, nil, 0, 0

  mouvement: (dt) =>
    if Keyboard.isDown 'z'
      @dy = -@speed
      @dx = 0
    else if Keyboard.isDown 's'
      @dy = @speed
      @dx = 0
    else if Keyboard.isDown 'd'
      @dx = @speed
      @dy = 0
    else if Keyboard.isDown 'q'
      @dx = -@speed
      @dy = 0
    else if Keyboard.isDown 'space'
      @dx = 0
      @dy = 0


  update: (dt) =>
    @mouvement dt
    if @dy < 0
      @y = max 0, @y + (@dy * dt)
    elseif @dy > 0
      @y = min VIRTUAL_HEIGHT - @h,  @y + (@dy * dt)
    elseif @dx < 0
      @x = max 0, @x + (@dx * dt)
    elseif @dx > 0
      @x = min VIRTUAL_WIDTH - @w, @x + (@dx * dt)
