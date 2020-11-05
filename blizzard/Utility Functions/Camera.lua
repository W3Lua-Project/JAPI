--***************************************************************************
--*
--*  Camera Utility Functions
--*
--***************************************************************************

--===========================================================================
---@return camerasetup
function GetCurrentCameraSetup()
	---@type camerasetup
	theCam   = CreateCameraSetup()
	---@type real
	duration = 0
	CameraSetupSetField(theCam, CAMERA_FIELD_TARGET_DISTANCE, GetCameraField(CAMERA_FIELD_TARGET_DISTANCE), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_FARZ, GetCameraField(CAMERA_FIELD_FARZ), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ZOFFSET, GetCameraField(CAMERA_FIELD_ZOFFSET), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ANGLE_OF_ATTACK, bj_RADTODEG * GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_FIELD_OF_VIEW, bj_RADTODEG * GetCameraField(CAMERA_FIELD_FIELD_OF_VIEW), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ROLL, bj_RADTODEG * GetCameraField(CAMERA_FIELD_ROLL), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ROTATION, bj_RADTODEG * GetCameraField(CAMERA_FIELD_ROTATION), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_LOCAL_PITCH, bj_RADTODEG * GetCameraField(CAMERA_FIELD_LOCAL_PITCH), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_LOCAL_YAW, bj_RADTODEG * GetCameraField(CAMERA_FIELD_LOCAL_YAW), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_LOCAL_ROLL, bj_RADTODEG * GetCameraField(CAMERA_FIELD_LOCAL_ROLL), duration)
	CameraSetupSetDestPosition(theCam, GetCameraTargetPositionX(), GetCameraTargetPositionY(), duration)
	return theCam
end

