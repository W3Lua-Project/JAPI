--***************************************************************************
--*
--*  Text Tag Utility Functions
--*
--***************************************************************************

--===========================================================================
-- Scale the font size linearly such that size 10 equates to height 0.023.
-- Screen-relative font heights are harder to grasp and than font sizes.
--
---@param size real
---@return real
function TextTagSize2Height(size)
	return size * 0.023 / 10
end

--===========================================================================
-- Scale the speed linearly such that speed 128 equates to 0.071.
-- Screen-relative speeds are hard to grasp.
--
---@param speed real
---@return real
function TextTagSpeed2Velocity(speed)
	return speed * 0.071 / 128
end

--===========================================================================
---@param tt texttag
---@param red real
---@param green real
---@param blue real
---@param transparency real
function SetTextTagColorBJ(tt, red, green, blue, transparency)
	SetTextTagColor(tt, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param tt texttag
---@param speed real
---@param angle real
function SetTextTagVelocityBJ(tt, speed, angle)
	---@type real
	vel  = TextTagSpeed2Velocity(speed)
	---@type real
	xvel = vel * Cos(angle * bj_DEGTORAD)
	---@type real
	yvel = vel * Sin(angle * bj_DEGTORAD)
	
	SetTextTagVelocity(tt, xvel, yvel)
end

--===========================================================================
---@param tt texttag
---@param s string
---@param size real
function SetTextTagTextBJ(tt, s, size)
	---@type real
	textHeight = TextTagSize2Height(size)
	
	SetTextTagText(tt, s, textHeight)
end

--===========================================================================
---@param tt texttag
---@param loc location
---@param zOffset real
function SetTextTagPosBJ(tt, loc, zOffset)
	SetTextTagPos(tt, GetLocationX(loc), GetLocationY(loc), zOffset)
end

--===========================================================================
---@param tt texttag
---@param whichUnit unit
---@param zOffset real
function SetTextTagPosUnitBJ(tt, whichUnit, zOffset)
	SetTextTagPosUnit(tt, whichUnit, zOffset)
end

--===========================================================================
---@param tt texttag
---@param flag boolean
function SetTextTagSuspendedBJ(tt, flag)
	SetTextTagSuspended(tt, flag)
end

--===========================================================================
---@param tt texttag
---@param flag boolean
function SetTextTagPermanentBJ(tt, flag)
	SetTextTagPermanent(tt, flag)
end

--===========================================================================
---@param tt texttag
---@param age real
function SetTextTagAgeBJ(tt, age)
	SetTextTagAge(tt, age)
end

--===========================================================================
---@param tt texttag
---@param lifespan real
function SetTextTagLifespanBJ(tt, lifespan)
	SetTextTagLifespan(tt, lifespan)
end

--===========================================================================
---@param tt texttag
---@param fadepoint real
function SetTextTagFadepointBJ(tt, fadepoint)
	SetTextTagFadepoint(tt, fadepoint)
end

--===========================================================================
---@param s string
---@param loc location
---@param zOffset real
---@param size real
---@param red real
---@param green real
---@param blue real
---@param transparency real
---@return texttag
function CreateTextTagLocBJ(s, loc, zOffset, size, red, green, blue, transparency)
	bj_lastCreatedTextTag = CreateTextTag()
	SetTextTagTextBJ(bj_lastCreatedTextTag, s, size)
	SetTextTagPosBJ(bj_lastCreatedTextTag, loc, zOffset)
	SetTextTagColorBJ(bj_lastCreatedTextTag, red, green, blue, transparency)
	
	return bj_lastCreatedTextTag
end

--===========================================================================
---@param s string
---@param whichUnit unit
---@param zOffset real
---@param size real
---@param red real
---@param green real
---@param blue real
---@param transparency real
---@return texttag
function CreateTextTagUnitBJ(s, whichUnit, zOffset, size, red, green, blue, transparency)
	bj_lastCreatedTextTag = CreateTextTag()
	SetTextTagTextBJ(bj_lastCreatedTextTag, s, size)
	SetTextTagPosUnitBJ(bj_lastCreatedTextTag, whichUnit, zOffset)
	SetTextTagColorBJ(bj_lastCreatedTextTag, red, green, blue, transparency)
	
	return bj_lastCreatedTextTag
end

--===========================================================================
---@param tt texttag
function DestroyTextTagBJ(tt)
	DestroyTextTag(tt)
end

--===========================================================================
---@param show boolean
---@param tt texttag
---@param whichForce force
function ShowTextTagForceBJ(show, tt, whichForce)
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetTextTagVisibility(tt, show)
	end
end

--===========================================================================
---@return texttag
function GetLastCreatedTextTag()
	return bj_lastCreatedTextTag
end