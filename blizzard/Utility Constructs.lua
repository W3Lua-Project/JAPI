--***************************************************************************
--*
--*  Utility Constructs
--*
--***************************************************************************

--===========================================================================
-- Runs the trigger's actions if the trigger's conditions evaluate to true.
--
---@param trig trigger
function ConditionalTriggerExecute(trig)
	if TriggerEvaluate(trig) then
		TriggerExecute(trig)
	end
end

--===========================================================================
-- Runs the trigger's actions if the trigger's conditions evaluate to true.
--
---@param trig trigger
---@param checkConditions boolean
---@return boolean
function TriggerExecuteBJ(trig, checkConditions)
	if checkConditions then
		if not (TriggerEvaluate(trig)) then
			return false
		end
	end
	TriggerExecute(trig)
	return true
end

--===========================================================================
-- Arranges for a trigger to fire almost immediately, except that the calling
-- trigger is not interrupted as is the case with a TriggerExecute call.
-- Since the trigger executes normally, its conditions are still evaluated.
--
---@param trig trigger
---@param checkConditions boolean
---@return boolean
function PostTriggerExecuteBJ(trig, checkConditions)
	if checkConditions then
		if not (TriggerEvaluate(trig)) then
			return false
		end
	end
	TriggerRegisterTimerEvent(trig, 0, false)
	return true
end

--===========================================================================
-- Debug - Display the contents of the trigger queue (as either nil or "x"
-- for each entry).
function QueuedTriggerCheck()
	---@type string
	s = "TrigQueue Check "
	---@type integer
	i = nil
	
	i = 0
	while true do
		if i >= bj_queuedExecTotal then break end
		s = s + "q[" + I2S(i) + "]="
		if (bj_queuedExecTriggers[i] == nil) then
			s = s + "null "
		else
			s = s + "x "
		end
		i = i + 1
	end
	s = s + "(" + I2S(bj_queuedExecTotal) + " total)"
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 600, s)
end

--===========================================================================
-- Searches the queue for a given trigger, returning the index of the
-- trigger within the queue if it is found, or -1 if it is not found.
--
---@param trig trigger
---@return integer
function QueuedTriggerGetIndex(trig)
	-- Determine which, if any, of the queued triggers is being removed.
	---@type integer
	index = 0
	while true do
		if index >= bj_queuedExecTotal then break end
		if (bj_queuedExecTriggers[index] == trig) then
			return index
		end
		index = index + 1
	end
	return -1
end

--===========================================================================
-- Removes a trigger from the trigger queue, shifting other triggers down
-- to fill the unused space.  If the currently running trigger is removed
-- in this manner, this function does NOT attempt to run the next trigger.
--
---@param trigIndex integer
---@return boolean
function QueuedTriggerRemoveByIndex(trigIndex)
	---@type integer
	index = nil
	
	-- If the to-be-removed index is out of range, fail.
	if (trigIndex >= bj_queuedExecTotal) then
		return false
	end
	
	-- Shift all queue entries down to fill in the gap.
	bj_queuedExecTotal = bj_queuedExecTotal - 1
	index              = trigIndex
	while true do
		if index >= bj_queuedExecTotal then break end
		bj_queuedExecTriggers[index] = bj_queuedExecTriggers[index + 1]
		bj_queuedExecUseConds[index] = bj_queuedExecUseConds[index + 1]
		index                        = index + 1
	end
	return true
end

--===========================================================================
-- Attempt to execute the first trigger in the queue.  If it fails, remove
-- it and execute the next one.  Continue this cycle until a trigger runs,
-- or until the queue is empty.
--
---@return boolean
function QueuedTriggerAttemptExec()
	while true do
		if bj_queuedExecTotal == 0 then break end
		
		if TriggerExecuteBJ(bj_queuedExecTriggers[0], bj_queuedExecUseConds[0]) then
			-- Timeout the queue if it sits at the front of the queue for too long.
			TimerStart(bj_queuedExecTimeoutTimer, bj_QUEUED_TRIGGER_TIMEOUT, false, nil)
			return true
		end
		
		QueuedTriggerRemoveByIndex(0)
	end
	return false
end

