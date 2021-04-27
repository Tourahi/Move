import min from math
import max from math
import insert from table
import remove from table
Entity = assert require "entity"
Box = assert require "box"
Petard = assert require "mobs.petard"
Spawner = assert require "spawner"

class LevelManager
  new: (tm, lvlsPath) =>
    @tileM = tm
    @player = {}
    @objects = {}
    @lvlsPath = lvlsPath
    @entities = {}
    @currentLevel = 1
    Spawner.spawn self, @tileM.objects

  draw: () =>
    Push\start!
    @tileM\draw!
    for _,ent in pairs @entities
      ent\draw!
    Push\finish!

  addEntity: (ent) =>
    insert @entities, ent

  updateEntities: (dt) =>
    for _,ent in pairs @entities
      if ent.dead
        @entities[_] = nil
        break
      for _,oent in pairs @entities
        if ent.collisionCheck
          ent\collisionCheck oent, self
      ent\update dt, self

  update: (dt) =>
    @updateEntities dt


  isTileWalkable: (x, y) =>
    return @tileM\isTileWalkable x, y

  resize: (w,h) =>
    Push\resize(w, h)


