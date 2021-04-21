Player = assert require "player"
push = assert require "libs.push"

player = Player(10,10,10,10,{1,0.5,1})

winOptions = {
	fullscreen: false,
	resizable: true,
	vsync: true
}
WINDOW_WIDTH = 640
WINDOW_HEIGHT = 360

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

love.load = () ->
  love.window.setTitle "Move"
  -- love.graphics.setDefaultFilter 'nearest', 'nearest'
  push.setupScreen(push, VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, winOptions)
love.update = (dt) ->
  player\update(dt)

love.draw = () ->
  push.apply(push, 'start')
  player\draw!
  push.apply(push, 'end')
