--***************************************************************************
--*
--*  Day/Night ambient sounds
--*
--***************************************************************************

--===========================================================================
---@param inLabel string
function SetAmbientDaySound(inLabel)
	---@type real
	ToD = nil
	
	-- Stop old sound, if necessary
	if (bj_dayAmbientSound ~= nil) then
		StopSound(bj_dayAmbientSound, true, true)
	end
	
	-- Create new sound
	bj_dayAmbientSound = CreateMIDISound(inLabel, 20, 20)
	
	-- Start the sound if necessary, based on current time
	ToD                = GetTimeOfDay()
	if (ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK) then
		StartSound(bj_dayAmbientSound)
	end
end

--===========================================================================
---@param inLabel string
function SetAmbientNightSound(inLabel)
	---@type real
	ToD = nil
	
	-- Stop old sound, if necessary
	if (bj_nightAmbientSound ~= nil) then
		StopSound(bj_nightAmbientSound, true, true)
	end
	
	-- Create new sound
	bj_nightAmbientSound = CreateMIDISound(inLabel, 20, 20)
	
	-- Start the sound if necessary, based on current time
	ToD                  = GetTimeOfDay()
	if (ToD < bj_TOD_DAWN or ToD >= bj_TOD_DUSK) then
		StartSound(bj_nightAmbientSound)
	end
end