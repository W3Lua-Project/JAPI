--***************************************************************************
--*
--*  UI Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param whichPlayer player
---@param key string
function ForceUIKeyBJ(whichPlayer, key)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ForceUIKey(key)
	end
end

--===========================================================================
---@param whichPlayer player
function ForceUICancelBJ(whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ForceUICancel()
	end
end