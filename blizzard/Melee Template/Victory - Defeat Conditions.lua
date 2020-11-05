--***************************************************************************
--*
--*  Melee Template Victory / Defeat Conditions
--*
--***************************************************************************

--===========================================================================
---@param playerIndex integer
---@param opponentIndex integer
---@return boolean
function MeleePlayerIsOpponent(playerIndex, opponentIndex)
	---@type player
	thePlayer   = Player(playerIndex)
	---@type player
	theOpponent = Player(opponentIndex)
	
	-- The player himself is not an opponent.
	if (playerIndex == opponentIndex) then
		return false
	end
	
	-- Unused player slots are not opponents.
	if (GetPlayerSlotState(theOpponent) ~= PLAYER_SLOT_STATE_PLAYING) then
		return false
	end
	
	-- Players who are already defeated are not opponents.
	if (bj_meleeDefeated[opponentIndex]) then
		return false
	end
	
	-- Allied players with allied victory set are not opponents.
	if GetPlayerAlliance(thePlayer, theOpponent, ALLIANCE_PASSIVE) then
		if GetPlayerAlliance(theOpponent, thePlayer, ALLIANCE_PASSIVE) then
			if (GetPlayerState(thePlayer, PLAYER_STATE_ALLIED_VICTORY) == 1) then
				if (GetPlayerState(theOpponent, PLAYER_STATE_ALLIED_VICTORY) == 1) then
					return false
				end
			end
		end
	end
	
	return true
end

--===========================================================================
-- Count buildings currently owned by all allies, including the player themself.
--
---@param whichPlayer player
---@return integer
function MeleeGetAllyStructureCount(whichPlayer)
	---@type integer
	playerIndex   = nil
	---@type integer
	buildingCount = nil
	---@type player
	indexPlayer   = nil
	
	-- Count the number of buildings controlled by all not-yet-defeated co-allies.
	buildingCount = 0
	playerIndex   = 0
	while true do
		indexPlayer = Player(playerIndex)
		
		-- uncomment to cause defeat even if you have control of ally structures, but yours have been nixed
		--if (PlayersAreCoAllied(whichPlayer, indexPlayer) and not bj_meleeDefeated[playerIndex]) then
		if (PlayersAreCoAllied(whichPlayer, indexPlayer)) then
			buildingCount = buildingCount + GetPlayerStructureCount(indexPlayer, true)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	return buildingCount
end

--===========================================================================
-- Count allies, excluding dead players and the player themself.
--
---@param whichPlayer player
---@return integer
function MeleeGetAllyCount(whichPlayer)
	---@type integer
	playerIndex = nil
	---@type integer
	playerCount = nil
	---@type player
	indexPlayer = nil
	
	-- Count the number of not-yet-defeated co-allies.
	playerCount = 0
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) and not bj_meleeDefeated[playerIndex] and (whichPlayer ~= indexPlayer) then
			playerCount = playerCount + 1
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	return playerCount
end

--===========================================================================
-- Counts key structures owned by a player and his or her allies, including
-- structures currently upgrading or under construction.
--
-- Key structures: Town Hall, Great Hall, Tree of Life, Necropolis
--
---@param whichPlayer player
---@return integer
function MeleeGetAllyKeyStructureCount(whichPlayer)
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	---@type integer
	keyStructs  = nil
	
	-- Count the number of buildings controlled by all not-yet-defeated co-allies.
	keyStructs  = 0
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		if (PlayersAreCoAllied(whichPlayer, indexPlayer)) then
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "townhall", true, true)
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "greathall", true, true)
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "treeoflife", true, true)
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "necropolis", true, true)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	return keyStructs
end

--===========================================================================
-- Enum: Draw out a specific player.
--
function MeleeDoDrawEnum()
	---@type player
	thePlayer = GetEnumPlayer()
	
	CachePlayerHeroData(thePlayer)
	RemovePlayerPreserveUnitsBJ(thePlayer, PLAYER_GAME_RESULT_TIE, false)
end

--===========================================================================
-- Enum: Victory out a specific player.
--
function MeleeDoVictoryEnum()
	---@type player
	thePlayer   = GetEnumPlayer()
	---@type integer
	playerIndex = GetPlayerId(thePlayer)
	
	if (not bj_meleeVictoried[playerIndex]) then
		bj_meleeVictoried[playerIndex] = true
		CachePlayerHeroData(thePlayer)
		RemovePlayerPreserveUnitsBJ(thePlayer, PLAYER_GAME_RESULT_VICTORY, false)
	end
