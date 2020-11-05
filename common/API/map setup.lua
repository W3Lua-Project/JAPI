--============================================================================
-- Map Setup API
--
--  These are  functions for describing the map configuration
--  these funcs should only be used in the "config" function of
--  a map script. The functions should also be called in this order
--  ( i.e. call SetPlayers before SetPlayerColor...
--

---@param name string
function SetMapName(name) end

---@param description string
function SetMapDescription(description) end


---@param teamcount integer
function SetTeams(teamcount) end

---@param playercount integer
function SetPlayers(playercount) end


---@param whichStartLoc integer
---@param x real
---@param y real
function DefineStartLocation(whichStartLoc, x, y) end

---@param whichStartLoc integer
---@param whichLocation location
function DefineStartLocationLoc(whichStartLoc, whichLocation) end

---@param whichStartLoc integer
---@param prioSlotCount integer
function SetStartLocPrioCount(whichStartLoc, prioSlotCount) end

---@param whichStartLoc integer
---@param prioSlotIndex integer
---@param otherStartLocIndex integer
---@param priority startlocprio
function SetStartLocPrio(whichStartLoc, prioSlotIndex, otherStartLocIndex, priority) end

---@param whichStartLoc integer
---@param prioSlotIndex integer
---@return integer
function GetStartLocPrioSlot(whichStartLoc, prioSlotIndex) end

---@param whichStartLoc integer
---@param prioSlotIndex integer
---@return startlocprio
function GetStartLocPrio(whichStartLoc, prioSlotIndex) end


---@param whichGameType gametype
---@param value boolean
function SetGameTypeSupported(whichGameType, value) end

---@param whichMapFlag mapflag
---@param value boolean
function SetMapFlag(whichMapFlag, value) end

---@param whichPlacementType placement
function SetGamePlacement(whichPlacementType) end

---@param whichspeed gamespeed
function SetGameSpeed(whichspeed) end

---@param whichdifficulty gamedifficulty
function SetGameDifficulty(whichdifficulty) end

---@param whichdensity mapdensity
function SetResourceDensity(whichdensity) end

---@param whichdensity mapdensity
function SetCreatureDensity(whichdensity) end


---@return integer
function GetTeams() end

---@return integer
function GetPlayers() end


---@param whichGameType gametype
---@return boolean
function IsGameTypeSupported(whichGameType) end

---@return gametype
function GetGameTypeSelected() end

---@param whichMapFlag mapflag
---@return boolean
function IsMapFlagSet(whichMapFlag) end


---@return placement
function GetGamePlacement() end

---@return gamespeed
function GetGameSpeed() end

---@return gamedifficulty
function GetGameDifficulty() end

---@return mapdensity
function GetResourceDensity() end

---@return mapdensity
function GetCreatureDensity() end

---@param whichStartLocation integer
---@return real
function GetStartLocationX(whichStartLocation) end

---@param whichStartLocation integer
---@return real
function GetStartLocationY(whichStartLocation) end

---@param whichStartLocation integer
---@return location
function GetStartLocationLoc(whichStartLocation) end



---@param whichPlayer player
---@param whichTeam integer
function SetPlayerTeam(whichPlayer, whichTeam) end

---@param whichPlayer player
---@param startLocIndex integer
function SetPlayerStartLocation(whichPlayer, startLocIndex) end

-- forces player to have the specified start loc and marks the start loc as occupied
-- which removes it from consideration for subsequently placed players
-- ( i.e. you can use this to put people in a fixed loc and then
--   use random placement for any unplaced players etc )
---@param whichPlayer player
---@param startLocIndex integer
function ForcePlayerStartLocation(whichPlayer, startLocIndex) end

---@param whichPlayer player
---@param color playercolor
function SetPlayerColor(whichPlayer, color) end

---@param sourcePlayer player
---@param otherPlayer player
---@param whichAllianceSetting alliancetype
---@param value boolean
function SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value) end

---@param sourcePlayer player
---@param otherPlayer player
---@param whichResource playerstate
---@param rate integer
function SetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource, rate) end

---@param whichPlayer player
---@param whichRacePreference racepreference
function SetPlayerRacePreference(whichPlayer, whichRacePreference) end

---@param whichPlayer player
---@param value boolean
function SetPlayerRaceSelectable(whichPlayer, value) end

---@param whichPlayer player
---@param controlType mapcontrol
function SetPlayerController(whichPlayer, controlType) end

---@param whichPlayer player
---@param name string
function SetPlayerName(whichPlayer, name) end


---@param whichPlayer player
---@param flag boolean
function SetPlayerOnScoreScreen(whichPlayer, flag) end


---@param whichPlayer player
---@return integer
function GetPlayerTeam(whichPlayer) end

---@param whichPlayer player
---@return integer
function GetPlayerStartLocation(whichPlayer) end

---@param whichPlayer player
---@return playercolor
function GetPlayerColor(whichPlayer) end

---@param whichPlayer player
---@return boolean
function GetPlayerSelectable(whichPlayer) end

---@param whichPlayer player
---@return mapcontrol
function GetPlayerController(whichPlayer) end

---@param whichPlayer player
---@return playerslotstate
function GetPlayerSlotState(whichPlayer) end

---@param sourcePlayer player
---@param otherPlayer player
---@param whichResource playerstate
---@return integer
function GetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource) end

---@param whichPlayer player
---@param pref racepreference
---@return boolean
function IsPlayerRacePrefSet(whichPlayer, pref) end

---@param whichPlayer player
---@return string
function GetPlayerName(whichPlayer) end