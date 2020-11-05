--***************************************************************************
--*
--*  Destructable Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param objectid integer
---@param loc location
---@param facing real
---@param scale real
---@param variation integer
---@return destructable
function CreateDestructableLoc(objectid, loc, facing, scale, variation)
	bj_lastCreatedDestructable = CreateDestructable(objectid, GetLocationX(loc), GetLocationY(loc), facing, scale, variation)
	return bj_lastCreatedDestructable
end

--===========================================================================
---@param objectid integer
---@param loc location
---@param facing real
---@param scale real
---@param variation integer
---@return destructable
function CreateDeadDestructableLocBJ(objectid, loc, facing, scale, variation)
	bj_lastCreatedDestructable = CreateDeadDestructable(objectid, GetLocationX(loc), GetLocationY(loc), facing, scale, variation)
	return bj_lastCreatedDestructable
end

--===========================================================================
---@return destructable
function GetLastCreatedDestructable()
	return bj_lastCreatedDestructable
end

--===========================================================================
---@param flag boolean
---@param d destructable
function ShowDestructableBJ(flag, d)
	ShowDestructable(d, flag)
end

--===========================================================================
---@param d destructable
---@param flag boolean
function SetDestructableInvulnerableBJ(d, flag)
	SetDestructableInvulnerable(d, flag)
end

--===========================================================================
---@param d destructable
---@return boolean
function IsDestructableInvulnerableBJ(d)
	return IsDestructableInvulnerable(d)
end

--===========================================================================
---@param whichDestructable destructable
---@return location
function GetDestructableLoc(whichDestructable)
	return Location(GetDestructableX(whichDestructable), GetDestructableY(whichDestructable))
end

--===========================================================================
---@param r rect
---@param actionFunc code
function EnumDestructablesInRectAll(r, actionFunc)
	EnumDestructablesInRect(r, nil, actionFunc)
end

--===========================================================================
---@return boolean
function EnumDestructablesInCircleBJFilter()
	---@type location
	destLoc = GetDestructableLoc(GetFilterDestructable())
	---@type boolean
	result  = nil
	
	result  = DistanceBetweenPoints(destLoc, bj_enumDestructableCenter) <= bj_enumDestructableRadius
	RemoveLocation(destLoc)
	return result
end

--===========================================================================
---@param d destructable
---@return boolean
function IsDestructableDeadBJ(d)
	return GetDestructableLife(d) <= 0
end

--===========================================================================
---@param d destructable
---@return boolean
function IsDestructableAliveBJ(d)
	return not IsDestructableDeadBJ(d)
end

--===========================================================================
-- See GroupPickRandomUnitEnum for the details of this algorithm.
--
function RandomDestructableInRectBJEnum()
	bj_destRandomConsidered = bj_destRandomConsidered + 1
	if (GetRandomInt(1, bj_destRandomConsidered) == 1) then
		bj_destRandomCurrentPick = GetEnumDestructable()
	end
end

--===========================================================================
-- Picks a random destructable from within a rect, matching a condition
--
---@param r rect
---@param filter boolexpr
---@return destructable
function RandomDestructableInRectBJ(r, filter)
	bj_destRandomConsidered  = 0
	bj_destRandomCurrentPick = nil
	EnumDestructablesInRect(r, filter, RandomDestructableInRectBJEnum)
	DestroyBoolExpr(filter)
	return bj_destRandomCurrentPick
end

--===========================================================================
-- Picks a random destructable from within a rect
--
---@param r rect
---@return destructable
function RandomDestructableInRectSimpleBJ(r)
	return RandomDestructableInRectBJ(r, nil)
end

--===========================================================================
-- Enumerates within a rect, with a filter to narrow the enumeration down
-- objects within a circular area.
--
---@param radius real
---@param loc location
---@param actionFunc code
function EnumDestructablesInCircleBJ(radius, loc, actionFunc)
	---@type rect
	r = nil
	
	if (radius >= 0) then
		bj_enumDestructableCenter = loc
		bj_enumDestructableRadius = radius
		r                         = GetRectFromCircleBJ(loc, radius)
		EnumDestructablesInRect(r, filterEnumDestructablesInCircleBJ, actionFunc)
		RemoveRect(r)
	end
end

--===========================================================================
---@param d destructable
---@param percent real
function SetDestructableLifePercentBJ(d, percent)
	SetDestructableLife(d, GetDestructableMaxLife(d) * percent * 0.01)
end

--===========================================================================
---@param d destructable
---@param max real
function SetDestructableMaxLifeBJ(d, max)
	SetDestructableMaxLife(d, max)
end

