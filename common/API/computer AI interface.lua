--============================================================================
-- Computer AI interface
--
---@param num player
---@param script string
function StartMeleeAI(num, script) end

---@param num player
---@param script string
function StartCampaignAI(num, script) end

---@param num player
---@param command integer
---@param data integer
function CommandAI(num, command, data) end

---@param p player
---@param pause boolean
function PauseCompAI(p,   pause) end

---@param num player
---@return aidifficulty
function GetAIDifficulty(num) end


---@param hUnit unit
function RemoveGuardPosition(hUnit) end

---@param hUnit unit
function RecycleGuardPosition(hUnit) end

---@param num player
function RemoveAllGuardPositions(num) end