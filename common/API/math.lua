--============================================================================
-- MathAPI
---@param degrees real
---@return real
function Deg2Rad(degrees) end

---@param radians real
---@return real
function Rad2Deg(radians) end


---@param radians real
---@return real
function Sin(radians) end

---@param radians real
---@return real
function Cos(radians) end

---@param radians real
---@return real
function Tan(radians) end


-- Expect values between -1 and 1...returns 0 for invalid input
---@param y real
---@return real
function Asin(y) end

---@param x real
---@return real
function Acos(x) end


---@param x real
---@return real
function Atan(x) end


-- Returns 0 if x and y are both 0
---@param y real
---@param x real
---@return real
function Atan2(y, x) end


-- Returns 0 if x <= 0
---@param x real
---@return real
function SquareRoot(x) end


-- computes x to the y power
-- y == 0.0             => 1
-- x ==0.0 and y < 0    => 0
--
---@param x real
---@param power real
---@return real
function Pow(x, power) end

--  BlzFourCC2S                                 takes integer value returns string
--  BlzS2FourCC                                 takes string value returns integer

-- Bit Operations
---@param x integer
---@param y integer
---@return integer
function BlzBitOr(x, y) end

---@param x integer
---@param y integer
---@return integer
function BlzBitAnd(x, y) end

---@param x integer
---@param y integer
---@return integer
function BlzBitXor(x, y) end