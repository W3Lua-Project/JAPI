--***************************************************************************
--*
--*  Text Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param toForce force
---@param message string
function DisplayTextToForce(toForce, message)
	if (IsPlayerInForce(GetLocalPlayer(), toForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		DisplayTextToPlayer(GetLocalPlayer(), 0, 0, message)
	end
end

--===========================================================================
---@param toForce force
---@param duration real
---@param message string
function DisplayTimedTextToForce(toForce, duration, message)
	if (IsPlayerInForce(GetLocalPlayer(), toForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, duration, message)
	end
end

--===========================================================================
---@param toForce force
function ClearTextMessagesBJ(toForce)
	if (IsPlayerInForce(GetLocalPlayer(), toForce)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearTextMessages()
	end
end

--===========================================================================
-- The parameters for the API Substring function are unintuitive, so this
-- merely performs a translation for the starting index.
--
---@param source string
---@param start integer
---@param ending integer
---@return string
function SubStringBJ(source, start, ending)
	return SubString(source, start - 1, ending)
end

---@param h handle
---@return integer
function GetHandleIdBJ(h)
	return GetHandleId(h)
end

---@param s string
---@return integer
function StringHashBJ(s)
	return StringHash(s)
end