--===========================================================================
---@param doPan boolean
---@param whichSetup camerasetup
---@param whichPlayer player
---@param duration real
function CameraSetupApplyForPlayer(doPan, whichSetup, whichPlayer, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetupApplyForceDuration(whichSetup, doPan, duration)
	end
end

--===========================================================================
---@param whichField camerafield
---@param whichSetup camerasetup
---@return real
function CameraSetupGetFieldSwap(whichField, whichSetup)
	return CameraSetupGetField(whichSetup, whichField)
end

--===========================================================================
---@param whichPlayer player
---@param whichField camerafield
---@param value real
---@param duration real
function SetCameraFieldForPlayer(whichPlayer, whichField, value, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraField(whichField, value, duration)
	end
end

--===========================================================================
---@param whichPlayer player
---@param whichUnit unit
---@param xoffset real
---@param yoffset real
---@param inheritOrientation boolean
function SetCameraTargetControllerNoZForPlayer(whichPlayer, whichUnit, xoffset, yoffset, inheritOrientation)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraTargetController(whichUnit, xoffset, yoffset, inheritOrientation)
	end
end

--===========================================================================
---@param whichPlayer player
---@param x real
---@param y real
function SetCameraPositionForPlayer(whichPlayer, x, y)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraPosition(x, y)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
function SetCameraPositionLocForPlayer(whichPlayer, loc)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraPosition(GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
---@param degrees real
---@param loc location
---@param whichPlayer player
---@param duration real
function RotateCameraAroundLocBJ(degrees, loc, whichPlayer, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraRotateMode(GetLocationX(loc), GetLocationY(loc), bj_DEGTORAD * degrees, duration)
	end
end

--===========================================================================
---@param whichPlayer player
---@param x real
---@param y real
function PanCameraToForPlayer(whichPlayer, x, y)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraTo(x, y)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
function PanCameraToLocForPlayer(whichPlayer, loc)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraTo(GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
---@param whichPlayer player
---@param x real
---@param y real
---@param duration real
function PanCameraToTimedForPlayer(whichPlayer, x, y, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraToTimed(x, y, duration)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
---@param duration real
function PanCameraToTimedLocForPlayer(whichPlayer, loc, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), duration)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
---@param zOffset real
---@param duration real
function PanCameraToTimedLocWithZForPlayer(whichPlayer, loc, zOffset, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraToTimedWithZ(GetLocationX(loc), GetLocationY(loc), zOffset, duration)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
---@param duration real
function SmartCameraPanBJ(whichPlayer, loc, duration)
	---@type real
	dist      = nil
	---@type location
	cameraLoc = GetCameraTargetPositionLoc()
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		
		dist = DistanceBetweenPoints(loc, cameraLoc)
		if (dist >= bj_SMARTPAN_TRESHOLD_SNAP) then
			-- If the user is too far away, snap the camera.
			PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), 0)
		elseif (dist >= bj_SMARTPAN_TRESHOLD_PAN) then
			-- If the user is moderately close, pan the camera.
			PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), duration)
		else
			-- User is close enough, so don't touch the camera.
		end
	end
	RemoveLocation(cameraLoc)
end

--===========================================================================
---@param whichPlayer player
---@param cameraModelFile string
function SetCinematicCameraForPlayer(whichPlayer, cameraModelFile)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCinematicCamera(cameraModelFile)
	end
end

--===========================================================================
---@param whichPlayer player
---@param duration real
function ResetToGameCameraForPlayer(whichPlayer, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ResetToGameCamera(duration)
	end
end

--===========================================================================
---@param whichPlayer player
---@param magnitude real
---@param velocity real
function CameraSetSourceNoiseForPlayer(whichPlayer, magnitude, velocity)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetSourceNoise(magnitude, velocity)
	end
end

--===========================================================================
---@param whichPlayer player
---@param magnitude real
---@param velocity real
function CameraSetTargetNoiseForPlayer(whichPlayer, magnitude, velocity)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetTargetNoise(magnitude, velocity)
	end
end

--===========================================================================
---@param whichPlayer player
---@param magnitude real
function CameraSetEQNoiseForPlayer(whichPlayer, magnitude)
	---@type real
	richter = magnitude
	if (richter > 5.0) then
		richter = 5.0
	end
	if (richter < 2.0) then
		richter = 2.0
	end
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetTargetNoiseEx(magnitude * 2.0, magnitude * Pow(10, richter), true)
		CameraSetSourceNoiseEx(magnitude * 2.0, magnitude * Pow(10, richter), true)
	end
end

--===========================================================================
---@param whichPlayer player
function CameraClearNoiseForPlayer(whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetSourceNoise(0, 0)
		CameraSetTargetNoise(0, 0)
	end
end

--===========================================================================
-- Query the current camera bounds.
--
---@return rect
function GetCurrentCameraBoundsMapRectBJ()
	return Rect(GetCameraBoundMinX(), GetCameraBoundMinY(), GetCameraBoundMaxX(), GetCameraBoundMaxY())
end

--===========================================================================
-- Query the initial camera bounds, as defined at map init.
--
---@return rect
function GetCameraBoundsMapRect()
	return bj_mapInitialCameraBounds
end

--===========================================================================
-- Query the playable map area, as defined at map init.
--
---@return rect
function GetPlayableMapRect()
	return bj_mapInitialPlayableArea
end

--===========================================================================
-- Query the entire map area, as defined at map init.
--
---@return rect
function GetEntireMapRect()
	return GetWorldBounds()
end

--===========================================================================
---@param r rect
function SetCameraBoundsToRect(r)
	---@type real
	minX = GetRectMinX(r)
	---@type real
	minY = GetRectMinY(r)
	---@type real
	maxX = GetRectMaxX(r)
	---@type real
	maxY = GetRectMaxY(r)
	SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
end

--===========================================================================
---@param whichPlayer player
---@param r rect
function SetCameraBoundsToRectForPlayerBJ(whichPlayer, r)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraBoundsToRect(r)
	end
end

--===========================================================================
---@param adjustMethod integer
---@param dxWest real
---@param dxEast real
---@param dyNorth real
---@param dySouth real
function AdjustCameraBoundsBJ(adjustMethod, dxWest, dxEast, dyNorth, dySouth)
	---@type real
	minX  = 0
	---@type real
	minY  = 0
	---@type real
	maxX  = 0
	---@type real
	maxY  = 0
	---@type real
	scale = 0
	
	if (adjustMethod == bj_CAMERABOUNDS_ADJUST_ADD) then
		scale = 1
	elseif (adjustMethod == bj_CAMERABOUNDS_ADJUST_SUB) then
		scale = -1
	else
		-- Unrecognized adjustment method - ignore the request.
		return
	end
	
	-- Adjust the actual camera values
	minX = GetCameraBoundMinX() - scale * dxWest
	maxX = GetCameraBoundMaxX() + scale * dxEast
	minY = GetCameraBoundMinY() - scale * dySouth
	maxY = GetCameraBoundMaxY() + scale * dyNorth
	
	-- Make sure the camera bounds are still valid.
	if (maxX < minX) then
		minX = (minX + maxX) * 0.5
		maxX = minX
	end
	if (maxY < minY) then
		minY = (minY + maxY) * 0.5
		maxY = minY
	end
	
	-- Apply the new camera values.
	SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
end

--===========================================================================
---@param adjustMethod integer
---@param whichPlayer player
---@param dxWest real
---@param dxEast real
---@param dyNorth real
---@param dySouth real
function AdjustCameraBoundsForPlayerBJ(adjustMethod, whichPlayer, dxWest, dxEast, dyNorth, dySouth)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		AdjustCameraBoundsBJ(adjustMethod, dxWest, dxEast, dyNorth, dySouth)
	end
end

--===========================================================================
---@param whichPlayer player
---@param x real
---@param y real
function SetCameraQuickPositionForPlayer(whichPlayer, x, y)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraQuickPosition(x, y)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
function SetCameraQuickPositionLocForPlayer(whichPlayer, loc)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraQuickPosition(GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
---@param loc location
function SetCameraQuickPositionLoc(loc)
	SetCameraQuickPosition(GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
---@param whichPlayer player
function StopCameraForPlayerBJ(whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		StopCamera()
	end
end

--===========================================================================
---@param whichPlayer player
---@param whichUnit unit
---@param xoffset real
---@param yoffset real
function SetCameraOrientControllerForPlayerBJ(whichPlayer, whichUnit, xoffset, yoffset)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraOrientController(whichUnit, xoffset, yoffset)
	end
end

--===========================================================================
---@param factor real
function CameraSetSmoothingFactorBJ(factor)
	CameraSetSmoothingFactor(factor)
end

--===========================================================================
function CameraResetSmoothingFactorBJ()
	CameraSetSmoothingFactor(0)
end