--***************************************************************************
--*
--*  Instanced Object Operation Functions
--*
--*  Get/Set specific fields for single unit/item/ability instance
--*
--***************************************************************************

--===========================================================================
---@return boolean
function BlzIsLastInstanceObjectFunctionSuccessful()
	return bj_lastInstObjFuncSuccessful
end

-- Ability
--===========================================================================
---@param whichAbility ability
---@param whichField abilitybooleanfield
---@param value boolean
function BlzSetAbilityBooleanFieldBJ(whichAbility, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityBooleanField(whichAbility, whichField, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityintegerfield
---@param value integer
function BlzSetAbilityIntegerFieldBJ(whichAbility, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityIntegerField(whichAbility, whichField, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityrealfield
---@param value real
function BlzSetAbilityRealFieldBJ(whichAbility, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityRealField(whichAbility, whichField, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitystringfield
---@param value string
function BlzSetAbilityStringFieldBJ(whichAbility, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityStringField(whichAbility, whichField, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitybooleanlevelfield
---@param level integer
---@param value boolean
function BlzSetAbilityBooleanLevelFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityBooleanLevelField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityintegerlevelfield
---@param level integer
---@param value integer
function BlzSetAbilityIntegerLevelFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityIntegerLevelField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityreallevelfield
---@param level integer
---@param value real
function BlzSetAbilityRealLevelFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityRealLevelField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitystringlevelfield
---@param level integer
---@param value string
function BlzSetAbilityStringLevelFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityStringLevelField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param index integer
---@param value boolean
function BlzSetAbilityBooleanLevelArrayFieldBJ(whichAbility, whichField, level, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityBooleanLevelArrayField(whichAbility, whichField, level, index, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param index integer
---@param value integer
function BlzSetAbilityIntegerLevelArrayFieldBJ(whichAbility, whichField, level, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityIntegerLevelArrayField(whichAbility, whichField, level, index, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityreallevelarrayfield
---@param level integer
---@param index integer
---@param value real
function BlzSetAbilityRealLevelArrayFieldBJ(whichAbility, whichField, level, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityRealLevelArrayField(whichAbility, whichField, level, index, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param index integer
---@param value string
function BlzSetAbilityStringLevelArrayFieldBJ(whichAbility, whichField, level, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetAbilityStringLevelArrayField(whichAbility, whichField, level, index, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param value boolean
function BlzAddAbilityBooleanLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzAddAbilityBooleanLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param value integer
function BlzAddAbilityIntegerLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzAddAbilityIntegerLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityreallevelarrayfield
---@param level integer
---@param value real
function BlzAddAbilityRealLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzAddAbilityRealLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param value string
function BlzAddAbilityStringLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzAddAbilityStringLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitybooleanlevelarrayfield
---@param level integer
---@param value boolean
function BlzRemoveAbilityBooleanLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzRemoveAbilityBooleanLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityintegerlevelarrayfield
---@param level integer
---@param value integer
function BlzRemoveAbilityIntegerLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzRemoveAbilityIntegerLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilityreallevelarrayfield
---@param level integer
---@param value real
function BlzRemoveAbilityRealLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzRemoveAbilityRealLevelArrayField(whichAbility, whichField, level, value)
end

--===========================================================================
---@param whichAbility ability
---@param whichField abilitystringlevelarrayfield
---@param level integer
---@param value string
function BlzRemoveAbilityStringLevelArrayFieldBJ(whichAbility, whichField, level, value)
	bj_lastInstObjFuncSuccessful = BlzRemoveAbilityStringLevelArrayField(whichAbility, whichField, level, value)
end

-- Item
--=============================================================
---@param whichItem item
---@param abilCode integer
function BlzItemAddAbilityBJ(whichItem, abilCode)
	bj_lastInstObjFuncSuccessful = BlzItemAddAbility(whichItem, abilCode)
end

--===========================================================================
---@param whichItem item
---@param abilCode integer
function BlzItemRemoveAbilityBJ(whichItem, abilCode)
	bj_lastInstObjFuncSuccessful = BlzItemRemoveAbility(whichItem, abilCode)
end

--===========================================================================
---@param whichItem item
---@param whichField itembooleanfield
---@param value boolean
function BlzSetItemBooleanFieldBJ(whichItem, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetItemBooleanField(whichItem, whichField, value)
end

--===========================================================================
---@param whichItem item
---@param whichField itemintegerfield
---@param value integer
function BlzSetItemIntegerFieldBJ(whichItem, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetItemIntegerField(whichItem, whichField, value)
end

--===========================================================================
---@param whichItem item
---@param whichField itemrealfield
---@param value real
function BlzSetItemRealFieldBJ(whichItem, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetItemRealField(whichItem, whichField, value)
end

--===========================================================================
---@param whichItem item
---@param whichField itemstringfield
---@param value string
function BlzSetItemStringFieldBJ(whichItem, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetItemStringField(whichItem, whichField, value)
end


-- Unit
--===========================================================================
---@param whichUnit unit
---@param whichField unitbooleanfield
---@param value boolean
function BlzSetUnitBooleanFieldBJ(whichUnit, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitBooleanField(whichUnit, whichField, value)
end

--===========================================================================
---@param whichUnit unit
---@param whichField unitintegerfield
---@param value integer
function BlzSetUnitIntegerFieldBJ(whichUnit, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitIntegerField(whichUnit, whichField, value)
end

--===========================================================================
---@param whichUnit unit
---@param whichField unitrealfield
---@param value real
function BlzSetUnitRealFieldBJ(whichUnit, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitRealField(whichUnit, whichField, value)
end

--===========================================================================
---@param whichUnit unit
---@param whichField unitstringfield
---@param value string
function BlzSetUnitStringFieldBJ(whichUnit, whichField, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitStringField(whichUnit, whichField, value)
end

-- Unit Weapon
--===========================================================================
---@param whichUnit unit
---@param whichField unitweaponbooleanfield
---@param index integer
---@param value boolean
function BlzSetUnitWeaponBooleanFieldBJ(whichUnit, whichField, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitWeaponBooleanField(whichUnit, whichField, index, value)
end

--===========================================================================
---@param whichUnit unit
---@param whichField unitweaponintegerfield
---@param index integer
---@param value integer
function BlzSetUnitWeaponIntegerFieldBJ(whichUnit, whichField, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitWeaponIntegerField(whichUnit, whichField, index, value)
end

--===========================================================================
---@param whichUnit unit
---@param whichField unitweaponrealfield
---@param index integer
---@param value real
function BlzSetUnitWeaponRealFieldBJ(whichUnit, whichField, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitWeaponRealField(whichUnit, whichField, index, value)
end

--===========================================================================
---@param whichUnit unit
---@param whichField unitweaponstringfield
---@param index integer
---@param value string
function BlzSetUnitWeaponStringFieldBJ(whichUnit, whichField, index, value)
	bj_lastInstObjFuncSuccessful = BlzSetUnitWeaponStringField(whichUnit, whichField, index, value)
end