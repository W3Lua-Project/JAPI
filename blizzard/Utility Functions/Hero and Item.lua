--***************************************************************************
--*
--*  Hero and Item Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param whichItem item
---@return location
function GetItemLoc(whichItem)
	return Location(GetItemX(whichItem), GetItemY(whichItem))
end

--===========================================================================
---@param whichWidget widget
---@return real
function GetItemLifeBJ(whichWidget)
	return GetWidgetLife(whichWidget)
end

--===========================================================================
---@param whichWidget widget
---@param life real
function SetItemLifeBJ(whichWidget, life)
	SetWidgetLife(whichWidget, life)
end

--===========================================================================
---@param xpToAdd integer
---@param whichHero unit
---@param showEyeCandy boolean
function AddHeroXPSwapped(xpToAdd, whichHero, showEyeCandy)
	AddHeroXP(whichHero, xpToAdd, showEyeCandy)
end

--===========================================================================
---@param whichHero unit
---@param newLevel integer
---@param showEyeCandy boolean
function SetHeroLevelBJ(whichHero, newLevel, showEyeCandy)
	---@type integer
	oldLevel = GetHeroLevel(whichHero)
	
	if (newLevel > oldLevel) then
		SetHeroLevel(whichHero, newLevel, showEyeCandy)
	elseif (newLevel < oldLevel) then
		UnitStripHeroLevel(whichHero, oldLevel - newLevel)
	else
		-- No change in level - ignore the request.
	end
end

--===========================================================================
---@param abilcode integer
---@param whichUnit unit
---@return integer
function DecUnitAbilityLevelSwapped(abilcode, whichUnit)
	return DecUnitAbilityLevel(whichUnit, abilcode)
end

--===========================================================================
---@param abilcode integer
---@param whichUnit unit
---@return integer
function IncUnitAbilityLevelSwapped(abilcode, whichUnit)
	return IncUnitAbilityLevel(whichUnit, abilcode)
end

--===========================================================================
---@param abilcode integer
---@param whichUnit unit
---@param level integer
---@return integer
function SetUnitAbilityLevelSwapped(abilcode, whichUnit, level)
	return SetUnitAbilityLevel(whichUnit, abilcode, level)
end

--===========================================================================
---@param abilcode integer
---@param whichUnit unit
---@return integer
function GetUnitAbilityLevelSwapped(abilcode, whichUnit)
	return GetUnitAbilityLevel(whichUnit, abilcode)
end

--===========================================================================
---@param whichUnit unit
---@param buffcode integer
---@return boolean
function UnitHasBuffBJ(whichUnit, buffcode)
	return (GetUnitAbilityLevel(whichUnit, buffcode) > 0)
end

--===========================================================================
---@param buffcode integer
---@param whichUnit unit
---@return boolean
function UnitRemoveBuffBJ(buffcode, whichUnit)
	return UnitRemoveAbility(whichUnit, buffcode)
end

--===========================================================================
---@param whichItem item
---@param whichHero unit
---@return boolean
function UnitAddItemSwapped(whichItem, whichHero)
	return UnitAddItem(whichHero, whichItem)
end

--===========================================================================
---@param itemId integer
---@param whichHero unit
---@return item
function UnitAddItemByIdSwapped(itemId, whichHero)
	-- Create the item at the hero's feet first, and then give it to him.
	-- This is to ensure that the item will be left at the hero's feet if
	-- his inventory is full.
	bj_lastCreatedItem = CreateItem(itemId, GetUnitX(whichHero), GetUnitY(whichHero))
	UnitAddItem(whichHero, bj_lastCreatedItem)
	return bj_lastCreatedItem
end

--===========================================================================
---@param whichItem item
---@param whichHero unit
function UnitRemoveItemSwapped(whichItem, whichHero)
	bj_lastRemovedItem = whichItem
	UnitRemoveItem(whichHero, whichItem)
end

--===========================================================================
-- Translates 0-based slot indices to 1-based slot indices.
--
---@param itemSlot integer
---@param whichHero unit
---@return item
function UnitRemoveItemFromSlotSwapped(itemSlot, whichHero)
	bj_lastRemovedItem = UnitRemoveItemFromSlot(whichHero, itemSlot - 1)
	return bj_lastRemovedItem
