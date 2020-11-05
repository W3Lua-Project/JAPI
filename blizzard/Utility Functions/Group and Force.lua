--***************************************************************************
--*
--*  Group and Force Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param whichGroup group
---@param callback code
function ForGroupBJ(whichGroup, callback)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy         = bj_wantDestroyGroup
	bj_wantDestroyGroup = false
	
	ForGroup(whichGroup, callback)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(whichGroup)
	end
end

--===========================================================================
---@param whichUnit unit
---@param whichGroup group
function GroupAddUnitSimple(whichUnit, whichGroup)
	GroupAddUnit(whichGroup, whichUnit)
end

--===========================================================================
---@param whichUnit unit
---@param whichGroup group
function GroupRemoveUnitSimple(whichUnit, whichGroup)
	GroupRemoveUnit(whichGroup, whichUnit)
end

--===========================================================================
function GroupAddGroupEnum()
	GroupAddUnit(bj_groupAddGroupDest, GetEnumUnit())
end

--===========================================================================
---@param sourceGroup group
---@param destGroup group
function GroupAddGroup(sourceGroup, destGroup)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy          = bj_wantDestroyGroup
	bj_wantDestroyGroup  = false
	
	bj_groupAddGroupDest = destGroup
	ForGroup(sourceGroup, GroupAddGroupEnum)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(sourceGroup)
	end
end

--===========================================================================
function GroupRemoveGroupEnum()
	GroupRemoveUnit(bj_groupRemoveGroupDest, GetEnumUnit())
end

--===========================================================================
---@param sourceGroup group
---@param destGroup group
function GroupRemoveGroup(sourceGroup, destGroup)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy             = bj_wantDestroyGroup
	bj_wantDestroyGroup     = false
	
	bj_groupRemoveGroupDest = destGroup
	ForGroup(sourceGroup, GroupRemoveGroupEnum)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(sourceGroup)
	end
end

--===========================================================================
---@param whichPlayer player
---@param whichForce force
function ForceAddPlayerSimple(whichPlayer, whichForce)
	ForceAddPlayer(whichForce, whichPlayer)
end

--===========================================================================
---@param whichPlayer player
---@param whichForce force
function ForceRemovePlayerSimple(whichPlayer, whichForce)
	ForceRemovePlayer(whichForce, whichPlayer)
end

--===========================================================================
-- Consider each unit, one at a time, keeping a "current pick".   Once all units
-- are considered, this "current pick" will be the resulting random unit.
--
-- The chance of picking a given unit over the "current pick" is 1/N, where N is
-- the number of units considered thusfar (including the current consideration).
--
function GroupPickRandomUnitEnum()
	bj_groupRandomConsidered = bj_groupRandomConsidered + 1
	if (GetRandomInt(1, bj_groupRandomConsidered) == 1) then
		bj_groupRandomCurrentPick = GetEnumUnit()
	end
end

--===========================================================================
-- Picks a random unit from a group.
--
---@param whichGroup group
---@return unit
function GroupPickRandomUnit(whichGroup)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy               = bj_wantDestroyGroup
	bj_wantDestroyGroup       = false
	
	bj_groupRandomConsidered  = 0
	bj_groupRandomCurrentPick = nil
	ForGroup(whichGroup, GroupPickRandomUnitEnum)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(whichGroup)
	end
	return bj_groupRandomCurrentPick
end

--===========================================================================
-- See GroupPickRandomUnitEnum for the details of this algorithm.
--
function ForcePickRandomPlayerEnum()
	bj_forceRandomConsidered = bj_forceRandomConsidered + 1
	if (GetRandomInt(1, bj_forceRandomConsidered) == 1) then
		bj_forceRandomCurrentPick = GetEnumPlayer()
	end
end

--===========================================================================
-- Picks a random player from a force.
--
---@param whichForce force
---@return player
function ForcePickRandomPlayer(whichForce)
	bj_forceRandomConsidered  = 0
	bj_forceRandomCurrentPick = nil
	ForForce(whichForce, ForcePickRandomPlayerEnum)
	return bj_forceRandomCurrentPick
end

