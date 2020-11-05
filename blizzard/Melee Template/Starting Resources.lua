--***************************************************************************
--*
--*  Melee Template Starting Resources
--*
--***************************************************************************

--===========================================================================
function MeleeStartingResources()
	---@type integer
	index          = nil
	---@type player
	indexPlayer    = nil
	---@type version
	v              = nil
	---@type integer
	startingGold   = nil
	---@type integer
	startingLumber = nil
	
	v              = VersionGet()
	if (v == VERSION_REIGN_OF_CHAOS) then
		startingGold   = bj_MELEE_STARTING_GOLD_V0
		startingLumber = bj_MELEE_STARTING_LUMBER_V0
	else
		startingGold   = bj_MELEE_STARTING_GOLD_V1
		startingLumber = bj_MELEE_STARTING_LUMBER_V1
	end
	
	-- Set each player's starting resources.
	index = 0
	while true do
		indexPlayer = Player(index)
		if (GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING) then
			SetPlayerState(indexPlayer, PLAYER_STATE_RESOURCE_GOLD, startingGold)
			SetPlayerState(indexPlayer, PLAYER_STATE_RESOURCE_LUMBER, startingLumber)
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end