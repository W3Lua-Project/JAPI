--===========================================================================
-- Blizzard.j ( define Jass2 functions that need to be in every map script )
--===========================================================================


-------------------------------------------------------------------------
-- Constants
--

-- Misc constants
bj_PI                             = 3.14159 ---@type real
bj_E                              = 2.71828 ---@type real
bj_CELLWIDTH                      = 128.0 ---@type real
bj_CLIFFHEIGHT                    = 128.0 ---@type real
bj_UNIT_FACING                    = 270.0 ---@type real
bj_RADTODEG                       = 180.0 / bj_PI ---@type real
bj_DEGTORAD                       = bj_PI / 180.0 ---@type real
bj_TEXT_DELAY_QUEST               = 20.00 ---@type real
bj_TEXT_DELAY_QUESTUPDATE         = 20.00 ---@type real
bj_TEXT_DELAY_QUESTDONE           = 20.00 ---@type real
bj_TEXT_DELAY_QUESTFAILED         = 20.00 ---@type real
bj_TEXT_DELAY_QUESTREQUIREMENT    = 20.00 ---@type real
bj_TEXT_DELAY_MISSIONFAILED       = 20.00 ---@type real
bj_TEXT_DELAY_ALWAYSHINT          = 12.00 ---@type real
bj_TEXT_DELAY_HINT                = 12.00 ---@type real
bj_TEXT_DELAY_SECRET              = 10.00 ---@type real
bj_TEXT_DELAY_UNITACQUIRED        = 15.00 ---@type real
bj_TEXT_DELAY_UNITAVAILABLE       = 10.00 ---@type real
bj_TEXT_DELAY_ITEMACQUIRED        = 10.00 ---@type real
bj_TEXT_DELAY_WARNING             = 12.00 ---@type real
bj_QUEUE_DELAY_QUEST              = 5.00 ---@type real
bj_QUEUE_DELAY_HINT               = 5.00 ---@type real
bj_QUEUE_DELAY_SECRET             = 3.00 ---@type real
bj_HANDICAP_EASY                  = 60.00 ---@type real
bj_GAME_STARTED_THRESHOLD         = 0.01 ---@type real
bj_WAIT_FOR_COND_MIN_INTERVAL     = 0.10 ---@type real
bj_POLLED_WAIT_INTERVAL           = 0.10 ---@type real
bj_POLLED_WAIT_SKIP_THRESHOLD     = 2.00 ---@type real

-- Game constants
bj_MAX_INVENTORY                  = 6 ---@type integer
bj_MAX_PLAYERS                    = GetBJMaxPlayers() ---@type integer
bj_PLAYER_NEUTRAL_VICTIM          = GetBJPlayerNeutralVictim() ---@type integer
bj_PLAYER_NEUTRAL_EXTRA           = GetBJPlayerNeutralExtra() ---@type integer
bj_MAX_PLAYER_SLOTS               = GetBJMaxPlayerSlots() ---@type integer
bj_MAX_SKELETONS                  = 25 ---@type integer
bj_MAX_STOCK_ITEM_SLOTS           = 11 ---@type integer
bj_MAX_STOCK_UNIT_SLOTS           = 11 ---@type integer
bj_MAX_ITEM_LEVEL                 = 10 ---@type integer

-- Ideally these would be looked up from Units/MiscData.txt,
-- but there is currently no script functionality exposed to do that
bj_TOD_DAWN                       = 6.00 ---@type real
bj_TOD_DUSK                       = 18.00 ---@type real

