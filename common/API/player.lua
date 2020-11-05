--============================================================================
-- Player API
---@param number integer
---@return player
function Player(number) end

---@return player
function GetLocalPlayer() end

---@param whichPlayer player
---@param otherPlayer player
---@return boolean
function IsPlayerAlly(whichPlayer, otherPlayer) end

---@param whichPlayer player
---@param otherPlayer player
---@return boolean
function IsPlayerEnemy(whichPlayer, otherPlayer) end

---@param whichPlayer player
---@param whichForce force
---@return boolean
function IsPlayerInForce(whichPlayer, whichForce) end

---@param whichPlayer player
---@return boolean
function IsPlayerObserver(whichPlayer) end

---@param x real
---@param y real
---@param whichPlayer player
---@return boolean
function IsVisibleToPlayer(x, y, whichPlayer) end

---@param whichLocation location
---@param whichPlayer player
---@return boolean
function IsLocationVisibleToPlayer(whichLocation, whichPlayer) end

---@param x real
---@param y real
---@param whichPlayer player
---@return boolean
function IsFoggedToPlayer(x, y, whichPlayer) end

---@param whichLocation location
---@param whichPlayer player
---@return boolean
function IsLocationFoggedToPlayer(whichLocation, whichPlayer) end

---@param x real
---@param y real
---@param whichPlayer player
---@return boolean
function IsMaskedToPlayer(x, y, whichPlayer) end

---@param whichLocation location
---@param whichPlayer player
---@return boolean
function IsLocationMaskedToPlayer(whichLocation, whichPlayer) end


---@param whichPlayer player
---@return race
function GetPlayerRace(whichPlayer) end

---@param whichPlayer player
---@return integer
function GetPlayerId(whichPlayer) end

---@param whichPlayer player
---@param includeIncomplete boolean
---@return integer
function GetPlayerUnitCount(whichPlayer, includeIncomplete) end

---@param whichPlayer player
---@param unitName string
---@param includeIncomplete boolean
---@param includeUpgrades boolean
---@return integer
function GetPlayerTypedUnitCount(whichPlayer, unitName, includeIncomplete, includeUpgrades) end

---@param whichPlayer player
---@param includeIncomplete boolean
---@return integer
function GetPlayerStructureCount(whichPlayer, includeIncomplete) end

---@param whichPlayer player
---@param whichPlayerState playerstate
---@return integer
function GetPlayerState(whichPlayer, whichPlayerState) end

---@param whichPlayer player
---@param whichPlayerScore playerscore
---@return integer
function GetPlayerScore(whichPlayer, whichPlayerScore) end

---@param sourcePlayer player
---@param otherPlayer player
---@param whichAllianceSetting alliancetype
---@return boolean
function GetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting) end


---@param whichPlayer player
---@return real
function GetPlayerHandicap(whichPlayer) end

---@param whichPlayer player
---@return real
function GetPlayerHandicapXP(whichPlayer) end

---@param whichPlayer player
---@param handicap real
function SetPlayerHandicap(whichPlayer, handicap) end

---@param whichPlayer player
---@param handicap real
function SetPlayerHandicapXP(whichPlayer, handicap) end


---@param whichPlayer player
---@param techid integer
---@param maximum integer
function SetPlayerTechMaxAllowed(whichPlayer, techid, maximum) end

---@param whichPlayer player
---@param techid integer
---@return integer
function GetPlayerTechMaxAllowed(whichPlayer, techid) end

---@param whichPlayer player
---@param techid integer
---@param levels integer
function AddPlayerTechResearched(whichPlayer, techid, levels) end

---@param whichPlayer player
---@param techid integer
---@param setToLevel integer
function SetPlayerTechResearched(whichPlayer, techid, setToLevel) end

---@param whichPlayer player
---@param techid integer
---@param specificonly boolean
---@return boolean
function GetPlayerTechResearched(whichPlayer, techid, specificonly) end

---@param whichPlayer player
---@param techid integer
---@param specificonly boolean
---@return integer
function GetPlayerTechCount(whichPlayer, techid, specificonly) end


---@param whichPlayer player
---@param newOwner integer
function SetPlayerUnitsOwner(whichPlayer, newOwner) end

---@param whichPlayer player
---@param toWhichPlayers force
---@param flag boolean
function CripplePlayer(whichPlayer, toWhichPlayers, flag) end


---@param whichPlayer player
---@param abilid integer
---@param avail boolean
function SetPlayerAbilityAvailable(whichPlayer, abilid, avail) end


---@param whichPlayer player
---@param whichPlayerState playerstate
---@param value integer
function SetPlayerState(whichPlayer, whichPlayerState, value) end

---@param whichPlayer player
---@param gameResult playergameresult
function RemovePlayer(whichPlayer, gameResult) end


-- Used to store hero level data for the scorescreen
-- before units are moved to neutral passive in melee games
--
---@param whichPlayer player
function CachePlayerHeroData(whichPlayer) end

---@param whichPlayer player
---@param techid integer
---@param levels integer
function BlzDecPlayerTechResearched(whichPlayer, techid, levels) end

---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return integer
function RequestExtraIntegerData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return boolean
function RequestExtraBooleanData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return string
function RequestExtraStringData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return real
function RequestExtraRealData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end