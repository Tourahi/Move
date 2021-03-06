Graphics = love.graphics

class Entity
  new: (name, sprite, x, y, speed, collision, mouvement, sUpdate, cBox) =>
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
    @sUpdate = sUpdate


  draw: () =>
    if @cBox
      Graphics.rectangle 'fill', @cBox.x, @cBox.y, @cBox.w, @cBox.h

  update: (dt, lvl) =>
    if @mouvement
      newPos = @mouvement.update self, lvl, dt
      if @sUpdate
        @sUpdate newPos.x, newPos.y
    if @cBox
      @cBox\update @x,@y

  getPos: () =>
    {x:@x,y:@y}

  collisionCheck: (other, lvl) =>
    if self == other
      return
    if @cBox\overlaps other
      if @collision
        @collision other, lvl
    @cBox\overlaps other

  addTimer: (t) =>
    @timer = t

  Dead: () =>
    @dead = true
