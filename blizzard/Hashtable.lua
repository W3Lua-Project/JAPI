--===========================================================================
---@return hashtable
function InitHashtableBJ()
	bj_lastCreatedHashtable = InitHashtable()
	return bj_lastCreatedHashtable
end

--===========================================================================
---@return hashtable
function GetLastCreatedHashtableBJ()
	return bj_lastCreatedHashtable
end

--===========================================================================
---@param value real
---@param key integer
---@param missionKey integer
---@param table hashtable
function SaveRealBJ(value, key, missionKey, table)
	SaveReal(table, missionKey, key, value)
end

--===========================================================================
---@param value integer
---@param key integer
---@param missionKey integer
---@param table hashtable
function SaveIntegerBJ(value, key, missionKey, table)
	SaveInteger(table, missionKey, key, value)
end

--===========================================================================
---@param value boolean
---@param key integer
---@param missionKey integer
---@param table hashtable
function SaveBooleanBJ(value, key, missionKey, table)
	SaveBoolean(table, missionKey, key, value)
end

--===========================================================================
---@param value string
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveStringBJ(value, key, missionKey, table)
	return SaveStr(table, missionKey, key, value)
end

--===========================================================================
---@param whichPlayer player
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SavePlayerHandleBJ(whichPlayer, key, missionKey, table)
	return SavePlayerHandle(table, missionKey, key, whichPlayer)
end

--===========================================================================
---@param whichWidget widget
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveWidgetHandleBJ(whichWidget, key, missionKey, table)
	return SaveWidgetHandle(table, missionKey, key, whichWidget)
end

--===========================================================================
---@param whichDestructable destructable
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveDestructableHandleBJ(whichDestructable, key, missionKey, table)
	return SaveDestructableHandle(table, missionKey, key, whichDestructable)
end

--===========================================================================
---@param whichItem item
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveItemHandleBJ(whichItem, key, missionKey, table)
	return SaveItemHandle(table, missionKey, key, whichItem)
end

--===========================================================================
---@param whichUnit unit
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveUnitHandleBJ(whichUnit, key, missionKey, table)
	return SaveUnitHandle(table, missionKey, key, whichUnit)
end

--===========================================================================
---@param whichAbility ability
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveAbilityHandleBJ(whichAbility, key, missionKey, table)
	return SaveAbilityHandle(table, missionKey, key, whichAbility)
end

--===========================================================================
---@param whichTimer timer
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTimerHandleBJ(whichTimer, key, missionKey, table)
	return SaveTimerHandle(table, missionKey, key, whichTimer)
end

--===========================================================================
---@param whichTrigger trigger
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTriggerHandleBJ(whichTrigger, key, missionKey, table)
	return SaveTriggerHandle(table, missionKey, key, whichTrigger)
end

--===========================================================================
---@param whichTriggercondition triggercondition
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTriggerConditionHandleBJ(whichTriggercondition, key, missionKey, table)
	return SaveTriggerConditionHandle(table, missionKey, key, whichTriggercondition)
end

--===========================================================================
---@param whichTriggeraction triggeraction
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTriggerActionHandleBJ(whichTriggeraction, key, missionKey, table)
	return SaveTriggerActionHandle(table, missionKey, key, whichTriggeraction)
end

--===========================================================================
---@param whichEvent event
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTriggerEventHandleBJ(whichEvent, key, missionKey, table)
	return SaveTriggerEventHandle(table, missionKey, key, whichEvent)
end

--===========================================================================
---@param whichForce force
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveForceHandleBJ(whichForce, key, missionKey, table)
	return SaveForceHandle(table, missionKey, key, whichForce)
end

--===========================================================================
---@param whichGroup group
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveGroupHandleBJ(whichGroup, key, missionKey, table)
	return SaveGroupHandle(table, missionKey, key, whichGroup)
end

--===========================================================================
---@param whichLocation location
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveLocationHandleBJ(whichLocation, key, missionKey, table)
	return SaveLocationHandle(table, missionKey, key, whichLocation)
end

--===========================================================================
---@param whichRect rect
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveRectHandleBJ(whichRect, key, missionKey, table)
	return SaveRectHandle(table, missionKey, key, whichRect)
