Graphics = love.graphics

class Entity
  new: (name, sprite, x, y, speed, collision, mouvement, cBox) =>
    @name = name
    @cBox = cBox
    @x = x
    @y = y
    @w = cBox.w
    @h = cBox.h
    @dx = 0
    @dy = 0
    @speed = speed
    @mouvement = mouvement
    @collision = collision
    @visible = true
    @dead = false
    @timer = nil


  draw: () =>
    if @cBox
      Graphics.rectangle 'line', @cBox.x, @cBox.y, @cBox.w, @cBox.h

  update: (dt) =>
    if @mouvement
      @x,@y = @mouvement.update self, dt
    if @cBox
      @cBox\update @x,@y

  collisionCheck: (other, lvl) =>
    ocBox = other.cBox
    if self == other
      return
    B\watch "isColiDetected",-> @cBox\overlaps ocBox
    if @cBox\overlaps other
      if @collision
        @collision other, lvl

  addTimer: (t) =>
    @timer = t

  Dead: () =>
    @dead = true
