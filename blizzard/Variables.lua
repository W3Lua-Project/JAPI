-------------------------------------------------------------------------
-- Variables
--

-- Force predefs
bj_FORCE_ALL_PLAYERS              = nil ---@type force
bj_FORCE_PLAYER                   = {} ---@type force

bj_MELEE_MAX_TWINKED_HEROES       = 0 ---@type integer

-- Map area rects
bj_mapInitialPlayableArea         = nil ---@type rect
bj_mapInitialCameraBounds         = nil ---@type rect

-- Utility function vars
bj_forLoopAIndex                  = 0 ---@type integer
bj_forLoopBIndex                  = 0 ---@type integer
bj_forLoopAIndexEnd               = 0 ---@type integer
bj_forLoopBIndexEnd               = 0 ---@type integer

bj_slotControlReady               = false ---@type boolean
bj_slotControlUsed                = {} ---@type boolean
bj_slotControl                    = {} ---@type mapcontrol

-- Game started detection vars
bj_gameStartedTimer               = nil ---@type timer
bj_gameStarted                    = false ---@type boolean
bj_volumeGroupsTimer              = CreateTimer() ---@type timer

-- Singleplayer check
bj_isSinglePlayer                 = false ---@type boolean

-- Day/Night Cycle vars
bj_dncSoundsDay                   = nil ---@type trigger
bj_dncSoundsNight                 = nil ---@type trigger
bj_dayAmbientSound                = nil ---@type sound
bj_nightAmbientSound              = nil ---@type sound
bj_dncSoundsDawn                  = nil ---@type trigger
bj_dncSoundsDusk                  = nil ---@type trigger
bj_dawnSound                      = nil ---@type sound
bj_duskSound                      = nil ---@type sound
bj_useDawnDuskSounds              = true ---@type boolean
bj_dncIsDaytime                   = false ---@type boolean

-- Triggered sounds
--sound              bj_pingMinimapSound         = nil
bj_rescueSound                    = nil ---@type sound
bj_questDiscoveredSound           = nil ---@type sound
bj_questUpdatedSound              = nil ---@type sound
bj_questCompletedSound            = nil ---@type sound
bj_questFailedSound               = nil ---@type sound
bj_questHintSound                 = nil ---@type sound
bj_questSecretSound               = nil ---@type sound
bj_questItemAcquiredSound         = nil ---@type sound
bj_questWarningSound              = nil ---@type sound
bj_victoryDialogSound             = nil ---@type sound
bj_defeatDialogSound              = nil ---@type sound

-- Marketplace vars
bj_stockItemPurchased             = nil ---@type trigger
bj_stockUpdateTimer               = nil ---@type timer
bj_stockAllowedPermanent          = {} ---@type boolean
bj_stockAllowedCharged            = {} ---@type boolean
bj_stockAllowedArtifact           = {} ---@type boolean
bj_stockPickedItemLevel           = 0 ---@type integer
bj_stockPickedItemType            = nil ---@type itemtype

-- Melee vars
bj_meleeVisibilityTrained         = nil ---@type trigger
bj_meleeVisibilityIsDay           = true ---@type boolean
bj_meleeGrantHeroItems            = false ---@type boolean
bj_meleeNearestMineToLoc          = nil ---@type location
bj_meleeNearestMine               = nil ---@type unit
bj_meleeNearestMineDist           = 0.00 ---@type real
bj_meleeGameOver                  = false ---@type boolean
bj_meleeDefeated                  = {} ---@type boolean
bj_meleeVictoried                 = {} ---@type boolean
bj_ghoul                          = {} ---@type unit
bj_crippledTimer                  = {} ---@type timer
bj_crippledTimerWindows           = {} ---@type timerdialog
bj_playerIsCrippled               = {} ---@type boolean
bj_playerIsExposed                = {} ---@type boolean
bj_finishSoonAllExposed           = false ---@type boolean
bj_finishSoonTimerDialog          = nil ---@type timerdialog
bj_meleeTwinkedHeroes             = {} ---@type integer

-- Rescue behavior vars
bj_rescueUnitBehavior             = nil ---@type trigger
bj_rescueChangeColorUnit          = true ---@type boolean
bj_rescueChangeColorBldg          = true ---@type boolean

-- Transmission vars
bj_cineSceneEndingTimer           = nil ---@type timer
bj_cineSceneLastSound             = nil ---@type sound
bj_cineSceneBeingSkipped          = nil ---@type trigger

-- Cinematic mode vars
bj_cineModePriorSpeed             = MAP_SPEED_NORMAL ---@type gamespeed
bj_cineModePriorFogSetting        = false ---@type boolean
bj_cineModePriorMaskSetting       = false ---@type boolean
bj_cineModeAlreadyIn              = false ---@type boolean
bj_cineModePriorDawnDusk          = false ---@type boolean
bj_cineModeSavedSeed              = 0 ---@type integer

-- Cinematic fade vars
bj_cineFadeFinishTimer            = nil ---@type timer
bj_cineFadeContinueTimer          = nil ---@type timer
bj_cineFadeContinueRed            = 0 ---@type real
bj_cineFadeContinueGreen          = 0 ---@type real
bj_cineFadeContinueBlue           = 0 ---@type real
bj_cineFadeContinueTrans          = 0 ---@type real
bj_cineFadeContinueDuration       = 0 ---@type real
bj_cineFadeContinueTex            = "" ---@type string

-- QueuedTriggerExecute vars
bj_queuedExecTotal                = 0 ---@type integer
bj_queuedExecTriggers             = {} ---@type trigger
bj_queuedExecUseConds             = {} ---@type boolean
bj_queuedExecTimeoutTimer         = CreateTimer() ---@type timer
bj_queuedExecTimeout              = nil ---@type trigger