-- Melee game settings:
--   - Starting Time of Day (TOD)
--   - Starting Gold
--   - Starting Lumber
--   - Starting Hero Tokens (free heroes)
--   - Max heroes allowed per player
--   - Max heroes allowed per hero type
--   - Distance from start loc to search for nearby mines
--
bj_MELEE_STARTING_TOD             = 8.00 ---@type real
bj_MELEE_STARTING_GOLD_V0         = 750 ---@type integer
bj_MELEE_STARTING_GOLD_V1         = 500 ---@type integer
bj_MELEE_STARTING_LUMBER_V0       = 200 ---@type integer
bj_MELEE_STARTING_LUMBER_V1       = 150 ---@type integer
bj_MELEE_STARTING_HERO_TOKENS     = 1 ---@type integer
bj_MELEE_HERO_LIMIT               = 3 ---@type integer
bj_MELEE_HERO_TYPE_LIMIT          = 1 ---@type integer
bj_MELEE_MINE_SEARCH_RADIUS       = 2000 ---@type real
bj_MELEE_CLEAR_UNITS_RADIUS       = 1500 ---@type real
bj_MELEE_CRIPPLE_TIMEOUT          = 120.00 ---@type real
bj_MELEE_CRIPPLE_MSG_DURATION     = 20.00 ---@type real
bj_MELEE_MAX_TWINKED_HEROES_V0    = 3 ---@type integer
bj_MELEE_MAX_TWINKED_HEROES_V1    = 1 ---@type integer

-- Delay between a creep's death and the time it may drop an item.
bj_CREEP_ITEM_DELAY               = 0.50 ---@type real

-- Timing settings for Marketplace inventories.
bj_STOCK_RESTOCK_INITIAL_DELAY    = 120 ---@type real
bj_STOCK_RESTOCK_INTERVAL         = 30 ---@type real
bj_STOCK_MAX_ITERATIONS           = 20 ---@type integer

-- Max events registered by a single "dest dies in region" event.
bj_MAX_DEST_IN_REGION_EVENTS      = 64 ---@type integer

-- Camera settings
bj_CAMERA_MIN_FARZ                = 100 ---@type integer
bj_CAMERA_DEFAULT_DISTANCE        = 1650 ---@type integer
bj_CAMERA_DEFAULT_FARZ            = 5000 ---@type integer
bj_CAMERA_DEFAULT_AOA             = 304 ---@type integer
bj_CAMERA_DEFAULT_FOV             = 70 ---@type integer
bj_CAMERA_DEFAULT_ROLL            = 0 ---@type integer
bj_CAMERA_DEFAULT_ROTATION        = 90 ---@type integer

-- Rescue
bj_RESCUE_PING_TIME               = 2.00 ---@type real

-- Transmission behavior settings
bj_NOTHING_SOUND_DURATION         = 5.00 ---@type real
bj_TRANSMISSION_PING_TIME         = 1.00 ---@type real
bj_TRANSMISSION_IND_RED           = 255 ---@type integer
bj_TRANSMISSION_IND_BLUE          = 255 ---@type integer
bj_TRANSMISSION_IND_GREEN         = 255 ---@type integer
bj_TRANSMISSION_IND_ALPHA         = 255 ---@type integer
bj_TRANSMISSION_PORT_HANGTIME     = 1.50 ---@type real

-- Cinematic mode settings
bj_CINEMODE_INTERFACEFADE         = 0.50 ---@type real
bj_CINEMODE_GAMESPEED             = MAP_SPEED_NORMAL ---@type gamespeed

-- Cinematic mode volume levels
bj_CINEMODE_VOLUME_UNITMOVEMENT   = 0.40 ---@type real
bj_CINEMODE_VOLUME_UNITSOUNDS     = 0.00 ---@type real
bj_CINEMODE_VOLUME_COMBAT         = 0.40 ---@type real
bj_CINEMODE_VOLUME_SPELLS         = 0.40 ---@type real
bj_CINEMODE_VOLUME_UI             = 0.00 ---@type real
bj_CINEMODE_VOLUME_MUSIC          = 0.55 ---@type real
bj_CINEMODE_VOLUME_AMBIENTSOUNDS  = 1.00 ---@type real
bj_CINEMODE_VOLUME_FIRE           = 0.60 ---@type real

