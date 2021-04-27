Spawner = {}

Player = assert require "mobs.player"

Spawner.spawn = (game, objects) ->
  for _,o in ipairs objects
    switch o.name
      when "player"
        player = Player(o.x, o.y)
        game\addEntity player
        game.player = player

Spawner
