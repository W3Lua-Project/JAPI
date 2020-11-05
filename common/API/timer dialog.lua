--============================================================================
-- Timer Dialog API
---@param t timer
---@return timerdialog
function CreateTimerDialog(t) end

---@param whichDialog timerdialog
function DestroyTimerDialog(whichDialog) end

---@param whichDialog timerdialog
---@param title string
function TimerDialogSetTitle(whichDialog, title) end

---@param whichDialog timerdialog
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function TimerDialogSetTitleColor(whichDialog, red, green, blue, alpha) end

---@param whichDialog timerdialog
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function TimerDialogSetTimeColor(whichDialog, red, green, blue, alpha) end

---@param whichDialog timerdialog
---@param speedMultFactor real
function TimerDialogSetSpeed(whichDialog, speedMultFactor) end

---@param whichDialog timerdialog
---@param display boolean
function TimerDialogDisplay(whichDialog, display) end

---@param whichDialog timerdialog
---@return boolean
function IsTimerDialogDisplayed(whichDialog) end

---@param whichDialog timerdialog
---@param timeRemaining real
function TimerDialogSetRealTimeRemaining(whichDialog, timeRemaining) end