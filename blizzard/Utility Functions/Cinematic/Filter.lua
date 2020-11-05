--***************************************************************************
--*
--*  Cinematic Filter Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param flag boolean
function DisplayCineFilterBJ(flag)
	DisplayCineFilter(flag)
end

--===========================================================================
---@param red real
---@param green real
---@param blue real
---@param duration real
---@param tex string
---@param startTrans real
---@param endTrans real
function CinematicFadeCommonBJ(red, green, blue, duration, tex, startTrans, endTrans)
	if (duration == 0) then
		-- If the fade is instant, use the same starting and ending values,
		-- so that we effectively do a set rather than a fade.
		startTrans = endTrans
	end
	EnableUserUI(false)
	SetCineFilterTexture(tex)
	SetCineFilterBlendMode(BLEND_MODE_BLEND)
	SetCineFilterTexMapFlags(TEXMAP_FLAG_NONE)
	SetCineFilterStartUV(0, 0, 1, 1)
	SetCineFilterEndUV(0, 0, 1, 1)
	SetCineFilterStartColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100 - startTrans))
	SetCineFilterEndColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100 - endTrans))
	SetCineFilterDuration(duration)
	DisplayCineFilter(true)
end

--===========================================================================
function FinishCinematicFadeBJ()
	DestroyTimer(bj_cineFadeFinishTimer)
	bj_cineFadeFinishTimer = nil
	DisplayCineFilter(false)
	EnableUserUI(true)
end

--===========================================================================
---@param duration real
function FinishCinematicFadeAfterBJ(duration)
	-- Create a timer to end the cinematic fade.
	bj_cineFadeFinishTimer = CreateTimer()
	TimerStart(bj_cineFadeFinishTimer, duration, false, FinishCinematicFadeBJ)
end

--===========================================================================
function ContinueCinematicFadeBJ()
	DestroyTimer(bj_cineFadeContinueTimer)
	bj_cineFadeContinueTimer = nil
	CinematicFadeCommonBJ(bj_cineFadeContinueRed, bj_cineFadeContinueGreen, bj_cineFadeContinueBlue, bj_cineFadeContinueDuration, bj_cineFadeContinueTex, bj_cineFadeContinueTrans, 100)
end

--===========================================================================
---@param duration real
---@param red real
---@param green real
---@param blue real
---@param trans real
---@param tex string
function ContinueCinematicFadeAfterBJ(duration, red, green, blue, trans, tex)
	bj_cineFadeContinueRed      = red
	bj_cineFadeContinueGreen    = green
	bj_cineFadeContinueBlue     = blue
	bj_cineFadeContinueTrans    = trans
	bj_cineFadeContinueDuration = duration
	bj_cineFadeContinueTex      = tex
	
	-- Create a timer to continue the cinematic fade.
	bj_cineFadeContinueTimer    = CreateTimer()
	TimerStart(bj_cineFadeContinueTimer, duration, false, ContinueCinematicFadeBJ)
end

--===========================================================================
function AbortCinematicFadeBJ()
	if (bj_cineFadeContinueTimer ~= nil) then
		DestroyTimer(bj_cineFadeContinueTimer)
	end
	
	if (bj_cineFadeFinishTimer ~= nil) then
		DestroyTimer(bj_cineFadeFinishTimer)
	end
end

--===========================================================================
---@param fadetype integer
---@param duration real
---@param tex string
---@param red real
---@param green real
---@param blue real
---@param trans real
function CinematicFadeBJ(fadetype, duration, tex, red, green, blue, trans)
	if (fadetype == bj_CINEFADETYPE_FADEOUT) then
		-- Fade out to the requested color.
		AbortCinematicFadeBJ()
		CinematicFadeCommonBJ(red, green, blue, duration, tex, 100, trans)
	elseif (fadetype == bj_CINEFADETYPE_FADEIN) then
		-- Fade in from the requested color.
		AbortCinematicFadeBJ()
		CinematicFadeCommonBJ(red, green, blue, duration, tex, trans, 100)
		FinishCinematicFadeAfterBJ(duration)
	elseif (fadetype == bj_CINEFADETYPE_FADEOUTIN) then
		-- Fade out to the requested color, and then fade back in from it.
		if (duration > 0) then
			AbortCinematicFadeBJ()
			CinematicFadeCommonBJ(red, green, blue, duration * 0.5, tex, 100, trans)
			ContinueCinematicFadeAfterBJ(duration * 0.5, red, green, blue, trans, tex)
			FinishCinematicFadeAfterBJ(duration)
		end
	else
		-- Unrecognized fadetype - ignore the request.
	end
end

--===========================================================================
---@param duration real
---@param bmode blendmode
---@param tex string
---@param red0 real
---@param green0 real
---@param blue0 real
---@param trans0 real
---@param red1 real
---@param green1 real
---@param blue1 real
---@param trans1 real
function CinematicFilterGenericBJ(duration, bmode, tex, red0, green0, blue0, trans0, red1, green1, blue1, trans1)
	AbortCinematicFadeBJ()
	SetCineFilterTexture(tex)
	SetCineFilterBlendMode(bmode)
	SetCineFilterTexMapFlags(TEXMAP_FLAG_NONE)
	SetCineFilterStartUV(0, 0, 1, 1)
	SetCineFilterEndUV(0, 0, 1, 1)
	SetCineFilterStartColor(PercentTo255(red0), PercentTo255(green0), PercentTo255(blue0), PercentTo255(100 - trans0))
	SetCineFilterEndColor(PercentTo255(red1), PercentTo255(green1), PercentTo255(blue1), PercentTo255(100 - trans1))
	SetCineFilterDuration(duration)
	DisplayCineFilter(true)
end