-- Speech mode volume levels
bj_SPEECH_VOLUME_UNITMOVEMENT     = 0.25 ---@type real
bj_SPEECH_VOLUME_UNITSOUNDS       = 0.00 ---@type real
bj_SPEECH_VOLUME_COMBAT           = 0.25 ---@type real
bj_SPEECH_VOLUME_SPELLS           = 0.25 ---@type real
bj_SPEECH_VOLUME_UI               = 0.00 ---@type real
bj_SPEECH_VOLUME_MUSIC            = 0.55 ---@type real
bj_SPEECH_VOLUME_AMBIENTSOUNDS    = 1.00 ---@type real
bj_SPEECH_VOLUME_FIRE             = 0.60 ---@type real

-- Smart pan settings
bj_SMARTPAN_TRESHOLD_PAN          = 500 ---@type real
bj_SMARTPAN_TRESHOLD_SNAP         = 3500 ---@type real

-- QueuedTriggerExecute settings
bj_MAX_QUEUED_TRIGGERS            = 100 ---@type integer
bj_QUEUED_TRIGGER_TIMEOUT         = 180.00 ---@type real

-- Campaign indexing constants
bj_CAMPAIGN_INDEX_T               = 0 ---@type integer
bj_CAMPAIGN_INDEX_H               = 1 ---@type integer
bj_CAMPAIGN_INDEX_U               = 2 ---@type integer
bj_CAMPAIGN_INDEX_O               = 3 ---@type integer
bj_CAMPAIGN_INDEX_N               = 4 ---@type integer
bj_CAMPAIGN_INDEX_XN              = 5 ---@type integer
bj_CAMPAIGN_INDEX_XH              = 6 ---@type integer
bj_CAMPAIGN_INDEX_XU              = 7 ---@type integer
bj_CAMPAIGN_INDEX_XO              = 8 ---@type integer

-- Campaign offset constants (for mission indexing)
bj_CAMPAIGN_OFFSET_T              = 0 ---@type integer
bj_CAMPAIGN_OFFSET_H              = 1 ---@type integer
bj_CAMPAIGN_OFFSET_U              = 2 ---@type integer
bj_CAMPAIGN_OFFSET_O              = 3 ---@type integer
bj_CAMPAIGN_OFFSET_N              = 4 ---@type integer
bj_CAMPAIGN_OFFSET_XN             = 0 ---@type integer
bj_CAMPAIGN_OFFSET_XH             = 1 ---@type integer
bj_CAMPAIGN_OFFSET_XU             = 2 ---@type integer
bj_CAMPAIGN_OFFSET_XO             = 3 ---@type integer

