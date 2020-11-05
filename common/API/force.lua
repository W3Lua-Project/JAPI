--============================================================================
-- Force API
--
---@return force
function CreateForce() end

---@param whichForce force
function DestroyForce(whichForce) end

---@param whichForce force
---@param whichPlayer player
function ForceAddPlayer(whichForce, whichPlayer) end

---@param whichForce force
---@param whichPlayer player
function ForceRemovePlayer(whichForce, whichPlayer) end

---@param whichForce force
---@param whichPlayer player
---@return boolean
function BlzForceHasPlayer(whichForce, whichPlayer) end

---@param whichForce force
function ForceClear(whichForce) end

---@param whichForce force
---@param filter boolexpr
function ForceEnumPlayers(whichForce, filter) end

---@param whichForce force
---@param filter boolexpr
---@param countLimit integer
function ForceEnumPlayersCounted(whichForce, filter, countLimit) end

---@param whichForce force
---@param whichPlayer player
---@param filter boolexpr
function ForceEnumAllies(whichForce, whichPlayer, filter) end

---@param whichForce force
---@param whichPlayer player
---@param filter boolexpr
function ForceEnumEnemies(whichForce, whichPlayer, filter) end

---@param whichForce force
---@param callback code
function ForForce(whichForce, callback) end