--============================================================================
-- Trigger Player Based Event API
--============================================================================

---@param whichTrigger trigger
---@param whichPlayer player
---@param whichPlayerEvent playerevent
---@return event
function TriggerRegisterPlayerEvent(whichTrigger, whichPlayer, whichPlayerEvent) end


-- EVENT_PLAYER_DEFEAT
-- EVENT_PLAYER_VICTORY
---@return player
function GetTriggerPlayer() end


---@param whichTrigger trigger
---@param whichPlayer player
---@param whichPlayerUnitEvent playerunitevent
---@param filter boolexpr
---@return event
function TriggerRegisterPlayerUnitEvent(whichTrigger, whichPlayer, whichPlayerUnitEvent, filter) end


-- EVENT_PLAYER_HERO_LEVEL
-- EVENT_UNIT_HERO_LEVEL
---@return unit
function GetLevelingUnit() end


-- EVENT_PLAYER_HERO_SKILL
-- EVENT_UNIT_HERO_SKILL
---@return unit
function GetLearningUnit() end

---@return integer
function GetLearnedSkill() end

---@return integer
function GetLearnedSkillLevel() end


-- EVENT_PLAYER_HERO_REVIVABLE
---@return unit
function GetRevivableUnit() end


-- EVENT_PLAYER_HERO_REVIVE_START
-- EVENT_PLAYER_HERO_REVIVE_CANCEL
-- EVENT_PLAYER_HERO_REVIVE_FINISH
-- EVENT_UNIT_HERO_REVIVE_START
-- EVENT_UNIT_HERO_REVIVE_CANCEL
-- EVENT_UNIT_HERO_REVIVE_FINISH
---@return unit
function GetRevivingUnit() end


-- EVENT_PLAYER_UNIT_ATTACKED
---@return unit
function GetAttacker() end


-- EVENT_PLAYER_UNIT_RESCUED
---@return unit
function GetRescuer() end


-- EVENT_PLAYER_UNIT_DEATH
---@return unit
function GetDyingUnit() end

---@return unit
function GetKillingUnit() end


-- EVENT_PLAYER_UNIT_DECAY
---@return unit
function GetDecayingUnit() end


-- EVENT_PLAYER_UNIT_SELECTED
--  GetSelectedUnit takes nothing returns unit

-- EVENT_PLAYER_UNIT_CONSTRUCT_START
---@return unit
function GetConstructingStructure() end


-- EVENT_PLAYER_UNIT_CONSTRUCT_FINISH
-- EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL
---@return unit
function GetCancelledStructure() end

---@return unit
function GetConstructedStructure() end


-- EVENT_PLAYER_UNIT_RESEARCH_START
-- EVENT_PLAYER_UNIT_RESEARCH_CANCEL
-- EVENT_PLAYER_UNIT_RESEARCH_FINISH
---@return unit
function GetResearchingUnit() end

---@return integer
function GetResearched() end


-- EVENT_PLAYER_UNIT_TRAIN_START
-- EVENT_PLAYER_UNIT_TRAIN_CANCEL
---@return integer
function GetTrainedUnitType() end


-- EVENT_PLAYER_UNIT_TRAIN_FINISH
---@return unit
function GetTrainedUnit() end


-- EVENT_PLAYER_UNIT_DETECTED
---@return unit
function GetDetectedUnit() end


-- EVENT_PLAYER_UNIT_SUMMONED
---@return unit
function GetSummoningUnit() end

---@return unit
function GetSummonedUnit() end


-- EVENT_PLAYER_UNIT_LOADED
---@return unit
function GetTransportUnit() end

---@return unit
function GetLoadedUnit() end


-- EVENT_PLAYER_UNIT_SELL
---@return unit
function GetSellingUnit() end

---@return unit
function GetSoldUnit() end

---@return unit
function GetBuyingUnit() end


-- EVENT_PLAYER_UNIT_SELL_ITEM
---@return item
function GetSoldItem() end


-- EVENT_PLAYER_UNIT_CHANGE_OWNER
---@return unit
function GetChangingUnit() end

---@return player
function GetChangingUnitPrevOwner() end


-- EVENT_PLAYER_UNIT_DROP_ITEM
-- EVENT_PLAYER_UNIT_PICKUP_ITEM
-- EVENT_PLAYER_UNIT_USE_ITEM
---@return unit
function GetManipulatingUnit() end