-- Mission indexing constants
-- Tutorial
bj_MISSION_INDEX_T00              = bj_CAMPAIGN_OFFSET_T * 1000 + 0 ---@type integer
bj_MISSION_INDEX_T01              = bj_CAMPAIGN_OFFSET_T * 1000 + 1 ---@type integer
-- Human
bj_MISSION_INDEX_H00              = bj_CAMPAIGN_OFFSET_H * 1000 + 0 ---@type integer
bj_MISSION_INDEX_H01              = bj_CAMPAIGN_OFFSET_H * 1000 + 1 ---@type integer
bj_MISSION_INDEX_H02              = bj_CAMPAIGN_OFFSET_H * 1000 + 2 ---@type integer
bj_MISSION_INDEX_H03              = bj_CAMPAIGN_OFFSET_H * 1000 + 3 ---@type integer
bj_MISSION_INDEX_H04              = bj_CAMPAIGN_OFFSET_H * 1000 + 4 ---@type integer
bj_MISSION_INDEX_H05              = bj_CAMPAIGN_OFFSET_H * 1000 + 5 ---@type integer
bj_MISSION_INDEX_H06              = bj_CAMPAIGN_OFFSET_H * 1000 + 6 ---@type integer
bj_MISSION_INDEX_H07              = bj_CAMPAIGN_OFFSET_H * 1000 + 7 ---@type integer
bj_MISSION_INDEX_H08              = bj_CAMPAIGN_OFFSET_H * 1000 + 8 ---@type integer
bj_MISSION_INDEX_H09              = bj_CAMPAIGN_OFFSET_H * 1000 + 9 ---@type integer
bj_MISSION_INDEX_H10              = bj_CAMPAIGN_OFFSET_H * 1000 + 10 ---@type integer
bj_MISSION_INDEX_H11              = bj_CAMPAIGN_OFFSET_H * 1000 + 11 ---@type integer
-- Undead
bj_MISSION_INDEX_U00              = bj_CAMPAIGN_OFFSET_U * 1000 + 0 ---@type integer
bj_MISSION_INDEX_U01              = bj_CAMPAIGN_OFFSET_U * 1000 + 1 ---@type integer
bj_MISSION_INDEX_U02              = bj_CAMPAIGN_OFFSET_U * 1000 + 2 ---@type integer
bj_MISSION_INDEX_U03              = bj_CAMPAIGN_OFFSET_U * 1000 + 3 ---@type integer
bj_MISSION_INDEX_U05              = bj_CAMPAIGN_OFFSET_U * 1000 + 4 ---@type integer
bj_MISSION_INDEX_U07              = bj_CAMPAIGN_OFFSET_U * 1000 + 5 ---@type integer
bj_MISSION_INDEX_U08              = bj_CAMPAIGN_OFFSET_U * 1000 + 6 ---@type integer
bj_MISSION_INDEX_U09              = bj_CAMPAIGN_OFFSET_U * 1000 + 7 ---@type integer
bj_MISSION_INDEX_U10              = bj_CAMPAIGN_OFFSET_U * 1000 + 8 ---@type integer
bj_MISSION_INDEX_U11              = bj_CAMPAIGN_OFFSET_U * 1000 + 9 ---@type integer
-- Orc
bj_MISSION_INDEX_O00              = bj_CAMPAIGN_OFFSET_O * 1000 + 0 ---@type integer
bj_MISSION_INDEX_O01              = bj_CAMPAIGN_OFFSET_O * 1000 + 1 ---@type integer
bj_MISSION_INDEX_O02              = bj_CAMPAIGN_OFFSET_O * 1000 + 2 ---@type integer
bj_MISSION_INDEX_O03              = bj_CAMPAIGN_OFFSET_O * 1000 + 3 ---@type integer
bj_MISSION_INDEX_O04              = bj_CAMPAIGN_OFFSET_O * 1000 + 4 ---@type integer
bj_MISSION_INDEX_O05              = bj_CAMPAIGN_OFFSET_O * 1000 + 5 ---@type integer
bj_MISSION_INDEX_O06              = bj_CAMPAIGN_OFFSET_O * 1000 + 6 ---@type integer
bj_MISSION_INDEX_O07              = bj_CAMPAIGN_OFFSET_O * 1000 + 7 ---@type integer
bj_MISSION_INDEX_O08              = bj_CAMPAIGN_OFFSET_O * 1000 + 8 ---@type integer
bj_MISSION_INDEX_O09              = bj_CAMPAIGN_OFFSET_O * 1000 + 9 ---@type integer
bj_MISSION_INDEX_O10              = bj_CAMPAIGN_OFFSET_O * 1000 + 10 ---@type integer
-- Night Elf
bj_MISSION_INDEX_N00              = bj_CAMPAIGN_OFFSET_N * 1000 + 0 ---@type integer
bj_MISSION_INDEX_N01              = bj_CAMPAIGN_OFFSET_N * 1000 + 1 ---@type integer
bj_MISSION_INDEX_N02              = bj_CAMPAIGN_OFFSET_N * 1000 + 2 ---@type integer
bj_MISSION_INDEX_N03              = bj_CAMPAIGN_OFFSET_N * 1000 + 3 ---@type integer
bj_MISSION_INDEX_N04              = bj_CAMPAIGN_OFFSET_N * 1000 + 4 ---@type integer
bj_MISSION_INDEX_N05              = bj_CAMPAIGN_OFFSET_N * 1000 + 5 ---@type integer
bj_MISSION_INDEX_N06              = bj_CAMPAIGN_OFFSET_N * 1000 + 6 ---@type integer
bj_MISSION_INDEX_N07              = bj_CAMPAIGN_OFFSET_N * 1000 + 7 ---@type integer
bj_MISSION_INDEX_N08              = bj_CAMPAIGN_OFFSET_N * 1000 + 8 ---@type integer
bj_MISSION_INDEX_N09              = bj_CAMPAIGN_OFFSET_N * 1000 + 9 ---@type integer
-- Expansion Night Elf
bj_MISSION_INDEX_XN00             = bj_CAMPAIGN_OFFSET_XN * 1000 + 0 ---@type integer
bj_MISSION_INDEX_XN01             = bj_CAMPAIGN_OFFSET_XN * 1000 + 1 ---@type integer
bj_MISSION_INDEX_XN02             = bj_CAMPAIGN_OFFSET_XN * 1000 + 2 ---@type integer
bj_MISSION_INDEX_XN03             = bj_CAMPAIGN_OFFSET_XN * 1000 + 3 ---@type integer
bj_MISSION_INDEX_XN04             = bj_CAMPAIGN_OFFSET_XN * 1000 + 4 ---@type integer
bj_MISSION_INDEX_XN05             = bj_CAMPAIGN_OFFSET_XN * 1000 + 5 ---@type integer
bj_MISSION_INDEX_XN06             = bj_CAMPAIGN_OFFSET_XN * 1000 + 6 ---@type integer
bj_MISSION_INDEX_XN07             = bj_CAMPAIGN_OFFSET_XN * 1000 + 7 ---@type integer
bj_MISSION_INDEX_XN08             = bj_CAMPAIGN_OFFSET_XN * 1000 + 8 ---@type integer
bj_MISSION_INDEX_XN09             = bj_CAMPAIGN_OFFSET_XN * 1000 + 9 ---@type integer
bj_MISSION_INDEX_XN10             = bj_CAMPAIGN_OFFSET_XN * 1000 + 10 ---@type integer
-- Expansion Human
bj_MISSION_INDEX_XH00             = bj_CAMPAIGN_OFFSET_XH * 1000 + 0 ---@type integer
bj_MISSION_INDEX_XH01             = bj_CAMPAIGN_OFFSET_XH * 1000 + 1 ---@type integer
bj_MISSION_INDEX_XH02             = bj_CAMPAIGN_OFFSET_XH * 1000 + 2 ---@type integer
bj_MISSION_INDEX_XH03             = bj_CAMPAIGN_OFFSET_XH * 1000 + 3 ---@type integer
bj_MISSION_INDEX_XH04             = bj_CAMPAIGN_OFFSET_XH * 1000 + 4 ---@type integer
bj_MISSION_INDEX_XH05             = bj_CAMPAIGN_OFFSET_XH * 1000 + 5 ---@type integer
bj_MISSION_INDEX_XH06             = bj_CAMPAIGN_OFFSET_XH * 1000 + 6 ---@type integer
bj_MISSION_INDEX_XH07             = bj_CAMPAIGN_OFFSET_XH * 1000 + 7 ---@type integer
bj_MISSION_INDEX_XH08             = bj_CAMPAIGN_OFFSET_XH * 1000 + 8 ---@type integer
bj_MISSION_INDEX_XH09             = bj_CAMPAIGN_OFFSET_XH * 1000 + 9 ---@type integer
-- Expansion Undead
bj_MISSION_INDEX_XU00             = bj_CAMPAIGN_OFFSET_XU * 1000 + 0 ---@type integer
bj_MISSION_INDEX_XU01             = bj_CAMPAIGN_OFFSET_XU * 1000 + 1 ---@type integer
bj_MISSION_INDEX_XU02             = bj_CAMPAIGN_OFFSET_XU * 1000 + 2 ---@type integer
bj_MISSION_INDEX_XU03             = bj_CAMPAIGN_OFFSET_XU * 1000 + 3 ---@type integer
bj_MISSION_INDEX_XU04             = bj_CAMPAIGN_OFFSET_XU * 1000 + 4 ---@type integer
bj_MISSION_INDEX_XU05             = bj_CAMPAIGN_OFFSET_XU * 1000 + 5 ---@type integer
bj_MISSION_INDEX_XU06             = bj_CAMPAIGN_OFFSET_XU * 1000 + 6 ---@type integer
bj_MISSION_INDEX_XU07             = bj_CAMPAIGN_OFFSET_XU * 1000 + 7 ---@type integer
bj_MISSION_INDEX_XU08             = bj_CAMPAIGN_OFFSET_XU * 1000 + 8 ---@type integer
bj_MISSION_INDEX_XU09             = bj_CAMPAIGN_OFFSET_XU * 1000 + 9 ---@type integer
bj_MISSION_INDEX_XU10             = bj_CAMPAIGN_OFFSET_XU * 1000 + 10 ---@type integer
bj_MISSION_INDEX_XU11             = bj_CAMPAIGN_OFFSET_XU * 1000 + 11 ---@type integer
bj_MISSION_INDEX_XU12             = bj_CAMPAIGN_OFFSET_XU * 1000 + 12 ---@type integer
bj_MISSION_INDEX_XU13             = bj_CAMPAIGN_OFFSET_XU * 1000 + 13 ---@type integer

