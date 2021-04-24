export WINDOW_WIDTH = 640
export WINDOW_HEIGHT = 360

export VIRTUAL_WIDTH = 432
export VIRTUAL_HEIGHT = 243

Player = assert require "player"
export push = assert require "libs.push"
tileManager = assert require "libs.tilemanager"
levelManager = assert require "levelManager"
export B = assert require "libs.Binocles"



player = Player(10,10,10,10,{1,0.5,1})
tileM = tileManager "maps.level1"
lvlM = levelManager tileM, player, "maps"

winOptions = {
	fullscreen: false,
	resizable: true,
	vsync: true
}


export DEBUG = false

with love
  .load = () ->
    B!
    B\setPosition 20,1
    B\watch "FPS",-> love.timer.getFPS!
    B\watch "NumOfObject",-> #tileM.objects
    love.window.setTitle "Move"
    love.graphics.setDefaultFilter 'nearest', 'nearest'
    push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, winOptions

  .update = (dt) ->
    lvlM\update dt
    B\update dt

  .draw = () ->
    lvlM\draw!
    B\draw!

  .resize = (w,h) ->
    lvlM\resize(w, h)

  .keypressed = (key) =>
    B\keypressed key
    if key == 'escape'
      love.event.quit!

