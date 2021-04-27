Graphics = love.graphics
Animation = assert require "graphics.animation"

class Spritesheet
	-- ftime : frame time
  new: (imgPath, spriteSize, ftime) =>
    @sprites = {}
    @image=Graphics.newImage(imgPath)
    @image\setFilter 'nearest', 'nearest'
    @spriteWide = @image\getWidth! / spriteSize
    @spriteSize = spriteSize
    @initSprites!
    @animation = Animation(#@sprites, ftime)
    @xOffset = @spriteSize / 2
    @yOffset = @spriteSize / 2

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
