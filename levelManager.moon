import min from math
import max from math
Entity = assert require "entity"
Box = assert require "box"

class LevelManager
  new: (tm, p, lvlsPath) =>
    @tileM = tm
    @player = p
    @objects = {}
    @lvlsPath = lvlsPath
    @entities = {}
    @currentLevel = 1
    @initObjects!
    @testEnt = Entity "test", nil, 100, 100,
      nil, nil, nil,
      Box 120, 120, 10, 10

  draw: () =>
    Push\apply 'start'
    @tileM\draw!
    @testEnt\draw!
    @player\draw!
    Push\apply 'end'


  initObjects: () =>
    objs = @tileM.objects
    for k,o in pairs objs
      @objects[o.name] = o
    @player\setPos @objects["player"].x, @objects["player"].y
    B\watch "NumOfTiledObjects",-> #@tileM.objects

  update: (dt) =>
    @player\update dt, self
    @testEnt\collisionCheck @player.cBox, self


  isTileWalkable: (x, y) =>
    return @tileM\isTileWalkable x, y

  resize: (w,h) =>
    Push\resize(w, h)


