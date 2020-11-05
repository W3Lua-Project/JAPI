--***************************************************************************
--*
--*  Sound Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param soundHandle sound
function PlaySoundBJ(soundHandle)
	bj_lastPlayedSound = soundHandle
	if (soundHandle ~= nil) then
		StartSound(soundHandle)
	end
end

--===========================================================================
---@param soundHandle sound
---@param fadeOut boolean
function StopSoundBJ(soundHandle, fadeOut)
	StopSound(soundHandle, false, fadeOut)
end

--===========================================================================
---@param soundHandle sound
---@param volumePercent real
function SetSoundVolumeBJ(soundHandle, volumePercent)
	SetSoundVolume(soundHandle, PercentToInt(volumePercent, 127))
end

--===========================================================================
---@param newOffset real
---@param soundHandle sound
function SetSoundOffsetBJ(newOffset, soundHandle)
	SetSoundPlayPosition(soundHandle, R2I(newOffset * 1000))
end

--===========================================================================
---@param soundHandle sound
---@param cutoff real
function SetSoundDistanceCutoffBJ(soundHandle, cutoff)
	SetSoundDistanceCutoff(soundHandle, cutoff)
end

--===========================================================================
---@param soundHandle sound
---@param pitch real
function SetSoundPitchBJ(soundHandle, pitch)
	SetSoundPitch(soundHandle, pitch)
end

--===========================================================================
---@param soundHandle sound
---@param loc location
---@param z real
function SetSoundPositionLocBJ(soundHandle, loc, z)
	SetSoundPosition(soundHandle, GetLocationX(loc), GetLocationY(loc), z)
end

--===========================================================================
---@param soundHandle sound
---@param whichUnit unit
function AttachSoundToUnitBJ(soundHandle, whichUnit)
	AttachSoundToUnit(soundHandle, whichUnit)
end

--===========================================================================
---@param soundHandle sound
---@param inside real
---@param outside real
---@param outsideVolumePercent real
function SetSoundConeAnglesBJ(soundHandle, inside, outside, outsideVolumePercent)
	SetSoundConeAngles(soundHandle, inside, outside, PercentToInt(outsideVolumePercent, 127))
end

--===========================================================================
---@param soundHandle sound
function KillSoundWhenDoneBJ(soundHandle)
	KillSoundWhenDone(soundHandle)
end

--===========================================================================
---@param soundHandle sound
---@param volumePercent real
---@param loc location
---@param z real
function PlaySoundAtPointBJ(soundHandle, volumePercent, loc, z)
	SetSoundPositionLocBJ(soundHandle, loc, z)
	SetSoundVolumeBJ(soundHandle, volumePercent)
	PlaySoundBJ(soundHandle)
end

--===========================================================================
---@param soundHandle sound
---@param volumePercent real
---@param whichUnit unit
function PlaySoundOnUnitBJ(soundHandle, volumePercent, whichUnit)
	AttachSoundToUnitBJ(soundHandle, whichUnit)
	SetSoundVolumeBJ(soundHandle, volumePercent)
	PlaySoundBJ(soundHandle)
end

--===========================================================================
---@param soundHandle sound
---@param volumePercent real
---@param startingOffset real
function PlaySoundFromOffsetBJ(soundHandle, volumePercent, startingOffset)
	SetSoundVolumeBJ(soundHandle, volumePercent)
	PlaySoundBJ(soundHandle)
	SetSoundOffsetBJ(startingOffset, soundHandle)
end

--===========================================================================
---@param musicFileName string
function PlayMusicBJ(musicFileName)
	bj_lastPlayedMusic = musicFileName
	PlayMusic(musicFileName)
end

--===========================================================================
---@param musicFileName string
---@param startingOffset real
---@param fadeInTime real
function PlayMusicExBJ(musicFileName, startingOffset, fadeInTime)
	bj_lastPlayedMusic = musicFileName
	PlayMusicEx(musicFileName, R2I(startingOffset * 1000), R2I(fadeInTime * 1000))
end

--===========================================================================
---@param newOffset real
function SetMusicOffsetBJ(newOffset)
	SetMusicPlayPosition(R2I(newOffset * 1000))
end

--===========================================================================
---@param musicName string
function PlayThematicMusicBJ(musicName)
	PlayThematicMusic(musicName)
end

--===========================================================================
---@param musicName string
---@param startingOffset real
function PlayThematicMusicExBJ(musicName, startingOffset)
	PlayThematicMusicEx(musicName, R2I(startingOffset * 1000))
end

--===========================================================================
---@param newOffset real
function SetThematicMusicOffsetBJ(newOffset)
	SetThematicMusicPlayPosition(R2I(newOffset * 1000))
end

--===========================================================================
function EndThematicMusicBJ()
	EndThematicMusic()
end

--===========================================================================
---@param fadeOut boolean
function StopMusicBJ(fadeOut)
	StopMusic(fadeOut)
end

--===========================================================================
function ResumeMusicBJ()
	ResumeMusic()
end

--===========================================================================
---@param volumePercent real
function SetMusicVolumeBJ(volumePercent)
	SetMusicVolume(PercentToInt(volumePercent, 127))
end

--===========================================================================
---@param soundHandle sound
---@return real
function GetSoundDurationBJ(soundHandle)
	if (soundHandle == nil) then
		return bj_NOTHING_SOUND_DURATION
	else
		return I2R(GetSoundDuration(soundHandle)) * 0.001
	end
end