-- Expansion Orc
bj_MISSION_INDEX_XO00             = bj_CAMPAIGN_OFFSET_XO * 1000 + 0 ---@type integer
bj_MISSION_INDEX_XO01             = bj_CAMPAIGN_OFFSET_XO * 1000 + 1 ---@type integer
bj_MISSION_INDEX_XO02             = bj_CAMPAIGN_OFFSET_XO * 1000 + 2 ---@type integer
bj_MISSION_INDEX_XO03             = bj_CAMPAIGN_OFFSET_XO * 1000 + 3 ---@type integer

-- Cinematic indexing constants
bj_CINEMATICINDEX_TOP             = 0 ---@type integer
bj_CINEMATICINDEX_HOP             = 1 ---@type integer
bj_CINEMATICINDEX_HED             = 2 ---@type integer
bj_CINEMATICINDEX_OOP             = 3 ---@type integer
bj_CINEMATICINDEX_OED             = 4 ---@type integer
bj_CINEMATICINDEX_UOP             = 5 ---@type integer
bj_CINEMATICINDEX_UED             = 6 ---@type integer
bj_CINEMATICINDEX_NOP             = 7 ---@type integer
bj_CINEMATICINDEX_NED             = 8 ---@type integer
bj_CINEMATICINDEX_XOP             = 9 ---@type integer
bj_CINEMATICINDEX_XED             = 10 ---@type integer