end

--===========================================================================
-- Defeat out a specific player.
--
---@param whichPlayer player
function MeleeDoDefeat(whichPlayer)
	bj_meleeDefeated[GetPlayerId(whichPlayer)] = true
	RemovePlayerPreserveUnitsBJ(whichPlayer, PLAYER_GAME_RESULT_DEFEAT, false)
end

--===========================================================================
-- Enum: Defeat out a specific player.
--
function MeleeDoDefeatEnum()
	---@type player
	thePlayer = GetEnumPlayer()
	
	-- needs to happen before ownership change
	CachePlayerHeroData(thePlayer)
	MakeUnitsPassiveForTeam(thePlayer)
	MeleeDoDefeat(thePlayer)
end

--===========================================================================
-- A specific player left the game.
--
---@param whichPlayer player
function MeleeDoLeave(whichPlayer)
	if (GetIntegerGameState(GAME_STATE_DISCONNECTED) ~= 0) then
		GameOverDialogBJ(whichPlayer, true)
	else
		bj_meleeDefeated[GetPlayerId(whichPlayer)] = true
		RemovePlayerPreserveUnitsBJ(whichPlayer, PLAYER_GAME_RESULT_DEFEAT, true)
	end
end

--===========================================================================
-- Remove all observers
--
function MeleeRemoveObservers()
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	
	-- Give all observers the game over dialog
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		
		if (IsPlayerObserver(indexPlayer)) then
			RemovePlayerPreserveUnitsBJ(indexPlayer, PLAYER_GAME_RESULT_NEUTRAL, false)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Test all players to determine if a team has won.  For a team to win, all
-- remaining (read: undefeated) players need to be co-allied with all other
-- remaining players.  If even one player is not allied towards another,
-- everyone must be denied victory.
--
---@return force
function MeleeCheckForVictors()
	---@type integer
	playerIndex         = nil
	---@type integer
	opponentIndex       = nil
	---@type force
	opponentlessPlayers = CreateForce()
	---@type boolean
	gameOver            = false
	
	-- Check to see if any players have opponents remaining.
	playerIndex         = 0
	while true do
		if (not bj_meleeDefeated[playerIndex]) then
			-- Determine whether or not this player has any remaining opponents.
			opponentIndex = 0
			while true do
				-- If anyone has an opponent, noone can be victorious yet.
				if MeleePlayerIsOpponent(playerIndex, opponentIndex) then
					return CreateForce()
				end
				
				opponentIndex = opponentIndex + 1
				if opponentIndex == bj_MAX_PLAYERS then break end
			end
			
			-- Keep track of each opponentless player so that we can give
			-- them a victory later.
			ForceAddPlayer(opponentlessPlayers, Player(playerIndex))
			gameOver = true
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	-- Set the game over global flag
	bj_meleeGameOver = gameOver
	
	return opponentlessPlayers
end

--===========================================================================
-- Test each player to determine if anyone has been defeated.
--
function MeleeCheckForLosersAndVictors()
	---@type integer
	playerIndex       = nil
	---@type player
	indexPlayer       = nil
	---@type force
	defeatedPlayers   = CreateForce()
	---@type force
	victoriousPlayers = nil
	---@type boolean
	gameOver          = false
	
	-- If the game is already over, do nothing
	if (bj_meleeGameOver) then
		return
	end
	
	-- If the game was disconnected then it is over, in this case we
	-- don't want to report results for anyone as they will most likely
	-- conflict with the actual game results
	if (GetIntegerGameState(GAME_STATE_DISCONNECTED) ~= 0) then
		bj_meleeGameOver = true
		return
	end
	
	-- Check each player to see if he or she has been defeated yet.
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		
		if (not bj_meleeDefeated[playerIndex] and not bj_meleeVictoried[playerIndex]) then
			--call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, "Player"+I2S(playerIndex)+" has "+I2S(MeleeGetAllyStructureCount(indexPlayer))+" ally buildings.")
			if (MeleeGetAllyStructureCount(indexPlayer) <= 0) then
				
				-- Keep track of each defeated player so that we can give
				-- them a defeat later.
				ForceAddPlayer(defeatedPlayers, Player(playerIndex))
				
				-- Set their defeated flag now so MeleeCheckForVictors
				-- can detect victors.
				bj_meleeDefeated[playerIndex] = true
			end
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	-- Now that the defeated flags are set, check if there are any victors
	victoriousPlayers = MeleeCheckForVictors()
	
	-- Defeat all defeated players
	ForForce(defeatedPlayers, MeleeDoDefeatEnum)
	
	-- Give victory to all victorious players
	ForForce(victoriousPlayers, MeleeDoVictoryEnum)
	
	-- If the game is over we should remove all observers
	if (bj_meleeGameOver) then
		MeleeRemoveObservers()
	end
