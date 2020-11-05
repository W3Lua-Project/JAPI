--***************************************************************************
--*
--*  Alliance Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param sourcePlayer player
---@param whichAllianceSetting alliancetype
---@param value boolean
---@param otherPlayer player
function SetPlayerAllianceBJ(sourcePlayer, whichAllianceSetting, value, otherPlayer)
	-- Prevent players from attempting to ally with themselves.
	if (sourcePlayer == otherPlayer) then
		return
	end
	
	SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value)
end

--===========================================================================
-- Set all flags used by the in-game "Ally" checkbox.
--
---@param sourcePlayer player
---@param otherPlayer player
---@param flag boolean
function SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_HELP_REQUEST, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_HELP_RESPONSE, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_XP, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_SPELLS, flag)
end

--===========================================================================
-- Set all flags used by the in-game "Shared Vision" checkbox.
--
---@param sourcePlayer player
---@param otherPlayer player
---@param flag boolean
function SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_VISION, flag)
end

--===========================================================================
-- Set all flags used by the in-game "Shared Units" checkbox.
--
---@param sourcePlayer player
---@param otherPlayer player
---@param flag boolean
function SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_CONTROL, flag)
end

--===========================================================================
-- Set all flags used by the in-game "Shared Units" checkbox with the Full
-- Shared Unit Control feature enabled.
--
---@param sourcePlayer player
---@param otherPlayer player
---@param flag boolean
function SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, flag)
end

--===========================================================================
---@param sourcePlayer player
---@param otherPlayer player
---@param allianceState integer
function SetPlayerAllianceStateBJ(sourcePlayer, otherPlayer, allianceState)
	-- Prevent players from attempting to ally with themselves.
	if (sourcePlayer == otherPlayer) then
		return
	end
	
	if allianceState == bj_ALLIANCE_UNALLIED then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_UNALLIED_VISION then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED_VISION then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED_UNITS then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED_ADVUNITS then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, true)
	elseif allianceState == bj_ALLIANCE_NEUTRAL then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, true)
	elseif allianceState == bj_ALLIANCE_NEUTRAL_VISION then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, true)
	else
		-- Unrecognized alliance state - ignore the request.
	end
end

--===========================================================================
-- Set the alliance states for an entire force towards another force.
--
---@param sourceForce force
---@param targetForce force
---@param allianceState integer
function SetForceAllianceStateBJ(sourceForce, targetForce, allianceState)
	---@type integer
	sourceIndex = nil
	---@type integer
	targetIndex = nil
	
	sourceIndex = 0
	while true do
		
		if (sourceForce == bj_FORCE_ALL_PLAYERS or IsPlayerInForce(Player(sourceIndex), sourceForce)) then
			targetIndex = 0
			while true do
				if (targetForce == bj_FORCE_ALL_PLAYERS or IsPlayerInForce(Player(targetIndex), targetForce)) then
					SetPlayerAllianceStateBJ(Player(sourceIndex), Player(targetIndex), allianceState)
				end
				
				targetIndex = targetIndex + 1
				if targetIndex == bj_MAX_PLAYER_SLOTS then break end
			end
		end
		
		sourceIndex = sourceIndex + 1
		if sourceIndex == bj_MAX_PLAYER_SLOTS then break end
	end
end

--===========================================================================
-- Test to see if two players are co-allied (allied with each other).
--
---@param playerA player
---@param playerB player
---@return boolean
function PlayersAreCoAllied(playerA, playerB)
	-- Players are considered to be allied with themselves.
	if (playerA == playerB) then
		return true
	end
	
	-- Co-allies are both allied with each other.
	if GetPlayerAlliance(playerA, playerB, ALLIANCE_PASSIVE) then
		if GetPlayerAlliance(playerB, playerA, ALLIANCE_PASSIVE) then
			return true
		end
	end
	return false
end

--===========================================================================
-- Force (whichPlayer) AI player to share vision and advanced unit control
-- with all AI players of its allies.
--
---@param whichPlayer player
function ShareEverythingWithTeamAI(whichPlayer)
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		if (PlayersAreCoAllied(whichPlayer, indexPlayer) and whichPlayer ~= indexPlayer) then
			if (GetPlayerController(indexPlayer) == MAP_CONTROL_COMPUTER) then
				SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_VISION, true)
				SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_CONTROL, true)
				SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
			end
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Force (whichPlayer) to share vision and advanced unit control with all of his/her allies.
--
---@param whichPlayer player
function ShareEverythingWithTeam(whichPlayer)
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		if (PlayersAreCoAllied(whichPlayer, indexPlayer) and whichPlayer ~= indexPlayer) then
			SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_VISION, true)
			SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_CONTROL, true)
			SetPlayerAlliance(indexPlayer, whichPlayer, ALLIANCE_SHARED_CONTROL, true)
			SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Creates a 'Neutral Victim' player slot.  This slot is passive towards all
