game = {}

export Push = assert require "libs.push"
tileManager = assert require "libs.tilemanager"
levelManager = assert require "levelManager"
gameStates = assert require "gameState.gamestates"
export B = assert require "libs.Binocles"

with game

  .enter = (prevS, ...) ->
    tileM = tileManager "maps.level1"
    game.lvlM = levelManager tileM, "maps"

  .load = () ->
    B!
    B\setPosition 40,2
    B\watch "FPS",-> love.timer.getFPS!
    love.window.setTitle "Move"
    love.graphics.setDefaultFilter 'nearest', 'nearest'
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, WinOptions

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