end

--===========================================================================
---@param whichBoolexpr boolexpr
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveBooleanExprHandleBJ(whichBoolexpr, key, missionKey, table)
	return SaveBooleanExprHandle(table, missionKey, key, whichBoolexpr)
end

--===========================================================================
---@param whichSound sound
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveSoundHandleBJ(whichSound, key, missionKey, table)
	return SaveSoundHandle(table, missionKey, key, whichSound)
end

--===========================================================================
---@param whichEffect effect
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveEffectHandleBJ(whichEffect, key, missionKey, table)
	return SaveEffectHandle(table, missionKey, key, whichEffect)
end

--===========================================================================
---@param whichUnitpool unitpool
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveUnitPoolHandleBJ(whichUnitpool, key, missionKey, table)
	return SaveUnitPoolHandle(table, missionKey, key, whichUnitpool)
end

--===========================================================================
---@param whichItempool itempool
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveItemPoolHandleBJ(whichItempool, key, missionKey, table)
	return SaveItemPoolHandle(table, missionKey, key, whichItempool)
end

--===========================================================================
---@param whichQuest quest
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveQuestHandleBJ(whichQuest, key, missionKey, table)
	return SaveQuestHandle(table, missionKey, key, whichQuest)
end

--===========================================================================
---@param whichQuestitem questitem
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveQuestItemHandleBJ(whichQuestitem, key, missionKey, table)
	return SaveQuestItemHandle(table, missionKey, key, whichQuestitem)
end

--===========================================================================
---@param whichDefeatcondition defeatcondition
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveDefeatConditionHandleBJ(whichDefeatcondition, key, missionKey, table)
	return SaveDefeatConditionHandle(table, missionKey, key, whichDefeatcondition)
end

--===========================================================================
---@param whichTimerdialog timerdialog
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTimerDialogHandleBJ(whichTimerdialog, key, missionKey, table)
	return SaveTimerDialogHandle(table, missionKey, key, whichTimerdialog)
end

--===========================================================================
---@param whichLeaderboard leaderboard
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveLeaderboardHandleBJ(whichLeaderboard, key, missionKey, table)
	return SaveLeaderboardHandle(table, missionKey, key, whichLeaderboard)
end

--===========================================================================
---@param whichMultiboard multiboard
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveMultiboardHandleBJ(whichMultiboard, key, missionKey, table)
	return SaveMultiboardHandle(table, missionKey, key, whichMultiboard)
end

--===========================================================================
---@param whichMultiboarditem multiboarditem
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveMultiboardItemHandleBJ(whichMultiboarditem, key, missionKey, table)
	return SaveMultiboardItemHandle(table, missionKey, key, whichMultiboarditem)
end

--===========================================================================
---@param whichTrackable trackable
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTrackableHandleBJ(whichTrackable, key, missionKey, table)
	return SaveTrackableHandle(table, missionKey, key, whichTrackable)
end

--===========================================================================
---@param whichDialog dialog
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveDialogHandleBJ(whichDialog, key, missionKey, table)
	return SaveDialogHandle(table, missionKey, key, whichDialog)
end

--===========================================================================
---@param whichButton button
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveButtonHandleBJ(whichButton, key, missionKey, table)
	return SaveButtonHandle(table, missionKey, key, whichButton)
end

--===========================================================================
---@param whichTexttag texttag
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveTextTagHandleBJ(whichTexttag, key, missionKey, table)
	return SaveTextTagHandle(table, missionKey, key, whichTexttag)
end

--===========================================================================
---@param whichLightning lightning
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveLightningHandleBJ(whichLightning, key, missionKey, table)
	return SaveLightningHandle(table, missionKey, key, whichLightning)
end

--===========================================================================
---@param whichImage image
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveImageHandleBJ(whichImage, key, missionKey, table)
	return SaveImageHandle(table, missionKey, key, whichImage)
end

--===========================================================================
---@param whichUbersplat ubersplat
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveUbersplatHandleBJ(whichUbersplat, key, missionKey, table)
	return SaveUbersplatHandle(table, missionKey, key, whichUbersplat)
