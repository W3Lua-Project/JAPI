--***************************************************************************
--*
--*  Cinematic Transmission Utility Functions
--*
--***************************************************************************

--===========================================================================
-- If cancelled, stop the sound and end the cinematic scene.
--
function CancelCineSceneBJ()
	StopSoundBJ(bj_cineSceneLastSound, true)
	EndCinematicScene()
end

--===========================================================================
-- Init a trigger to listen for END_CINEMATIC events and respond to them if
-- a cinematic scene is in progress.  For performance reasons, this should
-- only be called once a cinematic scene has been started, so that maps
-- lacking such scenes do not bother to register for these events.
--
function TryInitCinematicBehaviorBJ()
	---@type integer
	index = nil
	
	if (bj_cineSceneBeingSkipped == nil) then
		bj_cineSceneBeingSkipped = CreateTrigger()
		index                    = 0
		while true do
			TriggerRegisterPlayerEvent(bj_cineSceneBeingSkipped, Player(index), EVENT_PLAYER_END_CINEMATIC)
			index = index + 1
			if index == bj_MAX_PLAYERS then break end
		end
		TriggerAddAction(bj_cineSceneBeingSkipped, CancelCineSceneBJ)
	end
end

--===========================================================================
---@param soundHandle sound
---@param portraitUnitId integer
---@param color playercolor
---@param speakerTitle string
---@param text string
---@param sceneDuration real
---@param voiceoverDuration real
function SetCinematicSceneBJ(soundHandle, portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
	bj_cineSceneLastSound = soundHandle
	PlaySoundBJ(soundHandle)
	SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
end

--===========================================================================
---@param soundHandle sound
---@param timeType integer
---@param timeVal real
---@return real
function GetTransmissionDuration(soundHandle, timeType, timeVal)
	---@type real
	duration = nil
	
	if (timeType == bj_TIMETYPE_ADD) then
		duration = GetSoundDurationBJ(soundHandle) + timeVal
	elseif (timeType == bj_TIMETYPE_SET) then
		duration = timeVal
	elseif (timeType == bj_TIMETYPE_SUB) then
		duration = GetSoundDurationBJ(soundHandle) - timeVal
	else
		-- Unrecognized timeType - ignore timeVal.
		duration = GetSoundDurationBJ(soundHandle)
	end
	
	-- Make sure we have a non-negative duration.
	if (duration < 0) then
		duration = 0
	end
	return duration
end

--===========================================================================
---@param soundHandle sound
---@param timeType integer
---@param timeVal real
function WaitTransmissionDuration(soundHandle, timeType, timeVal)
	if (timeType == bj_TIMETYPE_SET) then
		-- If we have a static duration wait, just perform the wait.
		TriggerSleepAction(timeVal)
	
	elseif (soundHandle == nil) then
		-- If the sound does not exist, perform a default length wait.
		TriggerSleepAction(bj_NOTHING_SOUND_DURATION)
	
	elseif (timeType == bj_TIMETYPE_SUB) then
		-- If the transmission is cutting off the sound, wait for the sound
		-- to be mostly finished.
		WaitForSoundBJ(soundHandle, timeVal)
	
	elseif (timeType == bj_TIMETYPE_ADD) then
		-- If the transmission is extending beyond the sound's length, wait
		-- for it to finish, and then wait the additional time.
		WaitForSoundBJ(soundHandle, 0)
		TriggerSleepAction(timeVal)
	
	else
		-- Unrecognized timeType - ignore.
	end
end

--===========================================================================
---@param unitId integer
---@param color playercolor
---@param x real
---@param y real
---@param soundHandle sound
---@param unitName string
---@param message string
---@param duration real
function DoTransmissionBasicsXYBJ(unitId, color, x, y, soundHandle, unitName, message, duration)
	SetCinematicSceneBJ(soundHandle, unitId, color, unitName, message, duration + bj_TRANSMISSION_PORT_HANGTIME, duration)
	
	if (unitId ~= 0) then
		PingMinimap(x, y, bj_TRANSMISSION_PING_TIME)
		--call SetCameraQuickPosition(x, y)
	end
end

--===========================================================================
-- Display a text message to a Player Group with an accompanying sound,
-- portrait, speech indicator, and all that good stuff.
--   - Query duration of sound
--   - Play sound
--   - Display text message for duration
--   - Display animating portrait for duration
--   - Display a speech indicator for the unit
--   - Ping the minimap
--
---@param toForce force
---@param whichUnit unit
---@param unitName string
---@param soundHandle sound
---@param message string
---@param timeType integer
---@param timeVal real
---@param wait boolean
function TransmissionFromUnitWithNameBJ(toForce, whichUnit, unitName, soundHandle, message, timeType, timeVal, wait)
	TryInitCinematicBehaviorBJ()
	
	-- Ensure that the time value is non-negative.
	timeVal                     = RMaxBJ(timeVal, 0)
	
	bj_lastTransmissionDuration = GetTransmissionDuration(soundHandle, timeType, timeVal)
	bj_lastPlayedSound          = soundHandle
	
	if (IsPlayerInForce(GetLocalPlayer(), toForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		
		if (whichUnit == nil) then
			-- If the unit reference is invalid, send the transmission from the center of the map with no portrait.
			DoTransmissionBasicsXYBJ(0, PLAYER_COLOR_RED, 0, 0, soundHandle, unitName, message, bj_lastTransmissionDuration)
		else
			DoTransmissionBasicsXYBJ(GetUnitTypeId(whichUnit), GetPlayerColor(GetOwningPlayer(whichUnit)), GetUnitX(whichUnit), GetUnitY(whichUnit), soundHandle, unitName, message, bj_lastTransmissionDuration)
			if (not IsUnitHidden(whichUnit)) then
				UnitAddIndicator(whichUnit, bj_TRANSMISSION_IND_RED, bj_TRANSMISSION_IND_BLUE, bj_TRANSMISSION_IND_GREEN, bj_TRANSMISSION_IND_ALPHA)
			end
		end
	end
	
	if wait and (bj_lastTransmissionDuration > 0) then
		-- call TriggerSleepAction(bj_lastTransmissionDuration)
		WaitTransmissionDuration(soundHandle, timeType, timeVal)
	end

end

--===========================================================================
-- This operates like TransmissionFromUnitWithNameBJ, but for a unit type
-- rather than a unit instance.  As such, no speech indicator is employed.
--
---@param toForce force
---@param fromPlayer player
---@param unitId integer
---@param unitName string
---@param loc location
---@param soundHandle sound
---@param message string
---@param timeType integer
---@param timeVal real
---@param wait boolean
function TransmissionFromUnitTypeWithNameBJ(toForce, fromPlayer, unitId, unitName, loc, soundHandle, message, timeType, timeVal, wait)
	TryInitCinematicBehaviorBJ()
	
	-- Ensure that the time value is non-negative.
	timeVal                     = RMaxBJ(timeVal, 0)
	
	bj_lastTransmissionDuration = GetTransmissionDuration(soundHandle, timeType, timeVal)
	bj_lastPlayedSound          = soundHandle
	
	if (IsPlayerInForce(GetLocalPlayer(), toForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		
		DoTransmissionBasicsXYBJ(unitId, GetPlayerColor(fromPlayer), GetLocationX(loc), GetLocationY(loc), soundHandle, unitName, message, bj_lastTransmissionDuration)
	end
	
	if wait and (bj_lastTransmissionDuration > 0) then
		-- call TriggerSleepAction(bj_lastTransmissionDuration)
		WaitTransmissionDuration(soundHandle, timeType, timeVal)
	end

end

--===========================================================================
---@return real
function GetLastTransmissionDurationBJ()
	return bj_lastTransmissionDuration
end

--===========================================================================
---@param flag boolean
function ForceCinematicSubtitlesBJ(flag)
	ForceCinematicSubtitles(flag)
end