--============================================================================
-- Region and Location API
--
---@param minx real
---@param miny real
---@param maxx real
---@param maxy real
---@return rect
function Rect(minx, miny, maxx, maxy) end

---@param min location
---@param max location
---@return rect
function RectFromLoc(min, max) end

---@param whichRect rect
function RemoveRect(whichRect) end

---@param whichRect rect
---@param minx real
---@param miny real
---@param maxx real
---@param maxy real
function SetRect(whichRect, minx, miny, maxx, maxy) end

---@param whichRect rect
---@param min location
---@param max location
function SetRectFromLoc(whichRect, min, max) end

---@param whichRect rect
---@param newCenterX real
---@param newCenterY real
function MoveRectTo(whichRect, newCenterX, newCenterY) end

---@param whichRect rect
---@param newCenterLoc location
function MoveRectToLoc(whichRect, newCenterLoc) end


---@param whichRect rect
---@return real
function GetRectCenterX(whichRect) end

---@param whichRect rect
---@return real
function GetRectCenterY(whichRect) end

---@param whichRect rect
---@return real
function GetRectMinX(whichRect) end

---@param whichRect rect
---@return real
function GetRectMinY(whichRect) end

---@param whichRect rect
---@return real
function GetRectMaxX(whichRect) end

---@param whichRect rect
---@return real
function GetRectMaxY(whichRect) end


---@return region
function CreateRegion() end

---@param whichRegion region
function RemoveRegion(whichRegion) end


---@param whichRegion region
---@param r rect
function RegionAddRect(whichRegion, r) end

---@param whichRegion region
---@param r rect
function RegionClearRect(whichRegion, r) end


---@param whichRegion region
---@param x real
---@param y real
function RegionAddCell(whichRegion, x, y) end

---@param whichRegion region
---@param whichLocation location
function RegionAddCellAtLoc(whichRegion, whichLocation) end

---@param whichRegion region
---@param x real
---@param y real
function RegionClearCell(whichRegion, x, y) end

---@param whichRegion region
---@param whichLocation location
function RegionClearCellAtLoc(whichRegion, whichLocation) end


---@param x real
---@param y real
---@return location
function Location(x, y) end

---@param whichLocation location
function RemoveLocation(whichLocation) end

---@param whichLocation location
---@param newX real
---@param newY real
function MoveLocation(whichLocation, newX, newY) end

---@param whichLocation location
---@return real
function GetLocationX(whichLocation) end

---@param whichLocation location
---@return real
function GetLocationY(whichLocation) end


-- This function is asynchronous. The values it returns are not guaranteed synchronous between each player.
--  If you attempt to use it in a synchronous manner, it may cause a desync.
---@param whichLocation location
---@return real
function GetLocationZ(whichLocation) end


---@param whichRegion region
---@param whichUnit unit
---@return boolean
function IsUnitInRegion(whichRegion, whichUnit) end

---@param whichRegion region
---@param x real
---@param y real
---@return boolean
function IsPointInRegion(whichRegion, x, y) end

---@param whichRegion region
---@param whichLocation location
---@return boolean
function IsLocationInRegion(whichRegion, whichLocation) end


-- Returns full map bounds, including unplayable borders, in world coordinates
---@return rect
function GetWorldBounds() end