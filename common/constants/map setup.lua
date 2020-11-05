--===================================================
-- Map Setup Constants
--===================================================

RACE_PREF_HUMAN                     = ConvertRacePref(1) ---@type racepreference
RACE_PREF_ORC                       = ConvertRacePref(2) ---@type racepreference
RACE_PREF_NIGHTELF                  = ConvertRacePref(4) ---@type racepreference
RACE_PREF_UNDEAD                    = ConvertRacePref(8) ---@type racepreference
RACE_PREF_DEMON                     = ConvertRacePref(16) ---@type racepreference
RACE_PREF_RANDOM                    = ConvertRacePref(32) ---@type racepreference
RACE_PREF_USER_SELECTABLE           = ConvertRacePref(64) ---@type racepreference

MAP_CONTROL_USER                    = ConvertMapControl(0) ---@type mapcontrol
MAP_CONTROL_COMPUTER                = ConvertMapControl(1) ---@type mapcontrol
MAP_CONTROL_RESCUABLE               = ConvertMapControl(2) ---@type mapcontrol
MAP_CONTROL_NEUTRAL                 = ConvertMapControl(3) ---@type mapcontrol
MAP_CONTROL_CREEP                   = ConvertMapControl(4) ---@type mapcontrol
MAP_CONTROL_NONE                    = ConvertMapControl(5) ---@type mapcontrol

GAME_TYPE_MELEE                     = ConvertGameType(1) ---@type gametype
GAME_TYPE_FFA                       = ConvertGameType(2) ---@type gametype
GAME_TYPE_USE_MAP_SETTINGS          = ConvertGameType(4) ---@type gametype
GAME_TYPE_BLIZ                      = ConvertGameType(8) ---@type gametype
GAME_TYPE_ONE_ON_ONE                = ConvertGameType(16) ---@type gametype
GAME_TYPE_TWO_TEAM_PLAY             = ConvertGameType(32) ---@type gametype
GAME_TYPE_THREE_TEAM_PLAY           = ConvertGameType(64) ---@type gametype
GAME_TYPE_FOUR_TEAM_PLAY            = ConvertGameType(128) ---@type gametype

MAP_FOG_HIDE_TERRAIN                = ConvertMapFlag(1) ---@type mapflag
MAP_FOG_MAP_EXPLORED                = ConvertMapFlag(2) ---@type mapflag
MAP_FOG_ALWAYS_VISIBLE              = ConvertMapFlag(4) ---@type mapflag

MAP_USE_HANDICAPS                   = ConvertMapFlag(8) ---@type mapflag
MAP_OBSERVERS                       = ConvertMapFlag(16) ---@type mapflag
MAP_OBSERVERS_ON_DEATH              = ConvertMapFlag(32) ---@type mapflag

MAP_FIXED_COLORS                    = ConvertMapFlag(128) ---@type mapflag

MAP_LOCK_RESOURCE_TRADING           = ConvertMapFlag(256) ---@type mapflag
MAP_RESOURCE_TRADING_ALLIES_ONLY    = ConvertMapFlag(512) ---@type mapflag

MAP_LOCK_ALLIANCE_CHANGES           = ConvertMapFlag(1024) ---@type mapflag
MAP_ALLIANCE_CHANGES_HIDDEN         = ConvertMapFlag(2048) ---@type mapflag

MAP_CHEATS                          = ConvertMapFlag(4096) ---@type mapflag
MAP_CHEATS_HIDDEN                   = ConvertMapFlag(8192) ---@type mapflag

MAP_LOCK_SPEED                      = ConvertMapFlag(8192*2) ---@type mapflag
MAP_LOCK_RANDOM_SEED                = ConvertMapFlag(8192*4) ---@type mapflag
MAP_SHARED_ADVANCED_CONTROL         = ConvertMapFlag(8192*8) ---@type mapflag
MAP_RANDOM_HERO                     = ConvertMapFlag(8192*16) ---@type mapflag
MAP_RANDOM_RACES                    = ConvertMapFlag(8192*32) ---@type mapflag
MAP_RELOADED                        = ConvertMapFlag(8192*64) ---@type mapflag

-- random among all slots
MAP_PLACEMENT_RANDOM                = ConvertPlacement(0)   ---@type placement
-- player 0 in start loc 0...
MAP_PLACEMENT_FIXED                 = ConvertPlacement(1)   ---@type placement
-- whatever was specified by the script
MAP_PLACEMENT_USE_MAP_SETTINGS      = ConvertPlacement(2)   ---@type placement
-- random with allies next to each other
MAP_PLACEMENT_TEAMS_TOGETHER        = ConvertPlacement(3)   ---@type placement

MAP_LOC_PRIO_LOW                    = ConvertStartLocPrio(0) ---@type startlocprio
MAP_LOC_PRIO_HIGH                   = ConvertStartLocPrio(1) ---@type startlocprio
MAP_LOC_PRIO_NOT                    = ConvertStartLocPrio(2) ---@type startlocprio

MAP_DENSITY_NONE                    = ConvertMapDensity(0) ---@type mapdensity
MAP_DENSITY_LIGHT                   = ConvertMapDensity(1) ---@type mapdensity
MAP_DENSITY_MEDIUM                  = ConvertMapDensity(2) ---@type mapdensity
MAP_DENSITY_HEAVY                   = ConvertMapDensity(3) ---@type mapdensity

MAP_DIFFICULTY_EASY                 = ConvertGameDifficulty(0) ---@type gamedifficulty
MAP_DIFFICULTY_NORMAL               = ConvertGameDifficulty(1) ---@type gamedifficulty
MAP_DIFFICULTY_HARD                 = ConvertGameDifficulty(2) ---@type gamedifficulty
MAP_DIFFICULTY_INSANE               = ConvertGameDifficulty(3) ---@type gamedifficulty

MAP_SPEED_SLOWEST                   = ConvertGameSpeed(0) ---@type gamespeed
MAP_SPEED_SLOW                      = ConvertGameSpeed(1) ---@type gamespeed
MAP_SPEED_NORMAL                    = ConvertGameSpeed(2) ---@type gamespeed
MAP_SPEED_FAST                      = ConvertGameSpeed(3) ---@type gamespeed
MAP_SPEED_FASTEST                   = ConvertGameSpeed(4) ---@type gamespeed

PLAYER_SLOT_STATE_EMPTY             = ConvertPlayerSlotState(0) ---@type playerslotstate
PLAYER_SLOT_STATE_PLAYING           = ConvertPlayerSlotState(1) ---@type playerslotstate
PLAYER_SLOT_STATE_LEFT              = ConvertPlayerSlotState(2) ---@type playerslotstate