--***************************************************************************
--*
--*  Event Registration Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param trig trigger
---@param timeout real
---@return event
function TriggerRegisterTimerEventPeriodic(trig, timeout)
	return TriggerRegisterTimerEvent(trig, timeout, true)
end

--===========================================================================
---@param trig trigger
---@param timeout real
---@return event
function TriggerRegisterTimerEventSingle(trig, timeout)
	return TriggerRegisterTimerEvent(trig, timeout, false)
end

--===========================================================================
---@param trig trigger
---@param t timer
---@return event
function TriggerRegisterTimerExpireEventBJ(trig, t)
	return TriggerRegisterTimerExpireEvent(trig, t)
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@param whichEvent playerunitevent
---@return event
function TriggerRegisterPlayerUnitEventSimple(trig, whichPlayer, whichEvent)
	return TriggerRegisterPlayerUnitEvent(trig, whichPlayer, whichEvent, nil)
end

--===========================================================================
---@param trig trigger
---@param whichEvent playerunitevent
function TriggerRegisterAnyUnitEventBJ(trig, whichEvent)
	---@type integer
	index = nil
	
	index = 0
	while true do
		TriggerRegisterPlayerUnitEvent(trig, Player(index), whichEvent, nil)
		
		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@param selected boolean
---@return event
function TriggerRegisterPlayerSelectionEventBJ(trig, whichPlayer, selected)
	if selected then
		return TriggerRegisterPlayerUnitEvent(trig, whichPlayer, EVENT_PLAYER_UNIT_SELECTED, nil)
	else
		return TriggerRegisterPlayerUnitEvent(trig, whichPlayer, EVENT_PLAYER_UNIT_DESELECTED, nil)
	end
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@param keType integer
---@param keKey integer
---@return event
function TriggerRegisterPlayerKeyEventBJ(trig, whichPlayer, keType, keKey)
	if (keType == bj_KEYEVENTTYPE_DEPRESS) then
		-- Depress event - find out what key
		if (keKey == bj_KEYEVENTKEY_LEFT) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_LEFT_DOWN)
		elseif (keKey == bj_KEYEVENTKEY_RIGHT) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_RIGHT_DOWN)
		elseif (keKey == bj_KEYEVENTKEY_DOWN) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_DOWN_DOWN)
		elseif (keKey == bj_KEYEVENTKEY_UP) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_UP_DOWN)
		else
			-- Unrecognized key - ignore the request and return failure.
			return nil
		end
	elseif (keType == bj_KEYEVENTTYPE_RELEASE) then
		-- Release event - find out what key
		if (keKey == bj_KEYEVENTKEY_LEFT) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_LEFT_UP)
		elseif (keKey == bj_KEYEVENTKEY_RIGHT) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_RIGHT_UP)
		elseif (keKey == bj_KEYEVENTKEY_DOWN) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_DOWN_UP)
		elseif (keKey == bj_KEYEVENTKEY_UP) then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_UP_UP)
		else
			-- Unrecognized key - ignore the request and return failure.
			return nil
		end
	else
		-- Unrecognized type - ignore the request and return failure.
		return nil
	end
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@param meType integer
---@return event
function TriggerRegisterPlayerMouseEventBJ(trig, whichPlayer, meType)
	if (meType == bj_MOUSEEVENTTYPE_DOWN) then
		-- Mouse down event
		return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_MOUSE_DOWN)
	elseif (meType == bj_MOUSEEVENTTYPE_UP) then
		-- Mouse up event
		return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_MOUSE_UP)
	elseif (meType == bj_MOUSEEVENTTYPE_MOVE) then
		-- Mouse move event
		return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_MOUSE_MOVE)
	else
		-- Unrecognized type - ignore the request and return failure.
		return nil
	end
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@return event
function TriggerRegisterPlayerEventVictory(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_VICTORY)
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@return event
function TriggerRegisterPlayerEventDefeat(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_DEFEAT)
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@return event
function TriggerRegisterPlayerEventLeave(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_LEAVE)
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@return event
function TriggerRegisterPlayerEventAllianceChanged(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ALLIANCE_CHANGED)
end

