---@return hashtable
function InitHashtable() end


---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param value integer
function SaveInteger(table, parentKey, childKey, value) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param value real
function SaveReal(table, parentKey, childKey, value) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param value boolean
function SaveBoolean(table, parentKey, childKey, value) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param value string
---@return boolean
function SaveStr(table, parentKey, childKey, value) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichPlayer player
---@return boolean
function SavePlayerHandle(table, parentKey, childKey, whichPlayer) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichWidget widget
---@return boolean
function SaveWidgetHandle(table, parentKey, childKey, whichWidget) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichDestructable destructable
---@return boolean
function SaveDestructableHandle(table, parentKey, childKey, whichDestructable) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichItem item
---@return boolean
function SaveItemHandle(table, parentKey, childKey, whichItem) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichUnit unit
---@return boolean
function SaveUnitHandle(table, parentKey, childKey, whichUnit) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichAbility ability
---@return boolean
function SaveAbilityHandle(table, parentKey, childKey, whichAbility) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTimer timer
---@return boolean
function SaveTimerHandle(table, parentKey, childKey, whichTimer) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTrigger trigger
---@return boolean
function SaveTriggerHandle(table, parentKey, childKey, whichTrigger) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTriggercondition triggercondition
---@return boolean
function SaveTriggerConditionHandle(table, parentKey, childKey, whichTriggercondition) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTriggeraction triggeraction
---@return boolean
function SaveTriggerActionHandle(table, parentKey, childKey, whichTriggeraction) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichEvent event
---@return boolean
function SaveTriggerEventHandle(table, parentKey, childKey, whichEvent) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichForce force
---@return boolean
function SaveForceHandle(table, parentKey, childKey, whichForce) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichGroup group
---@return boolean
function SaveGroupHandle(table, parentKey, childKey, whichGroup) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichLocation location
---@return boolean
function SaveLocationHandle(table, parentKey, childKey, whichLocation) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichRect rect
---@return boolean
function SaveRectHandle(table, parentKey, childKey, whichRect) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichBoolexpr boolexpr
---@return boolean
function SaveBooleanExprHandle(table, parentKey, childKey, whichBoolexpr) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichSound sound
---@return boolean
function SaveSoundHandle(table, parentKey, childKey, whichSound) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichEffect effect
---@return boolean
function SaveEffectHandle(table, parentKey, childKey, whichEffect) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichUnitpool unitpool
---@return boolean
function SaveUnitPoolHandle(table, parentKey, childKey, whichUnitpool) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichItempool itempool
---@return boolean
function SaveItemPoolHandle(table, parentKey, childKey, whichItempool) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichQuest quest
---@return boolean
function SaveQuestHandle(table, parentKey, childKey, whichQuest) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichQuestitem questitem
---@return boolean
function SaveQuestItemHandle(table, parentKey, childKey, whichQuestitem) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichDefeatcondition defeatcondition
---@return boolean
function SaveDefeatConditionHandle(table, parentKey, childKey, whichDefeatcondition) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTimerdialog timerdialog
---@return boolean
function SaveTimerDialogHandle(table, parentKey, childKey, whichTimerdialog) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichLeaderboard leaderboard
---@return boolean
function SaveLeaderboardHandle(table, parentKey, childKey, whichLeaderboard) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichMultiboard multiboard
---@return boolean
function SaveMultiboardHandle(table, parentKey, childKey, whichMultiboard) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichMultiboarditem multiboarditem
---@return boolean
function SaveMultiboardItemHandle(table, parentKey, childKey, whichMultiboarditem) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTrackable trackable
---@return boolean
function SaveTrackableHandle(table, parentKey, childKey, whichTrackable) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichDialog dialog
---@return boolean
function SaveDialogHandle(table, parentKey, childKey, whichDialog) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichButton button
---@return boolean
function SaveButtonHandle(table, parentKey, childKey, whichButton) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichTexttag texttag
---@return boolean
function SaveTextTagHandle(table, parentKey, childKey, whichTexttag) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichLightning lightning
---@return boolean
function SaveLightningHandle(table, parentKey, childKey, whichLightning) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichImage image
---@return boolean
function SaveImageHandle(table, parentKey, childKey, whichImage) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichUbersplat ubersplat
---@return boolean
function SaveUbersplatHandle(table, parentKey, childKey, whichUbersplat) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichRegion region
---@return boolean
function SaveRegionHandle(table, parentKey, childKey, whichRegion) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichFogState fogstate
---@return boolean
function SaveFogStateHandle(table, parentKey, childKey, whichFogState) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichFogModifier fogmodifier
---@return boolean
function SaveFogModifierHandle(table, parentKey, childKey, whichFogModifier) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichAgent agent
---@return boolean
function SaveAgentHandle(table, parentKey, childKey, whichAgent) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichHashtable hashtable
---@return boolean
function SaveHashtableHandle(table, parentKey, childKey, whichHashtable) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@param whichFrameHandle framehandle
---@return boolean
function SaveFrameHandle(table, parentKey, childKey, whichFrameHandle) end



---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return integer
function LoadInteger(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return real
function LoadReal(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolean
function LoadBoolean(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return string
function LoadStr(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return player
function LoadPlayerHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return widget
function LoadWidgetHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return destructable
function LoadDestructableHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return item
function LoadItemHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return unit
function LoadUnitHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return ability
function LoadAbilityHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return timer
function LoadTimerHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return trigger
function LoadTriggerHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return triggercondition
function LoadTriggerConditionHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return triggeraction
function LoadTriggerActionHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return event
function LoadTriggerEventHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return force
function LoadForceHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return group
function LoadGroupHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return location
function LoadLocationHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return rect
function LoadRectHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolexpr
function LoadBooleanExprHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return sound
function LoadSoundHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return effect
function LoadEffectHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return unitpool
function LoadUnitPoolHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return itempool
function LoadItemPoolHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return quest
function LoadQuestHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return questitem
function LoadQuestItemHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return defeatcondition
function LoadDefeatConditionHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return timerdialog
function LoadTimerDialogHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return leaderboard
function LoadLeaderboardHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return multiboard
function LoadMultiboardHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return multiboarditem
function LoadMultiboardItemHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return trackable
function LoadTrackableHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return dialog
function LoadDialogHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return button
function LoadButtonHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return texttag
function LoadTextTagHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return lightning
function LoadLightningHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return image
function LoadImageHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return ubersplat
function LoadUbersplatHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return region
function LoadRegionHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return fogstate
function LoadFogStateHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return fogmodifier
function LoadFogModifierHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return hashtable
function LoadHashtableHandle(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return framehandle
function LoadFrameHandle(table, parentKey, childKey) end


---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolean
function HaveSavedInteger(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolean
function HaveSavedReal(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolean
function HaveSavedBoolean(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolean
function HaveSavedString(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
---@return boolean
function HaveSavedHandle(table, parentKey, childKey) end


---@param table hashtable
---@param parentKey integer
---@param childKey integer
function RemoveSavedInteger(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
function RemoveSavedReal(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
function RemoveSavedBoolean(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
function RemoveSavedString(table, parentKey, childKey) end

---@param table hashtable
---@param parentKey integer
---@param childKey integer
function RemoveSavedHandle(table, parentKey, childKey) end


---@param table hashtable
function FlushParentHashtable(table) end

---@param table hashtable
---@param parentKey integer
function FlushChildHashtable(table, parentKey) end