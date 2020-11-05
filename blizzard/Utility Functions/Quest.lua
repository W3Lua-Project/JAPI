--***************************************************************************
--*
--*  Quest Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param questType integer
---@param title string
---@param description string
---@param iconPath string
---@return quest
function CreateQuestBJ(questType, title, description, iconPath)
	---@type boolean
	required            = (questType == bj_QUESTTYPE_REQ_DISCOVERED) or (questType == bj_QUESTTYPE_REQ_UNDISCOVERED)
	---@type boolean
	discovered          = (questType == bj_QUESTTYPE_REQ_DISCOVERED) or (questType == bj_QUESTTYPE_OPT_DISCOVERED)
	
	bj_lastCreatedQuest = CreateQuest()
	QuestSetTitle(bj_lastCreatedQuest, title)
	QuestSetDescription(bj_lastCreatedQuest, description)
	QuestSetIconPath(bj_lastCreatedQuest, iconPath)
	QuestSetRequired(bj_lastCreatedQuest, required)
	QuestSetDiscovered(bj_lastCreatedQuest, discovered)
	QuestSetCompleted(bj_lastCreatedQuest, false)
	return bj_lastCreatedQuest
end

--===========================================================================
---@param whichQuest quest
function DestroyQuestBJ(whichQuest)
	DestroyQuest(whichQuest)
end

--===========================================================================
---@param enabled boolean
---@param whichQuest quest
function QuestSetEnabledBJ(enabled, whichQuest)
	QuestSetEnabled(whichQuest, enabled)
end

--===========================================================================
---@param whichQuest quest
---@param title string
function QuestSetTitleBJ(whichQuest, title)
	QuestSetTitle(whichQuest, title)
end

--===========================================================================
---@param whichQuest quest
---@param description string
function QuestSetDescriptionBJ(whichQuest, description)
	QuestSetDescription(whichQuest, description)
end

--===========================================================================
---@param whichQuest quest
---@param completed boolean
function QuestSetCompletedBJ(whichQuest, completed)
	QuestSetCompleted(whichQuest, completed)
end

--===========================================================================
---@param whichQuest quest
---@param failed boolean
function QuestSetFailedBJ(whichQuest, failed)
	QuestSetFailed(whichQuest, failed)
end

--===========================================================================
---@param whichQuest quest
---@param discovered boolean
function QuestSetDiscoveredBJ(whichQuest, discovered)
	QuestSetDiscovered(whichQuest, discovered)
end

--===========================================================================
---@return quest
function GetLastCreatedQuestBJ()
	return bj_lastCreatedQuest
end

--===========================================================================
---@param whichQuest quest
---@param description string
---@return questitem
function CreateQuestItemBJ(whichQuest, description)
	bj_lastCreatedQuestItem = QuestCreateItem(whichQuest)
	QuestItemSetDescription(bj_lastCreatedQuestItem, description)
	QuestItemSetCompleted(bj_lastCreatedQuestItem, false)
	return bj_lastCreatedQuestItem
end

--===========================================================================
---@param whichQuestItem questitem
---@param description string
function QuestItemSetDescriptionBJ(whichQuestItem, description)
	QuestItemSetDescription(whichQuestItem, description)
end

--===========================================================================
---@param whichQuestItem questitem
---@param completed boolean
function QuestItemSetCompletedBJ(whichQuestItem, completed)
	QuestItemSetCompleted(whichQuestItem, completed)
end

--===========================================================================
---@return questitem
function GetLastCreatedQuestItemBJ()
	return bj_lastCreatedQuestItem
end

--===========================================================================
---@param description string
---@return defeatcondition
function CreateDefeatConditionBJ(description)
	bj_lastCreatedDefeatCondition = CreateDefeatCondition()
	DefeatConditionSetDescription(bj_lastCreatedDefeatCondition, description)
	return bj_lastCreatedDefeatCondition
end

--===========================================================================
---@param whichCondition defeatcondition
function DestroyDefeatConditionBJ(whichCondition)
	DestroyDefeatCondition(whichCondition)
end

--===========================================================================
---@param whichCondition defeatcondition
---@param description string
function DefeatConditionSetDescriptionBJ(whichCondition, description)
	DefeatConditionSetDescription(whichCondition, description)
end

--===========================================================================
---@return defeatcondition
function GetLastCreatedDefeatConditionBJ()
	return bj_lastCreatedDefeatCondition
end

--===========================================================================
function FlashQuestDialogButtonBJ()
	FlashQuestDialogButton()
end

--===========================================================================
---@param f force
---@param messageType integer
---@param message string
function QuestMessageBJ(f, messageType, message)
	if (IsPlayerInForce(GetLocalPlayer(), f)) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		
		if (messageType == bj_QUESTMESSAGE_DISCOVERED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUEST, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUEST, message)
			StartSound(bj_questDiscoveredSound)
			FlashQuestDialogButton()
		
		elseif (messageType == bj_QUESTMESSAGE_UPDATED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTUPDATE, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTUPDATE, message)
			StartSound(bj_questUpdatedSound)
			FlashQuestDialogButton()
		
		elseif (messageType == bj_QUESTMESSAGE_COMPLETED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTDONE, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTDONE, message)
			StartSound(bj_questCompletedSound)
			FlashQuestDialogButton()
		
		elseif (messageType == bj_QUESTMESSAGE_FAILED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTFAILED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTFAILED, message)
			StartSound(bj_questFailedSound)
			FlashQuestDialogButton()
		
		elseif (messageType == bj_QUESTMESSAGE_REQUIREMENT) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTREQUIREMENT, message)
		
		elseif (messageType == bj_QUESTMESSAGE_MISSIONFAILED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_MISSIONFAILED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_MISSIONFAILED, message)
			StartSound(bj_questFailedSound)
		
		elseif (messageType == bj_QUESTMESSAGE_HINT) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_HINT, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_HINT, message)
			StartSound(bj_questHintSound)
		
		elseif (messageType == bj_QUESTMESSAGE_ALWAYSHINT) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, message)
			StartSound(bj_questHintSound)
		
		elseif (messageType == bj_QUESTMESSAGE_SECRET) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_SECRET, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_SECRET, message)
			StartSound(bj_questSecretSound)
		
		elseif (messageType == bj_QUESTMESSAGE_UNITACQUIRED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITACQUIRED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITACQUIRED, message)
			StartSound(bj_questHintSound)
		
		elseif (messageType == bj_QUESTMESSAGE_UNITAVAILABLE) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITAVAILABLE, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITAVAILABLE, message)
			StartSound(bj_questHintSound)
		
		elseif (messageType == bj_QUESTMESSAGE_ITEMACQUIRED) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ITEMACQUIRED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ITEMACQUIRED, message)
			StartSound(bj_questItemAcquiredSound)
		
		elseif (messageType == bj_QUESTMESSAGE_WARNING) then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_WARNING, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_WARNING, message)
			StartSound(bj_questWarningSound)
		
		else
			-- Unrecognized message type - ignore the request.
		end
	end
end