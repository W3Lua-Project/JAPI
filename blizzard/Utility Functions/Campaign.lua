--***************************************************************************
--*
--*  Campaign Utility Functions
--*
--***************************************************************************

---@param campaignNumber integer
function SetCampaignMenuRaceBJ(campaignNumber)
	if (campaignNumber == bj_CAMPAIGN_INDEX_T) then
		SetCampaignMenuRace(RACE_OTHER)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_H) then
		SetCampaignMenuRace(RACE_HUMAN)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_U) then
		SetCampaignMenuRace(RACE_UNDEAD)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_O) then
		SetCampaignMenuRace(RACE_ORC)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_N) then
		SetCampaignMenuRace(RACE_NIGHTELF)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XN) then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XN)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XH) then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XH)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XU) then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XU)
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XO) then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XO)
	else
		-- Unrecognized campaign - ignore the request
	end
end

--===========================================================================
-- Converts a single campaign mission designation into campaign and mission
-- numbers.  The 1000's digit is considered the campaign index, and the 1's
-- digit is considered the mission index within that campaign.  This is done
-- so that the trigger for this can use a single drop-down to list all of
-- the campaign missions.
--
---@param available boolean
---@param missionIndex integer
function SetMissionAvailableBJ(available, missionIndex)
	---@type integer
	campaignNumber = missionIndex / 1000
	---@type integer
	missionNumber  = missionIndex - campaignNumber * 1000
	
	SetMissionAvailable(campaignNumber, missionNumber, available)
end

--===========================================================================
---@param available boolean
---@param campaignNumber integer
function SetCampaignAvailableBJ(available, campaignNumber)
	---@type integer
	campaignOffset = nil
	
	if (campaignNumber == bj_CAMPAIGN_INDEX_H) then
		SetTutorialCleared(true)
	end
	
	if (campaignNumber == bj_CAMPAIGN_INDEX_XN) then
		campaignOffset = bj_CAMPAIGN_OFFSET_XN
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XH) then
		campaignOffset = bj_CAMPAIGN_OFFSET_XH
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XU) then
		campaignOffset = bj_CAMPAIGN_OFFSET_XU
	elseif (campaignNumber == bj_CAMPAIGN_INDEX_XO) then
		campaignOffset = bj_CAMPAIGN_OFFSET_XO
	else
		campaignOffset = campaignNumber
	end
	
	SetCampaignAvailable(campaignOffset, available)
	SetCampaignMenuRaceBJ(campaignNumber)
	ForceCampaignSelectScreen()
end

--===========================================================================
---@param available boolean
---@param cinematicIndex integer
function SetCinematicAvailableBJ(available, cinematicIndex)
	if (cinematicIndex == bj_CINEMATICINDEX_TOP) then
		SetOpCinematicAvailable(bj_CAMPAIGN_INDEX_T, available)
		PlayCinematic("TutorialOp")
	elseif (cinematicIndex == bj_CINEMATICINDEX_HOP) then
		SetOpCinematicAvailable(bj_CAMPAIGN_INDEX_H, available)
		PlayCinematic("HumanOp")
	elseif (cinematicIndex == bj_CINEMATICINDEX_HED) then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_H, available)
		PlayCinematic("HumanEd")
	elseif (cinematicIndex == bj_CINEMATICINDEX_OOP) then
		SetOpCinematicAvailable(bj_CAMPAIGN_INDEX_O, available)
		PlayCinematic("OrcOp")
	elseif (cinematicIndex == bj_CINEMATICINDEX_OED) then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_O, available)
		PlayCinematic("OrcEd")
	elseif (cinematicIndex == bj_CINEMATICINDEX_UOP) then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_U, available)
		PlayCinematic("UndeadOp")
	elseif (cinematicIndex == bj_CINEMATICINDEX_UED) then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_U, available)
		PlayCinematic("UndeadEd")
	elseif (cinematicIndex == bj_CINEMATICINDEX_NOP) then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_N, available)
		PlayCinematic("NightElfOp")
	elseif (cinematicIndex == bj_CINEMATICINDEX_NED) then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_N, available)
		PlayCinematic("NightElfEd")
	elseif (cinematicIndex == bj_CINEMATICINDEX_XOP) then
		SetOpCinematicAvailable(bj_CAMPAIGN_OFFSET_XN, available)
		PlayCinematic("IntroX")
	elseif (cinematicIndex == bj_CINEMATICINDEX_XED) then
		SetEdCinematicAvailable(bj_CAMPAIGN_OFFSET_XU, available)
		PlayCinematic("OutroX")
	else
		-- Unrecognized cinematic - ignore the request.
	end
end

--===========================================================================
---@param campaignFile string
---@return gamecache
function InitGameCacheBJ(campaignFile)
	bj_lastCreatedGameCache = InitGameCache(campaignFile)
	return bj_lastCreatedGameCache
end

--===========================================================================
---@param cache gamecache
---@return boolean
function SaveGameCacheBJ(cache)
	return SaveGameCache(cache)
end

--===========================================================================
---@return gamecache
function GetLastCreatedGameCacheBJ()
	return bj_lastCreatedGameCache
end

--===========================================================================
---@param value real
---@param key string
---@param missionKey string
---@param cache gamecache
function StoreRealBJ(value, key, missionKey, cache)
	StoreReal(cache, missionKey, key, value)
