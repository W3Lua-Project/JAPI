--============================================================================
-- Campaign API
---@param cleared boolean
function SetTutorialCleared(cleared) end

---@param campaignNumber integer
---@param missionNumber integer
---@param available boolean
function SetMissionAvailable(campaignNumber, missionNumber, available) end

---@param campaignNumber integer
---@param available boolean
function SetCampaignAvailable(campaignNumber, available) end

---@param campaignNumber integer
---@param available boolean
function SetOpCinematicAvailable(campaignNumber, available) end

---@param campaignNumber integer
---@param available boolean
function SetEdCinematicAvailable(campaignNumber, available) end

---@return gamedifficulty
function GetDefaultDifficulty() end

---@param g gamedifficulty
function SetDefaultDifficulty(g) end

---@param whichButton integer
---@param visible boolean
function SetCustomCampaignButtonVisible(whichButton, visible) end

---@param whichButton integer
---@return boolean
function GetCustomCampaignButtonVisible(whichButton) end

function DoNotSaveReplay() end