-- other players, but all other players are aggressive towards him/her.
--
function ConfigureNeutralVictim()
	---@type integer
	index         = nil
	---@type player
	indexPlayer   = nil
	---@type player
	neutralVictim = Player(bj_PLAYER_NEUTRAL_VICTIM)
	
	index         = 0
	while true do
		indexPlayer = Player(index)
		
		SetPlayerAlliance(neutralVictim, indexPlayer, ALLIANCE_PASSIVE, true)
		SetPlayerAlliance(indexPlayer, neutralVictim, ALLIANCE_PASSIVE, false)
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
	
	-- Neutral Victim and Neutral Aggressive should not fight each other.
	indexPlayer = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	SetPlayerAlliance(neutralVictim, indexPlayer, ALLIANCE_PASSIVE, true)
	SetPlayerAlliance(indexPlayer, neutralVictim, ALLIANCE_PASSIVE, true)
	
	-- Neutral Victim does not give bounties.
	SetPlayerState(neutralVictim, PLAYER_STATE_GIVES_BOUNTY, 0)
end

--===========================================================================
function MakeUnitsPassiveForPlayerEnum()
	SetUnitOwner(GetEnumUnit(), Player(bj_PLAYER_NEUTRAL_VICTIM), false)
end

--===========================================================================
-- Change ownership for every unit of (whichPlayer)'s team to neutral passive.
--
---@param whichPlayer player
function MakeUnitsPassiveForPlayer(whichPlayer)
	---@type group
	playerUnits = CreateGroup()
	CachePlayerHeroData(whichPlayer)
	GroupEnumUnitsOfPlayer(playerUnits, whichPlayer, nil)
	ForGroup(playerUnits, MakeUnitsPassiveForPlayerEnum)
	DestroyGroup(playerUnits)
end

--===========================================================================
-- Change ownership for every unit of (whichPlayer)'s team to neutral passive.
--
---@param whichPlayer player
function MakeUnitsPassiveForTeam(whichPlayer)
	---@type integer
	playerIndex = nil
	---@type player
	indexPlayer = nil
	
	playerIndex = 0
	while true do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) then
			MakeUnitsPassiveForPlayer(indexPlayer)
		end
		
		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Determine whether or not victory/defeat is disabled via cheat codes.
--
---@param gameResult playergameresult
---@return boolean
function AllowVictoryDefeat(gameResult)
	if (gameResult == PLAYER_GAME_RESULT_VICTORY) then
		return not IsNoVictoryCheat()
	end
	if (gameResult == PLAYER_GAME_RESULT_DEFEAT) then
		return not IsNoDefeatCheat()
	end
	if (gameResult == PLAYER_GAME_RESULT_NEUTRAL) then
		return (not IsNoVictoryCheat()) and (not IsNoDefeatCheat())
	end
	return true
end

--===========================================================================
function EndGameBJ()
	EndGame(true)
end

--===========================================================================
---@param whichPlayer player
---@param leftGame boolean
function MeleeVictoryDialogBJ(whichPlayer, leftGame)
	---@type trigger
	t            = CreateTrigger()
	---@type dialog
	d            = DialogCreate()
	---@type string
	formatString = nil
	
	-- Display "player was victorious" or "player has left the game" message
	if (leftGame) then
		formatString = GetLocalizedString("PLAYER_LEFT_GAME")
	else
		formatString = GetLocalizedString("PLAYER_VICTORIOUS")
	end
	
	DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, formatString)
	
	DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))
	DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE_GAME"), GetLocalizedHotkey("GAMEOVER_CONTINUE_GAME"))
	
	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddQuitButton(d, true, GetLocalizedString("GAMEOVER_QUIT_GAME"), GetLocalizedHotkey("GAMEOVER_QUIT_GAME")))
	
	DialogDisplay(whichPlayer, d, true)
	StartSoundForPlayerBJ(whichPlayer, bj_victoryDialogSound)
end

