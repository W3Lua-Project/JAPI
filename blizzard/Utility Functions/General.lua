--***************************************************************************
--*
--*  General Utility Functions
--*  These functions exist purely to make the trigger dialogs cleaner and
--*  more comprehensible.
--*
--***************************************************************************

--===========================================================================
function DoNothing()
end

--===========================================================================
-- This function does nothing.  WorldEdit should should eventually ignore
-- CommentString triggers during script generation, but until such a time,
-- this function will serve as a stub.
--
---@param commentString string
function CommentString(commentString)
end

--===========================================================================
-- This function returns the input string, converting it from the localized text, if necessary
--
---@param theString string
---@return string
function StringIdentity(theString)
	return GetLocalizedString(theString)
end

--===========================================================================
---@param valueA boolean
---@param valueB boolean
---@return boolean
function GetBooleanAnd(valueA, valueB)
	return valueA and valueB
end

--===========================================================================
---@param valueA boolean
---@param valueB boolean
---@return boolean
function GetBooleanOr(valueA, valueB)
	return valueA or valueB
end

--===========================================================================
-- Converts a percentage (real, 0..100) into a scaled integer (0..max),
-- clipping the result to 0..max in case the input is invalid.
--
---@param percentage real
---@param max integer
---@return integer
function PercentToInt(percentage, max)
	---@type integer
	result = R2I(percentage * I2R(max) * 0.01)
	
	if (result < 0) then
		result = 0
	elseif (result > max) then
		result = max
	end
	
	return result
end

--===========================================================================
---@param percentage real
---@return integer
function PercentTo255(percentage)
	return PercentToInt(percentage, 255)
end

--===========================================================================
---@return real
function GetTimeOfDay()
	return GetFloatGameState(GAME_STATE_TIME_OF_DAY)
end

--===========================================================================
---@param whatTime real
function SetTimeOfDay(whatTime)
	SetFloatGameState(GAME_STATE_TIME_OF_DAY, whatTime)
end

--===========================================================================
---@param scalePercent real
function SetTimeOfDayScalePercentBJ(scalePercent)
	SetTimeOfDayScale(scalePercent * 0.01)
end

--===========================================================================
---@return real
function GetTimeOfDayScalePercentBJ()
	return GetTimeOfDayScale() * 100
end

--===========================================================================
---@param soundName string
function PlaySound(soundName)
	---@type sound
	soundHandle = CreateSound(soundName, false, false, true, 12700, 12700, "")
	StartSound(soundHandle)
	KillSoundWhenDone(soundHandle)
end

--===========================================================================
---@param A location
---@param B location
---@return boolean
function CompareLocationsBJ(A, B)
	return GetLocationX(A) == GetLocationX(B) and GetLocationY(A) == GetLocationY(B)
end

--===========================================================================
---@param A rect
---@param B rect
---@return boolean
function CompareRectsBJ(A, B)
	return GetRectMinX(A) == GetRectMinX(B) and GetRectMinY(A) == GetRectMinY(B) and GetRectMaxX(A) == GetRectMaxX(B) and GetRectMaxY(A) == GetRectMaxY(B)
end

--===========================================================================
-- Returns a square rect that exactly encompasses the specified circle.
--
---@param center location
---@param radius real
---@return rect
function GetRectFromCircleBJ(center, radius)
	---@type real
	centerX = GetLocationX(center)
	---@type real
	centerY = GetLocationY(center)
	return Rect(centerX - radius, centerY - radius, centerX + radius, centerY + radius)
end