--============================================================================
-- Trigger Unit Based Event API
--============================================================================

-- returns handle to unit which triggered the most recent event when called from
-- within a trigger action function...returns null handle when used incorrectly

---@return unit
function GetTriggerUnit() end


---@param whichTrigger trigger
---@param whichUnit unit
---@param whichState unitstate
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterUnitStateEvent(whichTrigger, whichUnit, whichState, opcode, limitval) end


-- EVENT_UNIT_STATE_LIMIT
---@return unitstate
function GetEventUnitState() end


---@param whichTrigger trigger
---@param whichUnit unit
---@param whichEvent unitevent
---@return event
function TriggerRegisterUnitEvent(whichTrigger, whichUnit, whichEvent) end


-- EVENT_UNIT_DAMAGED
---@return real
function GetEventDamage() end

---@return unit
function GetEventDamageSource() end


-- EVENT_UNIT_DEATH
-- EVENT_UNIT_DECAY
-- Use the GetDyingUnit and GetDecayingUnit funcs above

-- EVENT_UNIT_DETECTED
---@return player
function GetEventDetectingPlayer() end


---@param whichTrigger trigger
---@param whichUnit unit
---@param whichEvent unitevent
---@param filter boolexpr
---@return event
function TriggerRegisterFilterUnitEvent(whichTrigger, whichUnit, whichEvent, filter) end


-- EVENT_UNIT_ACQUIRED_TARGET
-- EVENT_UNIT_TARGET_IN_RANGE
---@return unit
function GetEventTargetUnit() end


-- EVENT_UNIT_ATTACKED
-- Use GetAttacker from the Player Unit Event API Below...

-- EVENT_UNIT_RESCUEDED
-- Use GetRescuer from the Player Unit Event API Below...

-- EVENT_UNIT_CONSTRUCT_CANCEL
-- EVENT_UNIT_CONSTRUCT_FINISH

-- See the Player Unit Construction Event API above for event info funcs

-- EVENT_UNIT_TRAIN_START
-- EVENT_UNIT_TRAIN_CANCELLED
-- EVENT_UNIT_TRAIN_FINISH

-- See the Player Unit Training Event API above for event info funcs

-- EVENT_UNIT_SELL

-- See the Player Unit Sell Event API above for event info funcs

-- EVENT_UNIT_DROP_ITEM
-- EVENT_UNIT_PICKUP_ITEM
-- EVENT_UNIT_USE_ITEM
-- See the Player Unit/Item manipulation Event API above for event info funcs

-- EVENT_UNIT_ISSUED_ORDER
-- EVENT_UNIT_ISSUED_POINT_ORDER
-- EVENT_UNIT_ISSUED_TARGET_ORDER

-- See the Player Unit Order Event API above for event info funcs

---@param whichTrigger trigger
---@param whichUnit unit
---@param range real
---@param filter boolexpr
---@return event
function TriggerRegisterUnitInRange(whichTrigger, whichUnit, range, filter) end

---@param damage real
function BlzSetEventDamage(damage) end

---@return unit
function BlzGetEventDamageTarget() end

---@return attacktype
function BlzGetEventAttackType() end

---@return damagetype
function BlzGetEventDamageType() end

---@return weapontype
function BlzGetEventWeaponType() end

---@param attackType attacktype
---@return boolean
function BlzSetEventAttackType(attackType) end

---@param damageType damagetype
---@return boolean
function BlzSetEventDamageType(damageType) end

---@param weaponType weapontype
---@return boolean
function BlzSetEventWeaponType(weaponType) end