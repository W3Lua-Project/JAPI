--============================================================================
-- Visual API
---@param a real
---@param b real
---@param c real
---@param d real
---@param e real
function SetTerrainFog(a, b, c, d, e) end

function ResetTerrainFog() end


---@param a real
---@param b real
---@param c real
---@param d real
---@param e real
function SetUnitFog(a, b, c, d, e) end

---@param style integer
---@param zstart real
---@param zend real
---@param density real
---@param red real
---@param green real
---@param blue real
function SetTerrainFogEx(style, zstart, zend, density, red, green, blue) end

---@param toPlayer player
---@param x real
---@param y real
---@param message string
function DisplayTextToPlayer(toPlayer, x, y, message) end

---@param toPlayer player
---@param x real
---@param y real
---@param duration real
---@param message string
function DisplayTimedTextToPlayer(toPlayer, x, y, duration, message) end

---@param toPlayer player
---@param x real
---@param y real
---@param duration real
---@param message string
function DisplayTimedTextFromPlayer(toPlayer, x, y, duration, message) end

function ClearTextMessages() end

---@param terrainDNCFile string
---@param unitDNCFile string
function SetDayNightModels(terrainDNCFile, unitDNCFile) end

---@param skyModelFile string
function SetSkyModel(skyModelFile) end

---@param b boolean
function EnableUserControl(b) end

---@param b boolean
function EnableUserUI(b) end

---@param b boolean
function SuspendTimeOfDay(b) end

---@param r real
function SetTimeOfDayScale(r) end

---@return real
function GetTimeOfDayScale() end

---@param flag boolean
---@param fadeDuration real
function ShowInterface(flag, fadeDuration) end

---@param flag boolean
function PauseGame(flag) end

---@param whichUnit unit
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function UnitAddIndicator(whichUnit, red, green, blue, alpha) end

---@param whichWidget widget
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function AddIndicator(whichWidget, red, green, blue, alpha) end

---@param x real
---@param y real
---@param duration real
function PingMinimap(x, y, duration) end

---@param x real
---@param y real
---@param duration real
---@param red integer
---@param green integer
---@param blue integer
---@param extraEffects boolean
function PingMinimapEx(x, y, duration, red, green, blue, extraEffects) end

---@param flag boolean
function EnableOcclusion(flag) end

---@param introText string
function SetIntroShotText(introText) end

---@param introModelPath string
function SetIntroShotModel(introModelPath) end

---@param b boolean
function EnableWorldFogBoundary(b) end

---@param modelName string
function PlayModelCinematic(modelName) end

---@param movieName string
function PlayCinematic(movieName) end

---@param key string
function ForceUIKey(key) end

function ForceUICancel() end

function DisplayLoadDialog() end

---@param iconPath string
function SetAltMinimapIcon(iconPath) end

---@param flag boolean
function DisableRestartMission(flag) end


---@return texttag
function CreateTextTag() end

---@param t texttag
function DestroyTextTag(t) end

---@param t texttag
---@param s string
---@param height real
function SetTextTagText(t, s, height) end

---@param t texttag
---@param x real
---@param y real
---@param heightOffset real
function SetTextTagPos(t, x, y, heightOffset) end

---@param t texttag
---@param whichUnit unit
---@param heightOffset real
function SetTextTagPosUnit(t, whichUnit, heightOffset) end

---@param t texttag
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetTextTagColor(t, red, green, blue, alpha) end

---@param t texttag
---@param xvel real
---@param yvel real
function SetTextTagVelocity(t, xvel, yvel) end

---@param t texttag
---@param flag boolean
function SetTextTagVisibility(t, flag) end

---@param t texttag
---@param flag boolean
function SetTextTagSuspended(t, flag) end

---@param t texttag
---@param flag boolean
function SetTextTagPermanent(t, flag) end

---@param t texttag
---@param age real
function SetTextTagAge(t, age) end

---@param t texttag
---@param lifespan real
function SetTextTagLifespan(t, lifespan) end

---@param t texttag
---@param fadepoint real
function SetTextTagFadepoint(t, fadepoint) end


---@param reserved integer
function SetReservedLocalHeroButtons(reserved) end

---@return integer
function GetAllyColorFilterState() end

---@param state integer
function SetAllyColorFilterState(state) end

---@return boolean
function GetCreepCampFilterState() end

---@param state boolean
function SetCreepCampFilterState(state) end

---@param enableAlly boolean
---@param enableCreep boolean
function EnableMinimapFilterButtons(enableAlly, enableCreep) end

---@param state boolean
---@param ui boolean
function EnableDragSelect(state, ui) end

---@param state boolean
---@param ui boolean
function EnablePreSelect(state, ui) end

---@param state boolean
---@param ui boolean
function EnableSelect(state, ui) end

---@param whichAnim animtype
---@return string
function BlzGetAnimName(whichAnim) end

---@param enableSelection boolean
---@param enableSelectionCircle boolean
function BlzEnableSelections(enableSelection, enableSelectionCircle) end

---@return boolean
function BlzIsSelectionEnabled() end

---@return boolean
function BlzIsSelectionCircleEnabled() end

---@param enable boolean
function BlzEnableTargetIndicator(enable) end

---@return boolean
function BlzIsTargetIndicatorEnabled() end

---@param a integer
---@param r integer
---@param g integer
---@param b integer
---@return integer
function BlzConvertColor(a, r, g, b) end

---@param enable boolean
function BlzEnableCursor(enable) end

---@param x integer
---@param y integer
function BlzSetMousePos(x, y) end

---@return integer
function BlzGetLocalClientWidth() end

---@return integer
function BlzGetLocalClientHeight() end

---@return boolean
function BlzIsLocalClientActive() end

---@return unit
function BlzGetMouseFocusUnit() end

---@param texFile string
---@return boolean
function BlzChangeMinimapTerrainTex(texFile) end

---@param whichPlayer player
---@param recipient integer
---@param message string
function BlzDisplayChatMessage(whichPlayer, recipient, message) end