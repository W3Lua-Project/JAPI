--============================================================================
-- String Utility API
---@param i integer
---@return real
function I2R(i) end

---@param r real
---@return integer
function R2I(r) end

---@param i integer
---@return string
function I2S(i) end

---@param r real
---@return string
function R2S(r) end

---@param r real
---@param width integer
---@param precision integer
---@return string
function R2SW(r, width, precision) end

---@param s string
---@return integer
function S2I(s) end

---@param s string
---@return real
function S2R(s) end

---@param h handle
---@return integer
function GetHandleId(h) end

---@param source string
---@param start integer
---@param ending integer
---@return string
function SubString(source, start, ending) end

---@param s string
---@return integer
function StringLength(s) end

---@param source string
---@param upper boolean
---@return string
function StringCase(source, upper) end

---@param s string
---@return integer
function StringHash(s) end


---@param source string
---@return string
function GetLocalizedString(source) end

---@param source string
---@return integer
function GetLocalizedHotkey(source) end