--***************************************************************************
--*
--*  Debugging Functions
--*
--***************************************************************************

--===========================================================================
---@param msg string
function BJDebugMsg(msg)
	---@type integer
	i = 0
	while true do
		DisplayTimedTextToPlayer(Player(i), 0, 0, 60, msg)
		i = i + 1
		if i == bj_MAX_PLAYERS then break end
	end
end