--============================================================================
-- Native trigger interface
--
---@return trigger
function CreateTrigger() end

---@param whichTrigger trigger
function DestroyTrigger(whichTrigger) end

---@param whichTrigger trigger
function ResetTrigger(whichTrigger) end

---@param whichTrigger trigger
function EnableTrigger(whichTrigger) end

---@param whichTrigger trigger
function DisableTrigger(whichTrigger) end

---@param whichTrigger trigger
---@return boolean
function IsTriggerEnabled(whichTrigger) end


---@param whichTrigger trigger
---@param flag boolean
function TriggerWaitOnSleeps(whichTrigger, flag) end

---@param whichTrigger trigger
---@return boolean
function IsTriggerWaitOnSleeps(whichTrigger) end


---@return unit
function GetFilterUnit() end

---@return unit
function GetEnumUnit() end


---@return destructable
function GetFilterDestructable() end

---@return destructable
function GetEnumDestructable() end


---@return item
function GetFilterItem() end

---@return item
function GetEnumItem() end


---@return player
function GetFilterPlayer() end

---@return player
function GetEnumPlayer() end


---@return trigger
function GetTriggeringTrigger() end

---@return eventid
function GetTriggerEventId() end

---@param whichTrigger trigger
---@return integer
function GetTriggerEvalCount(whichTrigger) end

---@param whichTrigger trigger
---@return integer
function GetTriggerExecCount(whichTrigger) end


---@param funcName string
function ExecuteFunc(funcName) end

---@param whichTrigger trigger
---@param condition boolexpr
---@return triggercondition
function TriggerAddCondition(whichTrigger, condition) end

---@param whichTrigger trigger
---@param whichCondition triggercondition
function TriggerRemoveCondition(whichTrigger, whichCondition) end

---@param whichTrigger trigger
function TriggerClearConditions(whichTrigger) end


---@param whichTrigger trigger
---@param actionFunc code
---@return triggeraction
function TriggerAddAction(whichTrigger, actionFunc) end

---@param whichTrigger trigger
---@param whichAction triggeraction
function TriggerRemoveAction(whichTrigger, whichAction) end

---@param whichTrigger trigger
function TriggerClearActions(whichTrigger) end

---@param timeout real
function TriggerSleepAction(timeout) end

---@param s sound
---@param offset real
function TriggerWaitForSound(s, offset) end

---@param whichTrigger trigger
---@return boolean
function TriggerEvaluate(whichTrigger) end

---@param whichTrigger trigger
function TriggerExecute(whichTrigger) end

---@param whichTrigger trigger
function TriggerExecuteWait(whichTrigger) end

function TriggerSyncStart() end

function TriggerSyncReady() end