--===========================================================================
---@param whichPlayer player
---@param enumFilter boolexpr
---@param enumAction code
function EnumUnitsSelected(whichPlayer, enumFilter, enumAction)
	---@type group
	g = CreateGroup()
	SyncSelections()
	GroupEnumUnitsSelected(g, whichPlayer, enumFilter)
	DestroyBoolExpr(enumFilter)
	ForGroup(g, enumAction)
	DestroyGroup(g)
end

--===========================================================================
---@param r rect
---@param filter boolexpr
---@return group
function GetUnitsInRectMatching(r, filter)
	---@type group
	g = CreateGroup()
	GroupEnumUnitsInRect(g, r, filter)
	DestroyBoolExpr(filter)
	return g
end

--===========================================================================
---@param r rect
---@return group
function GetUnitsInRectAll(r)
	return GetUnitsInRectMatching(r, nil)
end

--===========================================================================
---@return boolean
function GetUnitsInRectOfPlayerFilter()
	return GetOwningPlayer(GetFilterUnit()) == bj_groupEnumOwningPlayer
end

--===========================================================================
---@param r rect
---@param whichPlayer player
---@return group
function GetUnitsInRectOfPlayer(r, whichPlayer)
	---@type group
	g                        = CreateGroup()
	bj_groupEnumOwningPlayer = whichPlayer
	GroupEnumUnitsInRect(g, r, filterGetUnitsInRectOfPlayer)
	return g
end

--===========================================================================
---@param radius real
---@param whichLocation location
---@param filter boolexpr
---@return group
function GetUnitsInRangeOfLocMatching(radius, whichLocation, filter)
	---@type group
	g = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
	DestroyBoolExpr(filter)
	return g
end

--===========================================================================
---@param radius real
---@param whichLocation location
---@return group
function GetUnitsInRangeOfLocAll(radius, whichLocation)
	return GetUnitsInRangeOfLocMatching(radius, whichLocation, nil)
end

--===========================================================================
---@return boolean
function GetUnitsOfTypeIdAllFilter()
	return GetUnitTypeId(GetFilterUnit()) == bj_groupEnumTypeId
end

--===========================================================================
---@param unitid integer
---@return group
function GetUnitsOfTypeIdAll(unitid)
	---@type group
	result = CreateGroup()
	---@type group
	g      = CreateGroup()
	---@type integer
	index  = nil
	
	index  = 0
	while true do
		bj_groupEnumTypeId = unitid
		GroupClear(g)
		GroupEnumUnitsOfPlayer(g, Player(index), filterGetUnitsOfTypeIdAll)
		GroupAddGroup(g, result)
		
		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
	DestroyGroup(g)
	
	return result
end

--===========================================================================
---@param whichPlayer player
---@param filter boolexpr
---@return group
function GetUnitsOfPlayerMatching(whichPlayer, filter)
	---@type group
	g = CreateGroup()
	GroupEnumUnitsOfPlayer(g, whichPlayer, filter)
	DestroyBoolExpr(filter)
	return g
end

--===========================================================================
---@param whichPlayer player
---@return group
function GetUnitsOfPlayerAll(whichPlayer)
	return GetUnitsOfPlayerMatching(whichPlayer, nil)
end

--===========================================================================
---@return boolean
function GetUnitsOfPlayerAndTypeIdFilter()
	return GetUnitTypeId(GetFilterUnit()) == bj_groupEnumTypeId
end

--===========================================================================
---@param whichPlayer player
---@param unitid integer
---@return group
function GetUnitsOfPlayerAndTypeId(whichPlayer, unitid)
	---@type group
	g                  = CreateGroup()
	bj_groupEnumTypeId = unitid
	GroupEnumUnitsOfPlayer(g, whichPlayer, filterGetUnitsOfPlayerAndTypeId)
	return g
end

--===========================================================================
---@param whichPlayer player
---@return group
function GetUnitsSelectedAll(whichPlayer)
	---@type group
	g = CreateGroup()
	SyncSelections()
	GroupEnumUnitsSelected(g, whichPlayer, nil)
	return g
end

--===========================================================================
---@param whichPlayer player
---@return force
function GetForceOfPlayer(whichPlayer)
	---@type force
	f = CreateForce()
	ForceAddPlayer(f, whichPlayer)
	return f