end

--===========================================================================
-- Returns a race-specific "build X or be revealed" message.
--
---@param whichPlayer player
---@return string
function MeleeGetCrippledWarningMessage(whichPlayer)
	---@type race
	r = GetPlayerRace(whichPlayer)
	
	if (r == RACE_HUMAN) then
		return GetLocalizedString("CRIPPLE_WARNING_HUMAN")
	elseif (r == RACE_ORC) then
		return GetLocalizedString("CRIPPLE_WARNING_ORC")
	elseif (r == RACE_NIGHTELF) then
		return GetLocalizedString("CRIPPLE_WARNING_NIGHTELF")
	elseif (r == RACE_UNDEAD) then
		return GetLocalizedString("CRIPPLE_WARNING_UNDEAD")
	else
		-- Unrecognized Race
		return ""
	end
end

--===========================================================================
-- Returns a race-specific "build X" label for cripple timers.
--
---@param whichPlayer player
---@return string
function MeleeGetCrippledTimerMessage(whichPlayer)
	---@type race
	r = GetPlayerRace(whichPlayer)
	
	if (r == RACE_HUMAN) then
		return GetLocalizedString("CRIPPLE_TIMER_HUMAN")
	elseif (r == RACE_ORC) then
		return GetLocalizedString("CRIPPLE_TIMER_ORC")
	elseif (r == RACE_NIGHTELF) then
		return GetLocalizedString("CRIPPLE_TIMER_NIGHTELF")
	elseif (r == RACE_UNDEAD) then
		return GetLocalizedString("CRIPPLE_TIMER_UNDEAD")
	else
		-- Unrecognized Race
		return ""
	end
end

--===========================================================================
-- Returns a race-specific "build X" label for cripple timers.
--
---@param whichPlayer player
---@return string
function MeleeGetCrippledRevealedMessage(whichPlayer)
	return GetLocalizedString("CRIPPLE_REVEALING_PREFIX") + GetPlayerName(whichPlayer) + GetLocalizedString("CRIPPLE_REVEALING_POSTFIX")
end

--===========================================================================
---@param whichPlayer player
---@param expose boolean
function MeleeExposePlayer(whichPlayer, expose)
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	---@type force
	toExposeTo  = CreateForce()
	
	CripplePlayer(whichPlayer, toExposeTo, false)
	
	bj_playerIsExposed[GetPlayerId(whichPlayer)] = expose
	playerIndex                                  = 0
	while true do
		indexPlayer = Player(playerIndex)
		if (not PlayersAreCoAllied(whichPlayer, indexPlayer)) then
			ForceAddPlayer(toExposeTo, indexPlayer)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	CripplePlayer(whichPlayer, toExposeTo, expose)
	DestroyForce(toExposeTo)
end

--===========================================================================
function MeleeExposeAllPlayers()
	---@type integer
	playerIndex  = nil
	---@type player
	indexPlayer  = nil
	---@type integer
	playerIndex2 = nil
	---@type player
	indexPlayer2 = nil
	---@type force
	toExposeTo   = CreateForce()
	
	playerIndex  = 0
	while true do
		indexPlayer = Player(playerIndex)
		
		ForceClear(toExposeTo)
		CripplePlayer(indexPlayer, toExposeTo, false)
		
		playerIndex2 = 0
		while true do
			indexPlayer2 = Player(playerIndex2)
			
			if playerIndex ~= playerIndex2 then
				if (not PlayersAreCoAllied(indexPlayer, indexPlayer2)) then
					ForceAddPlayer(toExposeTo, indexPlayer2)
				end
			end
			
			playerIndex2 = playerIndex2 + 1
			if playerIndex2 == bj_MAX_PLAYERS then break end
		end
		
		CripplePlayer(indexPlayer, toExposeTo, true)
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	
	DestroyForce(toExposeTo)
end

