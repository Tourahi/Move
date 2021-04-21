Player = assert require "player"
push = assert require "libs.push"
tilemanager = assert require "libs.tilemanager"
export Binocles = assert require "libs.Binocles"



player = Player(10,10,10,10,{1,0.5,1})
-- tileM = tilemanager()


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
    Binocles()
    Binocles\watch "FPS",() -> return love.timer.getFPS!
    love.window.setTitle "Move"
    love.graphics.setDefaultFilter 'nearest', 'nearest'
    push.setupScreen(push, VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, winOptions)
  .update = (dt) ->
    player\update dt
    Binocles\update dt

  .draw = () ->
    Binocles\draw!
    push.apply push, 'start'
    player\draw!
    push.apply push, 'end'