--===========================================================================
---@param trig trigger
---@param whichPlayer player
---@return event
function TriggerRegisterPlayerEventEndCinematic(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_END_CINEMATIC)
end

--===========================================================================
---@param trig trigger
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterGameStateEventTimeOfDay(trig, opcode, limitval)
	return TriggerRegisterGameStateEvent(trig, GAME_STATE_TIME_OF_DAY, opcode, limitval)
end

--===========================================================================
---@param trig trigger
---@param whichRegion region
---@return event
function TriggerRegisterEnterRegionSimple(trig, whichRegion)
	return TriggerRegisterEnterRegion(trig, whichRegion, nil)
end

--===========================================================================
---@param trig trigger
---@param whichRegion region
---@return event
function TriggerRegisterLeaveRegionSimple(trig, whichRegion)
	return TriggerRegisterLeaveRegion(trig, whichRegion, nil)
end

--===========================================================================
---@param trig trigger
---@param r rect
---@return event
function TriggerRegisterEnterRectSimple(trig, r)
	---@type region
	rectRegion = CreateRegion()
	RegionAddRect(rectRegion, r)
	return TriggerRegisterEnterRegion(trig, rectRegion, nil)
end

--===========================================================================
---@param trig trigger
---@param r rect
---@return event
function TriggerRegisterLeaveRectSimple(trig, r)
	---@type region
	rectRegion = CreateRegion()
	RegionAddRect(rectRegion, r)
	return TriggerRegisterLeaveRegion(trig, rectRegion, nil)
end

--===========================================================================
---@param trig trigger
---@param whichUnit unit
---@param condition boolexpr
---@param range real
---@return event
function TriggerRegisterDistanceBetweenUnits(trig, whichUnit, condition, range)
	return TriggerRegisterUnitInRange(trig, whichUnit, range, condition)
end

--===========================================================================
---@param trig trigger
---@param range real
---@param whichUnit unit
---@return event
function TriggerRegisterUnitInRangeSimple(trig, range, whichUnit)
	return TriggerRegisterUnitInRange(trig, whichUnit, range, nil)
end

--===========================================================================
---@param trig trigger
---@param whichUnit unit
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterUnitLifeEvent(trig, whichUnit, opcode, limitval)
	return TriggerRegisterUnitStateEvent(trig, whichUnit, UNIT_STATE_LIFE, opcode, limitval)
end

--===========================================================================
---@param trig trigger
---@param whichUnit unit
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterUnitManaEvent(trig, whichUnit, opcode, limitval)
	return TriggerRegisterUnitStateEvent(trig, whichUnit, UNIT_STATE_MANA, opcode, limitval)
end

--===========================================================================
---@param trig trigger
---@param whichDialog dialog
---@return event
function TriggerRegisterDialogEventBJ(trig, whichDialog)
	return TriggerRegisterDialogEvent(trig, whichDialog)
end

--===========================================================================
---@param trig trigger
---@return event
function TriggerRegisterShowSkillEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_SHOW_SKILL)
end

--===========================================================================
---@param trig trigger
---@return event
function TriggerRegisterBuildSubmenuEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_BUILD_SUBMENU)
end

--===========================================================================
---@param trig trigger
---@return event
function TriggerRegisterGameLoadedEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_LOADED)
end

--===========================================================================
---@param trig trigger
---@return event
function TriggerRegisterGameSavedEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_SAVE)
end

--===========================================================================
function RegisterDestDeathInRegionEnum()
	bj_destInRegionDiesCount = bj_destInRegionDiesCount + 1
	if (bj_destInRegionDiesCount <= bj_MAX_DEST_IN_REGION_EVENTS) then
		TriggerRegisterDeathEvent(bj_destInRegionDiesTrig, GetEnumDestructable())
	end
end

--===========================================================================
---@param trig trigger
---@param r rect
function TriggerRegisterDestDeathInRegionEvent(trig, r)
	bj_destInRegionDiesTrig  = trig
	bj_destInRegionDiesCount = 0
	EnumDestructablesInRect(r, nil, RegisterDestDeathInRegionEnum)
end