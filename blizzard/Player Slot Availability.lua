--***************************************************************************
--*
--*  Player Slot Availability
--*
--***************************************************************************

--===========================================================================
function CheckInitPlayerSlotAvailability()
	---@type integer
	index = nil
	
	if (not bj_slotControlReady) then
		index = 0
		while true do
			bj_slotControlUsed[index] = false
			bj_slotControl[index]     = MAP_CONTROL_USER
			index                     = index + 1
			if index == bj_MAX_PLAYERS then break end
		end
		bj_slotControlReady = true
	end
end

--===========================================================================
---@param whichPlayer player
---@param control mapcontrol
function SetPlayerSlotAvailable(whichPlayer, control)
	---@type integer
	playerIndex = GetPlayerId(whichPlayer)
	
	CheckInitPlayerSlotAvailability()
	bj_slotControlUsed[playerIndex] = true
	bj_slotControl[playerIndex]     = control
end