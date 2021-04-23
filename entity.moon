Graphics = love.graphics

class Entity
  new: (name, sprite, x, y, speed, collision, mouvement, cBox) =>
    @name = name
    @cBox = cBox
    @x = x
    @y = y
    @speed = speed
    @mouvement = mouvement
    @collision = collision
    @visible = true
    @dead = false


  draw: () =>
    if @cBox
      Graphics.rectangle 'line', @cBox.x, @cBox.y, @cBox.w, @cBox.h

  update: (dt) =>
    if @mouvement
      @mouvement\update! --TODO
    if @cBox
      @cBox\update @x,@y

  collisionCheck: (other, lvl) =>
    if self == other
      return
    B\watch "isColiDetected",-> @cBox\overlaps other
    if @cBox\overlaps other
      if @collision
        @collision other, lvl

  dead: () =>
    @dead = true
