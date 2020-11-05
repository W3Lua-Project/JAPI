---@param whichEffect effect
---@param whichPlayer player
function BlzSetSpecialEffectColorByPlayer(whichEffect, whichPlayer) end

---@param whichEffect effect
---@param r integer
---@param g integer
---@param b integer
function BlzSetSpecialEffectColor(whichEffect, r, g, b) end

---@param whichEffect effect
---@param alpha integer
function BlzSetSpecialEffectAlpha(whichEffect, alpha) end

---@param whichEffect effect
---@param scale real
function BlzSetSpecialEffectScale(whichEffect, scale) end

---@param whichEffect effect
---@param x real
---@param y real
---@param z real
function BlzSetSpecialEffectPosition(whichEffect, x, y, z) end

---@param whichEffect effect
---@param height real
function BlzSetSpecialEffectHeight(whichEffect, height) end

---@param whichEffect effect
---@param timeScale real
function BlzSetSpecialEffectTimeScale(whichEffect, timeScale) end

---@param whichEffect effect
---@param time real
function BlzSetSpecialEffectTime(whichEffect, time) end

---@param whichEffect effect
---@param yaw real
---@param pitch real
---@param roll real
function BlzSetSpecialEffectOrientation(whichEffect, yaw, pitch, roll) end

---@param whichEffect effect
---@param yaw real
function BlzSetSpecialEffectYaw(whichEffect, yaw) end

---@param whichEffect effect
---@param pitch real
function BlzSetSpecialEffectPitch(whichEffect, pitch) end

---@param whichEffect effect
---@param roll real
function BlzSetSpecialEffectRoll(whichEffect, roll) end

---@param whichEffect effect
---@param x real
function BlzSetSpecialEffectX(whichEffect, x) end

---@param whichEffect effect
---@param y real
function BlzSetSpecialEffectY(whichEffect, y) end

---@param whichEffect effect
---@param z real
function BlzSetSpecialEffectZ(whichEffect, z) end

---@param whichEffect effect
---@param loc location
function BlzSetSpecialEffectPositionLoc(whichEffect, loc) end

---@param whichEffect effect
---@return real
function BlzGetLocalSpecialEffectX(whichEffect) end

---@param whichEffect effect
---@return real
function BlzGetLocalSpecialEffectY(whichEffect) end

---@param whichEffect effect
---@return real
function BlzGetLocalSpecialEffectZ(whichEffect) end

---@param whichEffect effect
function BlzSpecialEffectClearSubAnimations(whichEffect) end

---@param whichEffect effect
---@param whichSubAnim subanimtype
function BlzSpecialEffectRemoveSubAnimation(whichEffect, whichSubAnim) end

---@param whichEffect effect
---@param whichSubAnim subanimtype
function BlzSpecialEffectAddSubAnimation(whichEffect, whichSubAnim) end

---@param whichEffect effect
---@param whichAnim animtype
function BlzPlaySpecialEffect(whichEffect, whichAnim) end

---@param whichEffect effect
---@param whichAnim animtype
---@param timeScale real
function BlzPlaySpecialEffectWithTimeScale(whichEffect, whichAnim, timeScale) end

---@param whichEffect effect
---@return real
function BlzGetSpecialEffectScale(whichEffect) end

---@param whichEffect effect
---@param x real
---@param y real
---@param z real
function BlzSetSpecialEffectMatrixScale(whichEffect, x, y, z) end

---@param whichEffect effect
function BlzResetSpecialEffectMatrix(whichEffect) end