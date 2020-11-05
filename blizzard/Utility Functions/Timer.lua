--***************************************************************************
--*
--*  Timer Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param t timer
---@param periodic boolean
---@param timeout real
---@return timer
function StartTimerBJ(t, periodic, timeout)
	bj_lastStartedTimer = t
	TimerStart(t, timeout, periodic, nil)
	return bj_lastStartedTimer
end

--===========================================================================
---@param periodic boolean
---@param timeout real
---@return timer
function CreateTimerBJ(periodic, timeout)
	bj_lastStartedTimer = CreateTimer()
	TimerStart(bj_lastStartedTimer, timeout, periodic, nil)
	return bj_lastStartedTimer
end

--===========================================================================
---@param whichTimer timer
function DestroyTimerBJ(whichTimer)
	DestroyTimer(whichTimer)
end

--===========================================================================
---@param pause boolean
---@param whichTimer timer
function PauseTimerBJ(pause, whichTimer)
	if pause then
		PauseTimer(whichTimer)
	else
		ResumeTimer(whichTimer)
	end
end

--===========================================================================
---@return timer
function GetLastCreatedTimerBJ()
	return bj_lastStartedTimer
end

--===========================================================================
---@param t timer
---@param title string
---@return timerdialog
function CreateTimerDialogBJ(t, title)
	bj_lastCreatedTimerDialog = CreateTimerDialog(t)
	TimerDialogSetTitle(bj_lastCreatedTimerDialog, title)
	TimerDialogDisplay(bj_lastCreatedTimerDialog, true)
	return bj_lastCreatedTimerDialog
end

--===========================================================================
---@param td timerdialog
function DestroyTimerDialogBJ(td)
	DestroyTimerDialog(td)
end

--===========================================================================
---@param td timerdialog
---@param title string
function TimerDialogSetTitleBJ(td, title)
	TimerDialogSetTitle(td, title)
end

--===========================================================================
---@param td timerdialog
---@param red real
---@param green real
---@param blue real
---@param transparency real
function TimerDialogSetTitleColorBJ(td, red, green, blue, transparency)
	TimerDialogSetTitleColor(td, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param td timerdialog
---@param red real
---@param green real
---@param blue real
---@param transparency real
function TimerDialogSetTimeColorBJ(td, red, green, blue, transparency)
	TimerDialogSetTimeColor(td, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param td timerdialog
---@param speedMultFactor real
function TimerDialogSetSpeedBJ(td, speedMultFactor)
	TimerDialogSetSpeed(td, speedMultFactor)
end

--===========================================================================
---@param show boolean
---@param td timerdialog
---@param whichPlayer player
function TimerDialogDisplayForPlayerBJ(show, td, whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		TimerDialogDisplay(td, show)
	end
end

--===========================================================================
---@param show boolean
---@param td timerdialog
function TimerDialogDisplayBJ(show, td)
	TimerDialogDisplay(td, show)
end

--===========================================================================
---@return timerdialog
function GetLastCreatedTimerDialogBJ()
	return bj_lastCreatedTimerDialog
end