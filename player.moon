import min from math
import max from math
import floor from math
import abs from math

Box = assert require "box"
spriteSheet = assert require "graphics.spritesheet"
Graphics = love.graphics


animStates = {
  "idle": {start:1, stop:1},
  "right": {start:1, stop:2},
  "left": {start:3, stop:4}
}

class Player

  new: (x, y, w, h, mouvement) =>
    @name = "player"
    @x = x
    @y = y
    @w = w
    @h = h
    @drawType = "line"
    @speed = 90
    @mouvement = mouvement
    @mouvement\setCtrls 'z','s','q','d'
    @dx = 0
    @dy = 0
    @spriteSheet = spriteSheet("sprites/player-Sheet.png",10 ,30, animStates)
    @rBound = VIRTUAL_WIDTH - @w
    @lBound = 0
    @tBound = 0
    @bBound = VIRTUAL_HEIGHT - @h
    @cBox = Box @x, @y, @w, @h


  draw: () =>
		-- Graphics.rectangle @drawType, @cBox.x, @cBox.y, @cBox.w, @cBox.h
		@spriteSheet\draw @x,@y

  setPos: (x,y) =>
    @x,@y = x,y

  getPos: () =>
    {x:@x,y:@y}


  update: (dt, lvl) =>
    x,y = @x,@y
    if @mouvement
      x,y = @mouvement.update self, dt
    if lvl\isTileWalkable x + (@h/2 + (@dx*floor @h/5)),y + (@w/2 + (@dy*floor @w/5))
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
    @cBox\update @x, @y
    @spriteSheet\update dt, lvl