--===========================================================================
-- Queues a trigger to be executed, assuring that such triggers are not
-- executed at the same time.
--
---@param trig trigger
---@param checkConditions boolean
---@return boolean
function QueuedTriggerAddBJ(trig, checkConditions)
	-- Make sure our queue isn't full.  If it is, return failure.
	if (bj_queuedExecTotal >= bj_MAX_QUEUED_TRIGGERS) then
		return false
	end
	
	-- Add the trigger to an array of to-be-executed triggers.
	bj_queuedExecTriggers[bj_queuedExecTotal] = trig
	bj_queuedExecUseConds[bj_queuedExecTotal] = checkConditions
	bj_queuedExecTotal                        = bj_queuedExecTotal + 1
	
	-- If this is the only trigger in the queue, run it.
	if (bj_queuedExecTotal == 1) then
		QueuedTriggerAttemptExec()
	end
	return true
end

--===========================================================================
-- Denotes the end of a queued trigger. Be sure to call this only once per
-- queued trigger, or risk stepping on the toes of other queued triggers.
--
---@param trig trigger
function QueuedTriggerRemoveBJ(trig)
	---@type integer
	index        = nil
	---@type integer
	trigIndex    = nil
	---@type boolean
	trigExecuted = nil
	
	-- Find the trigger's index.
	trigIndex    = QueuedTriggerGetIndex(trig)
	if (trigIndex == -1) then
		return
	end
	
	-- Shuffle the other trigger entries down to fill in the gap.
	QueuedTriggerRemoveByIndex(trigIndex)
	
	-- If we just axed the currently running trigger, run the next one.
	if (trigIndex == 0) then
		PauseTimer(bj_queuedExecTimeoutTimer)
		QueuedTriggerAttemptExec()
	end
end

--===========================================================================
-- Denotes the end of a queued trigger. Be sure to call this only once per
-- queued trigger, lest you step on the toes of other queued triggers.
--
function QueuedTriggerDoneBJ()
	---@type integer
	index = nil
	
	-- Make sure there's something on the queue to remove.
	if (bj_queuedExecTotal <= 0) then
		return
	end
	
	-- Remove the currently running trigger from the array.
	QueuedTriggerRemoveByIndex(0)
	
	-- If other triggers are waiting to run, run one of them.
	PauseTimer(bj_queuedExecTimeoutTimer)
	QueuedTriggerAttemptExec()
end

--===========================================================================
-- Empty the trigger queue.
--
function QueuedTriggerClearBJ()
	PauseTimer(bj_queuedExecTimeoutTimer)
	bj_queuedExecTotal = 0
end

--===========================================================================
-- Remove all but the currently executing trigger from the trigger queue.
--
function QueuedTriggerClearInactiveBJ()
	bj_queuedExecTotal = IMinBJ(bj_queuedExecTotal, 1)
end

--===========================================================================
---@return integer
function QueuedTriggerCountBJ()
	return bj_queuedExecTotal
end

--===========================================================================
---@return boolean
function IsTriggerQueueEmptyBJ()
	return bj_queuedExecTotal <= 0
end

--===========================================================================
---@param trig trigger
---@return boolean
function IsTriggerQueuedBJ(trig)
	return QueuedTriggerGetIndex(trig) ~= -1
end

--===========================================================================
---@return integer
function GetForLoopIndexA()
	return bj_forLoopAIndex
end

--===========================================================================
---@param newIndex integer
function SetForLoopIndexA(newIndex)
	bj_forLoopAIndex = newIndex
end

--===========================================================================
---@return integer
function GetForLoopIndexB()
	return bj_forLoopBIndex
end

--===========================================================================
---@param newIndex integer
function SetForLoopIndexB(newIndex)
	bj_forLoopBIndex = newIndex
end

--===========================================================================
-- We can't do game-time waits, so this simulates one by starting a timer
-- and polling until the timer expires.
---@param duration real
function PolledWait(duration)
	---@type timer
	t             = nil
	---@type real
	timeRemaining = nil
	
	if (duration > 0) then
		t = CreateTimer()
		TimerStart(t, duration, false, nil)
		while true do
			timeRemaining = TimerGetRemaining(t)
			if timeRemaining <= 0 then break end
			
			-- If we have a bit of time left, skip past 10% of the remaining
			-- duration instead of checking every interval, to minimize the
			-- polling on long waits.
			if (timeRemaining > bj_POLLED_WAIT_SKIP_THRESHOLD) then
				TriggerSleepAction(0.1 * timeRemaining)
			else
				TriggerSleepAction(bj_POLLED_WAIT_INTERVAL)
			end
		end
		DestroyTimer(t)
	end
end

--===========================================================================
---@param flag boolean
---@param valueA integer
---@param valueB integer
---@return integer
function IntegerTertiaryOp(flag, valueA, valueB)
	if flag then
		return valueA
	else
		return valueB
	end
end