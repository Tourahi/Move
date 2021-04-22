import min from math
import max from math


class LevelManager
  new: (tm, p, lvlsPath) =>
    @tileM = tm
    @player = p
    @objects = {}
    @lvlsPath = lvlsPath
    @entities = {}
    @currentLevel = 1
    @initObjects!

  draw: () =>
    push\apply 'start'
    @tileM\draw!
    @player\draw!
    push\apply 'end'

  initObjects: () =>
    objs = @tileM.objects
    for k,o in pairs objs
      @objects[o.name] = o
    @player\setPos @objects["player"].x, @objects["player"].y

  update: (dt) =>
    @player\update dt, self

  isTileWalkable: (x, y) =>
    if x < 0 or y < 0
      return false
    return @tileM\isTileWalkable x, y