---@return item
function GetManipulatedItem() end


-- EVENT_PLAYER_UNIT_ISSUED_ORDER
---@return unit
function GetOrderedUnit() end

---@return integer
function GetIssuedOrderId() end


-- EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER
---@return real
function GetOrderPointX() end

---@return real
function GetOrderPointY() end

---@return location
function GetOrderPointLoc() end


-- EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER
---@return widget
function GetOrderTarget() end

---@return destructable
function GetOrderTargetDestructable() end

---@return item
function GetOrderTargetItem() end

---@return unit
function GetOrderTargetUnit() end


-- EVENT_UNIT_SPELL_CHANNEL
-- EVENT_UNIT_SPELL_CAST
-- EVENT_UNIT_SPELL_EFFECT
-- EVENT_UNIT_SPELL_FINISH
-- EVENT_UNIT_SPELL_ENDCAST
-- EVENT_PLAYER_UNIT_SPELL_CHANNEL
-- EVENT_PLAYER_UNIT_SPELL_CAST
-- EVENT_PLAYER_UNIT_SPELL_EFFECT
-- EVENT_PLAYER_UNIT_SPELL_FINISH
-- EVENT_PLAYER_UNIT_SPELL_ENDCAST
---@return unit
function GetSpellAbilityUnit() end

---@return integer
function GetSpellAbilityId() end

---@return ability
function GetSpellAbility() end

---@return location
function GetSpellTargetLoc() end

---@return real
function GetSpellTargetX() end

---@return real
function GetSpellTargetY() end

---@return destructable
function GetSpellTargetDestructable() end

---@return item
function GetSpellTargetItem() end

---@return unit
function GetSpellTargetUnit() end


---@param whichTrigger trigger
---@param whichPlayer player
---@param whichAlliance alliancetype
---@return event
function TriggerRegisterPlayerAllianceChange(whichTrigger, whichPlayer, whichAlliance) end

---@param whichTrigger trigger
---@param whichPlayer player
---@param whichState playerstate
---@param opcode limitop
---@param limitval real
---@return event
function TriggerRegisterPlayerStateEvent(whichTrigger, whichPlayer, whichState, opcode, limitval) end


-- EVENT_PLAYER_STATE_LIMIT
---@return playerstate
function GetEventPlayerState() end


---@param whichTrigger trigger
---@param whichPlayer player
---@param chatMessageToDetect string
---@param exactMatchOnly boolean
---@return event
function TriggerRegisterPlayerChatEvent(whichTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly) end


-- EVENT_PLAYER_CHAT

-- returns the actual string they typed in ( same as what you registered for
-- if you required exact match )
---@return string
function GetEventPlayerChatString() end


-- returns the string that you registered for
---@return string
function GetEventPlayerChatStringMatched() end


---@param whichTrigger trigger
---@param whichWidget widget
---@return event
function TriggerRegisterDeathEvent(whichTrigger, whichWidget) end

-- JAPI Functions
---@return real
function BlzGetTriggerPlayerMouseX() end

---@return real
function BlzGetTriggerPlayerMouseY() end

---@return location
function BlzGetTriggerPlayerMousePosition() end

---@return mousebuttontype
function BlzGetTriggerPlayerMouseButton() end

---@param whichTrigger trigger
---@param whichPlayer player
---@param prefix string
---@param fromServer boolean
---@return event
function BlzTriggerRegisterPlayerSyncEvent(whichTrigger, whichPlayer, prefix, fromServer) end

---@param prefix string
---@param data string
---@return boolean
function BlzSendSyncData(prefix, data) end

---@return string
function BlzGetTriggerSyncPrefix() end

---@return string
function BlzGetTriggerSyncData() end

---@param whichTrigger trigger
---@param whichPlayer player
---@param key oskeytype
---@param metaKey integer
---@param keyDown boolean
---@return event
function BlzTriggerRegisterPlayerKeyEvent(whichTrigger, whichPlayer, key, metaKey, keyDown) end

---@return oskeytype
function BlzGetTriggerPlayerKey() end

---@return integer
function BlzGetTriggerPlayerMetaKey() end

---@return boolean
function BlzGetTriggerPlayerIsKeyDown() end

---@return string
function BlzGetLocale() end