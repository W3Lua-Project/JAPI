--============================================================================
-- Sound API
--
---@param environmentName string
function NewSoundEnvironment(environmentName) end


---@param fileName string
---@param looping boolean
---@param is3D boolean
---@param stopwhenoutofrange boolean
---@param fadeInRate integer
---@param fadeOutRate integer
---@param eaxSetting string
---@return sound
function CreateSound(fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, eaxSetting) end

---@param fileName string
---@param looping boolean
---@param is3D boolean
---@param stopwhenoutofrange boolean
---@param fadeInRate integer
---@param fadeOutRate integer
---@param SLKEntryName string
---@return sound
function CreateSoundFilenameWithLabel(fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, SLKEntryName) end

---@param soundLabel string
---@param looping boolean
---@param is3D boolean
---@param stopwhenoutofrange boolean
---@param fadeInRate integer
---@param fadeOutRate integer
---@return sound
function CreateSoundFromLabel(soundLabel, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate) end

---@param soundLabel string
---@param fadeInRate integer
---@param fadeOutRate integer
---@return sound
function CreateMIDISound(soundLabel, fadeInRate, fadeOutRate) end


---@param soundHandle sound
---@param soundLabel string
function SetSoundParamsFromLabel(soundHandle, soundLabel) end

---@param soundHandle sound
---@param cutoff real
function SetSoundDistanceCutoff(soundHandle, cutoff) end

---@param soundHandle sound
---@param channel integer
function SetSoundChannel(soundHandle, channel) end

---@param soundHandle sound
---@param volume integer
function SetSoundVolume(soundHandle, volume) end

---@param soundHandle sound
---@param pitch real
function SetSoundPitch(soundHandle, pitch) end


-- the following method must be called immediately after calling "StartSound"
---@param soundHandle sound
---@param millisecs integer
function SetSoundPlayPosition(soundHandle, millisecs) end


-- these calls are only valid if the sound was created with 3d enabled
---@param soundHandle sound
---@param minDist real
---@param maxDist real
function SetSoundDistances(soundHandle, minDist, maxDist) end

---@param soundHandle sound
---@param inside real
---@param outside real
---@param outsideVolume integer
function SetSoundConeAngles(soundHandle, inside, outside, outsideVolume) end

---@param soundHandle sound
---@param x real
---@param y real
---@param z real
function SetSoundConeOrientation(soundHandle, x, y, z) end

---@param soundHandle sound
---@param x real
---@param y real
---@param z real
function SetSoundPosition(soundHandle, x, y, z) end

---@param soundHandle sound
---@param x real
---@param y real
---@param z real
function SetSoundVelocity(soundHandle, x, y, z) end

---@param soundHandle sound
---@param whichUnit unit
function AttachSoundToUnit(soundHandle, whichUnit) end


---@param soundHandle sound
function StartSound(soundHandle) end

---@param soundHandle sound
---@param killWhenDone boolean
---@param fadeOut boolean
function StopSound(soundHandle, killWhenDone, fadeOut) end

---@param soundHandle sound
function KillSoundWhenDone(soundHandle) end


-- Music Interface. Note that if music is disabled, these calls do nothing
---@param musicName string
---@param random boolean
---@param index integer
function SetMapMusic(musicName, random, index) end

function ClearMapMusic() end


---@param musicName string
function PlayMusic(musicName) end

---@param musicName string
---@param frommsecs integer
---@param fadeinmsecs integer
function PlayMusicEx(musicName, frommsecs, fadeinmsecs) end

---@param fadeOut boolean
function StopMusic(fadeOut) end

function ResumeMusic() end


---@param musicFileName string
function PlayThematicMusic(musicFileName) end

---@param musicFileName string
---@param frommsecs integer
function PlayThematicMusicEx(musicFileName, frommsecs) end

function EndThematicMusic() end


---@param volume integer
function SetMusicVolume(volume) end

---@param millisecs integer
function SetMusicPlayPosition(millisecs) end

---@param millisecs integer
function SetThematicMusicPlayPosition(millisecs) end


-- other music and sound calls
---@param soundHandle sound
---@param duration integer
function SetSoundDuration(soundHandle, duration) end

---@param soundHandle sound
---@return integer
function GetSoundDuration(soundHandle) end

---@param musicFileName string
---@return integer
function GetSoundFileDuration(musicFileName) end


---@param vgroup volumegroup
---@param scale real
function VolumeGroupSetVolume(vgroup, scale) end

function VolumeGroupReset() end


---@param soundHandle sound
---@return boolean
function GetSoundIsPlaying(soundHandle) end

---@param soundHandle sound
---@return boolean
function GetSoundIsLoading(soundHandle) end


---@param soundHandle sound
---@param byPosition boolean
---@param rectwidth real
---@param rectheight real
function RegisterStackedSound(soundHandle, byPosition, rectwidth, rectheight) end

---@param soundHandle sound
---@param byPosition boolean
---@param rectwidth real
---@param rectheight real
function UnregisterStackedSound(soundHandle, byPosition, rectwidth, rectheight) end