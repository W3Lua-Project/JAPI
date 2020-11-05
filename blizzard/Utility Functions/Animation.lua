--***************************************************************************
--*
--*  Animation Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param whichUnit unit
function ResetUnitAnimation(whichUnit)
	SetUnitAnimation(whichUnit, "stand")
end

--===========================================================================
---@param whichUnit unit
---@param percentScale real
function SetUnitTimeScalePercent(whichUnit, percentScale)
	SetUnitTimeScale(whichUnit, percentScale * 0.01)
end

--===========================================================================
---@param whichUnit unit
---@param percentScaleX real
---@param percentScaleY real
---@param percentScaleZ real
function SetUnitScalePercent(whichUnit, percentScaleX, percentScaleY, percentScaleZ)
	SetUnitScale(whichUnit, percentScaleX * 0.01, percentScaleY * 0.01, percentScaleZ * 0.01)
end

--===========================================================================
-- This version differs from the common.j interface in that the alpha value
-- is reversed so as to be displayed as transparency, and all four parameters
-- are treated as percentages rather than bytes.
--
---@param whichUnit unit
---@param red real
---@param green real
---@param blue real
---@param transparency real
function SetUnitVertexColorBJ(whichUnit, red, green, blue, transparency)
	SetUnitVertexColor(whichUnit, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param whichUnit unit
---@param red real
---@param green real
---@param blue real
---@param transparency real
function UnitAddIndicatorBJ(whichUnit, red, green, blue, transparency)
	AddIndicator(whichUnit, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param whichDestructable destructable
---@param red real
---@param green real
---@param blue real
---@param transparency real
function DestructableAddIndicatorBJ(whichDestructable, red, green, blue, transparency)
	AddIndicator(whichDestructable, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param whichItem item
---@param red real
---@param green real
---@param blue real
---@param transparency real
function ItemAddIndicatorBJ(whichItem, red, green, blue, transparency)
	AddIndicator(whichItem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
-- Sets a unit's facing to point directly at a location.
--
---@param whichUnit unit
---@param target location
---@param duration real
function SetUnitFacingToFaceLocTimed(whichUnit, target, duration)
	---@type location
	unitLoc = GetUnitLoc(whichUnit)
	
	SetUnitFacingTimed(whichUnit, AngleBetweenPoints(unitLoc, target), duration)
	RemoveLocation(unitLoc)
end

--===========================================================================
-- Sets a unit's facing to point directly at another unit.
--
---@param whichUnit unit
---@param target unit
---@param duration real
function SetUnitFacingToFaceUnitTimed(whichUnit, target, duration)
	---@type location
	unitLoc = GetUnitLoc(target)
	
	SetUnitFacingToFaceLocTimed(whichUnit, unitLoc, duration)
	RemoveLocation(unitLoc)
end

--===========================================================================
---@param whichUnit unit
---@param whichAnimation string
function QueueUnitAnimationBJ(whichUnit, whichAnimation)
	QueueUnitAnimation(whichUnit, whichAnimation)
end

--===========================================================================
---@param d destructable
---@param whichAnimation string
function SetDestructableAnimationBJ(d, whichAnimation)
	SetDestructableAnimation(d, whichAnimation)
end

--===========================================================================
---@param d destructable
---@param whichAnimation string
function QueueDestructableAnimationBJ(d, whichAnimation)
	QueueDestructableAnimation(d, whichAnimation)
end

--===========================================================================
---@param d destructable
---@param percentScale real
function SetDestAnimationSpeedPercent(d, percentScale)
	SetDestructableAnimationSpeed(d, percentScale * 0.01)
end