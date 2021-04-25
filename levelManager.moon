import min from math
import max from math
import insert from table
import remove from table
Entity = assert require "entity"
Box = assert require "box"
Petard = assert require "mobs.petard"

class LevelManager
  new: (tm, p, lvlsPath) =>
    @tileM = tm
    @player = p
    @objects = {}
    @lvlsPath = lvlsPath
    @entities = {}
    @currentLevel = 1
    @initObjects!
    insert @entities, Petard.create 100,101,40
    insert @entities, Petard.create 110,102,40
    insert @entities, Petard.create 120,103,40

  draw: () =>
    Push\start!
    @tileM\draw!
    for _,ent in pairs @entities
      ent\draw!
    @player\draw!
    Push\finish!

  addEntity: (ent) =>
    insert @entities, ent


  initObjects: () =>
    objs = @tileM.objects
    for k,o in pairs objs
      @objects[o.name] = o
    @player\setPos @objects["player"].x, @objects["player"].y
    B\watch "NumOfTiledObjects",-> #@tileM.objects
    B\watch "NumOfEntities",-> #@entities

  update: (dt) =>
    @player\update dt, self
    for _,ent in pairs @entities
      if ent.dead
        @entities[_] = nil
        break
      ent\collisionCheck @player, self
      for _,oent in pairs @entities
        ent\collisionCheck oent, self
      ent\update dt, self


  isTileWalkable: (x, y) =>
    return @tileM\isTileWalkable x, y

  resize: (w,h) =>
    Push\resize(w, h)