--===========================================================================
---@param gateOperation integer
---@param d destructable
function ModifyGateBJ(gateOperation, d)
	if (gateOperation == bj_GATEOPERATION_CLOSE) then
		if (GetDestructableLife(d) <= 0) then
			DestructableRestoreLife(d, GetDestructableMaxLife(d), true)
		end
		SetDestructableAnimation(d, "stand")
	elseif (gateOperation == bj_GATEOPERATION_OPEN) then
		if (GetDestructableLife(d) > 0) then
			KillDestructable(d)
		end
		SetDestructableAnimation(d, "death alternate")
	elseif (gateOperation == bj_GATEOPERATION_DESTROY) then
		if (GetDestructableLife(d) > 0) then
			KillDestructable(d)
		end
		SetDestructableAnimation(d, "death")
	else
		-- Unrecognized gate state - ignore the request.
	end
end

--===========================================================================
-- Determine the elevator's height from its occlusion height.
--
---@param d destructable
---@return integer
function GetElevatorHeight(d)
	---@type integer
	height = nil
	
	height = 1 + R2I(GetDestructableOccluderHeight(d) / bj_CLIFFHEIGHT)
	if (height < 1) or (height > 3) then
		height = 1
	end
	return height
end

--===========================================================================
-- To properly animate an elevator, we must know not only what height we
-- want to change to, but also what height we are currently at.  This code
-- determines the elevator's current height from its occlusion height.
-- Arbitrarily changing an elevator's occlusion height is thus inadvisable.
--
---@param d destructable
---@param newHeight integer
function ChangeElevatorHeight(d, newHeight)
	---@type integer
	oldHeight = nil
	
	-- Cap the new height within the supported range.
	newHeight = IMaxBJ(1, newHeight)
	newHeight = IMinBJ(3, newHeight)
	
	-- Find out what height the elevator is already at.
	oldHeight = GetElevatorHeight(d)
	
	-- Set the elevator's occlusion height.
	SetDestructableOccluderHeight(d, bj_CLIFFHEIGHT * (newHeight - 1))
	
	if (newHeight == 1) then
		if (oldHeight == 2) then
			SetDestructableAnimation(d, "birth")
			QueueDestructableAnimation(d, "stand")
		elseif (oldHeight == 3) then
			SetDestructableAnimation(d, "birth third")
			QueueDestructableAnimation(d, "stand")
		else
			-- Unrecognized old height - snap to new height.
			SetDestructableAnimation(d, "stand")
		end
	elseif (newHeight == 2) then
		if (oldHeight == 1) then
			SetDestructableAnimation(d, "death")
			QueueDestructableAnimation(d, "stand second")
		elseif (oldHeight == 3) then
			SetDestructableAnimation(d, "birth second")
			QueueDestructableAnimation(d, "stand second")
		else
			-- Unrecognized old height - snap to new height.
			SetDestructableAnimation(d, "stand second")
		end
	elseif (newHeight == 3) then
		if (oldHeight == 1) then
			SetDestructableAnimation(d, "death third")
			QueueDestructableAnimation(d, "stand third")
		elseif (oldHeight == 2) then
			SetDestructableAnimation(d, "death second")
			QueueDestructableAnimation(d, "stand third")
		else
			-- Unrecognized old height - snap to new height.
			SetDestructableAnimation(d, "stand third")
		end
	else
		-- Unrecognized new height - ignore the request.
	end
end

--===========================================================================
-- Grab the unit and throw his own coords in his face, forcing him to push
-- and shove until he finds a spot where noone will bother him.
--
function NudgeUnitsInRectEnum()
	---@type unit
	nudgee = GetEnumUnit()
	
	SetUnitPosition(nudgee, GetUnitX(nudgee), GetUnitY(nudgee))
end

--===========================================================================
function NudgeItemsInRectEnum()
	---@type item
	nudgee = GetEnumItem()
	
	SetItemPosition(nudgee, GetItemX(nudgee), GetItemY(nudgee))
end

--===========================================================================
-- Nudge the items and units within a given rect ever so gently, so as to
-- encourage them to find locations where they can peacefully coexist with
-- pathing restrictions and live happy, fruitful lives.
--
---@param nudgeArea rect
function NudgeObjectsInRect(nudgeArea)
	---@type group
	g = nil
	
	g = CreateGroup()
	GroupEnumUnitsInRect(g, nudgeArea, nil)
	ForGroup(g, NudgeUnitsInRectEnum)
	DestroyGroup(g)
	
	EnumItemsInRect(nudgeArea, nil, NudgeItemsInRectEnum)
end

--===========================================================================
function NearbyElevatorExistsEnum()
	---@type destructable
	d     = GetEnumDestructable()
	---@type integer
	dType = GetDestructableTypeId(d)
	
	if (dType == bj_ELEVATOR_CODE01) or (dType == bj_ELEVATOR_CODE02) then
		bj_elevatorNeighbor = d
	end
end

