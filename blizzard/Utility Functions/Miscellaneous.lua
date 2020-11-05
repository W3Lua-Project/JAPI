--***************************************************************************
--*
--*  Miscellaneous Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param whichPlayer player
---@return real
function GetPlayerStartLocationX(whichPlayer)
	return GetStartLocationX(GetPlayerStartLocation(whichPlayer))
end

--===========================================================================
---@param whichPlayer player
---@return real
function GetPlayerStartLocationY(whichPlayer)
	return GetStartLocationY(GetPlayerStartLocation(whichPlayer))
end

--===========================================================================
---@param whichPlayer player
---@return location
function GetPlayerStartLocationLoc(whichPlayer)
	return GetStartLocationLoc(GetPlayerStartLocation(whichPlayer))
end

--===========================================================================
---@param whichRect rect
---@return location
function GetRectCenter(whichRect)
	return Location(GetRectCenterX(whichRect), GetRectCenterY(whichRect))
end

--===========================================================================
---@param whichPlayer player
---@param whichState playerslotstate
---@return boolean
function IsPlayerSlotState(whichPlayer, whichState)
	return GetPlayerSlotState(whichPlayer) == whichState
end

--===========================================================================
---@param seconds real
---@return integer
function GetFadeFromSeconds(seconds)
	if (seconds ~= 0) then
		return 128 / R2I(seconds)
	end
	return 10000
end

--===========================================================================
---@param seconds real
---@return real
function GetFadeFromSecondsAsReal(seconds)
	if (seconds ~= 0) then
		return 128.00 / seconds
	end
	return 10000.00
end

--===========================================================================
---@param whichPlayer player
---@param whichPlayerState playerstate
---@param delta integer
function AdjustPlayerStateSimpleBJ(whichPlayer, whichPlayerState, delta)
	SetPlayerState(whichPlayer, whichPlayerState, GetPlayerState(whichPlayer, whichPlayerState) + delta)
end

--===========================================================================
---@param delta integer
---@param whichPlayer player
---@param whichPlayerState playerstate
function AdjustPlayerStateBJ(delta, whichPlayer, whichPlayerState)
	-- If the change was positive, apply the difference to the player's
	-- gathered resources property as well.
	if (delta > 0) then
		if (whichPlayerState == PLAYER_STATE_RESOURCE_GOLD) then
			AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_GOLD_GATHERED, delta)
		elseif (whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER) then
			AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_LUMBER_GATHERED, delta)
		end
	end
	
	AdjustPlayerStateSimpleBJ(whichPlayer, whichPlayerState, delta)
end

--===========================================================================
---@param whichPlayer player
---@param whichPlayerState playerstate
---@param value integer
function SetPlayerStateBJ(whichPlayer, whichPlayerState, value)
	---@type integer
	oldValue = GetPlayerState(whichPlayer, whichPlayerState)
	AdjustPlayerStateBJ(value - oldValue, whichPlayer, whichPlayerState)
end

--===========================================================================
---@param whichPlayerFlag playerstate
---@param flag boolean
---@param whichPlayer player
function SetPlayerFlagBJ(whichPlayerFlag, flag, whichPlayer)
	SetPlayerState(whichPlayer, whichPlayerFlag, IntegerTertiaryOp(flag, 1, 0))
end

--===========================================================================
---@param rate integer
---@param whichResource playerstate
---@param sourcePlayer player
---@param otherPlayer player
function SetPlayerTaxRateBJ(rate, whichResource, sourcePlayer, otherPlayer)
	SetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource, rate)
end

--===========================================================================
---@param whichResource playerstate
---@param sourcePlayer player
---@param otherPlayer player
---@return integer
function GetPlayerTaxRateBJ(whichResource, sourcePlayer, otherPlayer)
	return GetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource)
end

