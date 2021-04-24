import min from math
import max from math
import insert from table
import remove from table
Entity = assert require "entity"
Box = assert require "box"
Missle = assert require "actions.missle"

class LevelManager
  new: (tm, p, lvlsPath) =>
    @tileM = tm
    @player = p
    @objects = {}
    @lvlsPath = lvlsPath
    @entities = {}
    @currentLevel = 1
    @initObjects!
    insert @entities, Missle.create 100,100,100

  draw: () =>
    Push\apply 'start'
    @tileM\draw!
    for _,ent in pairs @entities
      ent\draw!
    @player\draw!
    Push\apply 'end'

  addEntity: (ent) =>
    insert @entities, ent


  initObjects: () =>
    objs = @tileM.objects
    for k,o in pairs objs
      @objects[o.name] = o
    @player\setPos @objects["player"].x, @objects["player"].y
    B\watch "NumOfTiledObjects",-> #@tileM.objects

  update: (dt) =>
    @player\update dt, self
    for _,ent in pairs @entities
      if ent.dead
        @entities[_] = nil
        break
      ent\collisionCheck @player, self
      for _,oent in pairs @entities
        ent\collisionCheck oent, self
      ent\update dt


  isTileWalkable: (x, y) =>
    return @tileM\isTileWalkable x, y

  resize: (w,h) =>
    Push\resize(w, h)


