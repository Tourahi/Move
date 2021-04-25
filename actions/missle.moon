Entity = assert require "entity"
Box = assert require "box"
followPlayer = assert require "ai.follow_player"

Missle = {}


collision = (other, game) =>
  ocbox = other.cBox
  if other == game.player
    @Dead!
    print other.name .. " is dead"
    other.mouvement = nil

update = (difx, dify) =>
    @x += difx
    @y += dify
with Missle

  .create = (x,y,speed) ->
    missle = Entity "missle", nil, x, y,
            speed, collision,followPlayer, update,
            Box 10, 10, 10, 10



    missle


Missle
