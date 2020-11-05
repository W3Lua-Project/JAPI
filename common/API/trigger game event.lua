--============================================================================
-- Trigger Game Event API
--============================================================================

---@param whichTrigger trigger
---@param varName string
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterVariableEvent(whichTrigger, varName, opcode, limitval) end


-- EVENT_GAME_VARIABLE_LIMIT
--  string GetTriggeringVariableName takes nothing returns string

-- Creates it's own timer and triggers when it expires
---@param whichTrigger trigger
---@param timeout real
---@param periodic boolean
---@return event
function TriggerRegisterTimerEvent(whichTrigger, timeout, periodic) end


-- Triggers when the timer you tell it about expires
---@param whichTrigger trigger
---@param t timer
---@return event
function TriggerRegisterTimerExpireEvent(whichTrigger, t) end


---@param whichTrigger trigger
---@param whichState gamestate
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterGameStateEvent(whichTrigger, whichState, opcode, limitval) end


---@param whichTrigger trigger
---@param whichDialog dialog
---@return event
function TriggerRegisterDialogEvent(whichTrigger, whichDialog) end

---@param whichTrigger trigger
---@param whichButton button
---@return event
function TriggerRegisterDialogButtonEvent(whichTrigger, whichButton) end


--  EVENT_GAME_STATE_LIMIT
---@return gamestate
function GetEventGameState() end


---@param whichTrigger trigger
---@param whichGameEvent gameevent
---@return event
function TriggerRegisterGameEvent(whichTrigger, whichGameEvent) end


-- EVENT_GAME_VICTORY
---@return player
function GetWinningPlayer() end



---@param whichTrigger trigger
---@param whichRegion region
---@param filter boolexpr
---@return event
function TriggerRegisterEnterRegion(whichTrigger, whichRegion, filter) end


-- EVENT_GAME_ENTER_REGION
---@return region
function GetTriggeringRegion() end

---@return unit
function GetEnteringUnit() end


-- EVENT_GAME_LEAVE_REGION

---@param whichTrigger trigger
---@param whichRegion region
---@param filter boolexpr
---@return event
function TriggerRegisterLeaveRegion(whichTrigger, whichRegion, filter) end

---@return unit
function GetLeavingUnit() end


---@param whichTrigger trigger
---@param t trackable
---@return event
function TriggerRegisterTrackableHitEvent(whichTrigger, t) end

---@param whichTrigger trigger
---@param t trackable
---@return event
function TriggerRegisterTrackableTrackEvent(whichTrigger, t) end


-- EVENT_GAME_TRACKABLE_HIT
-- EVENT_GAME_TRACKABLE_TRACK
---@return trackable
function GetTriggeringTrackable() end


-- EVENT_DIALOG_BUTTON_CLICK
---@return button
function GetClickedButton() end

---@return dialog
function GetClickedDialog() end


-- EVENT_GAME_TOURNAMENT_FINISH_SOON
---@return real
function GetTournamentFinishSoonTimeRemaining() end

---@return integer
function GetTournamentFinishNowRule() end

---@return player
function GetTournamentFinishNowPlayer() end

---@param whichPlayer player
---@return integer
function GetTournamentScore(whichPlayer) end


-- EVENT_GAME_SAVE
---@return string
function GetSaveBasicFilename() end