-- Helper vars (for Filter and Enum funcs)
bj_destInRegionDiesCount          = 0 ---@type integer
bj_destInRegionDiesTrig           = nil ---@type trigger
bj_groupCountUnits                = 0 ---@type integer
bj_forceCountPlayers              = 0 ---@type integer
bj_groupEnumTypeId                = 0 ---@type integer
bj_groupEnumOwningPlayer          = nil ---@type player
bj_groupAddGroupDest              = nil ---@type group
bj_groupRemoveGroupDest           = nil ---@type group
bj_groupRandomConsidered          = 0 ---@type integer
bj_groupRandomCurrentPick         = nil ---@type unit
bj_groupLastCreatedDest           = nil ---@type group
bj_randomSubGroupGroup            = nil ---@type group
bj_randomSubGroupWant             = 0 ---@type integer
bj_randomSubGroupTotal            = 0 ---@type integer
bj_randomSubGroupChance           = 0 ---@type real
bj_destRandomConsidered           = 0 ---@type integer
bj_destRandomCurrentPick          = nil ---@type destructable
bj_elevatorWallBlocker            = nil ---@type destructable
bj_elevatorNeighbor               = nil ---@type destructable
bj_itemRandomConsidered           = 0 ---@type integer
bj_itemRandomCurrentPick          = nil ---@type item
bj_forceRandomConsidered          = 0 ---@type integer
bj_forceRandomCurrentPick         = nil ---@type player
bj_makeUnitRescuableUnit          = nil ---@type unit
bj_makeUnitRescuableFlag          = true ---@type boolean
bj_pauseAllUnitsFlag              = true ---@type boolean
bj_enumDestructableCenter         = nil ---@type location
bj_enumDestructableRadius         = 0 ---@type real
bj_setPlayerTargetColor           = nil ---@type playercolor
bj_isUnitGroupDeadResult          = true ---@type boolean
bj_isUnitGroupEmptyResult         = true ---@type boolean
bj_isUnitGroupInRectResult        = true ---@type boolean
bj_isUnitGroupInRectRect          = nil ---@type rect
bj_changeLevelShowScores          = false ---@type boolean
bj_changeLevelMapName             = nil ---@type string
bj_suspendDecayFleshGroup         = CreateGroup() ---@type group
bj_suspendDecayBoneGroup          = CreateGroup() ---@type group
bj_delayedSuspendDecayTimer       = CreateTimer() ---@type timer
bj_delayedSuspendDecayTrig        = nil ---@type trigger
bj_livingPlayerUnitsTypeId        = 0 ---@type integer
bj_lastDyingWidget                = nil ---@type widget

-- Random distribution vars
bj_randDistCount                  = 0 ---@type integer
bj_randDistID                     = {} ---@type integer
bj_randDistChance                 = {} ---@type integer

-- Last X'd vars
bj_lastCreatedUnit                = nil ---@type unit
bj_lastCreatedItem                = nil ---@type item
bj_lastRemovedItem                = nil ---@type item
bj_lastHauntedGoldMine            = nil ---@type unit
bj_lastCreatedDestructable        = nil ---@type destructable
bj_lastCreatedGroup               = CreateGroup() ---@type group
bj_lastCreatedFogModifier         = nil ---@type fogmodifier
bj_lastCreatedEffect              = nil ---@type effect
bj_lastCreatedWeatherEffect       = nil ---@type weathereffect
bj_lastCreatedTerrainDeformation  = nil ---@type terraindeformation
bj_lastCreatedQuest               = nil ---@type quest
bj_lastCreatedQuestItem           = nil ---@type questitem
bj_lastCreatedDefeatCondition     = nil ---@type defeatcondition
bj_lastStartedTimer               = CreateTimer() ---@type timer
bj_lastCreatedTimerDialog         = nil ---@type timerdialog
bj_lastCreatedLeaderboard         = nil ---@type leaderboard
bj_lastCreatedMultiboard          = nil ---@type multiboard
bj_lastPlayedSound                = nil ---@type sound
bj_lastPlayedMusic                = "" ---@type string
bj_lastTransmissionDuration       = 0 ---@type real
bj_lastCreatedGameCache           = nil ---@type gamecache
bj_lastCreatedHashtable           = nil ---@type hashtable
bj_lastLoadedUnit                 = nil ---@type unit
bj_lastCreatedButton              = nil ---@type button
bj_lastReplacedUnit               = nil ---@type unit
bj_lastCreatedTextTag             = nil ---@type texttag
bj_lastCreatedLightning           = nil ---@type lightning
bj_lastCreatedImage               = nil ---@type image
bj_lastCreatedUbersplat           = nil ---@type ubersplat

-- Filter function vars
filterIssueHauntOrderAtLocBJ      = nil ---@type boolexpr
filterEnumDestructablesInCircleBJ = nil ---@type boolexpr
filterGetUnitsInRectOfPlayer      = nil ---@type boolexpr
filterGetUnitsOfTypeIdAll         = nil ---@type boolexpr
filterGetUnitsOfPlayerAndTypeId   = nil ---@type boolexpr
filterMeleeTrainedUnitIsHeroBJ    = nil ---@type boolexpr
filterLivingPlayerUnitsOfTypeId   = nil ---@type boolexpr

-- Memory cleanup vars
bj_wantDestroyGroup               = false ---@type boolean

-- Instanced Operation Results
bj_lastInstObjFuncSuccessful      = true ---@type boolean