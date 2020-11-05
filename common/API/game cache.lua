-- Creates a new or reads in an existing game cache file stored
-- in the current campaign profile dir
--
---@return boolean
function ReloadGameCachesFromDisk() end


---@param campaignFile string
---@return gamecache
function InitGameCache(campaignFile) end

---@param whichCache gamecache
---@return boolean
function SaveGameCache(whichCache) end


---@param cache gamecache
---@param missionKey string
---@param key string
---@param value integer
function StoreInteger(cache, missionKey, key, value) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@param value real
function StoreReal(cache, missionKey, key, value) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@param value boolean
function StoreBoolean(cache, missionKey, key, value) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@param whichUnit unit
---@return boolean
function StoreUnit(cache, missionKey, key, whichUnit) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@param value string
---@return boolean
function StoreString(cache, missionKey, key, value) end


---@param cache gamecache
---@param missionKey string
---@param key string
function SyncStoredInteger(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function SyncStoredReal(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function SyncStoredBoolean(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function SyncStoredUnit(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function SyncStoredString(cache, missionKey, key) end


---@param cache gamecache
---@param missionKey string
---@param key string
---@return boolean
function HaveStoredInteger(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return boolean
function HaveStoredReal(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return boolean
function HaveStoredBoolean(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return boolean
function HaveStoredUnit(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return boolean
function HaveStoredString(cache, missionKey, key) end


---@param cache gamecache
function FlushGameCache(cache) end

---@param cache gamecache
---@param missionKey string
function FlushStoredMission(cache, missionKey) end

---@param cache gamecache
---@param missionKey string
---@param key string
function FlushStoredInteger(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function FlushStoredReal(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function FlushStoredBoolean(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function FlushStoredUnit(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
function FlushStoredString(cache, missionKey, key) end


-- Will return 0 if the specified value's data is not found in the cache
---@param cache gamecache
---@param missionKey string
---@param key string
---@return integer
function GetStoredInteger(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return real
function GetStoredReal(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return boolean
function GetStoredBoolean(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@return string
function GetStoredString(cache, missionKey, key) end

---@param cache gamecache
---@param missionKey string
---@param key string
---@param forWhichPlayer player
---@param x real
---@param y real
---@param facing real
---@return unit
function RestoreUnit(cache, missionKey, key, forWhichPlayer, x, y, facing) end