--============================================================================
-- Destructable Object API
-- Facing arguments are specified in degrees
---@param objectid integer
---@param x real
---@param y real
---@param face real
---@param scale real
---@param variation integer
---@return destructable
function CreateDestructable(objectid, x, y, face, scale, variation) end

---@param objectid integer
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
---@return destructable
function CreateDestructableZ(objectid, x, y, z, face, scale, variation) end

---@param objectid integer
---@param x real
---@param y real
---@param face real
---@param scale real
---@param variation integer
---@return destructable
function CreateDeadDestructable(objectid, x, y, face, scale, variation) end

---@param objectid integer
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
---@return destructable
function CreateDeadDestructableZ(objectid, x, y, z, face, scale, variation) end

---@param d destructable
function RemoveDestructable(d) end

---@param d destructable
function KillDestructable(d) end

---@param d destructable
---@param flag boolean
function SetDestructableInvulnerable(d, flag) end

---@param d destructable
---@return boolean
function IsDestructableInvulnerable(d) end

---@param r rect
---@param filter boolexpr
---@param actionFunc code
function EnumDestructablesInRect(r, filter, actionFunc) end

---@param d destructable
---@return integer
function GetDestructableTypeId(d) end

---@param d destructable
---@return real
function GetDestructableX(d) end

---@param d destructable
---@return real
function GetDestructableY(d) end

---@param d destructable
---@param life real
function SetDestructableLife(d, life) end

---@param d destructable
---@return real
function GetDestructableLife(d) end

---@param d destructable
---@param max real
function SetDestructableMaxLife(d, max) end

---@param d destructable
---@return real
function GetDestructableMaxLife(d) end

---@param d destructable
---@param life real
---@param birth boolean
function DestructableRestoreLife(d, life, birth) end

---@param d destructable
---@param whichAnimation string
function QueueDestructableAnimation(d, whichAnimation) end

---@param d destructable
---@param whichAnimation string
function SetDestructableAnimation(d, whichAnimation) end

---@param d destructable
---@param speedFactor real
function SetDestructableAnimationSpeed(d, speedFactor) end

---@param d destructable
---@param flag boolean
function ShowDestructable(d, flag) end

---@param d destructable
---@return real
function GetDestructableOccluderHeight(d) end

---@param d destructable
---@param height real
function SetDestructableOccluderHeight(d, height) end

---@param d destructable
---@return string
function GetDestructableName(d) end

---@return destructable
function GetTriggerDestructable() end