end

--===========================================================================
---@return force
function GetPlayersAll()
	return bj_FORCE_ALL_PLAYERS
end

--===========================================================================
---@param whichControl mapcontrol
---@return force
function GetPlayersByMapControl(whichControl)
	---@type force
	f           = CreateForce()
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		if GetPlayerController(indexPlayer) == whichControl then
			ForceAddPlayer(f, indexPlayer)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYER_SLOTS then break end
	end
	
	return f
end

--===========================================================================
---@param whichPlayer player
---@return force
function GetPlayersAllies(whichPlayer)
	---@type force
	f = CreateForce()
	ForceEnumAllies(f, whichPlayer, nil)
	return f
end

--===========================================================================
---@param whichPlayer player
---@return force
function GetPlayersEnemies(whichPlayer)
	---@type force
	f = CreateForce()
	ForceEnumEnemies(f, whichPlayer, nil)
	return f
end

--===========================================================================
---@param filter boolexpr
---@return force
function GetPlayersMatching(filter)
	---@type force
	f = CreateForce()
	ForceEnumPlayers(f, filter)
	DestroyBoolExpr(filter)
	return f
end

--===========================================================================
function CountUnitsInGroupEnum()
	bj_groupCountUnits = bj_groupCountUnits + 1
end

--===========================================================================
---@param g group
---@return integer
function CountUnitsInGroup(g)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy         = bj_wantDestroyGroup
	bj_wantDestroyGroup = false
	
	bj_groupCountUnits  = 0
	ForGroup(g, CountUnitsInGroupEnum)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(g)
	end
	return bj_groupCountUnits
end

--===========================================================================
function CountPlayersInForceEnum()
	bj_forceCountPlayers = bj_forceCountPlayers + 1
end

--===========================================================================
---@param f force
---@return integer
function CountPlayersInForceBJ(f)
	bj_forceCountPlayers = 0
	ForForce(f, CountPlayersInForceEnum)
	return bj_forceCountPlayers
end

--===========================================================================
function GetRandomSubGroupEnum()
	if (bj_randomSubGroupWant > 0) then
		if (bj_randomSubGroupWant >= bj_randomSubGroupTotal) or (GetRandomReal(0, 1) < bj_randomSubGroupChance) then
			-- We either need every remaining unit, or the unit passed its chance check.
			GroupAddUnit(bj_randomSubGroupGroup, GetEnumUnit())
			bj_randomSubGroupWant = bj_randomSubGroupWant - 1
		end
	end
	bj_randomSubGroupTotal = bj_randomSubGroupTotal - 1
end

--===========================================================================
---@param count integer
---@param sourceGroup group
---@return group
function GetRandomSubGroup(count, sourceGroup)
	---@type group
	g                      = CreateGroup()
	
	bj_randomSubGroupGroup = g
	bj_randomSubGroupWant  = count
	bj_randomSubGroupTotal = CountUnitsInGroup(sourceGroup)
	
	if (bj_randomSubGroupWant <= 0 or bj_randomSubGroupTotal <= 0) then
		return g
	end
	
	bj_randomSubGroupChance = I2R(bj_randomSubGroupWant) / I2R(bj_randomSubGroupTotal)
	ForGroup(sourceGroup, GetRandomSubGroupEnum)
	return g
end

--===========================================================================
---@return boolean
function LivingPlayerUnitsOfTypeIdFilter()
	---@type unit
	filterUnit = GetFilterUnit()
	return IsUnitAliveBJ(filterUnit) and GetUnitTypeId(filterUnit) == bj_livingPlayerUnitsTypeId
end

--===========================================================================
---@param unitId integer
---@param whichPlayer player
---@return integer
function CountLivingPlayerUnitsOfTypeId(unitId, whichPlayer)
	---@type group
	g                          = nil
	---@type integer
	matchedCount               = nil
	
	g                          = CreateGroup()
	bj_livingPlayerUnitsTypeId = unitId
	GroupEnumUnitsOfPlayer(g, whichPlayer, filterLivingPlayerUnitsOfTypeId)
	matchedCount = CountUnitsInGroup(g)
	DestroyGroup(g)
	
	return matchedCount
end