end

--===========================================================================
---@param whichRegion region
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveRegionHandleBJ(whichRegion, key, missionKey, table)
	return SaveRegionHandle(table, missionKey, key, whichRegion)
end

--===========================================================================
---@param whichFogState fogstate
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveFogStateHandleBJ(whichFogState, key, missionKey, table)
	return SaveFogStateHandle(table, missionKey, key, whichFogState)
end

--===========================================================================
---@param whichFogModifier fogmodifier
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveFogModifierHandleBJ(whichFogModifier, key, missionKey, table)
	return SaveFogModifierHandle(table, missionKey, key, whichFogModifier)
end

--===========================================================================
---@param whichAgent agent
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveAgentHandleBJ(whichAgent, key, missionKey, table)
	return SaveAgentHandle(table, missionKey, key, whichAgent)
end

--===========================================================================
---@param whichHashtable hashtable
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function SaveHashtableHandleBJ(whichHashtable, key, missionKey, table)
	return SaveHashtableHandle(table, missionKey, key, whichHashtable)
end

--===========================================================================
---@param key string
---@param missionKey string
---@param cache gamecache
---@return real
function GetStoredRealBJ(key, missionKey, cache)
	--call SyncStoredReal(cache, missionKey, key)
	return GetStoredReal(cache, missionKey, key)
end

--===========================================================================
---@param key string
---@param missionKey string
---@param cache gamecache
---@return integer
function GetStoredIntegerBJ(key, missionKey, cache)
	--call SyncStoredInteger(cache, missionKey, key)
	return GetStoredInteger(cache, missionKey, key)
end

--===========================================================================
---@param key string
---@param missionKey string
---@param cache gamecache
---@return boolean
function GetStoredBooleanBJ(key, missionKey, cache)
	--call SyncStoredBoolean(cache, missionKey, key)
	return GetStoredBoolean(cache, missionKey, key)
end

