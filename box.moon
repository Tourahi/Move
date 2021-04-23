

class Box
  new: (x , y, w, h) =>
    @x = x
    @y = y
    @w = w
    @h = h
    @xOffset = @w/2
    @yoffSet = @h/2


  axisOverlap: (min1, min2, max1, max2) =>
    (min1 < min2 and max1 > max2)

  -- o : the other box
  overlaps: (o) =>
    xAxisO = @axisOverlap @x, o.x, @x+@w, o.x+o.w
    yAxisO = @axisOverlap @y, o.y, @y+@h, o.y+o.h
    (xAxisO and yAxisO)

  update: (x, y) =>
    @x = x
    @y = y
