
gameStates = {}
gameStatesPath = "./gameState/"
loaded = {}
current_state = nil

getKeyOfValue = (tab, val) ->
  for k,v in pairs tab
    if v == val
      return k
  return nil

gameStates.stateEvent = (fname, ...) ->
  if current_state and type current_state[fname] == 'function'
    current_state[fname] ...

gameStates.setState = (sname, ...) ->
  gameStates.stateEvent 'exit'
  oldSname = getKeyOfValue loaded, current_state
  current_state = loaded[sname]
  if not current_state
    current_state = assert require gameStatesPath..sname
    loaded[sname] = current_state
    gameStates.stateEvent 'load', oldSname, ...
  gameStates.stateEvent 'enter', oldSname, ...

gameStates
