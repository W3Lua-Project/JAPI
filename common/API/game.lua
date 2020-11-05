--============================================================================
-- Game API
---@return version
function VersionGet() end

---@param whichVersion version
---@return boolean
function VersionCompatible(whichVersion) end

---@param whichVersion version
---@return boolean
function VersionSupported(whichVersion) end


---@param doScoreScreen boolean
function EndGame(doScoreScreen) end


-- Async only!
---@param newLevel string
---@param doScoreScreen boolean
function ChangeLevel(newLevel, doScoreScreen) end

---@param doScoreScreen boolean
function RestartGame(doScoreScreen) end

function ReloadGame() end

-- %%% SetCampaignMenuRace is deprecated.  It must remain to support
-- old maps which use it, but all new maps should use SetCampaignMenuRaceEx
---@param r race
function SetCampaignMenuRace(r) end

---@param campaignIndex integer
function SetCampaignMenuRaceEx(campaignIndex) end

function ForceCampaignSelectScreen() end


---@param saveFileName string
---@param doScoreScreen boolean
function LoadGame(saveFileName, doScoreScreen) end

---@param saveFileName string
function SaveGame(saveFileName) end

---@param sourceDirName string
---@param destDirName string
---@return boolean
function RenameSaveDirectory(sourceDirName, destDirName) end

---@param sourceDirName string
---@return boolean
function RemoveSaveDirectory(sourceDirName) end

---@param sourceSaveName string
---@param destSaveName string
---@return boolean
function CopySaveGame(sourceSaveName, destSaveName) end

---@param saveName string
---@return boolean
function SaveGameExists(saveName) end

function SyncSelections() end

---@param whichFloatGameState fgamestate
---@param value real
function SetFloatGameState(whichFloatGameState, value) end

---@param whichFloatGameState fgamestate
---@return real
function GetFloatGameState(whichFloatGameState) end

---@param whichIntegerGameState igamestate
---@param value integer
function SetIntegerGameState(whichIntegerGameState, value) end

---@param whichIntegerGameState igamestate
---@return integer
function GetIntegerGameState(whichIntegerGameState) end

---@param TOCFile string
---@return boolean
function BlzLoadTOCFile(TOCFile) end