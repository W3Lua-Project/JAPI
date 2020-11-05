--***************************************************************************
--*
--*  Neutral Building Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param activate boolean
---@param waygate unit
function WaygateActivateBJ(activate, waygate)
	WaygateActivate(waygate, activate)
end

--===========================================================================
---@param waygate unit
---@return boolean
function WaygateIsActiveBJ(waygate)
	return WaygateIsActive(waygate)
end

--===========================================================================
---@param waygate unit
---@param loc location
function WaygateSetDestinationLocBJ(waygate, loc)
	WaygateSetDestination(waygate, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
---@param waygate unit
---@return location
function WaygateGetDestinationLocBJ(waygate)
	return Location(WaygateGetDestinationX(waygate), WaygateGetDestinationY(waygate))
end

--===========================================================================
---@param flag boolean
---@param whichUnit unit
function UnitSetUsesAltIconBJ(flag, whichUnit)
	UnitSetUsesAltIcon(whichUnit, flag)
end