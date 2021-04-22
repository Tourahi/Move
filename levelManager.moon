import min from math
import max from math


class LevelManager
  new: (tm, p, lvlsPath) =>
    @tileM = tm
    @player = p
    @lvlsPath = lvlsPath
    @entities = {}
    @currentLevel = 1

  draw: () =>
    push\apply 'start'
    @tileM\draw!
    @player\draw!
    push\apply 'end'

  update: (dt) =>
    @player\update dt, self

  isTileWalkable: (x, y) =>
    if x < 0 or y < 0
      return false
    return @tileM\isTileWalkable x, y


