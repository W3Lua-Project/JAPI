--***************************************************************************
--*
--*  Melee Template Clear Start Locations
--*
--***************************************************************************

--===========================================================================
function MeleeClearExcessUnit()
	---@type unit
	theUnit = GetEnumUnit()
	---@type integer
	owner   = GetPlayerId(GetOwningPlayer(theUnit))
	
	if (owner == PLAYER_NEUTRAL_AGGRESSIVE) then
		-- Remove any Neutral Hostile units from the area.
		RemoveUnit(GetEnumUnit())
	elseif (owner == PLAYER_NEUTRAL_PASSIVE) then
		-- Remove non-structure Neutral Passive units from the area.
		if not IsUnitType(theUnit, UNIT_TYPE_STRUCTURE) then
			RemoveUnit(GetEnumUnit())
		end
	end
end

--===========================================================================
---@param x real
---@param y real
---@param range real
function MeleeClearNearbyUnits(x, y, range)
	---@type group
	nearbyUnits = nil
	
	nearbyUnits = CreateGroup()
	GroupEnumUnitsInRange(nearbyUnits, x, y, range, nil)
	ForGroup(nearbyUnits, MeleeClearExcessUnit)
	DestroyGroup(nearbyUnits)
end

--===========================================================================
function MeleeClearExcessUnits()
	---@type integer
	index       = nil
	---@type real
	locX        = nil
	---@type real
	locY        = nil
	---@type player
	indexPlayer = nil
	
	index       = 0
	while true do
		indexPlayer = Player(index)
		
		-- If the player slot is being used, clear any nearby creeps.
		if (GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING) then
			locX = GetStartLocationX(GetPlayerStartLocation(indexPlayer))
			locY = GetStartLocationY(GetPlayerStartLocation(indexPlayer))
			
			MeleeClearNearbyUnits(locX, locY, bj_MELEE_CLEAR_UNITS_RADIUS)
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end