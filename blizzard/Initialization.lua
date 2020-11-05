--***************************************************************************
--*
--*  Blizzard.j Initialization
--*
--***************************************************************************

--===========================================================================
function SetDNCSoundsDawn()
	if bj_useDawnDuskSounds then
		StartSound(bj_dawnSound)
	end
end

--===========================================================================
function SetDNCSoundsDusk()
	if bj_useDawnDuskSounds then
		StartSound(bj_duskSound)
	end
end

--===========================================================================
function SetDNCSoundsDay()
	---@type real
	ToD = GetTimeOfDay()
	
	if (ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK) and not bj_dncIsDaytime then
		bj_dncIsDaytime = true
		
		-- change ambient sounds
		StopSound(bj_nightAmbientSound, false, true)
		StartSound(bj_dayAmbientSound)
	end
end

--===========================================================================
function SetDNCSoundsNight()
	---@type real
	ToD = GetTimeOfDay()
	
	if (ToD < bj_TOD_DAWN or ToD >= bj_TOD_DUSK) and bj_dncIsDaytime then
		bj_dncIsDaytime = false
		
		-- change ambient sounds
		StopSound(bj_dayAmbientSound, false, true)
		StartSound(bj_nightAmbientSound)
	end
end

--===========================================================================
function InitDNCSounds()
	-- Create sounds to be played at dawn and dusk.
	bj_dawnSound     = CreateSoundFromLabel("RoosterSound", false, false, false, 10000, 10000)
	bj_duskSound     = CreateSoundFromLabel("WolfSound", false, false, false, 10000, 10000)
	
	-- Set up triggers to respond to dawn and dusk.
	bj_dncSoundsDawn = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsDawn, GAME_STATE_TIME_OF_DAY, EQUAL, bj_TOD_DAWN)
	TriggerAddAction(bj_dncSoundsDawn, SetDNCSoundsDawn)
	
	bj_dncSoundsDusk = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsDusk, GAME_STATE_TIME_OF_DAY, EQUAL, bj_TOD_DUSK)
	TriggerAddAction(bj_dncSoundsDusk, SetDNCSoundsDusk)
	
	-- Set up triggers to respond to changes from day to night or vice-versa.
	bj_dncSoundsDay = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsDay, GAME_STATE_TIME_OF_DAY, GREATER_THAN_OR_EQUAL, bj_TOD_DAWN)
	TriggerRegisterGameStateEvent(bj_dncSoundsDay, GAME_STATE_TIME_OF_DAY, LESS_THAN, bj_TOD_DUSK)
	TriggerAddAction(bj_dncSoundsDay, SetDNCSoundsDay)
	
	bj_dncSoundsNight = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsNight, GAME_STATE_TIME_OF_DAY, LESS_THAN, bj_TOD_DAWN)
	TriggerRegisterGameStateEvent(bj_dncSoundsNight, GAME_STATE_TIME_OF_DAY, GREATER_THAN_OR_EQUAL, bj_TOD_DUSK)
	TriggerAddAction(bj_dncSoundsNight, SetDNCSoundsNight)
end