--===========================================================================
function MeleeCrippledPlayerTimeout()
	---@type timer
	expiredTimer  = GetExpiredTimer()
	---@type integer
	playerIndex   = nil
	---@type player
	exposedPlayer = nil
	
	-- Determine which player's timer expired.
	playerIndex   = 0
	while true do
		if (bj_crippledTimer[playerIndex] == expiredTimer) then
			if true then break end
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	if (playerIndex == bj_MAX_PLAYERS) then
		return
	end
	exposedPlayer = Player(playerIndex)
	
	if (GetLocalPlayer() == exposedPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		
		-- Hide the timer window for this player.
		TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], false)
	end
	
	-- Display a text message to all players, explaining the exposure.
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, MeleeGetCrippledRevealedMessage(exposedPlayer))
	
	-- Expose the player.
	MeleeExposePlayer(exposedPlayer, true)
end

--===========================================================================
---@param whichPlayer player
---@return boolean
function MeleePlayerIsCrippled(whichPlayer)
	---@type integer
	allyStructures    = MeleeGetAllyStructureCount(whichPlayer)
	---@type integer
	allyKeyStructures = MeleeGetAllyKeyStructureCount(whichPlayer)
	
	-- Dead teams are not considered to be crippled.
	return (allyStructures > 0) and (allyKeyStructures <= 0)
end

--===========================================================================
-- Test each player to determine if anyone has become crippled.
--
function MeleeCheckForCrippledPlayers()
	---@type integer
	playerIndex     = nil
	---@type player
	indexPlayer     = nil
	---@type force
	crippledPlayers = CreateForce()
	---@type boolean
	isNowCrippled   = nil
	---@type race
	indexRace       = nil
	
	-- The "finish soon" exposure of all players overrides any "crippled" exposure
	if bj_finishSoonAllExposed then
		return
	end
	
	-- Check each player to see if he or she has been crippled or uncrippled.
	playerIndex = 0
	while true do
		indexPlayer   = Player(playerIndex)
		isNowCrippled = MeleePlayerIsCrippled(indexPlayer)
		
		if (not bj_playerIsCrippled[playerIndex] and isNowCrippled) then
			
			-- Player became crippled; start their cripple timer.
			bj_playerIsCrippled[playerIndex] = true
			TimerStart(bj_crippledTimer[playerIndex], bj_MELEE_CRIPPLE_TIMEOUT, false, MeleeCrippledPlayerTimeout)
			
			if (GetLocalPlayer() == indexPlayer) then
				-- Use only local code (no net traffic) within this block to avoid desyncs.
				
				-- Show the timer window.
				TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], true)
				
				-- Display a warning message.
				DisplayTimedTextToPlayer(indexPlayer, 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, MeleeGetCrippledWarningMessage(indexPlayer))
			end
		
		elseif (bj_playerIsCrippled[playerIndex] and not isNowCrippled) then
			
			-- Player became uncrippled; stop their cripple timer.
			bj_playerIsCrippled[playerIndex] = false
			PauseTimer(bj_crippledTimer[playerIndex])
			
			if (GetLocalPlayer() == indexPlayer) then
				-- Use only local code (no net traffic) within this block to avoid desyncs.
				
				-- Hide the timer window for this player.
				TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], false)
				
				-- Display a confirmation message if the player's team is still alive.
				if (MeleeGetAllyStructureCount(indexPlayer) > 0) then
					if (bj_playerIsExposed[playerIndex]) then
						DisplayTimedTextToPlayer(indexPlayer, 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, GetLocalizedString("CRIPPLE_UNREVEALED"))
					else
						DisplayTimedTextToPlayer(indexPlayer, 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, GetLocalizedString("CRIPPLE_UNCRIPPLED"))
					end
				end
			end
			
			-- If the player granted shared vision, deny that vision now.
			MeleeExposePlayer(indexPlayer, false)
		
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Determine if the lost unit should result in any defeats or victories.
--
---@param lostUnit unit
function MeleeCheckLostUnit(lostUnit)
	---@type player
	lostUnitOwner = GetOwningPlayer(lostUnit)
	
	-- We only need to check for mortality if this was the last building.
	if (GetPlayerStructureCount(lostUnitOwner, true) <= 0) then
		MeleeCheckForLosersAndVictors()
	end
	
	-- Check if the lost unit has crippled or uncrippled the player.
	-- (A team with 0 units is dead, and thus considered uncrippled.)
	MeleeCheckForCrippledPlayers()
end

