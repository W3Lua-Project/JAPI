--============================================================================
-- Unit API
-- Facing arguments are specified in degrees
---@param id player
---@param unitid integer
---@param x real
---@param y real
---@param face real
---@return unit
function CreateUnit(id, unitid, x, y, face) end

---@param whichPlayer player
---@param unitname string
---@param x real
---@param y real
---@param face real
---@return unit
function CreateUnitByName(whichPlayer, unitname, x, y, face) end

---@param id player
---@param unitid integer
---@param whichLocation location
---@param face real
---@return unit
function CreateUnitAtLoc(id, unitid, whichLocation, face) end

---@param id player
---@param unitname string
---@param whichLocation location
---@param face real
---@return unit
function CreateUnitAtLocByName(id, unitname, whichLocation, face) end

---@param whichPlayer player
---@param unitid integer
---@param x real
---@param y real
---@param face real
---@return unit
function CreateCorpse(whichPlayer, unitid, x, y, face) end


---@param whichUnit unit
function KillUnit(whichUnit) end

---@param whichUnit unit
function RemoveUnit(whichUnit) end

---@param whichUnit unit
---@param show boolean
function ShowUnit(whichUnit, show) end


---@param whichUnit unit
---@param whichUnitState unitstate
---@param newVal real
function SetUnitState(whichUnit, whichUnitState, newVal) end

---@param whichUnit unit
---@param newX real
function SetUnitX(whichUnit, newX) end

---@param whichUnit unit
---@param newY real
function SetUnitY(whichUnit, newY) end

---@param whichUnit unit
---@param newX real
---@param newY real
function SetUnitPosition(whichUnit, newX, newY) end

---@param whichUnit unit
---@param whichLocation location
function SetUnitPositionLoc(whichUnit, whichLocation) end

---@param whichUnit unit
---@param facingAngle real
function SetUnitFacing(whichUnit, facingAngle) end

---@param whichUnit unit
---@param facingAngle real
---@param duration real
function SetUnitFacingTimed(whichUnit, facingAngle, duration) end

---@param whichUnit unit
---@param newSpeed real
function SetUnitMoveSpeed(whichUnit, newSpeed) end

---@param whichUnit unit
---@param newHeight real
---@param rate real
function SetUnitFlyHeight(whichUnit, newHeight, rate) end

---@param whichUnit unit
---@param newTurnSpeed real
function SetUnitTurnSpeed(whichUnit, newTurnSpeed) end

---@param whichUnit unit
---@param newPropWindowAngle real
function SetUnitPropWindow(whichUnit, newPropWindowAngle) end

---@param whichUnit unit
---@param newAcquireRange real
function SetUnitAcquireRange(whichUnit, newAcquireRange) end

---@param whichUnit unit
---@param creepGuard boolean
function SetUnitCreepGuard(whichUnit, creepGuard) end