--===========================================================================
---@param whichPlayerFlag playerstate
---@param whichPlayer player
---@return boolean
function IsPlayerFlagSetBJ(whichPlayerFlag, whichPlayer)
	return GetPlayerState(whichPlayer, whichPlayerFlag) == 1
end

--===========================================================================
---@param delta integer
---@param whichUnit unit
function AddResourceAmountBJ(delta, whichUnit)
	AddResourceAmount(whichUnit, delta)
end

--===========================================================================
---@param whichPlayer player
---@return integer
function GetConvertedPlayerId(whichPlayer)
	return GetPlayerId(whichPlayer) + 1
end

--===========================================================================
---@param convertedPlayerId integer
---@return player
function ConvertedPlayer(convertedPlayerId)
	return Player(convertedPlayerId - 1)
end

--===========================================================================
---@param r rect
---@return real
function GetRectWidthBJ(r)
	return GetRectMaxX(r) - GetRectMinX(r)
end

--===========================================================================
---@param r rect
---@return real
function GetRectHeightBJ(r)
	return GetRectMaxY(r) - GetRectMinY(r)
end

--===========================================================================
-- Replaces a gold mine with a blighted gold mine for the given player.
--
---@param goldMine unit
---@param whichPlayer player
---@return unit
function BlightGoldMineForPlayerBJ(goldMine, whichPlayer)
	---@type real
	mineX    = nil
	---@type real
	mineY    = nil
	---@type integer
	mineGold = nil
	---@type unit
	newMine  = nil
	
	-- Make sure we're replacing a Gold Mine and not some other type of unit.
	if GetUnitTypeId(goldMine) ~= FourCC('ngol') then
		return nil
	end
	
	-- Save the Gold Mine's properties and remove it.
	mineX    = GetUnitX(goldMine)
	mineY    = GetUnitY(goldMine)
	mineGold = GetResourceAmount(goldMine)
	RemoveUnit(goldMine)
	
	-- Create a Haunted Gold Mine to replace the Gold Mine.
	newMine = CreateBlightedGoldmine(whichPlayer, mineX, mineY, bj_UNIT_FACING)
	SetResourceAmount(newMine, mineGold)
	return newMine
end

--===========================================================================
---@param goldMine unit
---@param whichPlayer player
---@return unit
function BlightGoldMineForPlayer(goldMine, whichPlayer)
	bj_lastHauntedGoldMine = BlightGoldMineForPlayerBJ(goldMine, whichPlayer)
	return bj_lastHauntedGoldMine
end

--===========================================================================
---@return unit
function GetLastHauntedGoldMine()
	return bj_lastHauntedGoldMine
end