end

--===========================================================================
---@param itemId integer
---@param loc location
---@return item
function CreateItemLoc(itemId, loc)
	bj_lastCreatedItem = CreateItem(itemId, GetLocationX(loc), GetLocationY(loc))
	return bj_lastCreatedItem
end

--===========================================================================
---@return item
function GetLastCreatedItem()
	return bj_lastCreatedItem
end

--===========================================================================
---@return item
function GetLastRemovedItem()
	return bj_lastRemovedItem
end

--===========================================================================
---@param whichItem item
---@param loc location
function SetItemPositionLoc(whichItem, loc)
	SetItemPosition(whichItem, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
---@return integer
function GetLearnedSkillBJ()
	return GetLearnedSkill()
end

--===========================================================================
---@param flag boolean
---@param whichHero unit
function SuspendHeroXPBJ(flag, whichHero)
	SuspendHeroXP(whichHero, not flag)
end

--===========================================================================
---@param whichPlayer player
---@param handicapPercent real
function SetPlayerHandicapXPBJ(whichPlayer, handicapPercent)
	SetPlayerHandicapXP(whichPlayer, handicapPercent * 0.01)
end

--===========================================================================
---@param whichPlayer player
---@return real
function GetPlayerHandicapXPBJ(whichPlayer)
	return GetPlayerHandicapXP(whichPlayer) * 100
end

--===========================================================================
---@param whichPlayer player
---@param handicapPercent real
function SetPlayerHandicapBJ(whichPlayer, handicapPercent)
	SetPlayerHandicap(whichPlayer, handicapPercent * 0.01)
end

--===========================================================================
---@param whichPlayer player
---@return real
function GetPlayerHandicapBJ(whichPlayer)
	return GetPlayerHandicap(whichPlayer) * 100
end

--===========================================================================
---@param whichStat integer
---@param whichHero unit
---@param includeBonuses boolean
---@return integer
function GetHeroStatBJ(whichStat, whichHero, includeBonuses)
	if (whichStat == bj_HEROSTAT_STR) then
		return GetHeroStr(whichHero, includeBonuses)
	elseif (whichStat == bj_HEROSTAT_AGI) then
		return GetHeroAgi(whichHero, includeBonuses)
	elseif (whichStat == bj_HEROSTAT_INT) then
		return GetHeroInt(whichHero, includeBonuses)
	else
		-- Unrecognized hero stat - return 0
		return 0
	end
end

--===========================================================================
---@param whichHero unit
---@param whichStat integer
---@param value integer
function SetHeroStat(whichHero, whichStat, value)
	-- Ignore requests for negative hero stats.
	if (value <= 0) then
		return
	end
	
	if (whichStat == bj_HEROSTAT_STR) then
		SetHeroStr(whichHero, value, true)
	elseif (whichStat == bj_HEROSTAT_AGI) then
		SetHeroAgi(whichHero, value, true)
	elseif (whichStat == bj_HEROSTAT_INT) then
		SetHeroInt(whichHero, value, true)
	else
		-- Unrecognized hero stat - ignore the request.
	end
end

--===========================================================================
---@param whichStat integer
---@param whichHero unit
---@param modifyMethod integer
---@param value integer
function ModifyHeroStat(whichStat, whichHero, modifyMethod, value)
	if (modifyMethod == bj_MODIFYMETHOD_ADD) then
		SetHeroStat(whichHero, whichStat, GetHeroStatBJ(whichStat, whichHero, false) + value)
	elseif (modifyMethod == bj_MODIFYMETHOD_SUB) then
		SetHeroStat(whichHero, whichStat, GetHeroStatBJ(whichStat, whichHero, false) - value)
	elseif (modifyMethod == bj_MODIFYMETHOD_SET) then
		SetHeroStat(whichHero, whichStat, value)
	else
		-- Unrecognized modification method - ignore the request.
	end
end

--===========================================================================
---@param whichHero unit
---@param modifyMethod integer
---@param value integer
---@return boolean
function ModifyHeroSkillPoints(whichHero, modifyMethod, value)
	if (modifyMethod == bj_MODIFYMETHOD_ADD) then
		return UnitModifySkillPoints(whichHero, value)
	elseif (modifyMethod == bj_MODIFYMETHOD_SUB) then
		return UnitModifySkillPoints(whichHero, -value)
	elseif (modifyMethod == bj_MODIFYMETHOD_SET) then
		return UnitModifySkillPoints(whichHero, value - GetHeroSkillPoints(whichHero))
	else
		-- Unrecognized modification method - ignore the request and return failure.
		return false
	end
end

--===========================================================================
---@param whichUnit unit
---@param whichItem item
---@param x real
---@param y real
---@return boolean
function UnitDropItemPointBJ(whichUnit, whichItem, x, y)
	return UnitDropItemPoint(whichUnit, whichItem, x, y)
end

--===========================================================================
---@param whichUnit unit
---@param whichItem item
---@param loc location
---@return boolean
function UnitDropItemPointLoc(whichUnit, whichItem, loc)
	return UnitDropItemPoint(whichUnit, whichItem, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
---@param whichUnit unit
---@param whichItem item
---@param slot integer
---@return boolean
function UnitDropItemSlotBJ(whichUnit, whichItem, slot)
	return UnitDropItemSlot(whichUnit, whichItem, slot - 1)
end

--===========================================================================
---@param whichUnit unit
---@param whichItem item
---@param target widget
---@return boolean
function UnitDropItemTargetBJ(whichUnit, whichItem, target)
	return UnitDropItemTarget(whichUnit, whichItem, target)
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
---@param whichUnit unit
---@param whichItem item
---@param target widget
---@return boolean
function UnitUseItemDestructable(whichUnit, whichItem, target)
	return UnitUseItemTarget(whichUnit, whichItem, target)
end

--===========================================================================
---@param whichUnit unit
---@param whichItem item
---@param loc location
---@return boolean
function UnitUseItemPointLoc(whichUnit, whichItem, loc)
	return UnitUseItemPoint(whichUnit, whichItem, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
-- Translates 0-based slot indices to 1-based slot indices.
--
---@param whichUnit unit
---@param itemSlot integer
---@return item
function UnitItemInSlotBJ(whichUnit, itemSlot)
	return UnitItemInSlot(whichUnit, itemSlot - 1)
end

--===========================================================================
-- Translates 0-based slot indices to 1-based slot indices.
--
---@param whichUnit unit
---@param itemId integer
---@return integer
function GetInventoryIndexOfItemTypeBJ(whichUnit, itemId)
	---@type integer
	index     = nil
	---@type item
	indexItem = nil
	
	index     = 0
	while true do
		indexItem = UnitItemInSlot(whichUnit, index)
		if (indexItem ~= nil) and (GetItemTypeId(indexItem) == itemId) then
			return index + 1
		end
		
		index = index + 1
		if index >= bj_MAX_INVENTORY then break end
	end
	return 0
end

--===========================================================================
---@param whichUnit unit
---@param itemId integer
---@return item
function GetItemOfTypeFromUnitBJ(whichUnit, itemId)
	---@type integer
	index = GetInventoryIndexOfItemTypeBJ(whichUnit, itemId)
	
	if (index == 0) then
		return nil
	else
		return UnitItemInSlot(whichUnit, index - 1)
	end
end

--===========================================================================
---@param whichUnit unit
---@param itemId integer
---@return boolean
function UnitHasItemOfTypeBJ(whichUnit, itemId)
	return GetInventoryIndexOfItemTypeBJ(whichUnit, itemId) > 0
end

--===========================================================================
---@param whichUnit unit
---@return integer
function UnitInventoryCount(whichUnit)
	---@type integer
	index = 0
	---@type integer
	count = 0
	
	while true do
		if (UnitItemInSlot(whichUnit, index) ~= nil) then
			count = count + 1
		end
		
		index = index + 1
		if index >= bj_MAX_INVENTORY then break end
	end
	
	return count
end

--===========================================================================
---@param whichUnit unit
---@return integer
function UnitInventorySizeBJ(whichUnit)
	return UnitInventorySize(whichUnit)
end

--===========================================================================
---@param whichItem item
---@param flag boolean
function SetItemInvulnerableBJ(whichItem, flag)
	SetItemInvulnerable(whichItem, flag)
end

--===========================================================================
---@param whichItem item
---@param flag boolean
function SetItemDropOnDeathBJ(whichItem, flag)
	SetItemDropOnDeath(whichItem, flag)
end

--===========================================================================
---@param whichItem item
---@param flag boolean
function SetItemDroppableBJ(whichItem, flag)
	SetItemDroppable(whichItem, flag)
end

--===========================================================================
---@param whichItem item
---@param whichPlayer player
---@param changeColor boolean
function SetItemPlayerBJ(whichItem, whichPlayer, changeColor)
	SetItemPlayer(whichItem, whichPlayer, changeColor)
end

--===========================================================================
---@param show boolean
---@param whichItem item
function SetItemVisibleBJ(show, whichItem)
	SetItemVisible(whichItem, show)
end

--===========================================================================
---@param whichItem item
---@return boolean
function IsItemHiddenBJ(whichItem)
	return not IsItemVisible(whichItem)
end

--===========================================================================
---@param level integer
---@return integer
function ChooseRandomItemBJ(level)
	return ChooseRandomItem(level)
end

--===========================================================================
---@param level integer
---@param whichType itemtype
---@return integer
function ChooseRandomItemExBJ(level, whichType)
	return ChooseRandomItemEx(whichType, level)
end

--===========================================================================
---@return integer
function ChooseRandomNPBuildingBJ()
	return ChooseRandomNPBuilding()
end

--===========================================================================
---@param level integer
---@return integer
function ChooseRandomCreepBJ(level)
	return ChooseRandomCreep(level)
end

--===========================================================================
---@param r rect
---@param actionFunc code
function EnumItemsInRectBJ(r, actionFunc)
	EnumItemsInRect(r, nil, actionFunc)
end

--===========================================================================
-- See GroupPickRandomUnitEnum for the details of this algorithm.
--
function RandomItemInRectBJEnum()
	bj_itemRandomConsidered = bj_itemRandomConsidered + 1
	if (GetRandomInt(1, bj_itemRandomConsidered) == 1) then
		bj_itemRandomCurrentPick = GetEnumItem()
	end
end

--===========================================================================
-- Picks a random item from within a rect, matching a condition
--
---@param r rect
---@param filter boolexpr
---@return item
function RandomItemInRectBJ(r, filter)
	bj_itemRandomConsidered  = 0
	bj_itemRandomCurrentPick = nil
	EnumItemsInRect(r, filter, RandomItemInRectBJEnum)
	DestroyBoolExpr(filter)
	return bj_itemRandomCurrentPick
end

--===========================================================================
-- Picks a random item from within a rect
--
---@param r rect
---@return item
function RandomItemInRectSimpleBJ(r)
	return RandomItemInRectBJ(r, nil)
end

--===========================================================================
---@param whichItem item
---@param status integer
---@return boolean
function CheckItemStatus(whichItem, status)
	if (status == bj_ITEM_STATUS_HIDDEN) then
		return not IsItemVisible(whichItem)
	elseif (status == bj_ITEM_STATUS_OWNED) then
		return IsItemOwned(whichItem)
	elseif (status == bj_ITEM_STATUS_INVULNERABLE) then
		return IsItemInvulnerable(whichItem)
	elseif (status == bj_ITEM_STATUS_POWERUP) then
		return IsItemPowerup(whichItem)
	elseif (status == bj_ITEM_STATUS_SELLABLE) then
		return IsItemSellable(whichItem)
	elseif (status == bj_ITEM_STATUS_PAWNABLE) then
		return IsItemPawnable(whichItem)
	else
		-- Unrecognized status - return false
		return false
	end
end

--===========================================================================
---@param itemId integer
---@param status integer
---@return boolean
function CheckItemcodeStatus(itemId, status)
	if (status == bj_ITEMCODE_STATUS_POWERUP) then
		return IsItemIdPowerup(itemId)
	elseif (status == bj_ITEMCODE_STATUS_SELLABLE) then
		return IsItemIdSellable(itemId)
	elseif (status == bj_ITEMCODE_STATUS_PAWNABLE) then
		return IsItemIdPawnable(itemId)
	else
		-- Unrecognized status - return false
		return false
	end
end