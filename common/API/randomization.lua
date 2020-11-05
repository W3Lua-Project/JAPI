--============================================================================
-- Randomization API
---@param lowBound integer
---@param highBound integer
---@return integer
function GetRandomInt(lowBound, highBound) end

---@param lowBound real
---@param highBound real
---@return real
function GetRandomReal(lowBound, highBound) end


---@return unitpool
function CreateUnitPool() end

---@param whichPool unitpool
function DestroyUnitPool(whichPool) end

---@param whichPool unitpool
---@param unitId integer
---@param weight real
function UnitPoolAddUnitType(whichPool, unitId, weight) end

---@param whichPool unitpool
---@param unitId integer
function UnitPoolRemoveUnitType(whichPool, unitId) end

---@param whichPool unitpool
---@param forWhichPlayer player
---@param x real
---@param y real
---@param facing real
---@return unit
function PlaceRandomUnit(whichPool, forWhichPlayer, x, y, facing) end


---@return itempool
function CreateItemPool() end

---@param whichItemPool itempool
function DestroyItemPool(whichItemPool) end

---@param whichItemPool itempool
---@param itemId integer
---@param weight real
function ItemPoolAddItemType(whichItemPool, itemId, weight) end

---@param whichItemPool itempool
---@param itemId integer
function ItemPoolRemoveItemType(whichItemPool, itemId) end

---@param whichItemPool itempool
---@param x real
---@param y real
---@return item
function PlaceRandomItem(whichItemPool, x, y) end


-- Choose any random unit/item. (NP means Neutral Passive)
---@param level integer
---@return integer
function ChooseRandomCreep(level) end

---@return integer
function ChooseRandomNPBuilding() end

---@param level integer
---@return integer
function ChooseRandomItem(level) end

---@param whichType itemtype
---@param level integer
---@return integer
function ChooseRandomItemEx(whichType, level) end

---@param seed integer
function SetRandomSeed(seed) end