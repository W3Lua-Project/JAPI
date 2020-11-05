--***************************************************************************
--*
--*  Cinematic Utility Functions
--*
--***************************************************************************

--===========================================================================
function PauseGameOn()
	PauseGame(true)
end

--===========================================================================
function PauseGameOff()
	PauseGame(false)
end

--===========================================================================
---@param whichForce force
function SetUserControlForceOn(whichForce)
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableUserControl(true)
	end
end

--===========================================================================
---@param whichForce force
function SetUserControlForceOff(whichForce)
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableUserControl(false)
	end
end

--===========================================================================
---@param whichForce force
---@param fadeDuration real
function ShowInterfaceForceOn(whichForce, fadeDuration)
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ShowInterface(true, fadeDuration)
	end
end

--===========================================================================
---@param whichForce force
---@param fadeDuration real
function ShowInterfaceForceOff(whichForce, fadeDuration)
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ShowInterface(false, fadeDuration)
	end
end

--===========================================================================
---@param whichForce force
---@param x real
---@param y real
---@param duration real
function PingMinimapForForce(whichForce, x, y, duration)
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PingMinimap(x, y, duration)
		--call StartSound(bj_pingMinimapSound)
	end
end

--===========================================================================
---@param whichForce force
---@param loc location
---@param duration real
function PingMinimapLocForForce(whichForce, loc, duration)
	PingMinimapForForce(whichForce, GetLocationX(loc), GetLocationY(loc), duration)
end

--===========================================================================
---@param whichPlayer player
---@param x real
---@param y real
---@param duration real
function PingMinimapForPlayer(whichPlayer, x, y, duration)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PingMinimap(x, y, duration)
		--call StartSound(bj_pingMinimapSound)
	end
end

--===========================================================================
---@param whichPlayer player
---@param loc location
---@param duration real
function PingMinimapLocForPlayer(whichPlayer, loc, duration)
	PingMinimapForPlayer(whichPlayer, GetLocationX(loc), GetLocationY(loc), duration)
end

--===========================================================================
---@param whichForce force
---@param x real
---@param y real
---@param duration real
---@param style integer
---@param red real
---@param green real
---@param blue real
function PingMinimapForForceEx(whichForce, x, y, duration, style, red, green, blue)
	---@type integer
	red255   = PercentTo255(red)
	---@type integer
	green255 = PercentTo255(green)
	---@type integer
	blue255  = PercentTo255(blue)
	
	if (IsPlayerInForce(GetLocalPlayer(), whichForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		
		-- Prevent 100% red simple and flashy pings, as they become "attack" pings.
		if (red255 == 255) and (green255 == 0) and (blue255 == 0) then
			red255 = 254
		end
		
		if (style == bj_MINIMAPPINGSTYLE_SIMPLE) then
			PingMinimapEx(x, y, duration, red255, green255, blue255, false)
		elseif (style == bj_MINIMAPPINGSTYLE_FLASHY) then
			PingMinimapEx(x, y, duration, red255, green255, blue255, true)
		elseif (style == bj_MINIMAPPINGSTYLE_ATTACK) then
			PingMinimapEx(x, y, duration, 255, 0, 0, false)
		else
			-- Unrecognized ping style - ignore the request.
		end
		
		--call StartSound(bj_pingMinimapSound)
	end
end

--===========================================================================
---@param whichForce force
---@param loc location
---@param duration real
---@param style integer
---@param red real
---@param green real
---@param blue real
function PingMinimapLocForForceEx(whichForce, loc, duration, style, red, green, blue)
	PingMinimapForForceEx(whichForce, GetLocationX(loc), GetLocationY(loc), duration, style, red, green, blue)
end

--===========================================================================
---@param enable boolean
---@param f force
function EnableWorldFogBoundaryBJ(enable, f)
	if (IsPlayerInForce(GetLocalPlayer(), f)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableWorldFogBoundary(enable)
	end
end

--===========================================================================
---@param enable boolean
---@param f force
function EnableOcclusionBJ(enable, f)
	if (IsPlayerInForce(GetLocalPlayer(), f)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableOcclusion(enable)
	end
end