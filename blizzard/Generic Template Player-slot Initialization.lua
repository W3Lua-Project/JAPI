--***************************************************************************
--*
--*  Generic Template Player-slot Initialization
--*
--***************************************************************************

--===========================================================================
---@param teamCount integer
function TeamInitPlayerSlots(teamCount)
	---@type integer
	index       = nil
	---@type player
	indexPlayer = nil
	---@type integer
	team        = nil
	
	SetTeams(teamCount)
	
	CheckInitPlayerSlotAvailability()
	index = 0
	team  = 0
	while true do
		if (bj_slotControlUsed[index]) then
			indexPlayer = Player(index)
			SetPlayerTeam(indexPlayer, team)
			team = team + 1
			if (team >= teamCount) then
				team = 0
			end
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
function MeleeInitPlayerSlots()
	TeamInitPlayerSlots(bj_MAX_PLAYERS)
end

--===========================================================================
function FFAInitPlayerSlots()
	TeamInitPlayerSlots(bj_MAX_PLAYERS)
end

--===========================================================================
function OneOnOneInitPlayerSlots()
	-- Limit the game to 2 players.
	SetTeams(2)
	SetPlayers(2)
	TeamInitPlayerSlots(2)
end

--===========================================================================
function InitGenericPlayerSlots()
	---@type gametype
	gType = GetGameTypeSelected()
	
	if (gType == GAME_TYPE_MELEE) then
		MeleeInitPlayerSlots()
	elseif (gType == GAME_TYPE_FFA) then
		FFAInitPlayerSlots()
	elseif (gType == GAME_TYPE_USE_MAP_SETTINGS) then
		-- Do nothing; the map-specific script handles this.
	elseif (gType == GAME_TYPE_ONE_ON_ONE) then
		OneOnOneInitPlayerSlots()
	elseif (gType == GAME_TYPE_TWO_TEAM_PLAY) then
		TeamInitPlayerSlots(2)
	elseif (gType == GAME_TYPE_THREE_TEAM_PLAY) then
		TeamInitPlayerSlots(3)
	elseif (gType == GAME_TYPE_FOUR_TEAM_PLAY) then
		TeamInitPlayerSlots(4)
	else
		-- Unrecognized Game Type
	end
end