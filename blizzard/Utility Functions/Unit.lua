--***************************************************************************
--*
--*  Unit Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param unitId integer
---@return integer
function UnitId2OrderIdBJ(unitId)
	return unitId
end

--===========================================================================
---@param unitIdString string
---@return integer
function String2UnitIdBJ(unitIdString)
	return UnitId(unitIdString)
end

--===========================================================================
---@param unitId integer
---@return string
function UnitId2StringBJ(unitId)
	---@type string
	unitString = UnitId2String(unitId)
	
	if (unitString ~= nil) then
		return unitString
	end
	
	-- The unitId was not recognized - return an empty string.
	return ""
end

--===========================================================================
---@param orderIdString string
---@return integer
function String2OrderIdBJ(orderIdString)
	---@type integer
	orderId = nil
	
	-- Check to see if it's a generic order.
	orderId = OrderId(orderIdString)
	if (orderId ~= 0) then
		return orderId
	end
	
	-- Check to see if it's a (train) unit order.
	orderId = UnitId(orderIdString)
	if (orderId ~= 0) then
		return orderId
	end
	
	-- Unrecognized - return 0
	return 0
end

--===========================================================================
---@param orderId integer
---@return string
function OrderId2StringBJ(orderId)
	---@type string
	orderString = nil
	
	-- Check to see if it's a generic order.
	orderString = OrderId2String(orderId)
	if (orderString ~= nil) then
		return orderString
	end
	
	-- Check to see if it's a (train) unit order.
	orderString = UnitId2String(orderId)
	if (orderString ~= nil) then
		return orderString
	end
	
	-- Unrecognized - return an empty string.
	return ""
end

--===========================================================================
---@return integer
function GetIssuedOrderIdBJ()
	return GetIssuedOrderId()
end

--===========================================================================
---@return unit
function GetKillingUnitBJ()
	return GetKillingUnit()
end

--===========================================================================
---@param id player
---@param unitid integer
---@param loc location
---@param face real
---@return unit
function CreateUnitAtLocSaveLast(id, unitid, loc, face)
	if (unitid == FourCC('ugol')) then
		bj_lastCreatedUnit = CreateBlightedGoldmine(id, GetLocationX(loc), GetLocationY(loc), face)
	else
		bj_lastCreatedUnit = CreateUnitAtLoc(id, unitid, loc, face)
	end
	
	return bj_lastCreatedUnit
end

--===========================================================================
---@return unit
function GetLastCreatedUnit()
	return bj_lastCreatedUnit
end

--===========================================================================
---@param count integer
---@param unitId integer
---@param whichPlayer player
---@param loc location
---@param face real
---@return group
function CreateNUnitsAtLoc(count, unitId, whichPlayer, loc, face)
	GroupClear(bj_lastCreatedGroup)
	while true do
		count = count - 1
		if count < 0 then break end
		CreateUnitAtLocSaveLast(whichPlayer, unitId, loc, face)
		GroupAddUnit(bj_lastCreatedGroup, bj_lastCreatedUnit)
	end
	return bj_lastCreatedGroup
end

--===========================================================================
---@param count integer
---@param unitId integer
---@param whichPlayer player
---@param loc location
---@param lookAt location
---@return group
function CreateNUnitsAtLocFacingLocBJ(count, unitId, whichPlayer, loc, lookAt)
	return CreateNUnitsAtLoc(count, unitId, whichPlayer, loc, AngleBetweenPoints(loc, lookAt))
end

--===========================================================================
function GetLastCreatedGroupEnum()
	GroupAddUnit(bj_groupLastCreatedDest, GetEnumUnit())
end

--===========================================================================
---@return group
function GetLastCreatedGroup()
	bj_groupLastCreatedDest = CreateGroup()
	ForGroup(bj_lastCreatedGroup, GetLastCreatedGroupEnum)
	return bj_groupLastCreatedDest
end

--===========================================================================
---@param unitid integer
---@param whichPlayer player
---@param loc location
---@return unit
function CreateCorpseLocBJ(unitid, whichPlayer, loc)
	bj_lastCreatedUnit = CreateCorpse(whichPlayer, unitid, GetLocationX(loc), GetLocationY(loc), GetRandomReal(0, 360))
	return bj_lastCreatedUnit
end

