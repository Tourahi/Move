
class Animation
  new: (frames, updatesPerFrame) =>
    @frames = frames
    @maxFrameDisplayTime = updatesPerFrame * (1/60)
    @currentFrameDispTime = 0
    @frameIndex = 1

  -- game is the level for now
  update: (dt, game) =>
    @currentFrameDispTime += dt
    if @currentFrameDispTime > @maxFrameDisplayTime
      @currentFrameDispTime = 0
      @frameIndex += 1
    if @frameIndex > @frames
      @frameIndex = 1

  frame: () =>
    @frameIndex
