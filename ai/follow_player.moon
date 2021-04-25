vector = assert require "tools.vector"
followPlayer = {}


with followPlayer
  .update = (entity, game,dt) ->
    playerPos = game.player\getPos!
    entPos = entity\getPos!
    dX = 0
    dY = 0
    dist = vector.distance entPos, playerPos

    if dist < 100
      Uvec = vector.normalise entPos, playerPos
      dX = Uvec.dx * entity.speed * dt
      dY = Uvec.dy * entity.speed * dt

    {x:dX,y:dY}

followPlayer