--===========================================================================
---@param suspend boolean
---@param whichUnit unit
function UnitSuspendDecayBJ(suspend, whichUnit)
	UnitSuspendDecay(whichUnit, suspend)
end

--===========================================================================
function DelayedSuspendDecayStopAnimEnum()
	---@type unit
	enumUnit = GetEnumUnit()
	
	if (GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0) then
		SetUnitTimeScale(enumUnit, 0.0001)
	end
end

--===========================================================================
function DelayedSuspendDecayBoneEnum()
	---@type unit
	enumUnit = GetEnumUnit()
	
	if (GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0) then
		UnitSuspendDecay(enumUnit, true)
		SetUnitTimeScale(enumUnit, 0.0001)
	end
end

--===========================================================================
-- Game code explicitly sets the animation back to "decay bone" after the
-- initial corpse fades away, so we reset it now.  It's best not to show
-- off corpses thus created until after this grace period has passed.
--
function DelayedSuspendDecayFleshEnum()
	---@type unit
	enumUnit = GetEnumUnit()
	
	if (GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0) then
		UnitSuspendDecay(enumUnit, true)
		SetUnitTimeScale(enumUnit, 10.0)
		SetUnitAnimation(enumUnit, "decay flesh")
	end
end

--===========================================================================
-- Waits a short period of time to ensure that the corpse is decaying, and
-- then suspend the animation and corpse decay.
--
function DelayedSuspendDecay()
	---@type group
	boneGroup                 = nil
	---@type group
	fleshGroup                = nil
	
	-- Switch the global unit groups over to local variables and recreate
	-- the global versions, so that this function can handle overlapping
	-- calls.
	boneGroup                 = bj_suspendDecayBoneGroup
	fleshGroup                = bj_suspendDecayFleshGroup
	bj_suspendDecayBoneGroup  = CreateGroup()
	bj_suspendDecayFleshGroup = CreateGroup()
	
	ForGroup(fleshGroup, DelayedSuspendDecayStopAnimEnum)
	ForGroup(boneGroup, DelayedSuspendDecayStopAnimEnum)
	
	TriggerSleepAction(bj_CORPSE_MAX_DEATH_TIME)
	ForGroup(fleshGroup, DelayedSuspendDecayFleshEnum)
	ForGroup(boneGroup, DelayedSuspendDecayBoneEnum)
	
	TriggerSleepAction(0.05)
	ForGroup(fleshGroup, DelayedSuspendDecayStopAnimEnum)
	
	DestroyGroup(boneGroup)
	DestroyGroup(fleshGroup)
end

--===========================================================================
function DelayedSuspendDecayCreate()
	bj_delayedSuspendDecayTrig = CreateTrigger()
	TriggerRegisterTimerExpireEvent(bj_delayedSuspendDecayTrig, bj_delayedSuspendDecayTimer)
	TriggerAddAction(bj_delayedSuspendDecayTrig, DelayedSuspendDecay)
end

--===========================================================================
---@param style integer
---@param unitid integer
---@param whichPlayer player
---@param loc location
---@param facing real
---@return unit
function CreatePermanentCorpseLocBJ(style, unitid, whichPlayer, loc, facing)
	bj_lastCreatedUnit = CreateCorpse(whichPlayer, unitid, GetLocationX(loc), GetLocationY(loc), facing)
	SetUnitBlendTime(bj_lastCreatedUnit, 0)
	
	if (style == bj_CORPSETYPE_FLESH) then
		SetUnitAnimation(bj_lastCreatedUnit, "decay flesh")
		GroupAddUnit(bj_suspendDecayFleshGroup, bj_lastCreatedUnit)
	elseif (style == bj_CORPSETYPE_BONE) then
		SetUnitAnimation(bj_lastCreatedUnit, "decay bone")
		GroupAddUnit(bj_suspendDecayBoneGroup, bj_lastCreatedUnit)
	else
		-- Unknown decay style - treat as skeletal.
		SetUnitAnimation(bj_lastCreatedUnit, "decay bone")
		GroupAddUnit(bj_suspendDecayBoneGroup, bj_lastCreatedUnit)
	end
	
	TimerStart(bj_delayedSuspendDecayTimer, 0.05, false, nil)
	return bj_lastCreatedUnit
end

--===========================================================================
---@param whichState unitstate
---@param whichUnit unit
---@return real
function GetUnitStateSwap(whichState, whichUnit)
	return GetUnitState(whichUnit, whichState)
