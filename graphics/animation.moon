DefaultStates = {
  "idle": {start:1, stop:1},
  "left": {start:1, stop:1},
  "right": {start:1, stop:1},
  "top": {start:1, stop:1},
  "bot": {start:1, stop:1},
  "move": {start:1, stop:1}
}

class Animation
  new: (updatesPerFrame, states) =>
    @frameStop = 1
    @states = states or DefaultStates
    @maxFrameDisplayTime = updatesPerFrame * (1/60)
    @currentFrameDispTime = 0
    @frameStart = 1
    @frameIndex = @frameStart

  -- game is the level for now
  update: (dt) =>
    @currentFrameDispTime += dt
    if @currentFrameDispTime > @maxFrameDisplayTime
      @currentFrameDispTime = 0
      @frameIndex += 1
    if @frameIndex > @frameStop
      @frameIndex = @frameStart

  updateState: (state) =>
    if @states[state]
      @frameStart = @states[state].start
      @frameIndex = @frameStart
      @frameStop = @states[state].stop
    else
      @frameStart = @states["idle"].start
      @frameIndex = @frameStart
      @frameStop = @states["idle"].stop

  frame: () =>
    @frameIndex
