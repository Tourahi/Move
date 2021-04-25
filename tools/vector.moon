import sqrt from math

vector = {}

with vector
  .distance = (From, To) ->
    dx = To.x - From.x
    dy = To.y - From.y
    sqrt dx*dx + dy*dy

  .normalise = (From, To) ->
    dx = To.x - From.x
    dy = To.y - From.y
    dist = vector.distance From, To
    { dx: dx /dist,dy: dy /dist }

vector
