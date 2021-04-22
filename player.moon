import min from math
import max from math
import floor from math

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
    @dx = 0
    @dy = 0
    @sprite = Graphics.newImage("sprites/player.png")


  draw: () =>
    -- Graphics.setColor unpack @color, 1
    --Graphics.rectangle @drawType, @x, @y, @w, @h
    Graphics.draw @sprite, @x, @y, nil, nil, nil, 0, 0

  mouvement: (dt) =>
    if Keyboard.isDown 'z'
      @dy = -1
      @dx = 0
    else if Keyboard.isDown 's'
      @dy = 1
      @dx = 0
    else if Keyboard.isDown 'd'
      @dx = 1
      @dy = 0
    else if Keyboard.isDown 'q'
      @dx = -1
      @dy = 0
    else if Keyboard.isDown 'space'
      @dx = 0
      @dy = 0

  setPos: (x,y) =>
    @x,@y = x,y



  update: (dt, lvl) =>
    @mouvement dt
    x,y = @x, @y
    if @dy < 0
      y = max 0, @y + (@dy * @speed * dt)
    elseif @dy > 0
      y = min VIRTUAL_HEIGHT - @h,  @y + (@dy * @speed * dt)
    elseif @dx < 0
      x = max 0, @x + (@dx * @speed * dt)
    elseif @dx > 0
      x = min VIRTUAL_WIDTH - @w, @x + (@dx * @speed * dt)

    B\watch "Player Pos",-> {x: floor(@x),y: floor(@y)}
    if lvl\isTileWalkable x+@w/2,y+@h/2
      @x = x
      @y = y