--===========================================================================
---@param whichPlayer player
---@param leftGame boolean
function MeleeDefeatDialogBJ(whichPlayer, leftGame)
	---@type trigger
	t            = CreateTrigger()
	---@type dialog
	d            = DialogCreate()
	---@type string
	formatString = nil
	
	-- Display "player was defeated" or "player has left the game" message
	if (leftGame) then
		formatString = GetLocalizedString("PLAYER_LEFT_GAME")
	else
		formatString = GetLocalizedString("PLAYER_DEFEATED")
	end
	
	DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, formatString)
	
	DialogSetMessage(d, GetLocalizedString("GAMEOVER_DEFEAT_MSG"))
	
	-- Only show the continue button if the game is not over and observers on death are allowed
	if (not bj_meleeGameOver and IsMapFlagSet(MAP_OBSERVERS_ON_DEATH)) then
		DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE_OBSERVING"), GetLocalizedHotkey("GAMEOVER_CONTINUE_OBSERVING"))
	end
	
	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddQuitButton(d, true, GetLocalizedString("GAMEOVER_QUIT_GAME"), GetLocalizedHotkey("GAMEOVER_QUIT_GAME")))
	
	DialogDisplay(whichPlayer, d, true)
	StartSoundForPlayerBJ(whichPlayer, bj_defeatDialogSound)
end

--===========================================================================
---@param whichPlayer player
---@param leftGame boolean
function GameOverDialogBJ(whichPlayer, leftGame)
	---@type trigger
	t = CreateTrigger()
	---@type dialog
	d = DialogCreate()
	---@type string
	s = nil
	
	-- Display "player left the game" message
	DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_LEFT_GAME"))
	
	if (GetIntegerGameState(GAME_STATE_DISCONNECTED) ~= 0) then
		s = GetLocalizedString("GAMEOVER_DISCONNECTED")
	else
		s = GetLocalizedString("GAMEOVER_GAME_OVER")
	end
	
	DialogSetMessage(d, s)
	
	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddQuitButton(d, true, GetLocalizedString("GAMEOVER_OK"), GetLocalizedHotkey("GAMEOVER_OK")))
	
	DialogDisplay(whichPlayer, d, true)
	StartSoundForPlayerBJ(whichPlayer, bj_defeatDialogSound)
end

--===========================================================================
---@param whichPlayer player
---@param gameResult playergameresult
---@param leftGame boolean
function RemovePlayerPreserveUnitsBJ(whichPlayer, gameResult, leftGame)
	if AllowVictoryDefeat(gameResult) then
		
		RemovePlayer(whichPlayer, gameResult)
		
		if (gameResult == PLAYER_GAME_RESULT_VICTORY) then
			MeleeVictoryDialogBJ(whichPlayer, leftGame)
			return
		elseif (gameResult == PLAYER_GAME_RESULT_DEFEAT) then
			MeleeDefeatDialogBJ(whichPlayer, leftGame)
		else
			GameOverDialogBJ(whichPlayer, leftGame)
		end
	
	end
end

--===========================================================================
function CustomVictoryOkBJ()
	if bj_isSinglePlayer then
		PauseGame(false)
		-- Bump the difficulty back up to the default.
		SetGameDifficulty(GetDefaultDifficulty())
	end
	
	if (bj_changeLevelMapName == nil) then
		EndGame(bj_changeLevelShowScores)
	else
		ChangeLevel(bj_changeLevelMapName, bj_changeLevelShowScores)
	end
end

--===========================================================================
function CustomVictoryQuitBJ()
	if bj_isSinglePlayer then
		PauseGame(false)
		-- Bump the difficulty back up to the default.
		SetGameDifficulty(GetDefaultDifficulty())
	end
	
	EndGame(bj_changeLevelShowScores)
end

--===========================================================================
---@param whichPlayer player
function CustomVictoryDialogBJ(whichPlayer)
	---@type trigger
	t = CreateTrigger()
	---@type dialog
	d = DialogCreate()
	
	DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))
	
	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE"), GetLocalizedHotkey("GAMEOVER_CONTINUE")))
	TriggerAddAction(t, CustomVictoryOkBJ)
	
	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
	TriggerAddAction(t, CustomVictoryQuitBJ)
	
	if (GetLocalPlayer() == whichPlayer) then
		EnableUserControl(true)
		if bj_isSinglePlayer then
			PauseGame(true)
		end
		EnableUserUI(false)
	end
	
	DialogDisplay(whichPlayer, d, true)
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer, SOUND_VOLUMEGROUP_UI, 1.0)
	StartSoundForPlayerBJ(whichPlayer, bj_victoryDialogSound)
end

