--============================================================================
-- Timer API
--
---@return timer
function CreateTimer() end

---@param whichTimer timer
function DestroyTimer(whichTimer) end

---@param whichTimer timer
---@param timeout real
---@param periodic boolean
---@param handlerFunc code
function TimerStart(whichTimer, timeout, periodic, handlerFunc) end

---@param whichTimer timer
---@return real
function TimerGetElapsed(whichTimer) end

---@param whichTimer timer
---@return real
function TimerGetRemaining(whichTimer) end

---@param whichTimer timer
---@return real
function TimerGetTimeout(whichTimer) end

---@param whichTimer timer
function PauseTimer(whichTimer) end

---@param whichTimer timer
function ResumeTimer(whichTimer) end

---@return timer
function GetExpiredTimer() end