--===========================================================================
---@param musicFileName string
---@return real
function GetSoundFileDurationBJ(musicFileName)
	return I2R(GetSoundFileDuration(musicFileName)) * 0.001
end

--===========================================================================
---@return sound
function GetLastPlayedSound()
	return bj_lastPlayedSound
end

--===========================================================================
---@return string
function GetLastPlayedMusic()
	return bj_lastPlayedMusic
end

--===========================================================================
---@param vgroup volumegroup
---@param percent real
function VolumeGroupSetVolumeBJ(vgroup, percent)
	VolumeGroupSetVolume(vgroup, percent * 0.01)
end

--===========================================================================
function SetCineModeVolumeGroupsImmediateBJ()
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITMOVEMENT, bj_CINEMODE_VOLUME_UNITMOVEMENT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITSOUNDS, bj_CINEMODE_VOLUME_UNITSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_COMBAT, bj_CINEMODE_VOLUME_COMBAT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_SPELLS, bj_CINEMODE_VOLUME_SPELLS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, bj_CINEMODE_VOLUME_UI)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_MUSIC, bj_CINEMODE_VOLUME_MUSIC)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_AMBIENTSOUNDS, bj_CINEMODE_VOLUME_AMBIENTSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_FIRE, bj_CINEMODE_VOLUME_FIRE)
end

--===========================================================================
function SetCineModeVolumeGroupsBJ()
	-- Delay the request if it occurs at map init.
	if bj_gameStarted then
		SetCineModeVolumeGroupsImmediateBJ()
	else
		TimerStart(bj_volumeGroupsTimer, bj_GAME_STARTED_THRESHOLD, false, SetCineModeVolumeGroupsImmediateBJ)
	end
end

--===========================================================================
function SetSpeechVolumeGroupsImmediateBJ()
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITMOVEMENT, bj_SPEECH_VOLUME_UNITMOVEMENT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITSOUNDS, bj_SPEECH_VOLUME_UNITSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_COMBAT, bj_SPEECH_VOLUME_COMBAT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_SPELLS, bj_SPEECH_VOLUME_SPELLS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, bj_SPEECH_VOLUME_UI)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_MUSIC, bj_SPEECH_VOLUME_MUSIC)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_AMBIENTSOUNDS, bj_SPEECH_VOLUME_AMBIENTSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_FIRE, bj_SPEECH_VOLUME_FIRE)
end

--===========================================================================
function SetSpeechVolumeGroupsBJ()
	-- Delay the request if it occurs at map init.
	if bj_gameStarted then
		SetSpeechVolumeGroupsImmediateBJ()
	else
		TimerStart(bj_volumeGroupsTimer, bj_GAME_STARTED_THRESHOLD, false, SetSpeechVolumeGroupsImmediateBJ)
	end
end

--===========================================================================
function VolumeGroupResetImmediateBJ()
	VolumeGroupReset()
end

--===========================================================================
function VolumeGroupResetBJ()
	-- Delay the request if it occurs at map init.
	if bj_gameStarted then
		VolumeGroupResetImmediateBJ()
	else
		TimerStart(bj_volumeGroupsTimer, bj_GAME_STARTED_THRESHOLD, false, VolumeGroupResetImmediateBJ)
	end
end

--===========================================================================
---@param soundHandle sound
---@return boolean
function GetSoundIsPlayingBJ(soundHandle)
	return GetSoundIsLoading(soundHandle) or GetSoundIsPlaying(soundHandle)
end

--===========================================================================
---@param soundHandle sound
---@param offset real
function WaitForSoundBJ(soundHandle, offset)
	TriggerWaitForSound(soundHandle, offset)
end

--===========================================================================
---@param musicName string
---@param index integer
function SetMapMusicIndexedBJ(musicName, index)
	SetMapMusic(musicName, false, index)
end

--===========================================================================
---@param musicName string
function SetMapMusicRandomBJ(musicName)
	SetMapMusic(musicName, true, 0)
end

--===========================================================================
function ClearMapMusicBJ()
	ClearMapMusic()
end

--===========================================================================
---@param add boolean
---@param soundHandle sound
---@param r rect
function SetStackedSoundBJ(add, soundHandle, r)
	---@type real
	width  = GetRectMaxX(r) - GetRectMinX(r)
	---@type real
	height = GetRectMaxY(r) - GetRectMinY(r)
	
	SetSoundPosition(soundHandle, GetRectCenterX(r), GetRectCenterY(r), 0)
	if add then
		RegisterStackedSound(soundHandle, true, width, height)
	else
		UnregisterStackedSound(soundHandle, true, width, height)
	end
end

--===========================================================================
---@param whichPlayer player
---@param soundHandle sound
function StartSoundForPlayerBJ(whichPlayer, soundHandle)
	if (whichPlayer == GetLocalPlayer()) then
		StartSound(soundHandle)
	end
end

--===========================================================================
---@param whichPlayer player
---@param vgroup volumegroup
---@param scale real
function VolumeGroupSetVolumeForPlayerBJ(whichPlayer, vgroup, scale)
	if (GetLocalPlayer() == whichPlayer) then
		VolumeGroupSetVolume(vgroup, scale)
	end
end

--===========================================================================
---@param flag boolean
function EnableDawnDusk(flag)
	bj_useDawnDuskSounds = flag
end

--===========================================================================
---@return boolean
function IsDawnDuskEnabled()
	return bj_useDawnDuskSounds
end