--===========================================================================
---@param where location
---@return boolean
function IsPointBlightedBJ(where)
	return IsPointBlighted(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
function SetPlayerColorBJEnum()
	SetUnitColor(GetEnumUnit(), bj_setPlayerTargetColor)
end

--===========================================================================
---@param whichPlayer player
---@param color playercolor
---@param changeExisting boolean
function SetPlayerColorBJ(whichPlayer, color, changeExisting)
	---@type group
	g = nil
	
	SetPlayerColor(whichPlayer, color)
	if changeExisting then
		bj_setPlayerTargetColor = color
		g                       = CreateGroup()
		GroupEnumUnitsOfPlayer(g, whichPlayer, nil)
		ForGroup(g, SetPlayerColorBJEnum)
		DestroyGroup(g)
	end
end

--===========================================================================
---@param unitId integer
---@param allowed boolean
---@param whichPlayer player
function SetPlayerUnitAvailableBJ(unitId, allowed, whichPlayer)
	if allowed then
		SetPlayerTechMaxAllowed(whichPlayer, unitId, -1)
	else
		SetPlayerTechMaxAllowed(whichPlayer, unitId, 0)
	end
end

--===========================================================================
function LockGameSpeedBJ()
	SetMapFlag(MAP_LOCK_SPEED, true)
end

--===========================================================================
function UnlockGameSpeedBJ()
	SetMapFlag(MAP_LOCK_SPEED, false)
end

--===========================================================================
---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@return boolean
function IssueTargetOrderBJ(whichUnit, order, targetWidget)
	return IssueTargetOrder(whichUnit, order, targetWidget)
end

--===========================================================================
---@param whichUnit unit
---@param order string
---@param whichLocation location
---@return boolean
function IssuePointOrderLocBJ(whichUnit, order, whichLocation)
	return IssuePointOrderLoc(whichUnit, order, whichLocation)
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@return boolean
function IssueTargetDestructableOrder(whichUnit, order, targetWidget)
	return IssueTargetOrder(whichUnit, order, targetWidget)
end

---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@return boolean
function IssueTargetItemOrder(whichUnit, order, targetWidget)
	return IssueTargetOrder(whichUnit, order, targetWidget)
end

--===========================================================================
---@param whichUnit unit
---@param order string
---@return boolean
function IssueImmediateOrderBJ(whichUnit, order)
	return IssueImmediateOrder(whichUnit, order)
end

--===========================================================================
---@param whichGroup group
---@param order string
---@param targetWidget widget
---@return boolean
function GroupTargetOrderBJ(whichGroup, order, targetWidget)
	return GroupTargetOrder(whichGroup, order, targetWidget)
end

--===========================================================================
---@param whichGroup group
---@param order string
---@param whichLocation location
---@return boolean
function GroupPointOrderLocBJ(whichGroup, order, whichLocation)
	return GroupPointOrderLoc(whichGroup, order, whichLocation)
end

--===========================================================================
---@param whichGroup group
---@param order string
---@return boolean
function GroupImmediateOrderBJ(whichGroup, order)
	return GroupImmediateOrder(whichGroup, order)
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
---@param whichGroup group
---@param order string
---@param targetWidget widget
---@return boolean
function GroupTargetDestructableOrder(whichGroup, order, targetWidget)
	return GroupTargetOrder(whichGroup, order, targetWidget)
end

---@param whichGroup group
---@param order string
---@param targetWidget widget
---@return boolean
function GroupTargetItemOrder(whichGroup, order, targetWidget)
	return GroupTargetOrder(whichGroup, order, targetWidget)
end

--===========================================================================
---@return destructable
function GetDyingDestructable()
	return GetTriggerDestructable()
end

--===========================================================================
-- Rally point setting
--
---@param whichUnit unit
---@param targPos location
function SetUnitRallyPoint(whichUnit, targPos)
	IssuePointOrderLocBJ(whichUnit, "setrally", targPos)
end

--===========================================================================
---@param whichUnit unit
---@param targUnit unit
function SetUnitRallyUnit(whichUnit, targUnit)
	IssueTargetOrder(whichUnit, "setrally", targUnit)
end

--===========================================================================
---@param whichUnit unit
---@param targDest destructable
function SetUnitRallyDestructable(whichUnit, targDest)
	IssueTargetOrder(whichUnit, "setrally", targDest)
end

--===========================================================================
-- Utility function for use by editor-generated item drop table triggers.
-- This function is added as an action to all destructable drop triggers,
-- so that a widget drop may be differentiated from a unit drop.
--
function SaveDyingWidget()
	bj_lastDyingWidget = GetTriggerWidget()
end

--===========================================================================
---@param addBlight boolean
---@param whichPlayer player
---@param r rect
function SetBlightRectBJ(addBlight, whichPlayer, r)
	SetBlightRect(whichPlayer, r, addBlight)
end

--===========================================================================
---@param addBlight boolean
---@param whichPlayer player
---@param loc location
---@param radius real
function SetBlightRadiusLocBJ(addBlight, whichPlayer, loc, radius)
	SetBlightLoc(whichPlayer, loc, radius, addBlight)
end

--===========================================================================
---@param abilcode integer
---@return string
function GetAbilityName(abilcode)
	return GetObjectName(abilcode)
end