-- Alliance settings
bj_ALLIANCE_UNALLIED              = 0 ---@type integer
bj_ALLIANCE_UNALLIED_VISION       = 1 ---@type integer
bj_ALLIANCE_ALLIED                = 2 ---@type integer
bj_ALLIANCE_ALLIED_VISION         = 3 ---@type integer
bj_ALLIANCE_ALLIED_UNITS          = 4 ---@type integer
bj_ALLIANCE_ALLIED_ADVUNITS       = 5 ---@type integer
bj_ALLIANCE_NEUTRAL               = 6 ---@type integer
bj_ALLIANCE_NEUTRAL_VISION        = 7 ---@type integer

-- Keyboard Event Types
bj_KEYEVENTTYPE_DEPRESS           = 0 ---@type integer
bj_KEYEVENTTYPE_RELEASE           = 1 ---@type integer

-- Keyboard Event Keys
bj_KEYEVENTKEY_LEFT               = 0 ---@type integer
bj_KEYEVENTKEY_RIGHT              = 1 ---@type integer
bj_KEYEVENTKEY_DOWN               = 2 ---@type integer
bj_KEYEVENTKEY_UP                 = 3 ---@type integer

-- Mouse Event Types
bj_MOUSEEVENTTYPE_DOWN            = 0 ---@type integer
bj_MOUSEEVENTTYPE_UP              = 1 ---@type integer
bj_MOUSEEVENTTYPE_MOVE            = 2 ---@type integer

