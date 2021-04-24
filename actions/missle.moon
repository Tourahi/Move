Entity = assert require "entity"
Box = assert require "box"

Missle = {}


collision = (other, game) =>
  ocbox = other.cBox
  if other.name == "player"
    @Dead!
    print @name .. " is dead"

with Missle

  .create = (x,y,speed) ->
    missle = Entity "missle", nil, x, y,
            speed, collision, nil,Box 10, 10, 10, 10

    missle


Missle