--===========================================================================
-- Determine if the gained unit should result in any defeats, victories,
-- or cripple-status changes.
--
---@param addedUnit unit
function MeleeCheckAddedUnit(addedUnit)
	---@type player
	addedUnitOwner = GetOwningPlayer(addedUnit)
	
	-- If the player was crippled, this unit may have uncrippled him/her.
	if (bj_playerIsCrippled[GetPlayerId(addedUnitOwner)]) then
		MeleeCheckForCrippledPlayers()
	end
end

--===========================================================================
function MeleeTriggerActionConstructCancel()
	MeleeCheckLostUnit(GetCancelledStructure())
end

--===========================================================================
function MeleeTriggerActionUnitDeath()
	if (IsUnitType(GetDyingUnit(), UNIT_TYPE_STRUCTURE)) then
		MeleeCheckLostUnit(GetDyingUnit())
	end
end

--===========================================================================
function MeleeTriggerActionUnitConstructionStart()
	MeleeCheckAddedUnit(GetConstructingStructure())
end

--===========================================================================
function MeleeTriggerActionPlayerDefeated()
	---@type player
	thePlayer = GetTriggerPlayer()
	CachePlayerHeroData(thePlayer)
	
	if (MeleeGetAllyCount(thePlayer) > 0) then
		-- If at least one ally is still alive and kicking, share units with
		-- them and proceed with death.
		ShareEverythingWithTeam(thePlayer)
		if (not bj_meleeDefeated[GetPlayerId(thePlayer)]) then
			MeleeDoDefeat(thePlayer)
		end
	else
		-- If no living allies remain, swap all units and buildings over to
		-- neutral_passive and proceed with death.
		MakeUnitsPassiveForTeam(thePlayer)
		if (not bj_meleeDefeated[GetPlayerId(thePlayer)]) then
			MeleeDoDefeat(thePlayer)
		end
	end
	MeleeCheckForLosersAndVictors()
end

--===========================================================================
function MeleeTriggerActionPlayerLeft()
	---@type player
	thePlayer = GetTriggerPlayer()
	
	-- Just show game over for observers when they leave
	if (IsPlayerObserver(thePlayer)) then
		RemovePlayerPreserveUnitsBJ(thePlayer, PLAYER_GAME_RESULT_NEUTRAL, false)
		return
	end
	
	CachePlayerHeroData(thePlayer)
	
	-- This is the same as defeat except the player generates the message
	-- "player left the game" as opposed to "player was defeated".
	
	if (MeleeGetAllyCount(thePlayer) > 0) then
		-- If at least one ally is still alive and kicking, share units with
		-- them and proceed with death.
		ShareEverythingWithTeam(thePlayer)
		MeleeDoLeave(thePlayer)
	else
		-- If no living allies remain, swap all units and buildings over to
		-- neutral_passive and proceed with death.
		MakeUnitsPassiveForTeam(thePlayer)
		MeleeDoLeave(thePlayer)
	end
	MeleeCheckForLosersAndVictors()
end

--===========================================================================
function MeleeTriggerActionAllianceChange()
	MeleeCheckForLosersAndVictors()
	MeleeCheckForCrippledPlayers()
end

--===========================================================================
function MeleeTriggerTournamentFinishSoon()
	-- Note: We may get this trigger multiple times
	---@type integer
	playerIndex   = nil
	---@type player
	indexPlayer   = nil
	---@type real
	timeRemaining = GetTournamentFinishSoonTimeRemaining()
	
	if not bj_finishSoonAllExposed then
		bj_finishSoonAllExposed = true
		
		-- Reset all crippled players and their timers, and hide the local crippled timer dialog
		playerIndex             = 0
		while true do
			indexPlayer = Player(playerIndex)
			if bj_playerIsCrippled[playerIndex] then
				-- Uncripple the player
				bj_playerIsCrippled[playerIndex] = false
				PauseTimer(bj_crippledTimer[playerIndex])
				
				if (GetLocalPlayer() == indexPlayer) then
					-- Use only local code (no net traffic) within this block to avoid desyncs.
					
					-- Hide the timer window.
					TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], false)
				end
			
			end
			playerIndex = playerIndex + 1
			if playerIndex == bj_MAX_PLAYERS then break end
		end
		
		-- Expose all players
		MeleeExposeAllPlayers()
	end
	
	-- Show the "finish soon" timer dialog and set the real time remaining
	TimerDialogDisplay(bj_finishSoonTimerDialog, true)
	TimerDialogSetRealTimeRemaining(bj_finishSoonTimerDialog, timeRemaining)
