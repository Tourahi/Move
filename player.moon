import min from math
import max from math
import floor from math
import abs from math

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
    @rBound = VIRTUAL_WIDTH + @w
    @lBound = -@w
    @tBound = -@h
    @bBound = VIRTUAL_HEIGHT + @h



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
      y = max @h*@dy, @y + (@dy * @speed * dt)
    elseif @dy > 0
      y = min VIRTUAL_HEIGHT + @h,  @y + (@dy * @speed * dt)
    elseif @dx < 0
      x = max @w*@dx, @x + (@dx * @speed * dt)
    elseif @dx > 0
      x = min VIRTUAL_WIDTH + @w, @x + (@dx * @speed * dt)

    B\watch "Player Pos",-> {x: floor(@x),y: floor(@y)}
    B\watch "Player Dir",-> {dx: @dx,dy: @dy}
    if lvl\isTileWalkable x + (@h/2 + (@dx*@h/3)),y + (@w/2 + (@dy*@w/3))
      @x = x
      @y = y
      if @dx != 0
        if @dx > 0 and @x == @rBound
          @x = @lBound
        elseif @dx < 0 and @x == @lBound
          @x = @rBound
      elseif @dy != 0
        if @dy > 0 and @y == @bBound
          @y = @tBound
        elseif @dy < 0 and @y == @tBound
          @y = @bBound


