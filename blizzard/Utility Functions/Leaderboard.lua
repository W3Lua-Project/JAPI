--***************************************************************************
--*
--*  Leaderboard Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param lb leaderboard
function LeaderboardResizeBJ(lb)
	---@type integer
	size = LeaderboardGetItemCount(lb)
	
	if (LeaderboardGetLabelText(lb) == "") then
		size = size - 1
	end
	LeaderboardSetSizeByItemCount(lb, size)
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@param val integer
function LeaderboardSetPlayerItemValueBJ(whichPlayer, lb, val)
	LeaderboardSetItemValue(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), val)
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@param val string
function LeaderboardSetPlayerItemLabelBJ(whichPlayer, lb, val)
	LeaderboardSetItemLabel(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), val)
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@param showLabel boolean
---@param showValue boolean
---@param showIcon boolean
function LeaderboardSetPlayerItemStyleBJ(whichPlayer, lb, showLabel, showValue, showIcon)
	LeaderboardSetItemStyle(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), showLabel, showValue, showIcon)
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@param red real
---@param green real
---@param blue real
---@param transparency real
function LeaderboardSetPlayerItemLabelColorBJ(whichPlayer, lb, red, green, blue, transparency)
	LeaderboardSetItemLabelColor(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@param red real
---@param green real
---@param blue real
---@param transparency real
function LeaderboardSetPlayerItemValueColorBJ(whichPlayer, lb, red, green, blue, transparency)
	LeaderboardSetItemValueColor(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param lb leaderboard
---@param red real
---@param green real
---@param blue real
---@param transparency real
function LeaderboardSetLabelColorBJ(lb, red, green, blue, transparency)
	LeaderboardSetLabelColor(lb, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param lb leaderboard
---@param red real
---@param green real
---@param blue real
---@param transparency real
function LeaderboardSetValueColorBJ(lb, red, green, blue, transparency)
	LeaderboardSetValueColor(lb, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param lb leaderboard
---@param label string
function LeaderboardSetLabelBJ(lb, label)
	LeaderboardSetLabel(lb, label)
	LeaderboardResizeBJ(lb)
end

--===========================================================================
---@param lb leaderboard
---@param showLabel boolean
---@param showNames boolean
---@param showValues boolean
---@param showIcons boolean
function LeaderboardSetStyleBJ(lb, showLabel, showNames, showValues, showIcons)
	LeaderboardSetStyle(lb, showLabel, showNames, showValues, showIcons)
end

--===========================================================================
---@param lb leaderboard
---@return integer
function LeaderboardGetItemCountBJ(lb)
	return LeaderboardGetItemCount(lb)
end

--===========================================================================
---@param lb leaderboard
---@param whichPlayer player
---@return boolean
function LeaderboardHasPlayerItemBJ(lb, whichPlayer)
	return LeaderboardHasPlayerItem(lb, whichPlayer)
end

--===========================================================================
---@param lb leaderboard
---@param toForce force
function ForceSetLeaderboardBJ(lb, toForce)
	---@type integer
	index       = nil
	---@type player
	indexPlayer = nil
	
	index       = 0
	while true do
		indexPlayer = Player(index)
		if IsPlayerInForce(indexPlayer, toForce) then
			PlayerSetLeaderboard(indexPlayer, lb)
		end
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
---@param toForce force
---@param label string
---@return leaderboard
function CreateLeaderboardBJ(toForce, label)
	bj_lastCreatedLeaderboard = CreateLeaderboard()
	LeaderboardSetLabel(bj_lastCreatedLeaderboard, label)
	ForceSetLeaderboardBJ(bj_lastCreatedLeaderboard, toForce)
	LeaderboardDisplay(bj_lastCreatedLeaderboard, true)
	return bj_lastCreatedLeaderboard
end

--===========================================================================
---@param lb leaderboard
function DestroyLeaderboardBJ(lb)
	DestroyLeaderboard(lb)
end

--===========================================================================
---@param show boolean
---@param lb leaderboard
function LeaderboardDisplayBJ(show, lb)
	LeaderboardDisplay(lb, show)
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@param label string
---@param value integer
function LeaderboardAddItemBJ(whichPlayer, lb, label, value)
	if (LeaderboardHasPlayerItem(lb, whichPlayer)) then
		LeaderboardRemovePlayerItem(lb, whichPlayer)
	end
	LeaderboardAddItem(lb, label, value, whichPlayer)
	LeaderboardResizeBJ(lb)
	--call LeaderboardSetSizeByItemCount(lb, LeaderboardGetItemCount(lb))
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
function LeaderboardRemovePlayerItemBJ(whichPlayer, lb)
	LeaderboardRemovePlayerItem(lb, whichPlayer)
	LeaderboardResizeBJ(lb)
end

--===========================================================================
---@param lb leaderboard
---@param sortType integer
---@param ascending boolean
function LeaderboardSortItemsBJ(lb, sortType, ascending)
	if (sortType == bj_SORTTYPE_SORTBYVALUE) then
		LeaderboardSortItemsByValue(lb, ascending)
	elseif (sortType == bj_SORTTYPE_SORTBYPLAYER) then
		LeaderboardSortItemsByPlayer(lb, ascending)
	elseif (sortType == bj_SORTTYPE_SORTBYLABEL) then
		LeaderboardSortItemsByLabel(lb, ascending)
	else
		-- Unrecognized sort type - ignore the request.
	end
end

--===========================================================================
---@param lb leaderboard
---@param ascending boolean
function LeaderboardSortItemsByPlayerBJ(lb, ascending)
	LeaderboardSortItemsByPlayer(lb, ascending)
end

--===========================================================================
---@param lb leaderboard
---@param ascending boolean
function LeaderboardSortItemsByLabelBJ(lb, ascending)
	LeaderboardSortItemsByLabel(lb, ascending)
end

--===========================================================================
---@param whichPlayer player
---@param lb leaderboard
---@return integer
function LeaderboardGetPlayerIndexBJ(whichPlayer, lb)
	return LeaderboardGetPlayerIndex(lb, whichPlayer) + 1
end

--===========================================================================
-- Returns the player who is occupying a specified position in a leaderboard.
-- The position parameter is expected in the range of 1..16.
--
---@param position integer
---@param lb leaderboard
---@return player
function LeaderboardGetIndexedPlayerBJ(position, lb)
	---@type integer
	index       = nil
	---@type player
	indexPlayer = nil
	
	index       = 0
	while true do
		indexPlayer = Player(index)
		if (LeaderboardGetPlayerIndex(lb, indexPlayer) == position - 1) then
			return indexPlayer
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
	
	return Player(PLAYER_NEUTRAL_PASSIVE)
end

--===========================================================================
---@param whichPlayer player
---@return leaderboard
function PlayerGetLeaderboardBJ(whichPlayer)
	return PlayerGetLeaderboard(whichPlayer)
end

--===========================================================================
---@return leaderboard
function GetLastCreatedLeaderboard()
	return bj_lastCreatedLeaderboard
end