-- Transmission timing methods
bj_TIMETYPE_ADD                   = 0 ---@type integer
bj_TIMETYPE_SET                   = 1 ---@type integer
bj_TIMETYPE_SUB                   = 2 ---@type integer

-- Camera bounds adjustment methods
bj_CAMERABOUNDS_ADJUST_ADD        = 0 ---@type integer
bj_CAMERABOUNDS_ADJUST_SUB        = 1 ---@type integer

-- Quest creation states
bj_QUESTTYPE_REQ_DISCOVERED       = 0 ---@type integer
bj_QUESTTYPE_REQ_UNDISCOVERED     = 1 ---@type integer
bj_QUESTTYPE_OPT_DISCOVERED       = 2 ---@type integer
bj_QUESTTYPE_OPT_UNDISCOVERED     = 3 ---@type integer

-- Quest message types
bj_QUESTMESSAGE_DISCOVERED        = 0 ---@type integer
bj_QUESTMESSAGE_UPDATED           = 1 ---@type integer
bj_QUESTMESSAGE_COMPLETED         = 2 ---@type integer
bj_QUESTMESSAGE_FAILED            = 3 ---@type integer
bj_QUESTMESSAGE_REQUIREMENT       = 4 ---@type integer
bj_QUESTMESSAGE_MISSIONFAILED     = 5 ---@type integer
bj_QUESTMESSAGE_ALWAYSHINT        = 6 ---@type integer
bj_QUESTMESSAGE_HINT              = 7 ---@type integer
bj_QUESTMESSAGE_SECRET            = 8 ---@type integer
bj_QUESTMESSAGE_UNITACQUIRED      = 9 ---@type integer
bj_QUESTMESSAGE_UNITAVAILABLE     = 10 ---@type integer
bj_QUESTMESSAGE_ITEMACQUIRED      = 11 ---@type integer
bj_QUESTMESSAGE_WARNING           = 12 ---@type integer

-- Leaderboard sorting methods
bj_SORTTYPE_SORTBYVALUE           = 0 ---@type integer
bj_SORTTYPE_SORTBYPLAYER          = 1 ---@type integer
bj_SORTTYPE_SORTBYLABEL           = 2 ---@type integer

-- Cinematic fade filter methods
bj_CINEFADETYPE_FADEIN            = 0 ---@type integer
bj_CINEFADETYPE_FADEOUT           = 1 ---@type integer
bj_CINEFADETYPE_FADEOUTIN         = 2 ---@type integer

-- Buff removal methods
bj_REMOVEBUFFS_POSITIVE           = 0 ---@type integer
bj_REMOVEBUFFS_NEGATIVE           = 1 ---@type integer
bj_REMOVEBUFFS_ALL                = 2 ---@type integer
bj_REMOVEBUFFS_NONTLIFE           = 3 ---@type integer

-- Buff properties - polarity
bj_BUFF_POLARITY_POSITIVE         = 0 ---@type integer
bj_BUFF_POLARITY_NEGATIVE         = 1 ---@type integer
bj_BUFF_POLARITY_EITHER           = 2 ---@type integer

-- Buff properties - resist type
bj_BUFF_RESIST_MAGIC              = 0 ---@type integer
bj_BUFF_RESIST_PHYSICAL           = 1 ---@type integer
bj_BUFF_RESIST_EITHER             = 2 ---@type integer
bj_BUFF_RESIST_BOTH               = 3 ---@type integer

