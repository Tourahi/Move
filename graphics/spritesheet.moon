Graphics = love.graphics

class Spritesheet
	-- ftime : frame time
	new: (imgPath, spriteSize, ftime) =>
		@sprites = {}
		@image = Graphics.newImage imgPath
		@image\setFilter 'nearest', 'nearest'
		@spriteSize = spriteSize
		@spriteWide = @image\getWidth! / @spriteSize
		@initSprites!


	initSprites: () =>
		for i = 1, @spriteWide
			x = (i - 1) * @spriteSize
			y = 0
			@sprites = Graphics.newQuad x,
								y, @spriteSize,@spriteSize,
								@image\getDimensions!
		@maxSprites = #@sprites

	draw: (x, y) =>
		xOffset = @spriteSize / 2
		yOffset = @spriteSize / 2
		Graphics.draw @image, @sprites[1], x - xOffset, y - yOffset