--===========================================================================
function InitBlizzardGlobals()
	---@type integer
	index                             = nil
	---@type integer
	userControlledPlayers             = nil
	---@type version
	v                                 = nil
	
	-- Init filter function vars
	filterIssueHauntOrderAtLocBJ      = Filter(IssueHauntOrderAtLocBJFilter)
	filterEnumDestructablesInCircleBJ = Filter(EnumDestructablesInCircleBJFilter)
	filterGetUnitsInRectOfPlayer      = Filter(GetUnitsInRectOfPlayerFilter)
	filterGetUnitsOfTypeIdAll         = Filter(GetUnitsOfTypeIdAllFilter)
	filterGetUnitsOfPlayerAndTypeId   = Filter(GetUnitsOfPlayerAndTypeIdFilter)
	filterMeleeTrainedUnitIsHeroBJ    = Filter(MeleeTrainedUnitIsHeroBJFilter)
	filterLivingPlayerUnitsOfTypeId   = Filter(LivingPlayerUnitsOfTypeIdFilter)
	
	-- Init force presets
	index                             = 0
	while true do
		if index == bj_MAX_PLAYER_SLOTS then break end
		bj_FORCE_PLAYER[index] = CreateForce()
		ForceAddPlayer(bj_FORCE_PLAYER[index], Player(index))
		index = index + 1
	end
	
	bj_FORCE_ALL_PLAYERS = CreateForce()
	ForceEnumPlayers(bj_FORCE_ALL_PLAYERS, nil)
	
	-- Init Cinematic Mode history
	bj_cineModePriorSpeed       = GetGameSpeed()
	bj_cineModePriorFogSetting  = IsFogEnabled()
	bj_cineModePriorMaskSetting = IsFogMaskEnabled()
	
	-- Init Trigger Queue
	index                       = 0
	while true do
		if index >= bj_MAX_QUEUED_TRIGGERS then break end
		bj_queuedExecTriggers[index] = nil
		bj_queuedExecUseConds[index] = false
		index                        = index + 1
	end
	
	-- Init singleplayer check
	bj_isSinglePlayer     = false
	userControlledPlayers = 0
	index                 = 0
	while true do
		if index >= bj_MAX_PLAYERS then break end
		if (GetPlayerController(Player(index)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(index)) == PLAYER_SLOT_STATE_PLAYING) then
			userControlledPlayers = userControlledPlayers + 1
		end
		index = index + 1
	end
	bj_isSinglePlayer         = (userControlledPlayers == 1)
	
	-- Init sounds
	--set bj_pingMinimapSound = CreateSoundFromLabel("AutoCastButtonClick", false, false, false, 10000, 10000)
	bj_rescueSound            = CreateSoundFromLabel("Rescue", false, false, false, 10000, 10000)
	bj_questDiscoveredSound   = CreateSoundFromLabel("QuestNew", false, false, false, 10000, 10000)
	bj_questUpdatedSound      = CreateSoundFromLabel("QuestUpdate", false, false, false, 10000, 10000)
	bj_questCompletedSound    = CreateSoundFromLabel("QuestCompleted", false, false, false, 10000, 10000)
	bj_questFailedSound       = CreateSoundFromLabel("QuestFailed", false, false, false, 10000, 10000)
	bj_questHintSound         = CreateSoundFromLabel("Hint", false, false, false, 10000, 10000)
	bj_questSecretSound       = CreateSoundFromLabel("SecretFound", false, false, false, 10000, 10000)
	bj_questItemAcquiredSound = CreateSoundFromLabel("ItemReward", false, false, false, 10000, 10000)
	bj_questWarningSound      = CreateSoundFromLabel("Warning", false, false, false, 10000, 10000)
	bj_victoryDialogSound     = CreateSoundFromLabel("QuestCompleted", false, false, false, 10000, 10000)
	bj_defeatDialogSound      = CreateSoundFromLabel("QuestFailed", false, false, false, 10000, 10000)
	
	-- Init corpse creation triggers.
	DelayedSuspendDecayCreate()
	
	-- Init version-specific data
	v = VersionGet()
	if (v == VERSION_REIGN_OF_CHAOS) then
		bj_MELEE_MAX_TWINKED_HEROES = bj_MELEE_MAX_TWINKED_HEROES_V0
	else
		bj_MELEE_MAX_TWINKED_HEROES = bj_MELEE_MAX_TWINKED_HEROES_V1
	end
end

--===========================================================================
function InitQueuedTriggers()
	bj_queuedExecTimeout = CreateTrigger()
	TriggerRegisterTimerExpireEvent(bj_queuedExecTimeout, bj_queuedExecTimeoutTimer)
	TriggerAddAction(bj_queuedExecTimeout, QueuedTriggerDoneBJ)
end

--===========================================================================
function InitMapRects()
	bj_mapInitialPlayableArea = Rect(GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT), GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM), GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT), GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP))
	bj_mapInitialCameraBounds = GetCurrentCameraBoundsMapRectBJ()
end

--===========================================================================
function InitSummonableCaps()
	---@type integer
	index = nil
	
	index = 0
	while true do
		-- upgraded units
		-- Note: Only do this if the corresponding upgrade is not yet researched
		-- Barrage - Siege Engines
		if (not GetPlayerTechResearched(Player(index), FourCC('Rhrt'), true)) then
			SetPlayerTechMaxAllowed(Player(index), FourCC('hrtt'), 0)
		end
		
		-- Berserker Upgrade - Troll Berserkers
		if (not GetPlayerTechResearched(Player(index), FourCC('Robk'), true)) then
			SetPlayerTechMaxAllowed(Player(index), FourCC('otbk'), 0)
		end
		
		-- max skeletons per player
		SetPlayerTechMaxAllowed(Player(index), FourCC('uske'), bj_MAX_SKELETONS)
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Update the per-class stock limits.
--
---@param whichItem item
function UpdateStockAvailability(whichItem)
	---@type itemtype
	iType  = GetItemType(whichItem)
	---@type integer
	iLevel = GetItemLevel(whichItem)
	
	-- Update allowed type/level combinations.
	if (iType == ITEM_TYPE_PERMANENT) then
		bj_stockAllowedPermanent[iLevel] = true
	elseif (iType == ITEM_TYPE_CHARGED) then
		bj_stockAllowedCharged[iLevel] = true
	elseif (iType == ITEM_TYPE_ARTIFACT) then
		bj_stockAllowedArtifact[iLevel] = true
	else
		-- Not interested in this item type - ignore the item.
	end
end

--===========================================================================
-- Find a sellable item of the given type and level, and then add it.
--
function UpdateEachStockBuildingEnum()
	---@type integer
	iteration    = 0
	---@type integer
	pickedItemId = nil
	
	while true do
		pickedItemId = ChooseRandomItemEx(bj_stockPickedItemType, bj_stockPickedItemLevel)
		if IsItemIdSellable(pickedItemId) then break end
		
		-- If we get hung up on an entire class/level combo of unsellable
		-- items, or a very unlucky series of random numbers, give up.
		iteration = iteration + 1
		if (iteration > bj_STOCK_MAX_ITERATIONS) then
			return
		end
	end
	AddItemToStock(GetEnumUnit(), pickedItemId, 1, 1)