end

--===========================================================================
---@param value integer
---@param key string
---@param missionKey string
---@param cache gamecache
function StoreIntegerBJ(value, key, missionKey, cache)
	StoreInteger(cache, missionKey, key, value)
end

--===========================================================================
---@param value boolean
---@param key string
---@param missionKey string
---@param cache gamecache
function StoreBooleanBJ(value, key, missionKey, cache)
	StoreBoolean(cache, missionKey, key, value)
end

--===========================================================================
---@param value string
---@param key string
---@param missionKey string
---@param cache gamecache
---@return boolean
function StoreStringBJ(value, key, missionKey, cache)
	return StoreString(cache, missionKey, key, value)
end

--===========================================================================
---@param whichUnit unit
---@param key string
---@param missionKey string
---@param cache gamecache
---@return boolean
function StoreUnitBJ(whichUnit, key, missionKey, cache)
	return StoreUnit(cache, missionKey, key, whichUnit)
end

--===========================================================================
---@param key string
---@param missionKey string
---@param cache gamecache
---@param forWhichPlayer player
---@param loc location
---@param facing real
---@return unit
function RestoreUnitLocFacingAngleBJ(key, missionKey, cache, forWhichPlayer, loc, facing)
	--call SyncStoredUnit(cache, missionKey, key)
	bj_lastLoadedUnit = RestoreUnit(cache, missionKey, key, forWhichPlayer, GetLocationX(loc), GetLocationY(loc), facing)
	return bj_lastLoadedUnit
end

--===========================================================================
---@param key string
---@param missionKey string
---@param cache gamecache
---@param forWhichPlayer player
---@param loc location
---@param lookAt location
---@return unit
function RestoreUnitLocFacingPointBJ(key, missionKey, cache, forWhichPlayer, loc, lookAt)
	--call SyncStoredUnit(cache, missionKey, key)
	return RestoreUnitLocFacingAngleBJ(key, missionKey, cache, forWhichPlayer, loc, AngleBetweenPoints(loc, lookAt))
end

--===========================================================================
---@return unit
function GetLastRestoredUnitBJ()
	return bj_lastLoadedUnit
end

--===========================================================================
---@param cache gamecache
function FlushGameCacheBJ(cache)
	FlushGameCache(cache)
end

--===========================================================================
---@param missionKey string
---@param cache gamecache
function FlushStoredMissionBJ(missionKey, cache)
	FlushStoredMission(cache, missionKey)
end

--===========================================================================
---@param key string
---@param valueType integer
---@param missionKey string
---@param cache gamecache
---@return boolean
function HaveStoredValue(key, valueType, missionKey, cache)
	if (valueType == bj_GAMECACHE_BOOLEAN) then
		return HaveStoredBoolean(cache, missionKey, key)
	elseif (valueType == bj_GAMECACHE_INTEGER) then
		return HaveStoredInteger(cache, missionKey, key)
	elseif (valueType == bj_GAMECACHE_REAL) then
		return HaveStoredReal(cache, missionKey, key)
	elseif (valueType == bj_GAMECACHE_UNIT) then
		return HaveStoredUnit(cache, missionKey, key)
	elseif (valueType == bj_GAMECACHE_STRING) then
		return HaveStoredString(cache, missionKey, key)
	else
		-- Unrecognized value type - ignore the request.
		return false
	end
end

--===========================================================================
---@param show boolean
---@param whichButton integer
function ShowCustomCampaignButton(show, whichButton)
	SetCustomCampaignButtonVisible(whichButton - 1, show)
end

--===========================================================================
---@param whichButton integer
---@return boolean
function IsCustomCampaignButtonVisibile(whichButton)
	return GetCustomCampaignButtonVisible(whichButton - 1)
end

--===========================================================================
---@param loadFileName string
---@param doScoreScreen boolean
function LoadGameBJ(loadFileName, doScoreScreen)
	LoadGame(loadFileName, doScoreScreen)
end

--===========================================================================
---@param saveFileName string
---@param newLevel string
---@param doScoreScreen boolean
function SaveAndChangeLevelBJ(saveFileName, newLevel, doScoreScreen)
	SaveGame(saveFileName)
	ChangeLevel(newLevel, doScoreScreen)
end

--===========================================================================
---@param saveFileName string
---@param loadFileName string
---@param doScoreScreen boolean
function SaveAndLoadGameBJ(saveFileName, loadFileName, doScoreScreen)
	SaveGame(saveFileName)
	LoadGame(loadFileName, doScoreScreen)
end

--===========================================================================
---@param sourceDirName string
---@param destDirName string
---@return boolean
function RenameSaveDirectoryBJ(sourceDirName, destDirName)
	return RenameSaveDirectory(sourceDirName, destDirName)
end

--===========================================================================
---@param sourceDirName string
---@return boolean
function RemoveSaveDirectoryBJ(sourceDirName)
	return RemoveSaveDirectory(sourceDirName)
end

--===========================================================================
---@param sourceSaveName string
---@param destSaveName string
---@return boolean
function CopySaveGameBJ(sourceSaveName, destSaveName)
	return CopySaveGame(sourceSaveName, destSaveName)
end