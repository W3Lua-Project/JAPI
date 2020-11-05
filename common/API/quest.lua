--============================================================================
-- Quest API
---@return quest
function CreateQuest() end

---@param whichQuest quest
function DestroyQuest(whichQuest) end

---@param whichQuest quest
---@param title string
function QuestSetTitle(whichQuest, title) end

---@param whichQuest quest
---@param description string
function QuestSetDescription(whichQuest, description) end

---@param whichQuest quest
---@param iconPath string
function QuestSetIconPath(whichQuest, iconPath) end


---@param whichQuest quest
---@param required boolean
function QuestSetRequired(whichQuest, required) end

---@param whichQuest quest
---@param completed boolean
function QuestSetCompleted(whichQuest, completed) end

---@param whichQuest quest
---@param discovered boolean
function QuestSetDiscovered(whichQuest, discovered) end

---@param whichQuest quest
---@param failed boolean
function QuestSetFailed(whichQuest, failed) end

---@param whichQuest quest
---@param enabled boolean
function QuestSetEnabled(whichQuest, enabled) end


---@param whichQuest quest
---@return boolean
function IsQuestRequired(whichQuest) end

---@param whichQuest quest
---@return boolean
function IsQuestCompleted(whichQuest) end

---@param whichQuest quest
---@return boolean
function IsQuestDiscovered(whichQuest) end

---@param whichQuest quest
---@return boolean
function IsQuestFailed(whichQuest) end

---@param whichQuest quest
---@return boolean
function IsQuestEnabled(whichQuest) end


---@param whichQuest quest
---@return questitem
function QuestCreateItem(whichQuest) end

---@param whichQuestItem questitem
---@param description string
function QuestItemSetDescription(whichQuestItem, description) end

---@param whichQuestItem questitem
---@param completed boolean
function QuestItemSetCompleted(whichQuestItem, completed) end


---@param whichQuestItem questitem
---@return boolean
function IsQuestItemCompleted(whichQuestItem) end


---@return defeatcondition
function CreateDefeatCondition() end

---@param whichCondition defeatcondition
function DestroyDefeatCondition(whichCondition) end

---@param whichCondition defeatcondition
---@param description string
function DefeatConditionSetDescription(whichCondition, description) end


function FlashQuestDialogButton() end

function ForceQuestDialogUpdate() end