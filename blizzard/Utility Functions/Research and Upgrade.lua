--***************************************************************************
--*
--*  Research and Upgrade Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param techid integer
---@param levels integer
---@param whichPlayer player
function SetPlayerTechResearchedSwap(techid, levels, whichPlayer)
	SetPlayerTechResearched(whichPlayer, techid, levels)
end

--===========================================================================
---@param techid integer
---@param maximum integer
---@param whichPlayer player
function SetPlayerTechMaxAllowedSwap(techid, maximum, whichPlayer)
	SetPlayerTechMaxAllowed(whichPlayer, techid, maximum)
end

--===========================================================================
---@param maximum integer
---@param whichPlayer player
function SetPlayerMaxHeroesAllowed(maximum, whichPlayer)
	SetPlayerTechMaxAllowed(whichPlayer, FourCC('HERO'), maximum)
end

--===========================================================================
---@param techid integer
---@param whichPlayer player
---@return integer
function GetPlayerTechCountSimple(techid, whichPlayer)
	return GetPlayerTechCount(whichPlayer, techid, true)
end

--===========================================================================
---@param techid integer
---@param whichPlayer player
---@return integer
function GetPlayerTechMaxAllowedSwap(techid, whichPlayer)
	return GetPlayerTechMaxAllowed(whichPlayer, techid)
end

--===========================================================================
---@param avail boolean
---@param abilid integer
---@param whichPlayer player
function SetPlayerAbilityAvailableBJ(avail, abilid, whichPlayer)
	SetPlayerAbilityAvailable(whichPlayer, abilid, avail)
end