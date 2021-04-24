local gameStates = { }
local gameStatesPath = "./gameStates/"
local loaded = { }
local current_state = nil
local getKeyOfValue
getKeyOfValue = function(tab, val)
  for k, v in pairs(tab) do
    if v == val then
      return k
    end
  end
  return nil
end
gameStates.stateEvent = function(fname, ...)
  if current_state and type(current_state[fname] == 'function') then
    return current_state[fname](...)
  end
end
gameStates.setState = function(sname, ...)
  gameStates.stateEvent('exit')
  local oldSname = getKeyOfValue(loaded, current_state)
  current_state = loaded(sname)
  if not current_state then
    current_state = assert(require(gameStatesPath .. sname))
    loaded[sname] = current_state
    gameStates.stateEvent('load', oldSname, ...)
  end
  return gameStates.stateEvent('enter', oldSname, ...)
end
return gameStates
