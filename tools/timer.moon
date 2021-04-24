Ltimer = love.timer

class Timer
  new: (duration, onDone) =>
    @duration = duration
    @onDone = onDone
    @time = 0

  ticks: (frames) =>
    frames * Ltimer.getFPS!

  tick: (owner, game, dt) =>
    @time += 1 * dt
    if @time >= @duration
      @onDone owner, game
      owner\removeTimer!

