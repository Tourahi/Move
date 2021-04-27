
class Animation
  new: (updatesPerFrame) =>
    @frames = 1
    @maxFrameDisplayTime = updatesPerFrame * (1/60)
    @currentFrameDispTime = 0
    @frameStart = 1
    @frameIndex = @frameStart

  -- game is the level for now
  update: (dt) =>
    print
    @currentFrameDispTime += dt
    if @currentFrameDispTime > @maxFrameDisplayTime
      @currentFrameDispTime = 0
      @frameIndex += 1
    if @frameIndex > @frames
      @frameIndex = @frameStart

  updateState: (state) =>
    @frameStart = state.start
    @frameIndex = @frameStart
    @frames = state.stop

  frame: () =>
    @frameIndex
