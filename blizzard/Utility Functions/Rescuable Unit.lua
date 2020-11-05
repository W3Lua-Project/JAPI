--***************************************************************************
--*
--*  Rescuable Unit Utility Functions
--*
--***************************************************************************

--===========================================================================
-- Rescues a unit for a player.  This performs the default rescue behavior,
-- including a rescue sound, flashing selection circle, ownership change,
-- and optionally a unit color change.
--
---@param whichUnit unit
---@param rescuer player
---@param changeColor boolean
function RescueUnitBJ(whichUnit, rescuer, changeColor)
	if IsUnitDeadBJ(whichUnit) or (GetOwningPlayer(whichUnit) == rescuer) then
		return
	end
	
	StartSound(bj_rescueSound)
	SetUnitOwner(whichUnit, rescuer, changeColor)
	UnitAddIndicator(whichUnit, 0, 255, 0, 255)
	PingMinimapForPlayer(rescuer, GetUnitX(whichUnit), GetUnitY(whichUnit), bj_RESCUE_PING_TIME)
end

--===========================================================================
function TriggerActionUnitRescuedBJ()
	---@type unit
	theUnit = GetTriggerUnit()
	
	if IsUnitType(theUnit, UNIT_TYPE_STRUCTURE) then
		RescueUnitBJ(theUnit, GetOwningPlayer(GetRescuer()), bj_rescueChangeColorBldg)
	else
		RescueUnitBJ(theUnit, GetOwningPlayer(GetRescuer()), bj_rescueChangeColorUnit)
	end
end

--===========================================================================
-- Attempt to init triggers for default rescue behavior.  For performance
-- reasons, this should only be attempted if a player is set to Rescuable,
-- or if a specific unit is thus flagged.
--
function TryInitRescuableTriggersBJ()
	---@type integer
	index = nil
	
	if (bj_rescueUnitBehavior == nil) then
		bj_rescueUnitBehavior = CreateTrigger()
		index                 = 0
		while true do
			TriggerRegisterPlayerUnitEvent(bj_rescueUnitBehavior, Player(index), EVENT_PLAYER_UNIT_RESCUED, nil)
			index = index + 1
			if index == bj_MAX_PLAYER_SLOTS then break end
		end
		TriggerAddAction(bj_rescueUnitBehavior, TriggerActionUnitRescuedBJ)
	end
end

--===========================================================================
-- Determines whether or not rescued units automatically change color upon
-- being rescued.
--
---@param changeColor boolean
function SetRescueUnitColorChangeBJ(changeColor)
	bj_rescueChangeColorUnit = changeColor
end

--===========================================================================
-- Determines whether or not rescued buildings automatically change color
-- upon being rescued.
--
---@param changeColor boolean
function SetRescueBuildingColorChangeBJ(changeColor)
	bj_rescueChangeColorBldg = changeColor
end

--===========================================================================
function MakeUnitRescuableToForceBJEnum()
	TryInitRescuableTriggersBJ()
	SetUnitRescuable(bj_makeUnitRescuableUnit, GetEnumPlayer(), bj_makeUnitRescuableFlag)
end

--===========================================================================
---@param whichUnit unit
---@param isRescuable boolean
---@param whichForce force
function MakeUnitRescuableToForceBJ(whichUnit, isRescuable, whichForce)
	-- Flag the unit as rescuable/unrescuable for the appropriate players.
	bj_makeUnitRescuableUnit = whichUnit
	bj_makeUnitRescuableFlag = isRescuable
	ForForce(whichForce, MakeUnitRescuableToForceBJEnum)
end

--===========================================================================
function InitRescuableBehaviorBJ()
	---@type integer
	index = nil
	
	index = 0
	while true do
		-- If at least one player slot is "Rescuable"-controlled, init the
		-- rescue behavior triggers.
		if (GetPlayerController(Player(index)) == MAP_CONTROL_RESCUABLE) then
			TryInitRescuableTriggersBJ()
			return
		end
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end