end

--===========================================================================
---@param whichUnit unit
---@param whichState unitstate
---@param whichMaxState unitstate
---@return real
function GetUnitStatePercent(whichUnit, whichState, whichMaxState)
	---@type real
	value    = GetUnitState(whichUnit, whichState)
	---@type real
	maxValue = GetUnitState(whichUnit, whichMaxState)
	
	-- Return 0 for nil units.
	if (whichUnit == nil) or (maxValue == 0) then
		return 0.0
	end
	
	return value / maxValue * 100.0
end

--===========================================================================
---@param whichUnit unit
---@return real
function GetUnitLifePercent(whichUnit)
	return GetUnitStatePercent(whichUnit, UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE)
end

--===========================================================================
---@param whichUnit unit
---@return real
function GetUnitManaPercent(whichUnit)
	return GetUnitStatePercent(whichUnit, UNIT_STATE_MANA, UNIT_STATE_MAX_MANA)
end

--===========================================================================
---@param whichUnit unit
function SelectUnitSingle(whichUnit)
	ClearSelection()
	SelectUnit(whichUnit, true)
end

--===========================================================================
function SelectGroupBJEnum()
	SelectUnit(GetEnumUnit(), true)
end

--===========================================================================
---@param g group
function SelectGroupBJ(g)
	ClearSelection()
	ForGroup(g, SelectGroupBJEnum)
end

--===========================================================================
---@param whichUnit unit
function SelectUnitAdd(whichUnit)
	SelectUnit(whichUnit, true)
end

--===========================================================================
---@param whichUnit unit
function SelectUnitRemove(whichUnit)
	SelectUnit(whichUnit, false)
end