end


--===========================================================================
---@param whichPlayer player
---@return boolean
function MeleeWasUserPlayer(whichPlayer)
	---@type playerslotstate
	slotState = nil
	
	if (GetPlayerController(whichPlayer) ~= MAP_CONTROL_USER) then
		return false
	end
	
	slotState = GetPlayerSlotState(whichPlayer)
	
	return (slotState == PLAYER_SLOT_STATE_PLAYING or slotState == PLAYER_SLOT_STATE_LEFT)
end

--===========================================================================
---@param multiplier integer
function MeleeTournamentFinishNowRuleA(multiplier)
	---@type integer
	playerScore  = {}
	---@type integer
	teamScore    = {}
	---@type force
	teamForce    = {}
	---@type integer
	teamCount    = nil
	---@type integer
	index        = nil
	---@type player
	indexPlayer  = nil
	---@type integer
	index2       = nil
	---@type player
	indexPlayer2 = nil
	---@type integer
	bestTeam     = nil
	---@type integer
	bestScore    = nil
	---@type boolean
	draw         = nil
	
	-- Compute individual player scores
	index        = 0
	while true do
		indexPlayer = Player(index)
		if MeleeWasUserPlayer(indexPlayer) then
			playerScore[index] = GetTournamentScore(indexPlayer)
			if playerScore[index] <= 0 then
				playerScore[index] = 1
			end
		else
			playerScore[index] = 0
		end
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
	
	-- Compute team scores and team forces
	teamCount = 0
	index     = 0
	while true do
		if playerScore[index] ~= 0 then
			indexPlayer          = Player(index)
			
			teamScore[teamCount] = 0
			teamForce[teamCount] = CreateForce()
			
			index2               = index
			while true do
				if playerScore[index2] ~= 0 then
					indexPlayer2 = Player(index2)
					
					if PlayersAreCoAllied(indexPlayer, indexPlayer2) then
						teamScore[teamCount] = teamScore[teamCount] + playerScore[index2]
						ForceAddPlayer(teamForce[teamCount], indexPlayer2)
						playerScore[index2] = 0
					end
				end
				
				index2 = index2 + 1
				if index2 == bj_MAX_PLAYERS then break end
			end
			
			teamCount = teamCount + 1
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
	
	-- The game is now over
	bj_meleeGameOver = true
	
	-- There should always be at least one team, but continue to work if not
	if teamCount ~= 0 then
		
		-- Find best team score
		bestTeam  = -1
		bestScore = -1
		index     = 0
		while true do
			if teamScore[index] > bestScore then
				bestTeam  = index
				bestScore = teamScore[index]
			end
			
			index = index + 1
			if index == teamCount then break end
		end
		
		-- Check whether the best team's score is FourCC('multiplier') times better than
		-- every other team. In the case of multiplier == 1 and exactly equal team
		-- scores, the first team (which was randomly chosen by the server) will win.
		draw  = false
		index = 0
		while true do
			if index ~= bestTeam then
				if bestScore < (multiplier * teamScore[index]) then
					draw = true
				end
			end
			
			index = index + 1
			if index == teamCount then break end
		end
		
		if draw then
			-- Give draw to all players on all teams
			index = 0
			while true do
				ForForce(teamForce[index], MeleeDoDrawEnum)
				
				index = index + 1
				if index == teamCount then break end
			end
		else
			-- Give defeat to all players on teams other than the best team
			index = 0
			while true do
				if index ~= bestTeam then
					ForForce(teamForce[index], MeleeDoDefeatEnum)
				end
				
				index = index + 1
				if index == teamCount then break end
			end
			
			-- Give victory to all players on the best team
			ForForce(teamForce[bestTeam], MeleeDoVictoryEnum)
		end
	end

end

--===========================================================================
function MeleeTriggerTournamentFinishNow()
	---@type integer
	rule = GetTournamentFinishNowRule()
	
	-- If the game is already over, do nothing
	if bj_meleeGameOver then
		return
	end
	
	if (rule == 1) then
		-- Finals games
		MeleeTournamentFinishNowRuleA(1)
	else
		-- Preliminary games
		MeleeTournamentFinishNowRuleA(3)
	end
	
	-- Since the game is over we should remove all observers
	MeleeRemoveObservers()

end

