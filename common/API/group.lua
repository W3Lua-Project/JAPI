--============================================================================
-- Group API
--
---@return group
function CreateGroup() end

---@param whichGroup group
function DestroyGroup(whichGroup) end

---@param whichGroup group
---@param whichUnit unit
---@return boolean
function GroupAddUnit(whichGroup, whichUnit) end

---@param whichGroup group
---@param whichUnit unit
---@return boolean
function GroupRemoveUnit(whichGroup, whichUnit) end

---@param whichGroup group
---@param addGroup group
---@return integer
function BlzGroupAddGroupFast(whichGroup, addGroup) end

---@param whichGroup group
---@param removeGroup group
---@return integer
function BlzGroupRemoveGroupFast(whichGroup, removeGroup) end

---@param whichGroup group
function GroupClear(whichGroup) end

---@param whichGroup group
---@return integer
function BlzGroupGetSize(whichGroup) end

---@param whichGroup group
---@param index integer
---@return unit
function BlzGroupUnitAt(whichGroup, index) end

---@param whichGroup group
---@param unitname string
---@param filter boolexpr
function GroupEnumUnitsOfType(whichGroup, unitname, filter) end

---@param whichGroup group
---@param whichPlayer player
---@param filter boolexpr
function GroupEnumUnitsOfPlayer(whichGroup, whichPlayer, filter) end

---@param whichGroup group
---@param unitname string
---@param filter boolexpr
---@param countLimit integer
function GroupEnumUnitsOfTypeCounted(whichGroup, unitname, filter, countLimit) end

---@param whichGroup group
---@param r rect
---@param filter boolexpr
function GroupEnumUnitsInRect(whichGroup, r, filter) end

---@param whichGroup group
---@param r rect
---@param filter boolexpr
---@param countLimit integer
function GroupEnumUnitsInRectCounted(whichGroup, r, filter, countLimit) end

---@param whichGroup group
---@param x real
---@param y real
---@param radius real
---@param filter boolexpr
function GroupEnumUnitsInRange(whichGroup, x, y, radius, filter) end

---@param whichGroup group
---@param whichLocation location
---@param radius real
---@param filter boolexpr
function GroupEnumUnitsInRangeOfLoc(whichGroup, whichLocation, radius, filter) end

---@param whichGroup group
---@param x real
---@param y real
---@param radius real
---@param filter boolexpr
---@param countLimit integer
function GroupEnumUnitsInRangeCounted(whichGroup, x, y, radius, filter, countLimit) end

---@param whichGroup group
---@param whichLocation location
---@param radius real
---@param filter boolexpr
---@param countLimit integer
function GroupEnumUnitsInRangeOfLocCounted(whichGroup, whichLocation, radius, filter, countLimit) end

---@param whichGroup group
---@param whichPlayer player
---@param filter boolexpr
function GroupEnumUnitsSelected(whichGroup, whichPlayer, filter) end


---@param whichGroup group
---@param order string
---@return boolean
function GroupImmediateOrder(whichGroup, order) end

---@param whichGroup group
---@param order integer
---@return boolean
function GroupImmediateOrderById(whichGroup, order) end

---@param whichGroup group
---@param order string
---@param x real
---@param y real
---@return boolean
function GroupPointOrder(whichGroup, order, x, y) end

---@param whichGroup group
---@param order string
---@param whichLocation location
---@return boolean
function GroupPointOrderLoc(whichGroup, order, whichLocation) end

---@param whichGroup group
---@param order integer
---@param x real
---@param y real
---@return boolean
function GroupPointOrderById(whichGroup, order, x, y) end

---@param whichGroup group
---@param order integer
---@param whichLocation location
---@return boolean
function GroupPointOrderByIdLoc(whichGroup, order, whichLocation) end

---@param whichGroup group
---@param order string
---@param targetWidget widget
---@return boolean
function GroupTargetOrder(whichGroup, order, targetWidget) end

---@param whichGroup group
---@param order integer
---@param targetWidget widget
---@return boolean
function GroupTargetOrderById(whichGroup, order, targetWidget) end


-- This will be difficult to support with potentially disjoint, cell-based regions
-- as it would involve enumerating all the cells that are covered by a particularregion
-- a better implementation would be a trigger that adds relevant units as they enter
-- and removes them if they leave...
---@param whichGroup group
---@param callback code
function ForGroup(whichGroup, callback) end

---@param whichGroup group
---@return unit
function FirstOfGroup(whichGroup) end