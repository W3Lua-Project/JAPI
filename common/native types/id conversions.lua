---@param value string
---@return integer
function FourCC(value) end

---@param orderIdString string
---@return integer
function OrderId(orderIdString) end

---@param orderId integer
---@return string
function OrderId2String(orderId) end

---@param unitIdString string
---@return integer
function UnitId(unitIdString) end

---@param unitId integer
---@return string
function UnitId2String(unitId) end


-- Not currently working correctly...
---@param abilityIdString string
---@return integer
function AbilityId(abilityIdString) end

---@param abilityId integer
---@return string
function AbilityId2String(abilityId) end


-- Looks up the "name" field for any object (unit, item, ability)
---@param objectId integer
---@return string
function GetObjectName(objectId) end