--===========================================================================
---@param whichPlayer player
function CustomVictorySkipBJ(whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		if bj_isSinglePlayer then
			-- Bump the difficulty back up to the default.
			SetGameDifficulty(GetDefaultDifficulty())
		end
		
		if (bj_changeLevelMapName == nil) then
			EndGame(bj_changeLevelShowScores)
		else
			ChangeLevel(bj_changeLevelMapName, bj_changeLevelShowScores)
		end
	end
end

--===========================================================================
---@param whichPlayer player
---@param showDialog boolean
---@param showScores boolean
function CustomVictoryBJ(whichPlayer, showDialog, showScores)
	if AllowVictoryDefeat(PLAYER_GAME_RESULT_VICTORY) then
		RemovePlayer(whichPlayer, PLAYER_GAME_RESULT_VICTORY)
		
		if not bj_isSinglePlayer then
			DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_VICTORIOUS"))
		end
		
		-- UI only needs to be displayed to users.
		if (GetPlayerController(whichPlayer) == MAP_CONTROL_USER) then
			bj_changeLevelShowScores = showScores
			if showDialog then
				CustomVictoryDialogBJ(whichPlayer)
			else
				CustomVictorySkipBJ(whichPlayer)
			end
		end
	end
end

--===========================================================================
function CustomDefeatRestartBJ()
	PauseGame(false)
	RestartGame(true)
end

--===========================================================================
function CustomDefeatReduceDifficultyBJ()
	---@type gamedifficulty
	diff = GetGameDifficulty()
	
	PauseGame(false)
	
	-- Knock the difficulty down, if possible.
	if (diff == MAP_DIFFICULTY_EASY) then
		-- Sorry, but it doesn't get any easier than this.
	elseif (diff == MAP_DIFFICULTY_NORMAL) then
		SetGameDifficulty(MAP_DIFFICULTY_EASY)
	elseif (diff == MAP_DIFFICULTY_HARD) then
		SetGameDifficulty(MAP_DIFFICULTY_NORMAL)
	else
		-- Unrecognized difficulty
	end
	
	RestartGame(true)
end

--===========================================================================
function CustomDefeatLoadBJ()
	PauseGame(false)
	DisplayLoadDialog()
end

--===========================================================================
function CustomDefeatQuitBJ()
	if bj_isSinglePlayer then
		PauseGame(false)
	end
	
	-- Bump the difficulty back up to the default.
	SetGameDifficulty(GetDefaultDifficulty())
	EndGame(true)
end

--===========================================================================
---@param whichPlayer player
---@param message string
function CustomDefeatDialogBJ(whichPlayer, message)
	---@type trigger
	t = CreateTrigger()
	---@type dialog
	d = DialogCreate()
	
	DialogSetMessage(d, message)
	
	if bj_isSinglePlayer then
		t = CreateTrigger()
		TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_RESTART"), GetLocalizedHotkey("GAMEOVER_RESTART")))
		TriggerAddAction(t, CustomDefeatRestartBJ)
		
		if (GetGameDifficulty() ~= MAP_DIFFICULTY_EASY) then
			t = CreateTrigger()
			TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_REDUCE_DIFFICULTY"), GetLocalizedHotkey("GAMEOVER_REDUCE_DIFFICULTY")))
			TriggerAddAction(t, CustomDefeatReduceDifficultyBJ)
		end
		
		t = CreateTrigger()
		TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_LOAD"), GetLocalizedHotkey("GAMEOVER_LOAD")))
		TriggerAddAction(t, CustomDefeatLoadBJ)
	end
	
	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
	TriggerAddAction(t, CustomDefeatQuitBJ)
	
	if (GetLocalPlayer() == whichPlayer) then
		EnableUserControl(true)
		if bj_isSinglePlayer then
			PauseGame(true)
		end
		EnableUserUI(false)
	end
	
	DialogDisplay(whichPlayer, d, true)
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer, SOUND_VOLUMEGROUP_UI, 1.0)
	StartSoundForPlayerBJ(whichPlayer, bj_defeatDialogSound)
end

--===========================================================================
---@param whichPlayer player
---@param message string
function CustomDefeatBJ(whichPlayer, message)
	if AllowVictoryDefeat(PLAYER_GAME_RESULT_DEFEAT) then
		RemovePlayer(whichPlayer, PLAYER_GAME_RESULT_DEFEAT)
		
		if not bj_isSinglePlayer then
			DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_DEFEATED"))
		end
		
		-- UI only needs to be displayed to users.
		if (GetPlayerController(whichPlayer) == MAP_CONTROL_USER) then
			CustomDefeatDialogBJ(whichPlayer, message)
		end
	end
end

--===========================================================================
---@param nextLevel string
function SetNextLevelBJ(nextLevel)
	if (nextLevel == "") then
		bj_changeLevelMapName = nil
	else
		bj_changeLevelMapName = nextLevel
	end
end

--===========================================================================
---@param flag boolean
---@param whichPlayer player
function SetPlayerOnScoreScreenBJ(flag, whichPlayer)
	SetPlayerOnScoreScreen(whichPlayer, flag)
end