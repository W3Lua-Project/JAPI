--============================================================================
-- Blight API
--
---@param whichPlayer player
---@param x real
---@param y real
---@param radius real
---@param addBlight boolean
function SetBlight(whichPlayer, x, y, radius, addBlight) end

---@param whichPlayer player
---@param r rect
---@param addBlight boolean
function SetBlightRect(whichPlayer, r, addBlight) end

---@param whichPlayer player
---@param x real
---@param y real
---@param addBlight boolean
function SetBlightPoint(whichPlayer, x, y, addBlight) end

---@param whichPlayer player
---@param whichLocation location
---@param radius real
---@param addBlight boolean
function SetBlightLoc(whichPlayer, whichLocation, radius, addBlight) end

---@param id player
---@param x real
---@param y real
---@param face real
---@return unit
function CreateBlightedGoldmine(id, x, y, face) end

---@param x real
---@param y real
---@return boolean
function IsPointBlighted(x, y) end