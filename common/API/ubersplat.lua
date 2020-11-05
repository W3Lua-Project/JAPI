--============================================================================
-- Ubersplat API
--
---@param x real
---@param y real
---@param name string
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
---@param forcePaused boolean
---@param noBirthTime boolean
---@return ubersplat
function CreateUbersplat(x, y, name, red, green, blue, alpha, forcePaused, noBirthTime) end

---@param whichSplat ubersplat
function DestroyUbersplat(whichSplat) end

---@param whichSplat ubersplat
function ResetUbersplat(whichSplat) end

---@param whichSplat ubersplat
function FinishUbersplat(whichSplat) end

---@param whichSplat ubersplat
---@param flag boolean
function ShowUbersplat(whichSplat, flag) end

---@param whichSplat ubersplat
---@param flag boolean
function SetUbersplatRender(whichSplat, flag) end

---@param whichSplat ubersplat
---@param flag boolean
function SetUbersplatRenderAlways(whichSplat, flag) end