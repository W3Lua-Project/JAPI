--***************************************************************************
--*
--*  Math Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param a real
---@param b real
---@return real
function RMinBJ(a, b)
	if (a < b) then
		return a
	else
		return b
	end
end

--===========================================================================
---@param a real
---@param b real
---@return real
function RMaxBJ(a, b)
	if (a < b) then
		return b
	else
		return a
	end
end

--===========================================================================
---@param a real
---@return real
function RAbsBJ(a)
	if (a >= 0) then
		return a
	else
		return -a
	end
end

--===========================================================================
---@param a real
---@return real
function RSignBJ(a)
	if (a >= 0.0) then
		return 1.0
	else
		return -1.0
	end
end

--===========================================================================
---@param a integer
---@param b integer
---@return integer
function IMinBJ(a, b)
	if (a < b) then
		return a
	else
		return b
	end
end

--===========================================================================
---@param a integer
---@param b integer
---@return integer
function IMaxBJ(a, b)
	if (a < b) then
		return b
	else
		return a
	end
end

--===========================================================================
---@param a integer
---@return integer
function IAbsBJ(a)
	if (a >= 0) then
		return a
	else
		return -a
	end
end

--===========================================================================
---@param a integer
---@return integer
function ISignBJ(a)
	if (a >= 0) then
		return 1
	else
		return -1
	end
end

--===========================================================================
---@param degrees real
---@return real
function SinBJ(degrees)
	return Sin(degrees * bj_DEGTORAD)
end

--===========================================================================
---@param degrees real
---@return real
function CosBJ(degrees)
	return Cos(degrees * bj_DEGTORAD)
end

--===========================================================================
---@param degrees real
---@return real
function TanBJ(degrees)
	return Tan(degrees * bj_DEGTORAD)
end

--===========================================================================
---@param degrees real
---@return real
function AsinBJ(degrees)
	return Asin(degrees) * bj_RADTODEG
end

--===========================================================================
---@param degrees real
---@return real
function AcosBJ(degrees)
	return Acos(degrees) * bj_RADTODEG
end

--===========================================================================
---@param degrees real
---@return real
function AtanBJ(degrees)
	return Atan(degrees) * bj_RADTODEG
end

--===========================================================================
---@param y real
---@param x real
---@return real
function Atan2BJ(y, x)
	return Atan2(y, x) * bj_RADTODEG
end

--===========================================================================
---@param locA location
---@param locB location
---@return real
function AngleBetweenPoints(locA, locB)
	return bj_RADTODEG * Atan2(GetLocationY(locB) - GetLocationY(locA), GetLocationX(locB) - GetLocationX(locA))
end

--===========================================================================
---@param locA location
---@param locB location
---@return real
function DistanceBetweenPoints(locA, locB)
	---@type real
	dx = GetLocationX(locB) - GetLocationX(locA)
	---@type real
	dy = GetLocationY(locB) - GetLocationY(locA)
	return SquareRoot(dx * dx + dy * dy)
end

--===========================================================================
---@param source location
---@param dist real
---@param angle real
---@return location
function PolarProjectionBJ(source, dist, angle)
	---@type real
	x = GetLocationX(source) + dist * Cos(angle * bj_DEGTORAD)
	---@type real
	y = GetLocationY(source) + dist * Sin(angle * bj_DEGTORAD)
	return Location(x, y)
end

--===========================================================================
---@return real
function GetRandomDirectionDeg()
	return GetRandomReal(0, 360)
end

--===========================================================================
---@return real
function GetRandomPercentageBJ()
	return GetRandomReal(0, 100)
end

--===========================================================================
---@param whichRect rect
---@return location
function GetRandomLocInRect(whichRect)
	return Location(GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect)), GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect)))
end

--===========================================================================
-- Calculate the modulus/remainder of (dividend) divided by (divisor).
-- Examples:  18 mod 5 = 3.  15 mod 5 = 0.  -8 mod 5 = 2.
--
---@param dividend integer
---@param divisor integer
---@return integer
function ModuloInteger(dividend, divisor)
	---@type integer
	modulus = dividend - (dividend / divisor) * divisor
	
	-- If the dividend was negative, the above modulus calculation will
	-- be negative, but within (-divisor..0).  We can add (divisor) to
	-- shift this result into the desired range of (0..divisor).
	if (modulus < 0) then
		modulus = modulus + divisor
	end
	
	return modulus
end

--===========================================================================
-- Calculate the modulus/remainder of (dividend) divided by (divisor).
-- Examples:  13.000 mod 2.500 = 0.500.  -6.000 mod 2.500 = 1.500.
--
---@param dividend real
---@param divisor real
---@return real
function ModuloReal(dividend, divisor)
	---@type real
	modulus = dividend - I2R(R2I(dividend / divisor)) * divisor
	
	-- If the dividend was negative, the above modulus calculation will
	-- be negative, but within (-divisor..0).  We can add (divisor) to
	-- shift this result into the desired range of (0..divisor).
	if (modulus < 0) then
		modulus = modulus + divisor
	end
	
	return modulus
end

--===========================================================================
---@param loc location
---@param dx real
---@param dy real
---@return location
function OffsetLocation(loc, dx, dy)
	return Location(GetLocationX(loc) + dx, GetLocationY(loc) + dy)
end

--===========================================================================
---@param r rect
---@param dx real
---@param dy real
---@return rect
function OffsetRectBJ(r, dx, dy)
	return Rect(GetRectMinX(r) + dx, GetRectMinY(r) + dy, GetRectMaxX(r) + dx, GetRectMaxY(r) + dy)
end

--===========================================================================
---@param center location
---@param width real
---@param height real
---@return rect
function RectFromCenterSizeBJ(center, width, height)
	---@type real
	x = GetLocationX(center)
	---@type real
	y = GetLocationY(center)
	return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
end

--===========================================================================
---@param r rect
---@param x real
---@param y real
---@return boolean
function RectContainsCoords(r, x, y)
	return (GetRectMinX(r) <= x) and (x <= GetRectMaxX(r)) and (GetRectMinY(r) <= y) and (y <= GetRectMaxY(r))
end

--===========================================================================
---@param r rect
---@param loc location
---@return boolean
function RectContainsLoc(r, loc)
	return RectContainsCoords(r, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
---@param r rect
---@param whichUnit unit
---@return boolean
function RectContainsUnit(r, whichUnit)
	return RectContainsCoords(r, GetUnitX(whichUnit), GetUnitY(whichUnit))
end

--===========================================================================
---@param whichItem item
---@param r rect
---@return boolean
function RectContainsItem(whichItem, r)
	if (whichItem == nil) then
		return false
	end
	
	if (IsItemOwned(whichItem)) then
		return false
	end
	
	return RectContainsCoords(r, GetItemX(whichItem), GetItemY(whichItem))
end