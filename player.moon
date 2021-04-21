import min from math
import max from math

class Player

  new: (x, y, w, h, color) =>
    @x = x
    @y = y
    @w = w
    @h = h
    @color = color
    @drawType = "line"
    @speed = 100
    @dx = @speed
    @dy = @speed


  draw: () =>
    love.graphics.setColor unpack @color, 1
    love.graphics.rectangle @drawType, @x, @y, @w, @h

  mouvement: (dt) =>
    if love.keyboard.isDown 'z'
      @dy = -@speed
      @dx = 0
    else if love.keyboard.isDown 's'
      @dy = @speed
      @dx = 0
    else if love.keyboard.isDown 'd'
      @dx = @speed
      @dy = 0
    else if love.keyboard.isDown 'q'
      @dx = -@speed
      @dy = 0


  update: (dt) =>
    @mouvement dt
    if @dy < 0
      @y = max 0, @y + @dy * dt
    elseif @dy > 0
      @y = min VIRTUAL_HEIGHT - @h,  @y + @dy * dt
    elseif @dx < 0
      @x = max 0, @x + @dx * dt
    elseif @dx > 0
      @x = min VIRTUAL_WIDTH - @w, @x + @dx * dt