-- Hero stats
bj_HEROSTAT_STR                   = 0 ---@type integer
bj_HEROSTAT_AGI                   = 1 ---@type integer
bj_HEROSTAT_INT                   = 2 ---@type integer

-- Hero skill point modification methods
bj_MODIFYMETHOD_ADD               = 0 ---@type integer
bj_MODIFYMETHOD_SUB               = 1 ---@type integer
bj_MODIFYMETHOD_SET               = 2 ---@type integer

-- Unit state adjustment methods (for replaced units)
bj_UNIT_STATE_METHOD_ABSOLUTE     = 0 ---@type integer
bj_UNIT_STATE_METHOD_RELATIVE     = 1 ---@type integer
bj_UNIT_STATE_METHOD_DEFAULTS     = 2 ---@type integer
bj_UNIT_STATE_METHOD_MAXIMUM      = 3 ---@type integer

-- Gate operations
bj_GATEOPERATION_CLOSE            = 0 ---@type integer
bj_GATEOPERATION_OPEN             = 1 ---@type integer
bj_GATEOPERATION_DESTROY          = 2 ---@type integer

-- Game cache value types
bj_GAMECACHE_BOOLEAN              = 0 ---@type integer
bj_GAMECACHE_INTEGER              = 1 ---@type integer
bj_GAMECACHE_REAL                 = 2 ---@type integer
bj_GAMECACHE_UNIT                 = 3 ---@type integer
bj_GAMECACHE_STRING               = 4 ---@type integer

-- Hashtable value types
bj_HASHTABLE_BOOLEAN              = 0 ---@type integer
bj_HASHTABLE_INTEGER              = 1 ---@type integer
bj_HASHTABLE_REAL                 = 2 ---@type integer
bj_HASHTABLE_STRING               = 3 ---@type integer
bj_HASHTABLE_HANDLE               = 4 ---@type integer

-- Item status types
bj_ITEM_STATUS_HIDDEN             = 0 ---@type integer
bj_ITEM_STATUS_OWNED              = 1 ---@type integer
bj_ITEM_STATUS_INVULNERABLE       = 2 ---@type integer
bj_ITEM_STATUS_POWERUP            = 3 ---@type integer
bj_ITEM_STATUS_SELLABLE           = 4 ---@type integer
bj_ITEM_STATUS_PAWNABLE           = 5 ---@type integer

-- Itemcode status types
bj_ITEMCODE_STATUS_POWERUP        = 0 ---@type integer
bj_ITEMCODE_STATUS_SELLABLE       = 1 ---@type integer
bj_ITEMCODE_STATUS_PAWNABLE       = 2 ---@type integer

-- Minimap ping styles
bj_MINIMAPPINGSTYLE_SIMPLE        = 0 ---@type integer
bj_MINIMAPPINGSTYLE_FLASHY        = 1 ---@type integer
bj_MINIMAPPINGSTYLE_ATTACK        = 2 ---@type integer

-- Corpse creation settings
bj_CORPSE_MAX_DEATH_TIME          = 8.00 ---@type real

-- Corpse creation styles
bj_CORPSETYPE_FLESH               = 0 ---@type integer
bj_CORPSETYPE_BONE                = 1 ---@type integer

-- Elevator pathing-blocker destructable code
bj_ELEVATOR_BLOCKER_CODE          = FourCC('DTep') ---@type integer
bj_ELEVATOR_CODE01                = FourCC('DTrf') ---@type integer
bj_ELEVATOR_CODE02                = FourCC('DTrx') ---@type integer

-- Elevator wall codes
bj_ELEVATOR_WALL_TYPE_ALL         = 0 ---@type integer
bj_ELEVATOR_WALL_TYPE_EAST        = 1 ---@type integer
bj_ELEVATOR_WALL_TYPE_NORTH       = 2 ---@type integer
bj_ELEVATOR_WALL_TYPE_SOUTH       = 3 ---@type integer
bj_ELEVATOR_WALL_TYPE_WEST        = 4 ---@type integer