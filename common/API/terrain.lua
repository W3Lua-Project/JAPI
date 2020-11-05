--============================================================================
-- Terrain API
--
---@param x real
---@param y real
---@return integer
function GetTerrainCliffLevel(x, y) end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetWaterBaseColor(red, green, blue, alpha) end

---@param val boolean
function SetWaterDeforms(val) end

---@param x real
---@param y real
---@return integer
function GetTerrainType(x, y) end

---@param x real
---@param y real
---@return integer
function GetTerrainVariance(x, y) end

---@param x real
---@param y real
---@param terrainType integer
---@param variation integer
---@param area integer
---@param shape integer
function SetTerrainType(x, y, terrainType, variation, area, shape) end

---@param x real
---@param y real
---@param t pathingtype
---@return boolean
function IsTerrainPathable(x, y, t) end

---@param x real
---@param y real
---@param t pathingtype
---@param flag boolean
function SetTerrainPathable(x, y, t, flag) end