--===========================================================================
---@param whichPlayer player
function ClearSelectionForPlayer(whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearSelection()
	end
end

--===========================================================================
---@param whichUnit unit
---@param whichPlayer player
function SelectUnitForPlayerSingle(whichUnit, whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearSelection()
		SelectUnit(whichUnit, true)
	end
end

--===========================================================================
---@param g group
---@param whichPlayer player
function SelectGroupForPlayerBJ(g, whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearSelection()
		ForGroup(g, SelectGroupBJEnum)
	end
end

--===========================================================================
---@param whichUnit unit
---@param whichPlayer player
function SelectUnitAddForPlayer(whichUnit, whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SelectUnit(whichUnit, true)
	end
end

--===========================================================================
---@param whichUnit unit
---@param whichPlayer player
function SelectUnitRemoveForPlayer(whichUnit, whichPlayer)
	if (GetLocalPlayer() == whichPlayer) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SelectUnit(whichUnit, false)
	end
end

--===========================================================================
---@param whichUnit unit
---@param newValue real
function SetUnitLifeBJ(whichUnit, newValue)
	SetUnitState(whichUnit, UNIT_STATE_LIFE, RMaxBJ(0, newValue))
end

--===========================================================================
---@param whichUnit unit
---@param newValue real
function SetUnitManaBJ(whichUnit, newValue)
	SetUnitState(whichUnit, UNIT_STATE_MANA, RMaxBJ(0, newValue))
end

--===========================================================================
---@param whichUnit unit
---@param percent real
function SetUnitLifePercentBJ(whichUnit, percent)
	SetUnitState(whichUnit, UNIT_STATE_LIFE, GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) * RMaxBJ(0, percent) * 0.01)
end

--===========================================================================
---@param whichUnit unit
---@param percent real
function SetUnitManaPercentBJ(whichUnit, percent)
	SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MAX_MANA) * RMaxBJ(0, percent) * 0.01)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function IsUnitDeadBJ(whichUnit)
	return GetUnitState(whichUnit, UNIT_STATE_LIFE) <= 0
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function IsUnitAliveBJ(whichUnit)
	return not IsUnitDeadBJ(whichUnit)
end

--===========================================================================
function IsUnitGroupDeadBJEnum()
	if not IsUnitDeadBJ(GetEnumUnit()) then
		bj_isUnitGroupDeadResult = false
	end
end

--===========================================================================
-- Returns true if every unit of the group is dead.
--
---@param g group
---@return boolean
function IsUnitGroupDeadBJ(g)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy              = bj_wantDestroyGroup
	bj_wantDestroyGroup      = false
	
	bj_isUnitGroupDeadResult = true
	ForGroup(g, IsUnitGroupDeadBJEnum)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(g)
	end
	return bj_isUnitGroupDeadResult
end

--===========================================================================
function IsUnitGroupEmptyBJEnum()
	bj_isUnitGroupEmptyResult = false
end

--===========================================================================
-- Returns true if the group contains no units.
--
---@param g group
---@return boolean
function IsUnitGroupEmptyBJ(g)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	---@type boolean
	wantDestroy               = bj_wantDestroyGroup
	bj_wantDestroyGroup       = false
	
	bj_isUnitGroupEmptyResult = true
	ForGroup(g, IsUnitGroupEmptyBJEnum)
	
	-- If the user wants the group destroyed, do so now.
	if (wantDestroy) then
		DestroyGroup(g)
	end
	return bj_isUnitGroupEmptyResult
end

--===========================================================================
function IsUnitGroupInRectBJEnum()
	if not RectContainsUnit(bj_isUnitGroupInRectRect, GetEnumUnit()) then
		bj_isUnitGroupInRectResult = false
	end
end

--===========================================================================
-- Returns true if every unit of the group is within the given rect.
--
---@param g group
---@param r rect
---@return boolean
function IsUnitGroupInRectBJ(g, r)
	bj_isUnitGroupInRectResult = true
	bj_isUnitGroupInRectRect   = r
	ForGroup(g, IsUnitGroupInRectBJEnum)
	return bj_isUnitGroupInRectResult
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function IsUnitHiddenBJ(whichUnit)
	return IsUnitHidden(whichUnit)
end

--===========================================================================
---@param whichUnit unit
function ShowUnitHide(whichUnit)
	ShowUnit(whichUnit, false)
end

--===========================================================================
---@param whichUnit unit
function ShowUnitShow(whichUnit)
	-- Prevent dead heroes from being unhidden.
	if (IsUnitType(whichUnit, UNIT_TYPE_HERO) and IsUnitDeadBJ(whichUnit)) then
		return
	end
	
	ShowUnit(whichUnit, true)
end

--===========================================================================
---@return boolean
function IssueHauntOrderAtLocBJFilter()
	return GetUnitTypeId(GetFilterUnit()) == FourCC('ngol')
end

--===========================================================================
---@param whichPeon unit
---@param loc location
---@return boolean
function IssueHauntOrderAtLocBJ(whichPeon, loc)
	---@type group
	g        = nil
	---@type unit
	goldMine = nil
	
	-- Search for a gold mine within a 1-cell radius of the specified location.
	g        = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(g, loc, 2 * bj_CELLWIDTH, filterIssueHauntOrderAtLocBJ)
	goldMine = FirstOfGroup(g)
	DestroyGroup(g)
	
	-- If no mine was found, abort the request.
	if (goldMine == nil) then
		return false
	end
	
	-- Issue the Haunt Gold Mine order.
	return IssueTargetOrderById(whichPeon, FourCC('ugol'), goldMine)
end

--===========================================================================
---@param whichPeon unit
---@param unitId integer
---@param loc location
---@return boolean
function IssueBuildOrderByIdLocBJ(whichPeon, unitId, loc)
	if (unitId == FourCC('ugol')) then
		return IssueHauntOrderAtLocBJ(whichPeon, loc)
	else
		return IssueBuildOrderById(whichPeon, unitId, GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
---@param whichUnit unit
---@param unitId integer
---@return boolean
function IssueTrainOrderByIdBJ(whichUnit, unitId)
	return IssueImmediateOrderById(whichUnit, unitId)
end

--===========================================================================
---@param g group
---@param unitId integer
---@return boolean
function GroupTrainOrderByIdBJ(g, unitId)
	return GroupImmediateOrderById(g, unitId)
end

--===========================================================================
---@param whichUnit unit
---@param techId integer
---@return boolean
function IssueUpgradeOrderByIdBJ(whichUnit, techId)
	return IssueImmediateOrderById(whichUnit, techId)
end

--===========================================================================
---@return unit
function GetAttackedUnitBJ()
	return GetTriggerUnit()
end

--===========================================================================
---@param whichUnit unit
---@param newHeight real
---@param rate real
function SetUnitFlyHeightBJ(whichUnit, newHeight, rate)
	SetUnitFlyHeight(whichUnit, newHeight, rate)
end

--===========================================================================
---@param whichUnit unit
---@param turnSpeed real
function SetUnitTurnSpeedBJ(whichUnit, turnSpeed)
	SetUnitTurnSpeed(whichUnit, turnSpeed)
end

--===========================================================================
---@param whichUnit unit
---@param propWindow real
function SetUnitPropWindowBJ(whichUnit, propWindow)
	---@type real
	angle = propWindow
	if (angle <= 0) then
		angle = 1
	elseif (angle >= 360) then
		angle = 359
	end
	angle = angle * bj_DEGTORAD
	
	SetUnitPropWindow(whichUnit, angle)
end

--===========================================================================
---@param whichUnit unit
---@return real
function GetUnitPropWindowBJ(whichUnit)
	return GetUnitPropWindow(whichUnit) * bj_RADTODEG
end

--===========================================================================
---@param whichUnit unit
---@return real
function GetUnitDefaultPropWindowBJ(whichUnit)
	return GetUnitDefaultPropWindow(whichUnit)
end

--===========================================================================
---@param whichUnit unit
---@param blendTime real
function SetUnitBlendTimeBJ(whichUnit, blendTime)
	SetUnitBlendTime(whichUnit, blendTime)
end

--===========================================================================
---@param whichUnit unit
---@param acquireRange real
function SetUnitAcquireRangeBJ(whichUnit, acquireRange)
	SetUnitAcquireRange(whichUnit, acquireRange)
end

--===========================================================================
---@param whichUnit unit
---@param canSleep boolean
function UnitSetCanSleepBJ(whichUnit, canSleep)
	UnitAddSleep(whichUnit, canSleep)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function UnitCanSleepBJ(whichUnit)
	return UnitCanSleep(whichUnit)
end

--===========================================================================
---@param whichUnit unit
function UnitWakeUpBJ(whichUnit)
	UnitWakeUp(whichUnit)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function UnitIsSleepingBJ(whichUnit)
	return UnitIsSleeping(whichUnit)
end

--===========================================================================
function WakePlayerUnitsEnum()
	UnitWakeUp(GetEnumUnit())
end

--===========================================================================
---@param whichPlayer player
function WakePlayerUnits(whichPlayer)
	---@type group
	g = CreateGroup()
	GroupEnumUnitsOfPlayer(g, whichPlayer, nil)
	ForGroup(g, WakePlayerUnitsEnum)
	DestroyGroup(g)
end

--===========================================================================
---@param enable boolean
function EnableCreepSleepBJ(enable)
	SetPlayerState(Player(PLAYER_NEUTRAL_AGGRESSIVE), PLAYER_STATE_NO_CREEP_SLEEP, IntegerTertiaryOp(enable, 0, 1))
	
	-- If we're disabling, attempt to wake any already-sleeping creeps.
	if (not enable) then
		WakePlayerUnits(Player(PLAYER_NEUTRAL_AGGRESSIVE))
	end
end

--===========================================================================
---@param whichUnit unit
---@param generate boolean
---@return boolean
function UnitGenerateAlarms(whichUnit, generate)
	return UnitIgnoreAlarm(whichUnit, not generate)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function DoesUnitGenerateAlarms(whichUnit)
	return not UnitIgnoreAlarmToggled(whichUnit)
end

--===========================================================================
function PauseAllUnitsBJEnum()
	PauseUnit(GetEnumUnit(), bj_pauseAllUnitsFlag)
end

--===========================================================================
-- Pause all units
---@param pause boolean
function PauseAllUnitsBJ(pause)
	---@type integer
	index                = nil
	---@type player
	indexPlayer          = nil
	---@type group
	g                    = nil
	
	bj_pauseAllUnitsFlag = pause
	g                    = CreateGroup()
	index                = 0
	while true do
		indexPlayer = Player(index)
		
		-- If this is a computer slot, pause/resume the AI.
		if (GetPlayerController(indexPlayer) == MAP_CONTROL_COMPUTER) then
			PauseCompAI(indexPlayer, pause)
		end
		
		-- Enumerate and unpause every unit owned by the player.
		GroupEnumUnitsOfPlayer(g, indexPlayer, nil)
		ForGroup(g, PauseAllUnitsBJEnum)
		GroupClear(g)
		
		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
	DestroyGroup(g)
end

--===========================================================================
---@param pause boolean
---@param whichUnit unit
function PauseUnitBJ(pause, whichUnit)
	PauseUnit(whichUnit, pause)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function IsUnitPausedBJ(whichUnit)
	return IsUnitPaused(whichUnit)
end

--===========================================================================
---@param flag boolean
---@param whichUnit unit
function UnitPauseTimedLifeBJ(flag, whichUnit)
	UnitPauseTimedLife(whichUnit, flag)
end

--===========================================================================
---@param duration real
---@param buffId integer
---@param whichUnit unit
function UnitApplyTimedLifeBJ(duration, buffId, whichUnit)
	UnitApplyTimedLife(whichUnit, buffId, duration)
end

--===========================================================================
---@param share boolean
---@param whichUnit unit
---@param whichPlayer player
function UnitShareVisionBJ(share, whichUnit, whichPlayer)
	UnitShareVision(whichUnit, whichPlayer, share)
end

--===========================================================================
---@param buffType integer
---@param whichUnit unit
function UnitRemoveBuffsBJ(buffType, whichUnit)
	if (buffType == bj_REMOVEBUFFS_POSITIVE) then
		UnitRemoveBuffs(whichUnit, true, false)
	elseif (buffType == bj_REMOVEBUFFS_NEGATIVE) then
		UnitRemoveBuffs(whichUnit, false, true)
	elseif (buffType == bj_REMOVEBUFFS_ALL) then
		UnitRemoveBuffs(whichUnit, true, true)
	elseif (buffType == bj_REMOVEBUFFS_NONTLIFE) then
		UnitRemoveBuffsEx(whichUnit, true, true, false, false, false, true, false)
	else
		-- Unrecognized dispel type - ignore the request.
	end
end

--===========================================================================
---@param polarity integer
---@param resist integer
---@param whichUnit unit
---@param bTLife boolean
---@param bAura boolean
function UnitRemoveBuffsExBJ(polarity, resist, whichUnit, bTLife, bAura)
	---@type boolean
	bPos   = (polarity == bj_BUFF_POLARITY_EITHER) or (polarity == bj_BUFF_POLARITY_POSITIVE)
	---@type boolean
	bNeg   = (polarity == bj_BUFF_POLARITY_EITHER) or (polarity == bj_BUFF_POLARITY_NEGATIVE)
	---@type boolean
	bMagic = (resist == bj_BUFF_RESIST_BOTH) or (resist == bj_BUFF_RESIST_MAGIC)
	---@type boolean
	bPhys  = (resist == bj_BUFF_RESIST_BOTH) or (resist == bj_BUFF_RESIST_PHYSICAL)
	
	UnitRemoveBuffsEx(whichUnit, bPos, bNeg, bMagic, bPhys, bTLife, bAura, false)
end

--===========================================================================
---@param polarity integer
---@param resist integer
---@param whichUnit unit
---@param bTLife boolean
---@param bAura boolean
---@return integer
function UnitCountBuffsExBJ(polarity, resist, whichUnit, bTLife, bAura)
	---@type boolean
	bPos   = (polarity == bj_BUFF_POLARITY_EITHER) or (polarity == bj_BUFF_POLARITY_POSITIVE)
	---@type boolean
	bNeg   = (polarity == bj_BUFF_POLARITY_EITHER) or (polarity == bj_BUFF_POLARITY_NEGATIVE)
	---@type boolean
	bMagic = (resist == bj_BUFF_RESIST_BOTH) or (resist == bj_BUFF_RESIST_MAGIC)
	---@type boolean
	bPhys  = (resist == bj_BUFF_RESIST_BOTH) or (resist == bj_BUFF_RESIST_PHYSICAL)
	
	return UnitCountBuffsEx(whichUnit, bPos, bNeg, bMagic, bPhys, bTLife, bAura, false)
end

--===========================================================================
---@param abilityId integer
---@param whichUnit unit
---@return boolean
function UnitRemoveAbilityBJ(abilityId, whichUnit)
	return UnitRemoveAbility(whichUnit, abilityId)
end

--===========================================================================
---@param abilityId integer
---@param whichUnit unit
---@return boolean
function UnitAddAbilityBJ(abilityId, whichUnit)
	return UnitAddAbility(whichUnit, abilityId)
end

--===========================================================================
---@param whichType unittype
---@param whichUnit unit
---@return boolean
function UnitRemoveTypeBJ(whichType, whichUnit)
	return UnitRemoveType(whichUnit, whichType)
end

--===========================================================================
---@param whichType unittype
---@param whichUnit unit
---@return boolean
function UnitAddTypeBJ(whichType, whichUnit)
	return UnitAddType(whichUnit, whichType)
end

--===========================================================================
---@param permanent boolean
---@param abilityId integer
---@param whichUnit unit
---@return boolean
function UnitMakeAbilityPermanentBJ(permanent, abilityId, whichUnit)
	return UnitMakeAbilityPermanent(whichUnit, permanent, abilityId)
end

--===========================================================================
---@param whichUnit unit
---@param exploded boolean
function SetUnitExplodedBJ(whichUnit, exploded)
	SetUnitExploded(whichUnit, exploded)
end

--===========================================================================
---@param whichUnit unit
function ExplodeUnitBJ(whichUnit)
	SetUnitExploded(whichUnit, true)
	KillUnit(whichUnit)
end

--===========================================================================
---@return unit
function GetTransportUnitBJ()
	return GetTransportUnit()
end

--===========================================================================
---@return unit
function GetLoadedUnitBJ()
	return GetLoadedUnit()
end

--===========================================================================
---@param whichUnit unit
---@param whichTransport unit
---@return boolean
function IsUnitInTransportBJ(whichUnit, whichTransport)
	return IsUnitInTransport(whichUnit, whichTransport)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function IsUnitLoadedBJ(whichUnit)
	return IsUnitLoaded(whichUnit)
end

--===========================================================================
---@param whichUnit unit
---@return boolean
function IsUnitIllusionBJ(whichUnit)
	return IsUnitIllusion(whichUnit)
end

--===========================================================================
-- This attempts to replace a unit with a new unit type by creating a new
-- unit of the desired type using the old unit's location, facing, etc.
--
---@param whichUnit unit
---@param newUnitId integer
---@param unitStateMethod integer
---@return unit
function ReplaceUnitBJ(whichUnit, newUnitId, unitStateMethod)
	---@type unit
	oldUnit   = whichUnit
	---@type unit
	newUnit   = nil
	---@type boolean
	wasHidden = nil
	---@type integer
	index     = nil
	---@type item
	indexItem = nil
	---@type real
	oldRatio  = nil
	
	-- If we have bogus data, don't attempt the replace.
	if (oldUnit == nil) then
		bj_lastReplacedUnit = oldUnit
		return oldUnit
	end
	
	-- Hide the original unit.
	wasHidden = IsUnitHidden(oldUnit)
	ShowUnit(oldUnit, false)
	
	-- Create the replacement unit.
	if (newUnitId == FourCC('ugol')) then
		newUnit = CreateBlightedGoldmine(GetOwningPlayer(oldUnit), GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
	else
		newUnit = CreateUnit(GetOwningPlayer(oldUnit), newUnitId, GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
	end
	
	-- Set the unit's life and mana according to the requested method.
	if (unitStateMethod == bj_UNIT_STATE_METHOD_RELATIVE) then
		-- Set the replacement's current/max life ratio to that of the old unit.
		-- If both units have mana, do the same for mana.
		if (GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE) > 0) then
			oldRatio = GetUnitState(oldUnit, UNIT_STATE_LIFE) / GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE)
			SetUnitState(newUnit, UNIT_STATE_LIFE, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
		end
		
		if (GetUnitState(oldUnit, UNIT_STATE_MAX_MANA) > 0) and (GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0) then
			oldRatio = GetUnitState(oldUnit, UNIT_STATE_MANA) / GetUnitState(oldUnit, UNIT_STATE_MAX_MANA)
			SetUnitState(newUnit, UNIT_STATE_MANA, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
		end
	elseif (unitStateMethod == bj_UNIT_STATE_METHOD_ABSOLUTE) then
		-- Set the replacement's current life to that of the old unit.
		-- If the new unit has mana, do the same for mana.
		SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(oldUnit, UNIT_STATE_LIFE))
		if (GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0) then
			SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(oldUnit, UNIT_STATE_MANA))
		end
	elseif (unitStateMethod == bj_UNIT_STATE_METHOD_DEFAULTS) then
		-- The newly created unit should already have default life and mana.
	elseif (unitStateMethod == bj_UNIT_STATE_METHOD_MAXIMUM) then
		-- Use max life and mana.
		SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
		SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
	else
		-- Unrecognized unit state method - ignore the request.
	end
	
	-- Mirror properties of the old unit onto the new unit.
	--call PauseUnit(newUnit, IsUnitPaused(oldUnit))
	SetResourceAmount(newUnit, GetResourceAmount(oldUnit))
	
	-- If both the old and new units are heroes, handle their hero info.
	if (IsUnitType(oldUnit, UNIT_TYPE_HERO) and IsUnitType(newUnit, UNIT_TYPE_HERO)) then
		SetHeroXP(newUnit, GetHeroXP(oldUnit), false)
		
		index = 0
		while true do
			indexItem = UnitItemInSlot(oldUnit, index)
			if (indexItem ~= nil) then
				UnitRemoveItem(oldUnit, indexItem)
				UnitAddItem(newUnit, indexItem)
			end
			
			index = index + 1
			if index >= bj_MAX_INVENTORY then break end
		end
	end
	
	-- Remove or kill the original unit.  It is sometimes unsafe to remove
	-- hidden units, so kill the original unit if it was previously hidden.
	if wasHidden then
		KillUnit(oldUnit)
		RemoveUnit(oldUnit)
	else
		RemoveUnit(oldUnit)
	end
	
	bj_lastReplacedUnit = newUnit
	return newUnit
end

--===========================================================================
---@return unit
function GetLastReplacedUnitBJ()
	return bj_lastReplacedUnit
end

--===========================================================================
---@param whichUnit unit
---@param loc location
---@param facing real
function SetUnitPositionLocFacingBJ(whichUnit, loc, facing)
	SetUnitPositionLoc(whichUnit, loc)
	SetUnitFacing(whichUnit, facing)
end

--===========================================================================
---@param whichUnit unit
---@param loc location
---@param lookAt location
function SetUnitPositionLocFacingLocBJ(whichUnit, loc, lookAt)
	SetUnitPositionLoc(whichUnit, loc)
	SetUnitFacing(whichUnit, AngleBetweenPoints(loc, lookAt))
end

--===========================================================================
---@param itemId integer
---@param whichUnit unit
---@param currentStock integer
---@param stockMax integer
function AddItemToStockBJ(itemId, whichUnit, currentStock, stockMax)
	AddItemToStock(whichUnit, itemId, currentStock, stockMax)
end

--===========================================================================
---@param unitId integer
---@param whichUnit unit
---@param currentStock integer
---@param stockMax integer
function AddUnitToStockBJ(unitId, whichUnit, currentStock, stockMax)
	AddUnitToStock(whichUnit, unitId, currentStock, stockMax)
end

--===========================================================================
---@param itemId integer
---@param whichUnit unit
function RemoveItemFromStockBJ(itemId, whichUnit)
	RemoveItemFromStock(whichUnit, itemId)
end

--===========================================================================
---@param unitId integer
---@param whichUnit unit
function RemoveUnitFromStockBJ(unitId, whichUnit)
	RemoveUnitFromStock(whichUnit, unitId)
end

--===========================================================================
---@param enable boolean
---@param whichUnit unit
function SetUnitUseFoodBJ(enable, whichUnit)
	SetUnitUseFood(whichUnit, enable)
end

--===========================================================================
---@param whichUnit unit
---@param delay real
---@param radius real
---@param loc location
---@param amount real
---@param whichAttack attacktype
---@param whichDamage damagetype
---@return boolean
function UnitDamagePointLoc(whichUnit, delay, radius, loc, amount, whichAttack, whichDamage)
	return UnitDamagePoint(whichUnit, delay, radius, GetLocationX(loc), GetLocationY(loc), amount, true, false, whichAttack, whichDamage, WEAPON_TYPE_WHOKNOWS)
end

--===========================================================================
---@param whichUnit unit
---@param target unit
---@param amount real
---@param whichAttack attacktype
---@param whichDamage damagetype
---@return boolean
function UnitDamageTargetBJ(whichUnit, target, amount, whichAttack, whichDamage)
	return UnitDamageTarget(whichUnit, target, amount, true, false, whichAttack, whichDamage, WEAPON_TYPE_WHOKNOWS)
end