--===========================================================================
function MeleeInitVictoryDefeat()
	---@type trigger
	trig                     = nil
	---@type integer
	index                    = nil
	---@type player
	indexPlayer              = nil
	
	-- Create a timer window for the "finish soon" timeout period, it has no timer
	-- because it is driven by real time (outside of the game state to avoid desyncs)
	bj_finishSoonTimerDialog = CreateTimerDialog(null)
	
	-- Set a trigger to fire when we receive a "finish soon" game event
	trig                     = CreateTrigger()
	TriggerRegisterGameEvent(trig, EVENT_GAME_TOURNAMENT_FINISH_SOON)
	TriggerAddAction(trig, MeleeTriggerTournamentFinishSoon)
	
	-- Set a trigger to fire when we receive a "finish now" game event
	trig = CreateTrigger()
	TriggerRegisterGameEvent(trig, EVENT_GAME_TOURNAMENT_FINISH_NOW)
	TriggerAddAction(trig, MeleeTriggerTournamentFinishNow)
	
	-- Set up each player's mortality code.
	index = 0
	while true do
		indexPlayer = Player(index)
		
		-- Make sure this player slot is playing.
		if (GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING) then
			bj_meleeDefeated[index]        = false
			bj_meleeVictoried[index]       = false
			
			-- Create a timer and timer window in case the player is crippled.
			bj_playerIsCrippled[index]     = false
			bj_playerIsExposed[index]      = false
			bj_crippledTimer[index]        = CreateTimer()
			bj_crippledTimerWindows[index] = CreateTimerDialog(bj_crippledTimer[index])
			TimerDialogSetTitle(bj_crippledTimerWindows[index], MeleeGetCrippledTimerMessage(indexPlayer))
			
			-- Set a trigger to fire whenever a building is cancelled for this player.
			trig = CreateTrigger()
			TriggerRegisterPlayerUnitEvent(trig, indexPlayer, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL, nil)
			TriggerAddAction(trig, MeleeTriggerActionConstructCancel)
			
			-- Set a trigger to fire whenever a unit dies for this player.
			trig = CreateTrigger()
			TriggerRegisterPlayerUnitEvent(trig, indexPlayer, EVENT_PLAYER_UNIT_DEATH, nil)
			TriggerAddAction(trig, MeleeTriggerActionUnitDeath)
			
			-- Set a trigger to fire whenever a unit begins construction for this player
			trig = CreateTrigger()
			TriggerRegisterPlayerUnitEvent(trig, indexPlayer, EVENT_PLAYER_UNIT_CONSTRUCT_START, nil)
			TriggerAddAction(trig, MeleeTriggerActionUnitConstructionStart)
			
			-- Set a trigger to fire whenever this player defeats-out
			trig = CreateTrigger()
			TriggerRegisterPlayerEvent(trig, indexPlayer, EVENT_PLAYER_DEFEAT)
			TriggerAddAction(trig, MeleeTriggerActionPlayerDefeated)
			
			-- Set a trigger to fire whenever this player leaves
			trig = CreateTrigger()
			TriggerRegisterPlayerEvent(trig, indexPlayer, EVENT_PLAYER_LEAVE)
			TriggerAddAction(trig, MeleeTriggerActionPlayerLeft)
			
			-- Set a trigger to fire whenever this player changes his/her alliances.
			trig = CreateTrigger()
			TriggerRegisterPlayerAllianceChange(trig, indexPlayer, ALLIANCE_PASSIVE)
			TriggerRegisterPlayerStateEvent(trig, indexPlayer, PLAYER_STATE_ALLIED_VICTORY, EQUAL, 1)
			TriggerAddAction(trig, MeleeTriggerActionAllianceChange)
		else
			bj_meleeDefeated[index]  = true
			bj_meleeVictoried[index] = false
			
			-- Handle leave events for observers
			if (IsPlayerObserver(indexPlayer)) then
				-- Set a trigger to fire whenever this player leaves
				trig = CreateTrigger()
				TriggerRegisterPlayerEvent(trig, indexPlayer, EVENT_PLAYER_LEAVE)
				TriggerAddAction(trig, MeleeTriggerActionPlayerLeft)
			end
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
	
	-- Test for victory / defeat at startup, in case the user has already won / lost.
	-- Allow for a short time to pass first, so that the map can finish loading.
	TimerStart(CreateTimer(), 2.0, false, MeleeTriggerActionAllianceChange)
end