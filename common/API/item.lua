--============================================================================
-- Item API
---@param itemid integer
---@param x real
---@param y real
---@return item
function CreateItem(itemid, x, y) end

---@param whichItem item
function RemoveItem(whichItem) end

---@param whichItem item
---@return player
function GetItemPlayer(whichItem) end

---@param i item
---@return integer
function GetItemTypeId(i) end

---@param i item
---@return real
function GetItemX(i) end

---@param i item
---@return real
function GetItemY(i) end

---@param i item
---@param x real
---@param y real
function SetItemPosition(i, x, y) end

---@param whichItem item
---@param flag boolean
function SetItemDropOnDeath(whichItem, flag) end

---@param i item
---@param flag boolean
function SetItemDroppable(i, flag) end

---@param i item
---@param flag boolean
function SetItemPawnable(i, flag) end

---@param whichItem item
---@param whichPlayer player
---@param changeColor boolean
function SetItemPlayer(whichItem, whichPlayer, changeColor) end

---@param whichItem item
---@param flag boolean
function SetItemInvulnerable(whichItem, flag) end

---@param whichItem item
---@return boolean
function IsItemInvulnerable(whichItem) end

---@param whichItem item
---@param show boolean
function SetItemVisible(whichItem, show) end

---@param whichItem item
---@return boolean
function IsItemVisible(whichItem) end

---@param whichItem item
---@return boolean
function IsItemOwned(whichItem) end

---@param whichItem item
---@return boolean
function IsItemPowerup(whichItem) end

---@param whichItem item
---@return boolean
function IsItemSellable(whichItem) end

---@param whichItem item
---@return boolean
function IsItemPawnable(whichItem) end

---@param itemId integer
---@return boolean
function IsItemIdPowerup(itemId) end

---@param itemId integer
---@return boolean
function IsItemIdSellable(itemId) end

---@param itemId integer
---@return boolean
function IsItemIdPawnable(itemId) end

---@param r rect
---@param filter boolexpr
---@param actionFunc code
function EnumItemsInRect(r, filter, actionFunc) end

---@param whichItem item
---@return integer
function GetItemLevel(whichItem) end

---@param whichItem item
---@return itemtype
function GetItemType(whichItem) end

---@param whichItem item
---@param unitId integer
function SetItemDropID(whichItem, unitId) end

---@param whichItem item
---@return string
function GetItemName(whichItem) end

---@param whichItem item
---@return integer
function GetItemCharges(whichItem) end

---@param whichItem item
---@param charges integer
function SetItemCharges(whichItem, charges) end

---@param whichItem item
---@return integer
function GetItemUserData(whichItem) end

---@param whichItem item
---@param data integer
function SetItemUserData(whichItem, data) end

-- Item
---@param whichItem item
---@param index integer
---@return ability
function BlzGetItemAbilityByIndex(whichItem, index) end

---@param whichItem item
---@param abilCode integer
---@return ability
function BlzGetItemAbility(whichItem, abilCode) end

---@param whichItem item
---@param abilCode integer
---@return boolean
function BlzItemAddAbility(whichItem, abilCode) end

---@param whichItem item
---@param whichField itembooleanfield
---@return boolean
function BlzGetItemBooleanField(whichItem, whichField) end

---@param whichItem item
---@param whichField itemintegerfield
---@return integer
function BlzGetItemIntegerField(whichItem, whichField) end

---@param whichItem item
---@param whichField itemrealfield
---@return real
function BlzGetItemRealField(whichItem, whichField) end

---@param whichItem item
---@param whichField itemstringfield
---@return string
function BlzGetItemStringField(whichItem, whichField) end

---@param whichItem item
---@param whichField itembooleanfield
---@param value boolean
---@return boolean
function BlzSetItemBooleanField(whichItem, whichField, value) end

---@param whichItem item
---@param whichField itemintegerfield
---@param value integer
---@return boolean
function BlzSetItemIntegerField(whichItem, whichField, value) end

---@param whichItem item
---@param whichField itemrealfield
---@param value real
---@return boolean
function BlzSetItemRealField(whichItem, whichField, value) end

---@param whichItem item
---@param whichField itemstringfield
---@param value string
---@return boolean
function BlzSetItemStringField(whichItem, whichField, value) end

---@param whichItem item
---@param abilCode integer
---@return boolean
function BlzItemRemoveAbility(whichItem, abilCode) end