end

--===========================================================================
---@param iType itemtype
---@param iLevel integer
function UpdateEachStockBuilding(iType, iLevel)
	---@type group
	g                       = nil
	
	bj_stockPickedItemType  = iType
	bj_stockPickedItemLevel = iLevel
	
	g                       = CreateGroup()
	GroupEnumUnitsOfType(g, "marketplace", nil)
	ForGroup(g, UpdateEachStockBuildingEnum)
	DestroyGroup(g)
end

--===========================================================================
-- Update stock inventory.
--
function PerformStockUpdates()
	---@type integer
	pickedItemId        = nil
	---@type itemtype
	pickedItemType      = nil
	---@type integer
	pickedItemLevel     = 0
	---@type integer
	allowedCombinations = 0
	---@type integer
	iLevel              = nil
	
	-- Give each type/level combination a chance of being picked.
	iLevel              = 1
	while true do
		if (bj_stockAllowedPermanent[iLevel]) then
			allowedCombinations = allowedCombinations + 1
			if (GetRandomInt(1, allowedCombinations) == 1) then
				pickedItemType  = ITEM_TYPE_PERMANENT
				pickedItemLevel = iLevel
			end
		end
		if (bj_stockAllowedCharged[iLevel]) then
			allowedCombinations = allowedCombinations + 1
			if (GetRandomInt(1, allowedCombinations) == 1) then
				pickedItemType  = ITEM_TYPE_CHARGED
				pickedItemLevel = iLevel
			end
		end
		if (bj_stockAllowedArtifact[iLevel]) then
			allowedCombinations = allowedCombinations + 1
			if (GetRandomInt(1, allowedCombinations) == 1) then
				pickedItemType  = ITEM_TYPE_ARTIFACT
				pickedItemLevel = iLevel
			end
		end
		
		iLevel = iLevel + 1
		if iLevel > bj_MAX_ITEM_LEVEL then break end
	end
	
	-- Make sure we found a valid item type to add.
	if (allowedCombinations == 0) then
		return
	end
	
	UpdateEachStockBuilding(pickedItemType, pickedItemLevel)
end

--===========================================================================
-- Perform the first update, and then arrange future updates.
--
function StartStockUpdates()
	PerformStockUpdates()
	TimerStart(bj_stockUpdateTimer, bj_STOCK_RESTOCK_INTERVAL, true, PerformStockUpdates)
end

--===========================================================================
function RemovePurchasedItem()
	RemoveItemFromStock(GetSellingUnit(), GetItemTypeId(GetSoldItem()))
end

--===========================================================================
function InitNeutralBuildings()
	---@type integer
	iLevel = nil
	
	-- Chart of allowed stock items.
	iLevel = 0
	while true do
		bj_stockAllowedPermanent[iLevel] = false
		bj_stockAllowedCharged[iLevel]   = false
		bj_stockAllowedArtifact[iLevel]  = false
		iLevel                           = iLevel + 1
		if iLevel > bj_MAX_ITEM_LEVEL then break end
	end
	
	-- Limit stock inventory slots.
	SetAllItemTypeSlots(bj_MAX_STOCK_ITEM_SLOTS)
	SetAllUnitTypeSlots(bj_MAX_STOCK_UNIT_SLOTS)
	
	-- Arrange the first update.
	bj_stockUpdateTimer = CreateTimer()
	TimerStart(bj_stockUpdateTimer, bj_STOCK_RESTOCK_INITIAL_DELAY, false, StartStockUpdates)
	
	-- Set up a trigger to fire whenever an item is sold.
	bj_stockItemPurchased = CreateTrigger()
	TriggerRegisterPlayerUnitEvent(bj_stockItemPurchased, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_UNIT_SELL_ITEM, nil)
	TriggerAddAction(bj_stockItemPurchased, RemovePurchasedItem)
end

--===========================================================================
function MarkGameStarted()
	bj_gameStarted = true
	DestroyTimer(bj_gameStartedTimer)
end

--===========================================================================
function DetectGameStarted()
	bj_gameStartedTimer = CreateTimer()
	TimerStart(bj_gameStartedTimer, bj_GAME_STARTED_THRESHOLD, false, MarkGameStarted)
end

--===========================================================================
function InitBlizzard()
	-- Set up the Neutral Victim player slot, to torture the abandoned units
	-- of defeated players.  Since some triggers expect this player slot to
	-- exist, this is performed for all maps.
	ConfigureNeutralVictim()
	
	InitBlizzardGlobals()
	InitQueuedTriggers()
	InitRescuableBehaviorBJ()
	InitDNCSounds()
	InitMapRects()
	InitSummonableCaps()
	InitNeutralBuildings()
	DetectGameStarted()
end