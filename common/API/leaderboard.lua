--============================================================================
-- Leaderboard API

-- Create a leaderboard object
---@return leaderboard
function CreateLeaderboard() end

---@param lb leaderboard
function DestroyLeaderboard(lb) end


---@param lb leaderboard
---@param show boolean
function LeaderboardDisplay(lb, show) end

---@param lb leaderboard
---@return boolean
function IsLeaderboardDisplayed(lb) end


---@param lb leaderboard
---@return integer
function LeaderboardGetItemCount(lb) end


---@param lb leaderboard
---@param count integer
function LeaderboardSetSizeByItemCount(lb, count) end

---@param lb leaderboard
---@param label string
---@param value integer
---@param p player
function LeaderboardAddItem(lb, label, value, p) end

---@param lb leaderboard
---@param index integer
function LeaderboardRemoveItem(lb, index) end

---@param lb leaderboard
---@param p player
function LeaderboardRemovePlayerItem(lb, p) end

---@param lb leaderboard
function LeaderboardClear(lb) end


---@param lb leaderboard
---@param ascending boolean
function LeaderboardSortItemsByValue(lb, ascending) end

---@param lb leaderboard
---@param ascending boolean
function LeaderboardSortItemsByPlayer(lb, ascending) end

---@param lb leaderboard
---@param ascending boolean
function LeaderboardSortItemsByLabel(lb, ascending) end


---@param lb leaderboard
---@param p player
---@return boolean
function LeaderboardHasPlayerItem(lb, p) end

---@param lb leaderboard
---@param p player
---@return integer
function LeaderboardGetPlayerIndex(lb, p) end

---@param lb leaderboard
---@param label string
function LeaderboardSetLabel(lb, label) end

---@param lb leaderboard
---@return string
function LeaderboardGetLabelText(lb) end


---@param toPlayer player
---@param lb leaderboard
function PlayerSetLeaderboard(toPlayer, lb) end

---@param toPlayer player
---@return leaderboard
function PlayerGetLeaderboard(toPlayer) end


---@param lb leaderboard
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function LeaderboardSetLabelColor(lb, red, green, blue, alpha) end

---@param lb leaderboard
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function LeaderboardSetValueColor(lb, red, green, blue, alpha) end

---@param lb leaderboard
---@param showLabel boolean
---@param showNames boolean
---@param showValues boolean
---@param showIcons boolean
function LeaderboardSetStyle(lb, showLabel, showNames, showValues, showIcons) end


---@param lb leaderboard
---@param whichItem integer
---@param val integer
function LeaderboardSetItemValue(lb, whichItem, val) end

---@param lb leaderboard
---@param whichItem integer
---@param val string
function LeaderboardSetItemLabel(lb, whichItem, val) end

---@param lb leaderboard
---@param whichItem integer
---@param showLabel boolean
---@param showValue boolean
---@param showIcon boolean
function LeaderboardSetItemStyle(lb, whichItem, showLabel, showValue, showIcon) end

---@param lb leaderboard
---@param whichItem integer
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function LeaderboardSetItemLabelColor(lb, whichItem, red, green, blue, alpha) end

---@param lb leaderboard
---@param whichItem integer
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function LeaderboardSetItemValueColor(lb, whichItem, red, green, blue, alpha) end