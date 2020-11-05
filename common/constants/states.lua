--===================================================
-- Game, Player, and Unit States
--
-- For use with TriggerRegisterStateEvent
--
--===================================================

GAME_STATE_DIVINE_INTERVENTION          = ConvertIGameState(0) ---@type igamestate
GAME_STATE_DISCONNECTED                 = ConvertIGameState(1) ---@type igamestate
GAME_STATE_TIME_OF_DAY                  = ConvertFGameState(2) ---@type fgamestate

PLAYER_STATE_GAME_RESULT               = ConvertPlayerState(0) ---@type playerstate

-- current resource levels
--
PLAYER_STATE_RESOURCE_GOLD             = ConvertPlayerState(1) ---@type playerstate
PLAYER_STATE_RESOURCE_LUMBER           = ConvertPlayerState(2) ---@type playerstate
PLAYER_STATE_RESOURCE_HERO_TOKENS      = ConvertPlayerState(3) ---@type playerstate
PLAYER_STATE_RESOURCE_FOOD_CAP         = ConvertPlayerState(4) ---@type playerstate
PLAYER_STATE_RESOURCE_FOOD_USED        = ConvertPlayerState(5) ---@type playerstate
PLAYER_STATE_FOOD_CAP_CEILING          = ConvertPlayerState(6) ---@type playerstate

PLAYER_STATE_GIVES_BOUNTY              = ConvertPlayerState(7) ---@type playerstate
PLAYER_STATE_ALLIED_VICTORY            = ConvertPlayerState(8) ---@type playerstate
PLAYER_STATE_PLACED                    = ConvertPlayerState(9) ---@type playerstate
PLAYER_STATE_OBSERVER_ON_DEATH         = ConvertPlayerState(10) ---@type playerstate
PLAYER_STATE_OBSERVER                  = ConvertPlayerState(11) ---@type playerstate
PLAYER_STATE_UNFOLLOWABLE              = ConvertPlayerState(12) ---@type playerstate

-- taxation rate for each resource
--
PLAYER_STATE_GOLD_UPKEEP_RATE          = ConvertPlayerState(13) ---@type playerstate
PLAYER_STATE_LUMBER_UPKEEP_RATE        = ConvertPlayerState(14) ---@type playerstate

-- cumulative resources collected by the player during the mission
--
PLAYER_STATE_GOLD_GATHERED             = ConvertPlayerState(15) ---@type playerstate
PLAYER_STATE_LUMBER_GATHERED           = ConvertPlayerState(16) ---@type playerstate

PLAYER_STATE_NO_CREEP_SLEEP            = ConvertPlayerState(25) ---@type playerstate

UNIT_STATE_LIFE                          = ConvertUnitState(0) ---@type unitstate
UNIT_STATE_MAX_LIFE                      = ConvertUnitState(1) ---@type unitstate
UNIT_STATE_MANA                          = ConvertUnitState(2) ---@type unitstate
UNIT_STATE_MAX_MANA                      = ConvertUnitState(3) ---@type unitstate

AI_DIFFICULTY_NEWBIE                  = ConvertAIDifficulty(0) ---@type aidifficulty
AI_DIFFICULTY_NORMAL                  = ConvertAIDifficulty(1) ---@type aidifficulty
AI_DIFFICULTY_INSANE                  = ConvertAIDifficulty(2) ---@type aidifficulty

-- player score values
PLAYER_SCORE_UNITS_TRAINED             = ConvertPlayerScore(0) ---@type playerscore
PLAYER_SCORE_UNITS_KILLED              = ConvertPlayerScore(1) ---@type playerscore
PLAYER_SCORE_STRUCT_BUILT              = ConvertPlayerScore(2) ---@type playerscore
PLAYER_SCORE_STRUCT_RAZED              = ConvertPlayerScore(3) ---@type playerscore
PLAYER_SCORE_TECH_PERCENT              = ConvertPlayerScore(4) ---@type playerscore
PLAYER_SCORE_FOOD_MAXPROD              = ConvertPlayerScore(5) ---@type playerscore
PLAYER_SCORE_FOOD_MAXUSED              = ConvertPlayerScore(6) ---@type playerscore
PLAYER_SCORE_HEROES_KILLED             = ConvertPlayerScore(7) ---@type playerscore
PLAYER_SCORE_ITEMS_GAINED              = ConvertPlayerScore(8) ---@type playerscore
PLAYER_SCORE_MERCS_HIRED               = ConvertPlayerScore(9) ---@type playerscore
PLAYER_SCORE_GOLD_MINED_TOTAL          = ConvertPlayerScore(10) ---@type playerscore
PLAYER_SCORE_GOLD_MINED_UPKEEP         = ConvertPlayerScore(11) ---@type playerscore
PLAYER_SCORE_GOLD_LOST_UPKEEP          = ConvertPlayerScore(12) ---@type playerscore
PLAYER_SCORE_GOLD_LOST_TAX             = ConvertPlayerScore(13) ---@type playerscore
PLAYER_SCORE_GOLD_GIVEN                = ConvertPlayerScore(14) ---@type playerscore
PLAYER_SCORE_GOLD_RECEIVED             = ConvertPlayerScore(15) ---@type playerscore
PLAYER_SCORE_LUMBER_TOTAL              = ConvertPlayerScore(16) ---@type playerscore
PLAYER_SCORE_LUMBER_LOST_UPKEEP        = ConvertPlayerScore(17) ---@type playerscore
PLAYER_SCORE_LUMBER_LOST_TAX           = ConvertPlayerScore(18) ---@type playerscore
PLAYER_SCORE_LUMBER_GIVEN              = ConvertPlayerScore(19) ---@type playerscore
PLAYER_SCORE_LUMBER_RECEIVED           = ConvertPlayerScore(20) ---@type playerscore
PLAYER_SCORE_UNIT_TOTAL                = ConvertPlayerScore(21) ---@type playerscore
PLAYER_SCORE_HERO_TOTAL                = ConvertPlayerScore(22) ---@type playerscore
PLAYER_SCORE_RESOURCE_TOTAL            = ConvertPlayerScore(23) ---@type playerscore
PLAYER_SCORE_TOTAL                     = ConvertPlayerScore(24) ---@type playerscore