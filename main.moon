Player = assert require "player"
export push = assert require "libs.push"
tilemanager = assert require "libs.tilemanager"
export Binocles = assert require "libs.Binocles"



player = Player(10,10,10,10,{1,0.5,1})
tileM = tilemanager "maps.level1"


winOptions = {
	fullscreen: false,
	resizable: true,
	vsync: true
}
export WINDOW_WIDTH = 640
export WINDOW_HEIGHT = 360

export VIRTUAL_WIDTH = 432
export VIRTUAL_HEIGHT = 243

export DEBUG = false

with love
  .load = () ->
    Binocles!
    Binocles\watch "FPS",-> love.timer.getFPS!
    love.window.setTitle "Move"
    love.graphics.setDefaultFilter 'nearest', 'nearest'
    push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, winOptions

  .update = (dt) ->
    player\update dt
    Binocles\update dt

  .draw = () ->
    push\apply 'start'
    tileM\draw!
    player\draw!
    push\apply 'end'
    Binocles\draw!
