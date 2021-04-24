Entity = assert require "entity"
Box = assert require "box"

Missle = {}



with Missle

  .create = (x,y,speed) ->
    missle = Entity "missle", nil, x, y,
            speed, @collision, nil,Box 120, 120, 10, 10

    missle

  .collision = (ent, game) =>
    if ent.name == 'player'
      print "Missle hit player"


Missle