--===========================================================================
---@param key string
---@param missionKey string
---@param cache gamecache
---@return string
function GetStoredStringBJ(key, missionKey, cache)
	---@type string
	s = nil
	
	--call SyncStoredString(cache, missionKey, key)
	s = GetStoredString(cache, missionKey, key)
	if (s == nil) then
		return ""
	else
		return s
	end
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return real
function LoadRealBJ(key, missionKey, table)
	--call SyncStoredReal(table, missionKey, key)
	return LoadReal(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return integer
function LoadIntegerBJ(key, missionKey, table)
	--call SyncStoredInteger(table, missionKey, key)
	return LoadInteger(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function LoadBooleanBJ(key, missionKey, table)
	--call SyncStoredBoolean(table, missionKey, key)
	return LoadBoolean(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return string
function LoadStringBJ(key, missionKey, table)
	---@type string
	s = nil
	
	--call SyncStoredString(table, missionKey, key)
	s = LoadStr(table, missionKey, key)
	if (s == nil) then
		return ""
	else
		return s
	end
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return player
function LoadPlayerHandleBJ(key, missionKey, table)
	return LoadPlayerHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return widget
function LoadWidgetHandleBJ(key, missionKey, table)
	return LoadWidgetHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return destructable
function LoadDestructableHandleBJ(key, missionKey, table)
	return LoadDestructableHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return item
function LoadItemHandleBJ(key, missionKey, table)
	return LoadItemHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return unit
function LoadUnitHandleBJ(key, missionKey, table)
	return LoadUnitHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return ability
function LoadAbilityHandleBJ(key, missionKey, table)
	return LoadAbilityHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return timer
function LoadTimerHandleBJ(key, missionKey, table)
	return LoadTimerHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return trigger
function LoadTriggerHandleBJ(key, missionKey, table)
	return LoadTriggerHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return triggercondition
function LoadTriggerConditionHandleBJ(key, missionKey, table)
	return LoadTriggerConditionHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return triggeraction
function LoadTriggerActionHandleBJ(key, missionKey, table)
	return LoadTriggerActionHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return event
function LoadTriggerEventHandleBJ(key, missionKey, table)
	return LoadTriggerEventHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return force
function LoadForceHandleBJ(key, missionKey, table)
	return LoadForceHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return group
function LoadGroupHandleBJ(key, missionKey, table)
	return LoadGroupHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return location
function LoadLocationHandleBJ(key, missionKey, table)
	return LoadLocationHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return rect
function LoadRectHandleBJ(key, missionKey, table)
	return LoadRectHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return boolexpr
function LoadBooleanExprHandleBJ(key, missionKey, table)
	return LoadBooleanExprHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return sound
function LoadSoundHandleBJ(key, missionKey, table)
	return LoadSoundHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return effect
function LoadEffectHandleBJ(key, missionKey, table)
	return LoadEffectHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return unitpool
function LoadUnitPoolHandleBJ(key, missionKey, table)
	return LoadUnitPoolHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return itempool
function LoadItemPoolHandleBJ(key, missionKey, table)
	return LoadItemPoolHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return quest
function LoadQuestHandleBJ(key, missionKey, table)
	return LoadQuestHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return questitem
function LoadQuestItemHandleBJ(key, missionKey, table)
	return LoadQuestItemHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return defeatcondition
function LoadDefeatConditionHandleBJ(key, missionKey, table)
	return LoadDefeatConditionHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return timerdialog
function LoadTimerDialogHandleBJ(key, missionKey, table)
	return LoadTimerDialogHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return leaderboard
function LoadLeaderboardHandleBJ(key, missionKey, table)
	return LoadLeaderboardHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return multiboard
function LoadMultiboardHandleBJ(key, missionKey, table)
	return LoadMultiboardHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return multiboarditem
function LoadMultiboardItemHandleBJ(key, missionKey, table)
	return LoadMultiboardItemHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return trackable
function LoadTrackableHandleBJ(key, missionKey, table)
	return LoadTrackableHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return dialog
function LoadDialogHandleBJ(key, missionKey, table)
	return LoadDialogHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return button
function LoadButtonHandleBJ(key, missionKey, table)
	return LoadButtonHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return texttag
function LoadTextTagHandleBJ(key, missionKey, table)
	return LoadTextTagHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return lightning
function LoadLightningHandleBJ(key, missionKey, table)
	return LoadLightningHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return image
function LoadImageHandleBJ(key, missionKey, table)
	return LoadImageHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return ubersplat
function LoadUbersplatHandleBJ(key, missionKey, table)
	return LoadUbersplatHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return region
function LoadRegionHandleBJ(key, missionKey, table)
	return LoadRegionHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return fogstate
function LoadFogStateHandleBJ(key, missionKey, table)
	return LoadFogStateHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return fogmodifier
function LoadFogModifierHandleBJ(key, missionKey, table)
	return LoadFogModifierHandle(table, missionKey, key)
end

--===========================================================================
---@param key integer
---@param missionKey integer
---@param table hashtable
---@return hashtable
function LoadHashtableHandleBJ(key, missionKey, table)
	return LoadHashtableHandle(table, missionKey, key)
end

--===========================================================================
---@param table hashtable
function FlushParentHashtableBJ(table)
	FlushParentHashtable(table)
end

--===========================================================================
---@param missionKey integer
---@param table hashtable
function FlushChildHashtableBJ(missionKey, table)
	FlushChildHashtable(table, missionKey)
end

--===========================================================================
---@param key integer
---@param valueType integer
---@param missionKey integer
---@param table hashtable
---@return boolean
function HaveSavedValue(key, valueType, missionKey, table)
	if (valueType == bj_HASHTABLE_BOOLEAN) then
		return HaveSavedBoolean(table, missionKey, key)
	elseif (valueType == bj_HASHTABLE_INTEGER) then
		return HaveSavedInteger(table, missionKey, key)
	elseif (valueType == bj_HASHTABLE_REAL) then
		return HaveSavedReal(table, missionKey, key)
	elseif (valueType == bj_HASHTABLE_STRING) then
		return HaveSavedString(table, missionKey, key)
	elseif (valueType == bj_HASHTABLE_HANDLE) then
		return HaveSavedHandle(table, missionKey, key)
	else
		-- Unrecognized value type - ignore the request.
		return false
	end
end