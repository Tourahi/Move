Spawner = {}

Player = assert require "mobs.player"
Petard = assert require "mobs.petard"

Spawner.spawn = (game, objects) ->
  for _,o in ipairs objects
    switch o.name
      when "player"
        player = Player(o.x, o.y)
        game\addEntity player
        game.player = player
      when "petard"
        game\addEntity Petard.create o.x, o.y

Spawner
