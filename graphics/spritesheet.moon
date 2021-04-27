Graphics = love.graphics
Animation = assert require "graphics.animation"

class Spritesheet
	-- ftime : frame time
  new: (imgPath, spriteSize, ftime, animStates) =>
    @sprites = {}
    @image=Graphics.newImage(imgPath)
    @image\setFilter 'nearest', 'nearest'
    @spriteWide = @image\getWidth! / spriteSize
    @spriteSize = spriteSize
    @initSprites!
    @states = animStates or {
      "idle": {start:1, stop:1},
      "left": {start:1, stop:1},
      "right": {start:1, stop:1},
      "top": {start:1, stop:1},
      "bot": {start:1, stop:1},
      "move": {start:1, stop:1}
    }
    @animation = Animation(ftime)
    @updateState "idle"
    @xOffset = @spriteSize / 2
    @yOffset = @spriteSize / 2

  updateState: (newS) =>
    if @states[newS] == nil
      newS = "idle"
    @state = @states[newS]
    @animation\updateState @state

  initSprites: () =>
    for i = 1, @spriteWide
      x = (i - 1) * @spriteSize
      y = 0
      @sprites[i] = Graphics.newQuad x,y, @spriteSize,@spriteSize,@image\getDimensions!
    @maxSprites = #@sprites

  update: (dt, game) =>
    @animation\update dt, game

  draw: (x, y) =>
    Graphics.draw @image, @sprites[@animation\frame!], x, y
