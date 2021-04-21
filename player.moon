

class Player

  new: (x, y, w, h, color) =>
    @x = x
    @y = y
    @w = w
    @h = h
    @color = color
    @drawType = "line"
    @speed = 100


  draw: () =>
    love.graphics.setColor unpack @color, 1
    love.graphics.rectangle @drawType, @x, @y, @w, @h

  mouvement: (dt) =>
    if love.keyboard.isDown 'z'
      @y -= @speed * dt
    else if love.keyboard.isDown 's'
      @y += @speed * dt


  update: (dt) =>
    @mouvement dt

