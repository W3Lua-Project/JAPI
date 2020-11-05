--***************************************************************************
--*
--*  Cinematic Mode Utility Functions
--*
--***************************************************************************

--===========================================================================
-- Makes many common UI settings changes at once, for use when beginning and
-- ending cinematic sequences.  Note that some affects apply to all players,
-- such as game speed.  This is unavoidable.
--   - Clear the screen of text messages
--   - Hide interface UI (letterbox mode)
--   - Hide game messages (ally under attack, etc.)
--   - Disable user control
--   - Disable occlusion
--   - Set game speed (for all players)
--   - Lock game speed (for all players)
--   - Disable black mask (for all players)
--   - Disable fog of war (for all players)
--   - Disable world boundary fog (for all players)
--   - Dim non-speech sound channels
--   - End any outstanding music themes
--   - Fix the random seed to a set value
--   - Reset the camera smoothing factor
--
---@param cineMode boolean
---@param forForce force
---@param interfaceFadeTime real
function CinematicModeExBJ(cineMode, forForce, interfaceFadeTime)
	-- If the game hasn't started yet, perform interface fades immediately
	if (not bj_gameStarted) then
		interfaceFadeTime = 0
	end
	
	if (cineMode) then
		-- Save the UI state so that we can restore it later.
		if (not bj_cineModeAlreadyIn) then
			bj_cineModeAlreadyIn        = true
			bj_cineModePriorSpeed       = GetGameSpeed()
			bj_cineModePriorFogSetting  = IsFogEnabled()
			bj_cineModePriorMaskSetting = IsFogMaskEnabled()
			bj_cineModePriorDawnDusk    = IsDawnDuskEnabled()
			bj_cineModeSavedSeed        = GetRandomInt(0, 1000000)
		end
		
		-- Perform local changes
		if (IsPlayerInForce(GetLocalPlayer(), forForce)) then
			-- Use only local code (no net traffic) within this block to avoid desyncs.
			ClearTextMessages()
			ShowInterface(false, interfaceFadeTime)
			EnableUserControl(false)
			EnableOcclusion(false)
			SetCineModeVolumeGroupsBJ()
		end
		
		-- Perform global changes
		SetGameSpeed(bj_CINEMODE_GAMESPEED)
		SetMapFlag(MAP_LOCK_SPEED, true)
		FogMaskEnable(false)
		FogEnable(false)
		EnableWorldFogBoundary(false)
		EnableDawnDusk(false)
		
		-- Use a fixed random seed, so that cinematics play consistently.
		SetRandomSeed(0)
	else
		bj_cineModeAlreadyIn = false
		
		-- Perform local changes
		if (IsPlayerInForce(GetLocalPlayer(), forForce)) then
			-- Use only local code (no net traffic) within this block to avoid desyncs.
			ShowInterface(true, interfaceFadeTime)
			EnableUserControl(true)
			EnableOcclusion(true)
			VolumeGroupReset()
			EndThematicMusic()
			CameraResetSmoothingFactorBJ()
		end
		
		-- Perform global changes
		SetMapFlag(MAP_LOCK_SPEED, false)
		SetGameSpeed(bj_cineModePriorSpeed)
		FogMaskEnable(bj_cineModePriorMaskSetting)
		FogEnable(bj_cineModePriorFogSetting)
		EnableWorldFogBoundary(true)
		EnableDawnDusk(bj_cineModePriorDawnDusk)
		SetRandomSeed(bj_cineModeSavedSeed)
	end
end

--===========================================================================
---@param cineMode boolean
---@param forForce force
function CinematicModeBJ(cineMode, forForce)
	CinematicModeExBJ(cineMode, forForce, bj_CINEMODE_INTERFACEFADE)
end