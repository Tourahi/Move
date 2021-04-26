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
    @entities = { @player }
    @currentLevel = 1
    @initObjects!
    insert @entities, Petard.create 100,100,40
    insert @entities, Petard.create 120,110,40
    insert @entities, Petard.create 140,120,40

  draw: () =>
    Push\start!
    @tileM\draw!
    for _,ent in pairs @entities
      ent\draw!
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


