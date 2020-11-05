--***************************************************************************
--*
--*  Melee Template Starting AI Scripts
--*
--***************************************************************************

--===========================================================================
---@param num player
---@param s1 string
---@param s2 string
---@param s3 string
function PickMeleeAI(num, s1, s2, s3)
	---@type integer
	pick = nil
	
	-- easy difficulty never uses any custom AI scripts
	-- that are designed to be a bit more challenging
	--
	if GetAIDifficulty(num) == AI_DIFFICULTY_NEWBIE then
		StartMeleeAI(num, s1)
		return
	end
	
	if s2 == nil then
		pick = 1
	elseif s3 == nil then
		pick = GetRandomInt(1, 2)
	else
		pick = GetRandomInt(1, 3)
	end
	
	if pick == 1 then
		StartMeleeAI(num, s1)
	elseif pick == 2 then
		StartMeleeAI(num, s2)
	else
		StartMeleeAI(num, s3)
	end
end

--===========================================================================
function MeleeStartingAI()
	---@type integer
	index       = nil
	---@type player
	indexPlayer = nil
	---@type race
	indexRace   = nil
	
	index       = 0
	while true do
		indexPlayer = Player(index)
		if (GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING) then
			indexRace = GetPlayerRace(indexPlayer)
			if (GetPlayerController(indexPlayer) == MAP_CONTROL_COMPUTER) then
				-- Run a race-specific melee AI script.
				if (indexRace == RACE_HUMAN) then
					PickMeleeAI(indexPlayer, "human.ai", nil, nil)
				elseif (indexRace == RACE_ORC) then
					PickMeleeAI(indexPlayer, "orc.ai", nil, nil)
				elseif (indexRace == RACE_UNDEAD) then
					PickMeleeAI(indexPlayer, "undead.ai", nil, nil)
					RecycleGuardPosition(bj_ghoul[index])
				elseif (indexRace == RACE_NIGHTELF) then
					PickMeleeAI(indexPlayer, "elf.ai", nil, nil)
				else
					-- Unrecognized race.
				end
				ShareEverythingWithTeamAI(indexPlayer)
			end
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

---@param targ unit
function LockGuardPosition(targ)
	SetUnitCreepGuard(targ, true)
end