---@param whichUnit unit
---@return real
function GetUnitAcquireRange(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitTurnSpeed(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitPropWindow(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitFlyHeight(whichUnit) end


---@param whichUnit unit
---@return real
function GetUnitDefaultAcquireRange(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitDefaultTurnSpeed(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitDefaultPropWindow(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitDefaultFlyHeight(whichUnit) end


---@param whichUnit unit
---@param whichPlayer player
---@param changeColor boolean
function SetUnitOwner(whichUnit, whichPlayer, changeColor) end

---@param whichUnit unit
---@param whichColor playercolor
function SetUnitColor(whichUnit, whichColor) end


---@param whichUnit unit
---@param scaleX real
---@param scaleY real
---@param scaleZ real
function SetUnitScale(whichUnit, scaleX, scaleY, scaleZ) end

---@param whichUnit unit
---@param timeScale real
function SetUnitTimeScale(whichUnit, timeScale) end

---@param whichUnit unit
---@param blendTime real
function SetUnitBlendTime(whichUnit, blendTime) end

---@param whichUnit unit
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetUnitVertexColor(whichUnit, red, green, blue, alpha) end


---@param whichUnit unit
---@param whichAnimation string
function QueueUnitAnimation(whichUnit, whichAnimation) end

---@param whichUnit unit
---@param whichAnimation string
function SetUnitAnimation(whichUnit, whichAnimation) end

---@param whichUnit unit
---@param whichAnimation integer
function SetUnitAnimationByIndex(whichUnit, whichAnimation) end

---@param whichUnit unit
---@param whichAnimation string
---@param rarity raritycontrol
function SetUnitAnimationWithRarity(whichUnit, whichAnimation, rarity) end

---@param whichUnit unit
---@param animProperties string
---@param add boolean
function AddUnitAnimationProperties(whichUnit, animProperties, add) end


---@param whichUnit unit
---@param whichBone string
---@param lookAtTarget unit
---@param offsetX real
---@param offsetY real
---@param offsetZ real
function SetUnitLookAt(whichUnit, whichBone, lookAtTarget, offsetX, offsetY, offsetZ) end

---@param whichUnit unit
function ResetUnitLookAt(whichUnit) end


---@param whichUnit unit
---@param byWhichPlayer player
---@param flag boolean
function SetUnitRescuable(whichUnit, byWhichPlayer, flag) end

---@param whichUnit unit
---@param range real
function SetUnitRescueRange(whichUnit, range) end


---@param whichHero unit
---@param newStr integer
---@param permanent boolean
function SetHeroStr(whichHero, newStr, permanent) end

---@param whichHero unit
---@param newAgi integer
---@param permanent boolean
function SetHeroAgi(whichHero, newAgi, permanent) end

---@param whichHero unit
---@param newInt integer
---@param permanent boolean
function SetHeroInt(whichHero, newInt, permanent) end


---@param whichHero unit
---@param includeBonuses boolean
---@return integer
function GetHeroStr(whichHero, includeBonuses) end

---@param whichHero unit
---@param includeBonuses boolean
---@return integer
function GetHeroAgi(whichHero, includeBonuses) end

---@param whichHero unit
---@param includeBonuses boolean
---@return integer
function GetHeroInt(whichHero, includeBonuses) end


---@param whichHero unit
---@param howManyLevels integer
---@return boolean
function UnitStripHeroLevel(whichHero, howManyLevels) end


---@param whichHero unit
---@return integer
function GetHeroXP(whichHero) end

---@param whichHero unit
---@param newXpVal integer
---@param showEyeCandy boolean
function SetHeroXP(whichHero, newXpVal,  showEyeCandy) end


---@param whichHero unit
---@return integer
function GetHeroSkillPoints(whichHero) end

---@param whichHero unit
---@param skillPointDelta integer
---@return boolean
function UnitModifySkillPoints(whichHero, skillPointDelta) end


---@param whichHero unit
---@param xpToAdd integer
---@param showEyeCandy boolean
function AddHeroXP(whichHero, xpToAdd,   showEyeCandy) end

---@param whichHero unit
---@param level integer
---@param showEyeCandy boolean
function SetHeroLevel(whichHero, level,  showEyeCandy) end

---@param whichHero unit
---@return integer
function GetHeroLevel(whichHero) end

---@param whichUnit unit
---@return integer
function GetUnitLevel(whichUnit) end

---@param whichHero unit
---@return string
function GetHeroProperName(whichHero) end

---@param whichHero unit
---@param flag boolean
function SuspendHeroXP(whichHero, flag) end

---@param whichHero unit
---@return boolean
function IsSuspendedXP(whichHero) end

---@param whichHero unit
---@param abilcode integer
function SelectHeroSkill(whichHero, abilcode) end

---@param whichUnit unit
---@param abilcode integer
---@return integer
function GetUnitAbilityLevel(whichUnit, abilcode) end

---@param whichUnit unit
---@param abilcode integer
---@return integer
function DecUnitAbilityLevel(whichUnit, abilcode) end

---@param whichUnit unit
---@param abilcode integer
---@return integer
function IncUnitAbilityLevel(whichUnit, abilcode) end

---@param whichUnit unit
---@param abilcode integer
---@param level integer
---@return integer
function SetUnitAbilityLevel(whichUnit, abilcode, level) end

---@param whichHero unit
---@param x real
---@param y real
---@param doEyecandy boolean
---@return boolean
function ReviveHero(whichHero, x, y, doEyecandy) end

---@param whichHero unit
---@param loc location
---@param doEyecandy boolean
---@return boolean
function ReviveHeroLoc(whichHero, loc, doEyecandy) end

---@param whichUnit unit
---@param exploded boolean
function SetUnitExploded(whichUnit, exploded) end

---@param whichUnit unit
---@param flag boolean
function SetUnitInvulnerable(whichUnit, flag) end

---@param whichUnit unit
---@param flag boolean
function PauseUnit(whichUnit, flag) end

---@param whichHero unit
---@return boolean
function IsUnitPaused(whichHero) end

---@param whichUnit unit
---@param flag boolean
function SetUnitPathing(whichUnit, flag) end


function ClearSelection() end

---@param whichUnit unit
---@param flag boolean
function SelectUnit(whichUnit, flag) end


---@param whichUnit unit
---@return integer
function GetUnitPointValue(whichUnit) end

---@param unitType integer
---@return integer
function GetUnitPointValueByType(unitType) end

--        SetUnitPointValueByType takes integer unitType, integer newPointValue returns nothing

---@param whichUnit unit
---@param whichItem item
---@return boolean
function UnitAddItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param itemId integer
---@return item
function UnitAddItemById(whichUnit, itemId) end

---@param whichUnit unit
---@param itemId integer
---@param itemSlot integer
---@return boolean
function UnitAddItemToSlotById(whichUnit, itemId, itemSlot) end

---@param whichUnit unit
---@param whichItem item
function UnitRemoveItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param itemSlot integer
---@return item
function UnitRemoveItemFromSlot(whichUnit, itemSlot) end

---@param whichUnit unit
---@param whichItem item
---@return boolean
function UnitHasItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param itemSlot integer
---@return item
function UnitItemInSlot(whichUnit, itemSlot) end

---@param whichUnit unit
---@return integer
function UnitInventorySize(whichUnit) end


---@param whichUnit unit
---@param whichItem item
---@param x real
---@param y real
---@return boolean
function UnitDropItemPoint(whichUnit, whichItem, x, y) end

---@param whichUnit unit
---@param whichItem item
---@param slot integer
---@return boolean
function UnitDropItemSlot(whichUnit, whichItem, slot) end

---@param whichUnit unit
---@param whichItem item
---@param target widget
---@return boolean
function UnitDropItemTarget(whichUnit, whichItem, target) end


---@param whichUnit unit
---@param whichItem item
---@return boolean
function UnitUseItem(whichUnit, whichItem) end

---@param whichUnit unit
---@param whichItem item
---@param x real
---@param y real
---@return boolean
function UnitUseItemPoint(whichUnit, whichItem, x, y) end

---@param whichUnit unit
---@param whichItem item
---@param target widget
---@return boolean
function UnitUseItemTarget(whichUnit, whichItem, target) end


---@param whichUnit unit
---@return real
function GetUnitX(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitY(whichUnit) end

---@param whichUnit unit
---@return location
function GetUnitLoc(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitFacing(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitMoveSpeed(whichUnit) end

---@param whichUnit unit
---@return real
function GetUnitDefaultMoveSpeed(whichUnit) end

---@param whichUnit unit
---@param whichUnitState unitstate
---@return real
function GetUnitState(whichUnit, whichUnitState) end

---@param whichUnit unit
---@return player
function GetOwningPlayer(whichUnit) end

---@param whichUnit unit
---@return integer
function GetUnitTypeId(whichUnit) end

---@param whichUnit unit
---@return race
function GetUnitRace(whichUnit) end

---@param whichUnit unit
---@return string
function GetUnitName(whichUnit) end

---@param whichUnit unit
---@return integer
function GetUnitFoodUsed(whichUnit) end

---@param whichUnit unit
---@return integer
function GetUnitFoodMade(whichUnit) end

---@param unitId integer
---@return integer
function GetFoodMade(unitId) end

---@param unitId integer
---@return integer
function GetFoodUsed(unitId) end

---@param whichUnit unit
---@param useFood boolean
function SetUnitUseFood(whichUnit, useFood) end


---@param whichUnit unit
---@return location
function GetUnitRallyPoint(whichUnit) end

---@param whichUnit unit
---@return unit
function GetUnitRallyUnit(whichUnit) end

---@param whichUnit unit
---@return destructable
function GetUnitRallyDestructable(whichUnit) end


---@param whichUnit unit
---@param whichGroup group
---@return boolean
function IsUnitInGroup(whichUnit, whichGroup) end

---@param whichUnit unit
---@param whichForce force
---@return boolean
function IsUnitInForce(whichUnit, whichForce) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitOwnedByPlayer(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitAlly(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitEnemy(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitVisible(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitDetected(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitInvisible(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitFogged(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitMasked(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichPlayer player
---@return boolean
function IsUnitSelected(whichUnit, whichPlayer) end

---@param whichUnit unit
---@param whichRace race
---@return boolean
function IsUnitRace(whichUnit, whichRace) end

---@param whichUnit unit
---@param whichUnitType unittype
---@return boolean
function IsUnitType(whichUnit, whichUnitType) end

---@param whichUnit unit
---@param whichSpecifiedUnit unit
---@return boolean
function IsUnit(whichUnit, whichSpecifiedUnit) end

---@param whichUnit unit
---@param otherUnit unit
---@param distance real
---@return boolean
function IsUnitInRange(whichUnit, otherUnit, distance) end

---@param whichUnit unit
---@param x real
---@param y real
---@param distance real
---@return boolean
function IsUnitInRangeXY(whichUnit, x, y, distance) end

---@param whichUnit unit
---@param whichLocation location
---@param distance real
---@return boolean
function IsUnitInRangeLoc(whichUnit, whichLocation, distance) end

---@param whichUnit unit
---@return boolean
function IsUnitHidden(whichUnit) end

---@param whichUnit unit
---@return boolean
function IsUnitIllusion(whichUnit) end


---@param whichUnit unit
---@param whichTransport unit
---@return boolean
function IsUnitInTransport(whichUnit, whichTransport) end

---@param whichUnit unit
---@return boolean
function IsUnitLoaded(whichUnit) end


---@param unitId integer
---@return boolean
function IsHeroUnitId(unitId) end

---@param unitId integer
---@param whichUnitType unittype
---@return boolean
function IsUnitIdType(unitId, whichUnitType) end


---@param whichUnit unit
---@param whichPlayer player
---@param share boolean
function UnitShareVision(whichUnit, whichPlayer, share) end

---@param whichUnit unit
---@param suspend boolean
function UnitSuspendDecay(whichUnit, suspend) end

---@param whichUnit unit
---@param whichUnitType unittype
---@return boolean
function UnitAddType(whichUnit, whichUnitType) end

---@param whichUnit unit
---@param whichUnitType unittype
---@return boolean
function UnitRemoveType(whichUnit, whichUnitType) end


---@param whichUnit unit
---@param abilityId integer
---@return boolean
function UnitAddAbility(whichUnit, abilityId) end

---@param whichUnit unit
---@param abilityId integer
---@return boolean
function UnitRemoveAbility(whichUnit, abilityId) end

---@param whichUnit unit
---@param permanent boolean
---@param abilityId integer
---@return boolean
function UnitMakeAbilityPermanent(whichUnit, permanent, abilityId) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
function UnitRemoveBuffs(whichUnit, removePositive, removeNegative) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
function UnitRemoveBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
---@return boolean
function UnitHasBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end

---@param whichUnit unit
---@param removePositive boolean
---@param removeNegative boolean
---@param magic boolean
---@param physical boolean
---@param timedLife boolean
---@param aura boolean
---@param autoDispel boolean
---@return integer
function UnitCountBuffsEx(whichUnit, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) end

---@param whichUnit unit
---@param add boolean
function UnitAddSleep(whichUnit, add) end

---@param whichUnit unit
---@return boolean
function UnitCanSleep(whichUnit) end

---@param whichUnit unit
---@param add boolean
function UnitAddSleepPerm(whichUnit, add) end

---@param whichUnit unit
---@return boolean
function UnitCanSleepPerm(whichUnit) end

---@param whichUnit unit
---@return boolean
function UnitIsSleeping(whichUnit) end

---@param whichUnit unit
function UnitWakeUp(whichUnit) end

---@param whichUnit unit
---@param buffId integer
---@param duration real
function UnitApplyTimedLife(whichUnit, buffId, duration) end

---@param whichUnit unit
---@param flag boolean
---@return boolean
function UnitIgnoreAlarm(whichUnit, flag) end

---@param whichUnit unit
---@return boolean
function UnitIgnoreAlarmToggled(whichUnit) end

---@param whichUnit unit
function UnitResetCooldown(whichUnit) end

---@param whichUnit unit
---@param constructionPercentage integer
function UnitSetConstructionProgress(whichUnit, constructionPercentage) end

---@param whichUnit unit
---@param upgradePercentage integer
function UnitSetUpgradeProgress(whichUnit, upgradePercentage) end

---@param whichUnit unit
---@param flag boolean
function UnitPauseTimedLife(whichUnit, flag) end

---@param whichUnit unit
---@param flag boolean
function UnitSetUsesAltIcon(whichUnit, flag) end


---@param whichUnit unit
---@param delay real
---@param radius real
---@param x real
---@param y real
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function UnitDamagePoint(whichUnit, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType) end

---@param whichUnit unit
---@param target widget
---@param amount real
---@param attack boolean
---@param ranged boolean
---@param attackType attacktype
---@param damageType damagetype
---@param weaponType weapontype
---@return boolean
function UnitDamageTarget(whichUnit, target, amount, attack, ranged, attackType, damageType, weaponType) end


---@param whichUnit unit
---@param order string
---@return boolean
function IssueImmediateOrder(whichUnit, order) end

---@param whichUnit unit
---@param order integer
---@return boolean
function IssueImmediateOrderById(whichUnit, order) end

---@param whichUnit unit
---@param order string
---@param x real
---@param y real
---@return boolean
function IssuePointOrder(whichUnit, order, x, y) end

---@param whichUnit unit
---@param order string
---@param whichLocation location
---@return boolean
function IssuePointOrderLoc(whichUnit, order, whichLocation) end

---@param whichUnit unit
---@param order integer
---@param x real
---@param y real
---@return boolean
function IssuePointOrderById(whichUnit, order, x, y) end

---@param whichUnit unit
---@param order integer
---@param whichLocation location
---@return boolean
function IssuePointOrderByIdLoc(whichUnit, order, whichLocation) end

---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@return boolean
function IssueTargetOrder(whichUnit, order, targetWidget) end

---@param whichUnit unit
---@param order integer
---@param targetWidget widget
---@return boolean
function IssueTargetOrderById(whichUnit, order, targetWidget) end

---@param whichUnit unit
---@param order string
---@param x real
---@param y real
---@param instantTargetWidget widget
---@return boolean
function IssueInstantPointOrder(whichUnit, order, x, y, instantTargetWidget) end

---@param whichUnit unit
---@param order integer
---@param x real
---@param y real
---@param instantTargetWidget widget
---@return boolean
function IssueInstantPointOrderById(whichUnit, order, x, y, instantTargetWidget) end

---@param whichUnit unit
---@param order string
---@param targetWidget widget
---@param instantTargetWidget widget
---@return boolean
function IssueInstantTargetOrder(whichUnit, order, targetWidget, instantTargetWidget) end

---@param whichUnit unit
---@param order integer
---@param targetWidget widget
---@param instantTargetWidget widget
---@return boolean
function IssueInstantTargetOrderById(whichUnit, order, targetWidget, instantTargetWidget) end

---@param whichPeon unit
---@param unitToBuild string
---@param x real
---@param y real
---@return boolean
function IssueBuildOrder(whichPeon, unitToBuild, x, y) end

---@param whichPeon unit
---@param unitId integer
---@param x real
---@param y real
---@return boolean
function IssueBuildOrderById(whichPeon, unitId, x, y) end


---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitToBuild string
---@return boolean
function IssueNeutralImmediateOrder(forWhichPlayer, neutralStructure, unitToBuild) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@return boolean
function IssueNeutralImmediateOrderById(forWhichPlayer,neutralStructure, unitId) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitToBuild string
---@param x real
---@param y real
---@return boolean
function IssueNeutralPointOrder(forWhichPlayer,neutralStructure, unitToBuild, x, y) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@param x real
---@param y real
---@return boolean
function IssueNeutralPointOrderById(forWhichPlayer,neutralStructure, unitId, x, y) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitToBuild string
---@param target widget
---@return boolean
function IssueNeutralTargetOrder(forWhichPlayer,neutralStructure, unitToBuild, target) end

---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@param target widget
---@return boolean
function IssueNeutralTargetOrderById(forWhichPlayer,neutralStructure, unitId, target) end


---@param whichUnit unit
---@return integer
function GetUnitCurrentOrder(whichUnit) end


---@param whichUnit unit
---@param amount integer
function SetResourceAmount(whichUnit, amount) end

---@param whichUnit unit
---@param amount integer
function AddResourceAmount(whichUnit, amount) end

---@param whichUnit unit
---@return integer
function GetResourceAmount(whichUnit) end


---@param waygate unit
---@return real
function WaygateGetDestinationX(waygate) end

---@param waygate unit
---@return real
function WaygateGetDestinationY(waygate) end

---@param waygate unit
---@param x real
---@param y real
function WaygateSetDestination(waygate, x, y) end

---@param waygate unit
---@param activate boolean
function WaygateActivate(waygate, activate) end

---@param waygate unit
---@return boolean
function WaygateIsActive(waygate) end


---@param itemId integer
---@param currentStock integer
---@param stockMax integer
function AddItemToAllStock(itemId, currentStock, stockMax) end

---@param whichUnit unit
---@param itemId integer
---@param currentStock integer
---@param stockMax integer
function AddItemToStock(whichUnit, itemId, currentStock, stockMax) end

---@param unitId integer
---@param currentStock integer
---@param stockMax integer
function AddUnitToAllStock(unitId, currentStock, stockMax) end

---@param whichUnit unit
---@param unitId integer
---@param currentStock integer
---@param stockMax integer
function AddUnitToStock(whichUnit, unitId, currentStock, stockMax) end


---@param itemId integer
function RemoveItemFromAllStock(itemId) end

---@param whichUnit unit
---@param itemId integer
function RemoveItemFromStock(whichUnit, itemId) end

---@param unitId integer
function RemoveUnitFromAllStock(unitId) end

---@param whichUnit unit
---@param unitId integer
function RemoveUnitFromStock(whichUnit, unitId) end


---@param slots integer
function SetAllItemTypeSlots(slots) end

---@param slots integer
function SetAllUnitTypeSlots(slots) end

---@param whichUnit unit
---@param slots integer
function SetItemTypeSlots(whichUnit, slots) end

---@param whichUnit unit
---@param slots integer
function SetUnitTypeSlots(whichUnit, slots) end


---@param whichUnit unit
---@return integer
function GetUnitUserData(whichUnit) end

---@param whichUnit unit
---@param data integer
function SetUnitUserData(whichUnit, data) end

---@param whichUnit unit
---@return integer
function BlzGetUnitMaxHP(whichUnit) end

---@param whichUnit unit
---@param hp integer
function BlzSetUnitMaxHP(whichUnit, hp) end

---@param whichUnit unit
---@return integer
function BlzGetUnitMaxMana(whichUnit) end

---@param whichUnit unit
---@param mana integer
function BlzSetUnitMaxMana(whichUnit, mana) end

---@param whichItem item
---@param name string
function BlzSetItemName(whichItem, name) end

---@param whichItem item
---@param description string
function BlzSetItemDescription(whichItem, description) end

---@param whichItem item
---@return string
function BlzGetItemDescription(whichItem) end

---@param whichItem item
---@param tooltip string
function BlzSetItemTooltip(whichItem, tooltip) end

---@param whichItem item
---@return string
function BlzGetItemTooltip(whichItem) end

---@param whichItem item
---@param extendedTooltip string
function BlzSetItemExtendedTooltip(whichItem, extendedTooltip) end

---@param whichItem item
---@return string
function BlzGetItemExtendedTooltip(whichItem) end

---@param whichItem item
---@param iconPath string
function BlzSetItemIconPath(whichItem, iconPath) end

---@param whichItem item
---@return string
function BlzGetItemIconPath(whichItem) end

---@param whichUnit unit
---@param name string
function BlzSetUnitName(whichUnit, name) end

---@param whichUnit unit
---@param heroProperName string
function BlzSetHeroProperName(whichUnit, heroProperName) end

---@param whichUnit unit
---@param weaponIndex integer
---@return integer
function BlzGetUnitBaseDamage(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param baseDamage integer
---@param weaponIndex integer
function BlzSetUnitBaseDamage(whichUnit, baseDamage, weaponIndex) end

---@param whichUnit unit
---@param weaponIndex integer
---@return integer
function BlzGetUnitDiceNumber(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param diceNumber integer
---@param weaponIndex integer
function BlzSetUnitDiceNumber(whichUnit, diceNumber, weaponIndex) end

---@param whichUnit unit
---@param weaponIndex integer
---@return integer
function BlzGetUnitDiceSides(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param diceSides integer
---@param weaponIndex integer
function BlzSetUnitDiceSides(whichUnit, diceSides, weaponIndex) end

---@param whichUnit unit
---@param weaponIndex integer
---@return real
function BlzGetUnitAttackCooldown(whichUnit, weaponIndex) end

---@param whichUnit unit
---@param cooldown real
---@param weaponIndex integer
function BlzSetUnitAttackCooldown(whichUnit, cooldown, weaponIndex) end

---@param whichUnit unit
---@return real
function BlzGetUnitArmor(whichUnit) end

---@param whichUnit unit
---@param armorAmount real
function BlzSetUnitArmor(whichUnit, armorAmount) end

---@param whichUnit unit
---@param abilId integer
---@param flag boolean
function BlzUnitHideAbility(whichUnit, abilId, flag) end

---@param whichUnit unit
---@param abilId integer
---@param flag boolean
---@param hideUI boolean
function BlzUnitDisableAbility(whichUnit, abilId, flag, hideUI) end

---@param whichUnit unit
function BlzUnitCancelTimedLife(whichUnit) end

---@param whichUnit unit
---@return boolean
function BlzIsUnitSelectable(whichUnit) end

---@param whichUnit unit
---@return boolean
function BlzIsUnitInvulnerable(whichUnit) end

---@param whichUnit unit
function BlzUnitInterruptAttack(whichUnit) end

---@param whichUnit unit
---@return real
function BlzGetUnitCollisionSize(whichUnit) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@param cooldown real
function BlzSetUnitAbilityCooldown(whichUnit, abilId, level, cooldown) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@return real
function BlzGetUnitAbilityCooldown(whichUnit, abilId, level) end

---@param whichUnit unit
---@param abilId integer
---@return real
function BlzGetUnitAbilityCooldownRemaining(whichUnit, abilId) end

---@param whichUnit unit
---@param abilCode integer
function BlzEndUnitAbilityCooldown(whichUnit, abilCode) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@return integer
function BlzGetUnitAbilityManaCost(whichUnit, abilId, level) end

---@param whichUnit unit
---@param abilId integer
---@param level integer
---@param manaCost integer
function BlzSetUnitAbilityManaCost(whichUnit, abilId, level, manaCost) end

---@param whichUnit unit
---@return real
function BlzGetLocalUnitZ(whichUnit) end

-- Add this function to follow the style of GetUnitX and GetUnitY, it has the same result as BlzGetLocalUnitZ
---@param whichUnit unit
---@return real
function BlzGetUnitZ(whichUnit) end

---@param whichUnit unit
---@param abilId integer
---@return ability
function BlzGetUnitAbility(whichUnit, abilId) end

---@param whichUnit unit
---@param index integer
---@return ability
function BlzGetUnitAbilityByIndex(whichUnit, index) end

---@param whichUnit unit
---@param flag boolean
function BlzPauseUnitEx(whichUnit, flag) end

-- Unit
---@param whichUnit unit
---@param whichField unitbooleanfield
---@return boolean
function BlzGetUnitBooleanField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitintegerfield
---@return integer
function BlzGetUnitIntegerField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitrealfield
---@return real
function BlzGetUnitRealField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitstringfield
---@return string
function BlzGetUnitStringField(whichUnit, whichField) end

---@param whichUnit unit
---@param whichField unitbooleanfield
---@param value boolean
---@return boolean
function BlzSetUnitBooleanField(whichUnit, whichField, value) end

---@param whichUnit unit
---@param whichField unitintegerfield
---@param value integer
---@return boolean
function BlzSetUnitIntegerField(whichUnit, whichField, value) end

---@param whichUnit unit
---@param whichField unitrealfield
---@param value real
---@return boolean
function BlzSetUnitRealField(whichUnit, whichField, value) end

---@param whichUnit unit
---@param whichField unitstringfield
---@param value string
---@return boolean
function BlzSetUnitStringField(whichUnit, whichField, value) end


-- Unit Weapon
---@param whichUnit unit
---@param whichField unitweaponbooleanfield
---@param index integer
---@return boolean
function BlzGetUnitWeaponBooleanField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponintegerfield
---@param index integer
---@return integer
function BlzGetUnitWeaponIntegerField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponrealfield
---@param index integer
---@return real
function BlzGetUnitWeaponRealField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponstringfield
---@param index integer
---@return string
function BlzGetUnitWeaponStringField(whichUnit, whichField, index) end

---@param whichUnit unit
---@param whichField unitweaponbooleanfield
---@param index integer
---@param value boolean
---@return boolean
function BlzSetUnitWeaponBooleanField(whichUnit, whichField, index, value) end

---@param whichUnit unit
---@param whichField unitweaponintegerfield
---@param index integer
---@param value integer
---@return boolean
function BlzSetUnitWeaponIntegerField(whichUnit, whichField, index, value) end

---@param whichUnit unit
---@param whichField unitweaponrealfield
---@param index integer
---@param value real
---@return boolean
function BlzSetUnitWeaponRealField(whichUnit, whichField, index, value) end

---@param whichUnit unit
---@param whichField unitweaponstringfield
---@param index integer
---@param value string
---@return boolean
function BlzSetUnitWeaponStringField(whichUnit, whichField, index, value) end