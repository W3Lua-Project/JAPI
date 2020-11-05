--============================================================================
-- Fog of War API
---@param forWhichPlayer player
---@param whichState fogstate
---@param where rect
---@param useSharedVision boolean
function SetFogStateRect(forWhichPlayer, whichState, where, useSharedVision) end

---@param forWhichPlayer player
---@param whichState fogstate
---@param centerx real
---@param centerY real
---@param radius real
---@param useSharedVision boolean
function SetFogStateRadius(forWhichPlayer, whichState, centerx, centerY, radius, useSharedVision) end

---@param forWhichPlayer player
---@param whichState fogstate
---@param center location
---@param radius real
---@param useSharedVision boolean
function SetFogStateRadiusLoc(forWhichPlayer, whichState, center, radius, useSharedVision) end

---@param enable boolean
function FogMaskEnable(enable) end

---@return boolean
function IsFogMaskEnabled() end

---@param enable boolean
function FogEnable(enable) end

---@return boolean
function IsFogEnabled() end


---@param forWhichPlayer player
---@param whichState fogstate
---@param where rect
---@param useSharedVision boolean
---@param afterUnits boolean
---@return fogmodifier
function CreateFogModifierRect(forWhichPlayer, whichState, where, useSharedVision, afterUnits) end

---@param forWhichPlayer player
---@param whichState fogstate
---@param centerx real
---@param centerY real
---@param radius real
---@param useSharedVision boolean
---@param afterUnits boolean
---@return fogmodifier
function CreateFogModifierRadius(forWhichPlayer, whichState, centerx, centerY, radius, useSharedVision, afterUnits) end

---@param forWhichPlayer player
---@param whichState fogstate
---@param center location
---@param radius real
---@param useSharedVision boolean
---@param afterUnits boolean
---@return fogmodifier
function CreateFogModifierRadiusLoc(forWhichPlayer, whichState, center, radius, useSharedVision, afterUnits) end

---@param whichFogModifier fogmodifier
function DestroyFogModifier(whichFogModifier) end

---@param whichFogModifier fogmodifier
function FogModifierStart(whichFogModifier) end

---@param whichFogModifier fogmodifier
function FogModifierStop(whichFogModifier) end