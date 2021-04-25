gameS = assert require "gameState.gamestates"

with love
  .load = (arg) ->
    gameS.setState "game"

  .update = (dt) ->
    gameS.stateEvent "update", dt

  .draw = () ->
    gameS.stateEvent "draw"

  .keypressed = (key) ->
    gameS.stateEvent "keypressed", key
  .resize = (w,h) ->
    gameS.stateEvent "resize", w, h

