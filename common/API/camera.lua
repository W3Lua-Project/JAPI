--============================================================================
-- Camera API
---@param x real
---@param y real
function SetCameraPosition(x, y) end

---@param x real
---@param y real
function SetCameraQuickPosition(x, y) end

---@param x1 real
---@param y1 real
---@param x2 real
---@param y2 real
---@param x3 real
---@param y3 real
---@param x4 real
---@param y4 real
function SetCameraBounds(x1, y1, x2, y2, x3, y3, x4, y4) end

function StopCamera() end

---@param duration real
function ResetToGameCamera(duration) end

---@param x real
---@param y real
function PanCameraTo(x, y) end

---@param x real
---@param y real
---@param duration real
function PanCameraToTimed(x, y, duration) end

---@param x real
---@param y real
---@param zOffsetDest real
function PanCameraToWithZ(x, y, zOffsetDest) end

---@param x real
---@param y real
---@param zOffsetDest real
---@param duration real
function PanCameraToTimedWithZ(x, y, zOffsetDest, duration) end

---@param cameraModelFile string
function SetCinematicCamera(cameraModelFile) end

---@param x real
---@param y real
---@param radiansToSweep real
---@param duration real
function SetCameraRotateMode(x, y, radiansToSweep, duration) end

---@param whichField camerafield
---@param value real
---@param duration real
function SetCameraField(whichField, value, duration) end

---@param whichField camerafield
---@param offset real
---@param duration real
function AdjustCameraField(whichField, offset, duration) end

---@param whichUnit unit
---@param xoffset real
---@param yoffset real
---@param inheritOrientation boolean
function SetCameraTargetController(whichUnit, xoffset, yoffset, inheritOrientation) end

---@param whichUnit unit
---@param xoffset real
---@param yoffset real
function SetCameraOrientController(whichUnit, xoffset, yoffset) end


---@return camerasetup
function CreateCameraSetup() end

---@param whichSetup camerasetup
---@param whichField camerafield
---@param value real
---@param duration real
function CameraSetupSetField(whichSetup, whichField, value, duration) end

---@param whichSetup camerasetup
---@param whichField camerafield
---@return real
function CameraSetupGetField(whichSetup, whichField) end

---@param whichSetup camerasetup
---@param x real
---@param y real
---@param duration real
function CameraSetupSetDestPosition(whichSetup, x, y, duration) end

---@param whichSetup camerasetup
---@return location
function CameraSetupGetDestPositionLoc(whichSetup) end

---@param whichSetup camerasetup
---@return real
function CameraSetupGetDestPositionX(whichSetup) end

---@param whichSetup camerasetup
---@return real
function CameraSetupGetDestPositionY(whichSetup) end

---@param whichSetup camerasetup
---@param doPan boolean
---@param panTimed boolean
function CameraSetupApply(whichSetup, doPan, panTimed) end

---@param whichSetup camerasetup
---@param zDestOffset real
function CameraSetupApplyWithZ(whichSetup, zDestOffset) end

---@param whichSetup camerasetup
---@param doPan boolean
---@param forceDuration real
function CameraSetupApplyForceDuration(whichSetup, doPan, forceDuration) end

---@param whichSetup camerasetup
---@param zDestOffset real
---@param forceDuration real
function CameraSetupApplyForceDurationWithZ(whichSetup, zDestOffset, forceDuration) end


---@param mag real
---@param velocity real
function CameraSetTargetNoise(mag, velocity) end

---@param mag real
---@param velocity real
function CameraSetSourceNoise(mag, velocity) end


---@param mag real
---@param velocity real
---@param vertOnly boolean
function CameraSetTargetNoiseEx(mag, velocity, vertOnly) end

---@param mag real
---@param velocity real
---@param vertOnly boolean
function CameraSetSourceNoiseEx(mag, velocity, vertOnly) end


---@param factor real
function CameraSetSmoothingFactor(factor) end


---@param filename string
function SetCineFilterTexture(filename) end

---@param whichMode blendmode
function SetCineFilterBlendMode(whichMode) end

---@param whichFlags texmapflags
function SetCineFilterTexMapFlags(whichFlags) end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function SetCineFilterStartUV(minu, minv, maxu, maxv) end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function SetCineFilterEndUV(minu, minv, maxu, maxv) end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetCineFilterStartColor(red, green, blue, alpha) end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetCineFilterEndColor(red, green, blue, alpha) end

---@param duration real
function SetCineFilterDuration(duration) end

---@param flag boolean
function DisplayCineFilter(flag) end

---@return boolean
function IsCineFilterDisplayed() end


---@param portraitUnitId integer
---@param color playercolor
---@param speakerTitle string
---@param text string
---@param sceneDuration real
---@param voiceoverDuration real
function SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration) end

function EndCinematicScene() end

---@param flag boolean
function ForceCinematicSubtitles(flag) end


---@param whichMargin integer
---@return real
function GetCameraMargin(whichMargin) end


-- These return values for the local players camera only...
---@return real
function GetCameraBoundMinX() end

---@return real
function GetCameraBoundMinY() end

---@return real
function GetCameraBoundMaxX() end

---@return real
function GetCameraBoundMaxY() end

---@param whichField camerafield
---@return real
function GetCameraField(whichField) end

---@return real
function GetCameraTargetPositionX() end

---@return real
function GetCameraTargetPositionY() end

---@return real
function GetCameraTargetPositionZ() end

---@return location
function GetCameraTargetPositionLoc() end

---@return real
function GetCameraEyePositionX() end

---@return real
function GetCameraEyePositionY() end

---@return real
function GetCameraEyePositionZ() end

---@return location
function GetCameraEyePositionLoc() end

---@param whichSetup camerasetup
---@param doPan boolean
---@param forcedDuration real
---@param easeInDuration real
---@param easeOutDuration real
---@param smoothFactor real
function BlzCameraSetupApplyForceDurationSmooth(whichSetup, doPan, forcedDuration, easeInDuration, easeOutDuration, smoothFactor) end