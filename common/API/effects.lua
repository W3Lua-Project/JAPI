--============================================================================
-- Effects API
--
---@param where rect
---@param effectID integer
---@return weathereffect
function AddWeatherEffect(where, effectID) end

---@param whichEffect weathereffect
function RemoveWeatherEffect(whichEffect) end

---@param whichEffect weathereffect
---@param enable boolean
function EnableWeatherEffect(whichEffect, enable) end


---@param x real
---@param y real
---@param radius real
---@param depth real
---@param duration integer
---@param permanent boolean
---@return terraindeformation
function TerrainDeformCrater(x, y, radius, depth, duration, permanent) end

---@param x real
---@param y real
---@param radius real
---@param depth real
---@param duration integer
---@param count integer
---@param spaceWaves real
---@param timeWaves real
---@param radiusStartPct real
---@param limitNeg boolean
---@return terraindeformation
function TerrainDeformRipple(x, y, radius, depth, duration, count, spaceWaves, timeWaves, radiusStartPct, limitNeg) end

---@param x real
---@param y real
---@param dirX real
---@param dirY real
---@param distance real
---@param speed real
---@param radius real
---@param depth real
---@param trailTime integer
---@param count integer
---@return terraindeformation
function TerrainDeformWave(x, y, dirX, dirY, distance, speed, radius, depth, trailTime, count) end

---@param x real
---@param y real
---@param radius real
---@param minDelta real
---@param maxDelta real
---@param duration integer
---@param updateInterval integer
---@return terraindeformation
function TerrainDeformRandom(x, y, radius, minDelta, maxDelta, duration, updateInterval) end

---@param deformation terraindeformation
---@param duration integer
function TerrainDeformStop(deformation, duration) end

function TerrainDeformStopAll() end


---@param modelName string
---@param x real
---@param y real
---@return effect
function AddSpecialEffect(modelName, x, y) end

---@param modelName string
---@param where location
---@return effect
function AddSpecialEffectLoc(modelName, where) end

---@param modelName string
---@param targetWidget widget
---@param attachPointName string
---@return effect
function AddSpecialEffectTarget(modelName, targetWidget, attachPointName) end

---@param whichEffect effect
function DestroyEffect(whichEffect) end


---@param abilityString string
---@param t effecttype
---@param x real
---@param y real
---@return effect
function AddSpellEffect(abilityString, t, x, y) end

---@param abilityString string
---@param t effecttype
---@param where location
---@return effect
function AddSpellEffectLoc(abilityString, t,where) end

---@param abilityId integer
---@param t effecttype
---@param x real
---@param y real
---@return effect
function AddSpellEffectById(abilityId, t,x, y) end

---@param abilityId integer
---@param t effecttype
---@param where location
---@return effect
function AddSpellEffectByIdLoc(abilityId, t,where) end

---@param modelName string
---@param t effecttype
---@param targetWidget widget
---@param attachPoint string
---@return effect
function AddSpellEffectTarget(modelName, t, targetWidget, attachPoint) end

---@param abilityId integer
---@param t effecttype
---@param targetWidget widget
---@param attachPoint string
---@return effect
function AddSpellEffectTargetById(abilityId, t, targetWidget, attachPoint) end


---@param codeName string
---@param checkVisibility boolean
---@param x1 real
---@param y1 real
---@param x2 real
---@param y2 real
---@return lightning
function AddLightning(codeName, checkVisibility, x1, y1, x2, y2) end

---@param codeName string
---@param checkVisibility boolean
---@param x1 real
---@param y1 real
---@param z1 real
---@param x2 real
---@param y2 real
---@param z2 real
---@return lightning
function AddLightningEx(codeName, checkVisibility, x1, y1, z1, x2, y2, z2) end

---@param whichBolt lightning
---@return boolean
function DestroyLightning(whichBolt) end

---@param whichBolt lightning
---@param checkVisibility boolean
---@param x1 real
---@param y1 real
---@param x2 real
---@param y2 real
---@return boolean
function MoveLightning(whichBolt, checkVisibility, x1, y1, x2, y2) end

---@param whichBolt lightning
---@param checkVisibility boolean
---@param x1 real
---@param y1 real
---@param z1 real
---@param x2 real
---@param y2 real
---@param z2 real
---@return boolean
function MoveLightningEx(whichBolt, checkVisibility, x1, y1, z1, x2, y2, z2) end

---@param whichBolt lightning
---@return real
function GetLightningColorA(whichBolt) end

---@param whichBolt lightning
---@return real
function GetLightningColorR(whichBolt) end

---@param whichBolt lightning
---@return real
function GetLightningColorG(whichBolt) end

---@param whichBolt lightning
---@return real
function GetLightningColorB(whichBolt) end

---@param whichBolt lightning
---@param r real
---@param g real
---@param b real
---@param a real
---@return boolean
function SetLightningColor(whichBolt, r, g, b, a) end


---@param abilityString string
---@param t effecttype
---@param index integer
---@return string
function GetAbilityEffect(abilityString, t, index) end

---@param abilityId integer
---@param t effecttype
---@param index integer
---@return string
function GetAbilityEffectById(abilityId, t, index) end

---@param abilityString string
---@param t soundtype
---@return string
function GetAbilitySound(abilityString, t) end

---@param abilityId integer
---@param t soundtype
---@return string
function GetAbilitySoundById(abilityId, t) end