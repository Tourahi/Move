Player = assert require "player"
push = assert require "libs.push"

player = Player(10,10,10,10,{1,0.5,1})

winOptions = {
	fullscreen: false,
	resizable: true,
	vsync: true
}
export WINDOW_WIDTH = 640
export WINDOW_HEIGHT = 360

export VIRTUAL_WIDTH = 432
export VIRTUAL_HEIGHT = 243


with love
  .load = () ->
    love.window.setTitle "Move"
    love.graphics.setDefaultFilter 'nearest', 'nearest'
    push.setupScreen(push, VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, winOptions)
  .update = (dt) ->
    player\update dt

  .draw = () ->
    push.apply push, 'start'
    player\draw!
    push.apply push, 'end'
