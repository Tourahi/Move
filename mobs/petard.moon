Entity = assert require "entity"
Box = assert require "box"
followPlayer = assert require "ai.follow_player"

Petard = {}

SPEED = 100

collision = (other, game) =>
  ocbox = other.cBox
  if other == game.player
    @Dead!
    print other.name .. " got Hit by " .. @name
    -- other.mouvement = nil

update = (diffx, diffy) =>
    @x += diffx
    @y += diffy

with Petard

  .create = (x,y) ->
    petard = Entity "petard", nil, x, y,
            SPEED, collision,followPlayer, update,
            Box 10, 10, 10, 10
    petard.startFollowDist = 120
    petard


Petard
