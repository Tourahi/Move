game = {}

export WINDOW_WIDTH = 640
export WINDOW_HEIGHT = 360

export VIRTUAL_WIDTH = 432
export VIRTUAL_HEIGHT = 243

Player = assert require "player"
export Push = assert require "libs.push"
tileManager = assert require "libs.tilemanager"
levelManager = assert require "levelManager"
gameStates = assert require "gameState.gamestates"
export playerMv = assert require "ai.playerKeyboardMv"
export B = assert require "libs.Binocles"

winOptions = {
	fullscreen: false,
	resizable: true,
	vsync: false
}


with game

  .enter = (prevS, ...) ->
    player = Player(10,10,10,10,playerMv)
    tileM = tileManager "maps.level1"
    game.lvlM = levelManager tileM, player, "maps"

  .load = () ->
    B!
    B\setPosition 20,1
    B\watch "FPS",-> love.timer.getFPS!
    love.window.setTitle "Move"
    love.graphics.setDefaultFilter 'nearest', 'nearest'
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, winOptions

  .update = (dt) ->
    game.lvlM\update dt
    B\update dt

  .draw = () ->
    game.lvlM\draw!
    B\draw!

  .resize = (w,h) ->
    game.lvlM\resize(w, h)

  .keypressed = (key) ->
    B\keypressed key
    if key == 'escape'
      love.event.quit!

  .exit = () ->
    return



game