--===========================================================================
---@param x real
---@param y real
---@return boolean
function NearbyElevatorExists(x, y)
	---@type real
	findThreshold       = 32
	---@type rect
	r                   = nil
	
	-- If another elevator is overlapping this one, ignore the wall.
	r                   = Rect(x - findThreshold, y - findThreshold, x + findThreshold, y + findThreshold)
	bj_elevatorNeighbor = nil
	EnumDestructablesInRect(r, nil, NearbyElevatorExistsEnum)
	RemoveRect(r)
	
	return bj_elevatorNeighbor ~= nil
end

--===========================================================================
function FindElevatorWallBlockerEnum()
	bj_elevatorWallBlocker = GetEnumDestructable()
end

--===========================================================================
-- This toggles pathing on or off for one wall of an elevator by killing
-- or reviving a pathing blocker at the appropriate location (and creating
-- the pathing blocker in the first place, if it does not yet exist).
--
---@param x real
---@param y real
---@param facing real
---@param open boolean
function ChangeElevatorWallBlocker(x, y, facing, open)
	---@type destructable
	blocker                = nil
	---@type real
	findThreshold          = 32
	---@type real
	nudgeLength            = 4.25 * bj_CELLWIDTH
	---@type real
	nudgeWidth             = 1.25 * bj_CELLWIDTH
	---@type rect
	r                      = nil
	
	-- Search for the pathing blocker within the general area.
	r                      = Rect(x - findThreshold, y - findThreshold, x + findThreshold, y + findThreshold)
	bj_elevatorWallBlocker = nil
	EnumDestructablesInRect(r, nil, FindElevatorWallBlockerEnum)
	RemoveRect(r)
	blocker = bj_elevatorWallBlocker
	
	-- Ensure that the blocker exists.
	if (blocker == nil) then
		blocker = CreateDeadDestructable(bj_ELEVATOR_BLOCKER_CODE, x, y, facing, 1, 0)
	elseif (GetDestructableTypeId(blocker) ~= bj_ELEVATOR_BLOCKER_CODE) then
		-- If a different destructible exists in the blocker's spot, ignore
		-- the request.  (Two destructibles cannot occupy the same location
		-- on the map, so we cannot create an elevator blocker here.)
		return
	end
	
	if (open) then
		-- Ensure that the blocker is dead.
		if (GetDestructableLife(blocker) > 0) then
			KillDestructable(blocker)
		end
	else
		-- Ensure that the blocker is alive.
		if (GetDestructableLife(blocker) <= 0) then
			DestructableRestoreLife(blocker, GetDestructableMaxLife(blocker), false)
		end
		
		-- Nudge any objects standing in the blocker's way.
		if (facing == 0) then
			r = Rect(x - nudgeWidth / 2, y - nudgeLength / 2, x + nudgeWidth / 2, y + nudgeLength / 2)
			NudgeObjectsInRect(r)
			RemoveRect(r)
		elseif (facing == 90) then
			r = Rect(x - nudgeLength / 2, y - nudgeWidth / 2, x + nudgeLength / 2, y + nudgeWidth / 2)
			NudgeObjectsInRect(r)
			RemoveRect(r)
		else
			-- Unrecognized blocker angle - don't nudge anything.
		end
	end
end

--===========================================================================
---@param open boolean
---@param walls integer
---@param d destructable
function ChangeElevatorWalls(open, walls, d)
	---@type real
	x              = GetDestructableX(d)
	---@type real
	y              = GetDestructableY(d)
	---@type real
	distToBlocker  = 192
	---@type real
	distToNeighbor = 256
	
	if (walls == bj_ELEVATOR_WALL_TYPE_ALL) or (walls == bj_ELEVATOR_WALL_TYPE_EAST) then
		if (not NearbyElevatorExists(x + distToNeighbor, y)) then
			ChangeElevatorWallBlocker(x + distToBlocker, y, 0, open)
		end
	end
	
	if (walls == bj_ELEVATOR_WALL_TYPE_ALL) or (walls == bj_ELEVATOR_WALL_TYPE_NORTH) then
		if (not NearbyElevatorExists(x, y + distToNeighbor)) then
			ChangeElevatorWallBlocker(x, y + distToBlocker, 90, open)
		end
	end
	
	if (walls == bj_ELEVATOR_WALL_TYPE_ALL) or (walls == bj_ELEVATOR_WALL_TYPE_SOUTH) then
		if (not NearbyElevatorExists(x, y - distToNeighbor)) then
			ChangeElevatorWallBlocker(x, y - distToBlocker, 90, open)
		end
	end
	
	if (walls == bj_ELEVATOR_WALL_TYPE_ALL) or (walls == bj_ELEVATOR_WALL_TYPE_WEST) then
		if (not NearbyElevatorExists(x - distToNeighbor, y)) then
			ChangeElevatorWallBlocker(x - distToBlocker, y, 0, open)
		end
	end
end