--===================================================
-- Game, Player and Unit Events
--
--  When an event causes a trigger to fire these
--  values allow the action code to determine which
--  event was dispatched and therefore which set of
--   functions should be used to get information
--  about the event.
--
-- Do NOT change the order or value of these s
-- without insuring that the JASS_GAME_EVENTS_WAR3 enum
-- is changed to match.
--
--===================================================

--===================================================
-- For use with TriggerRegisterGameEvent
--===================================================

EVENT_GAME_VICTORY                       = ConvertGameEvent(0) ---@type gameevent
EVENT_GAME_END_LEVEL                     = ConvertGameEvent(1) ---@type gameevent

EVENT_GAME_VARIABLE_LIMIT                = ConvertGameEvent(2) ---@type gameevent
EVENT_GAME_STATE_LIMIT                   = ConvertGameEvent(3) ---@type gameevent

EVENT_GAME_TIMER_EXPIRED                 = ConvertGameEvent(4) ---@type gameevent

EVENT_GAME_ENTER_REGION                  = ConvertGameEvent(5) ---@type gameevent
EVENT_GAME_LEAVE_REGION                  = ConvertGameEvent(6) ---@type gameevent

EVENT_GAME_TRACKABLE_HIT                 = ConvertGameEvent(7) ---@type gameevent
EVENT_GAME_TRACKABLE_TRACK               = ConvertGameEvent(8) ---@type gameevent

EVENT_GAME_SHOW_SKILL                    = ConvertGameEvent(9) ---@type gameevent
EVENT_GAME_BUILD_SUBMENU                 = ConvertGameEvent(10) ---@type gameevent

--===================================================
-- For use with TriggerRegisterPlayerEvent
--===================================================
EVENT_PLAYER_STATE_LIMIT               = ConvertPlayerEvent(11) ---@type playerevent
EVENT_PLAYER_ALLIANCE_CHANGED          = ConvertPlayerEvent(12) ---@type playerevent

EVENT_PLAYER_DEFEAT                    = ConvertPlayerEvent(13) ---@type playerevent
EVENT_PLAYER_VICTORY                   = ConvertPlayerEvent(14) ---@type playerevent
EVENT_PLAYER_LEAVE                     = ConvertPlayerEvent(15) ---@type playerevent
EVENT_PLAYER_CHAT                      = ConvertPlayerEvent(16) ---@type playerevent
EVENT_PLAYER_END_CINEMATIC             = ConvertPlayerEvent(17) ---@type playerevent

--===================================================
-- For use with TriggerRegisterPlayerUnitEvent
--===================================================

EVENT_PLAYER_UNIT_ATTACKED                 = ConvertPlayerUnitEvent(18) ---@type playerunitevent
EVENT_PLAYER_UNIT_RESCUED                  = ConvertPlayerUnitEvent(19) ---@type playerunitevent

EVENT_PLAYER_UNIT_DEATH                    = ConvertPlayerUnitEvent(20) ---@type playerunitevent
EVENT_PLAYER_UNIT_DECAY                    = ConvertPlayerUnitEvent(21) ---@type playerunitevent

EVENT_PLAYER_UNIT_DETECTED                 = ConvertPlayerUnitEvent(22) ---@type playerunitevent
EVENT_PLAYER_UNIT_HIDDEN                   = ConvertPlayerUnitEvent(23) ---@type playerunitevent

EVENT_PLAYER_UNIT_SELECTED                 = ConvertPlayerUnitEvent(24) ---@type playerunitevent
EVENT_PLAYER_UNIT_DESELECTED               = ConvertPlayerUnitEvent(25) ---@type playerunitevent

EVENT_PLAYER_UNIT_CONSTRUCT_START          = ConvertPlayerUnitEvent(26) ---@type playerunitevent
EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL         = ConvertPlayerUnitEvent(27) ---@type playerunitevent
EVENT_PLAYER_UNIT_CONSTRUCT_FINISH         = ConvertPlayerUnitEvent(28) ---@type playerunitevent

EVENT_PLAYER_UNIT_UPGRADE_START            = ConvertPlayerUnitEvent(29) ---@type playerunitevent
EVENT_PLAYER_UNIT_UPGRADE_CANCEL           = ConvertPlayerUnitEvent(30) ---@type playerunitevent
EVENT_PLAYER_UNIT_UPGRADE_FINISH           = ConvertPlayerUnitEvent(31) ---@type playerunitevent

EVENT_PLAYER_UNIT_TRAIN_START              = ConvertPlayerUnitEvent(32) ---@type playerunitevent
EVENT_PLAYER_UNIT_TRAIN_CANCEL             = ConvertPlayerUnitEvent(33) ---@type playerunitevent
EVENT_PLAYER_UNIT_TRAIN_FINISH             = ConvertPlayerUnitEvent(34) ---@type playerunitevent

EVENT_PLAYER_UNIT_RESEARCH_START           = ConvertPlayerUnitEvent(35) ---@type playerunitevent
EVENT_PLAYER_UNIT_RESEARCH_CANCEL          = ConvertPlayerUnitEvent(36) ---@type playerunitevent
EVENT_PLAYER_UNIT_RESEARCH_FINISH          = ConvertPlayerUnitEvent(37) ---@type playerunitevent
EVENT_PLAYER_UNIT_ISSUED_ORDER             = ConvertPlayerUnitEvent(38) ---@type playerunitevent
EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER       = ConvertPlayerUnitEvent(39) ---@type playerunitevent
EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER      = ConvertPlayerUnitEvent(40) ---@type playerunitevent
-- for compat
EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER        = ConvertPlayerUnitEvent(40)    ---@type playerunitevent

EVENT_PLAYER_HERO_LEVEL                    = ConvertPlayerUnitEvent(41) ---@type playerunitevent
EVENT_PLAYER_HERO_SKILL                    = ConvertPlayerUnitEvent(42) ---@type playerunitevent

EVENT_PLAYER_HERO_REVIVABLE                = ConvertPlayerUnitEvent(43) ---@type playerunitevent

EVENT_PLAYER_HERO_REVIVE_START             = ConvertPlayerUnitEvent(44) ---@type playerunitevent
EVENT_PLAYER_HERO_REVIVE_CANCEL            = ConvertPlayerUnitEvent(45) ---@type playerunitevent
EVENT_PLAYER_HERO_REVIVE_FINISH            = ConvertPlayerUnitEvent(46) ---@type playerunitevent
EVENT_PLAYER_UNIT_SUMMON                   = ConvertPlayerUnitEvent(47) ---@type playerunitevent
EVENT_PLAYER_UNIT_DROP_ITEM                = ConvertPlayerUnitEvent(48) ---@type playerunitevent
EVENT_PLAYER_UNIT_PICKUP_ITEM              = ConvertPlayerUnitEvent(49) ---@type playerunitevent
EVENT_PLAYER_UNIT_USE_ITEM                 = ConvertPlayerUnitEvent(50) ---@type playerunitevent

EVENT_PLAYER_UNIT_LOADED                   = ConvertPlayerUnitEvent(51) ---@type playerunitevent
EVENT_PLAYER_UNIT_DAMAGED                  = ConvertPlayerUnitEvent(308) ---@type playerunitevent
EVENT_PLAYER_UNIT_DAMAGING                 = ConvertPlayerUnitEvent(315) ---@type playerunitevent

--===================================================
-- For use with TriggerRegisterUnitEvent
--===================================================

EVENT_UNIT_DAMAGED                               = ConvertUnitEvent(52) ---@type unitevent
EVENT_UNIT_DAMAGING                              = ConvertUnitEvent(314) ---@type unitevent
EVENT_UNIT_DEATH                                 = ConvertUnitEvent(53) ---@type unitevent
EVENT_UNIT_DECAY                                 = ConvertUnitEvent(54) ---@type unitevent
EVENT_UNIT_DETECTED                              = ConvertUnitEvent(55) ---@type unitevent
EVENT_UNIT_HIDDEN                                = ConvertUnitEvent(56) ---@type unitevent
EVENT_UNIT_SELECTED                              = ConvertUnitEvent(57) ---@type unitevent
EVENT_UNIT_DESELECTED                            = ConvertUnitEvent(58) ---@type unitevent

EVENT_UNIT_STATE_LIMIT                           = ConvertUnitEvent(59) ---@type unitevent

-- Events which may have a filter for the "other unit"
--
EVENT_UNIT_ACQUIRED_TARGET                       = ConvertUnitEvent(60) ---@type unitevent
EVENT_UNIT_TARGET_IN_RANGE                       = ConvertUnitEvent(61) ---@type unitevent
EVENT_UNIT_ATTACKED                              = ConvertUnitEvent(62) ---@type unitevent
EVENT_UNIT_RESCUED                               = ConvertUnitEvent(63) ---@type unitevent

EVENT_UNIT_CONSTRUCT_CANCEL                      = ConvertUnitEvent(64) ---@type unitevent
EVENT_UNIT_CONSTRUCT_FINISH                      = ConvertUnitEvent(65) ---@type unitevent

EVENT_UNIT_UPGRADE_START                         = ConvertUnitEvent(66) ---@type unitevent
EVENT_UNIT_UPGRADE_CANCEL                        = ConvertUnitEvent(67) ---@type unitevent
EVENT_UNIT_UPGRADE_FINISH                        = ConvertUnitEvent(68) ---@type unitevent

-- Events which involve the specified unit performing
-- training of other units
--
EVENT_UNIT_TRAIN_START                           = ConvertUnitEvent(69) ---@type unitevent
EVENT_UNIT_TRAIN_CANCEL                          = ConvertUnitEvent(70) ---@type unitevent
EVENT_UNIT_TRAIN_FINISH                          = ConvertUnitEvent(71) ---@type unitevent

EVENT_UNIT_RESEARCH_START                        = ConvertUnitEvent(72) ---@type unitevent
EVENT_UNIT_RESEARCH_CANCEL                       = ConvertUnitEvent(73) ---@type unitevent
EVENT_UNIT_RESEARCH_FINISH                       = ConvertUnitEvent(74) ---@type unitevent

EVENT_UNIT_ISSUED_ORDER                          = ConvertUnitEvent(75) ---@type unitevent
EVENT_UNIT_ISSUED_POINT_ORDER                    = ConvertUnitEvent(76) ---@type unitevent
EVENT_UNIT_ISSUED_TARGET_ORDER                   = ConvertUnitEvent(77) ---@type unitevent

EVENT_UNIT_HERO_LEVEL                            = ConvertUnitEvent(78) ---@type unitevent
EVENT_UNIT_HERO_SKILL                            = ConvertUnitEvent(79) ---@type unitevent

EVENT_UNIT_HERO_REVIVABLE                        = ConvertUnitEvent(80) ---@type unitevent
EVENT_UNIT_HERO_REVIVE_START                     = ConvertUnitEvent(81) ---@type unitevent
EVENT_UNIT_HERO_REVIVE_CANCEL                    = ConvertUnitEvent(82) ---@type unitevent
EVENT_UNIT_HERO_REVIVE_FINISH                    = ConvertUnitEvent(83) ---@type unitevent

EVENT_UNIT_SUMMON                                = ConvertUnitEvent(84) ---@type unitevent

EVENT_UNIT_DROP_ITEM                             = ConvertUnitEvent(85) ---@type unitevent
EVENT_UNIT_PICKUP_ITEM                           = ConvertUnitEvent(86) ---@type unitevent
EVENT_UNIT_USE_ITEM                              = ConvertUnitEvent(87) ---@type unitevent

EVENT_UNIT_LOADED                                = ConvertUnitEvent(88) ---@type unitevent

EVENT_WIDGET_DEATH                             = ConvertWidgetEvent(89) ---@type widgetevent

EVENT_DIALOG_BUTTON_CLICK                      = ConvertDialogEvent(90) ---@type dialogevent
EVENT_DIALOG_CLICK                             = ConvertDialogEvent(91) ---@type dialogevent

--===================================================
-- Frozen Throne Expansion Events
-- Need to be added here to preserve compat
--===================================================

EVENT_GAME_LOADED                       = ConvertGameEvent(256) ---@type gameevent
EVENT_GAME_TOURNAMENT_FINISH_SOON       = ConvertGameEvent(257) ---@type gameevent
EVENT_GAME_TOURNAMENT_FINISH_NOW        = ConvertGameEvent(258) ---@type gameevent
EVENT_GAME_SAVE                         = ConvertGameEvent(259) ---@type gameevent
EVENT_GAME_CUSTOM_UI_FRAME              = ConvertGameEvent(310) ---@type gameevent

--===================================================
-- For use with TriggerRegisterPlayerEvent
--===================================================

EVENT_PLAYER_ARROW_LEFT_DOWN            = ConvertPlayerEvent(261) ---@type playerevent
EVENT_PLAYER_ARROW_LEFT_UP              = ConvertPlayerEvent(262) ---@type playerevent
EVENT_PLAYER_ARROW_RIGHT_DOWN           = ConvertPlayerEvent(263) ---@type playerevent
EVENT_PLAYER_ARROW_RIGHT_UP             = ConvertPlayerEvent(264) ---@type playerevent
EVENT_PLAYER_ARROW_DOWN_DOWN            = ConvertPlayerEvent(265) ---@type playerevent
EVENT_PLAYER_ARROW_DOWN_UP              = ConvertPlayerEvent(266) ---@type playerevent
EVENT_PLAYER_ARROW_UP_DOWN              = ConvertPlayerEvent(267) ---@type playerevent
EVENT_PLAYER_ARROW_UP_UP                = ConvertPlayerEvent(268) ---@type playerevent
EVENT_PLAYER_MOUSE_DOWN                 = ConvertPlayerEvent(305) ---@type playerevent
EVENT_PLAYER_MOUSE_UP                   = ConvertPlayerEvent(306) ---@type playerevent
EVENT_PLAYER_MOUSE_MOVE                 = ConvertPlayerEvent(307) ---@type playerevent
EVENT_PLAYER_SYNC_DATA                  = ConvertPlayerEvent(309) ---@type playerevent
EVENT_PLAYER_KEY                        = ConvertPlayerEvent(311) ---@type playerevent
EVENT_PLAYER_KEY_DOWN                   = ConvertPlayerEvent(312) ---@type playerevent
EVENT_PLAYER_KEY_UP                     = ConvertPlayerEvent(313) ---@type playerevent

--===================================================
-- For use with TriggerRegisterPlayerUnitEvent
--===================================================

EVENT_PLAYER_UNIT_SELL                  = ConvertPlayerUnitEvent(269) ---@type playerunitevent
EVENT_PLAYER_UNIT_CHANGE_OWNER          = ConvertPlayerUnitEvent(270) ---@type playerunitevent
EVENT_PLAYER_UNIT_SELL_ITEM             = ConvertPlayerUnitEvent(271) ---@type playerunitevent
EVENT_PLAYER_UNIT_SPELL_CHANNEL         = ConvertPlayerUnitEvent(272) ---@type playerunitevent
EVENT_PLAYER_UNIT_SPELL_CAST            = ConvertPlayerUnitEvent(273) ---@type playerunitevent
EVENT_PLAYER_UNIT_SPELL_EFFECT          = ConvertPlayerUnitEvent(274) ---@type playerunitevent
EVENT_PLAYER_UNIT_SPELL_FINISH          = ConvertPlayerUnitEvent(275) ---@type playerunitevent
EVENT_PLAYER_UNIT_SPELL_ENDCAST         = ConvertPlayerUnitEvent(276) ---@type playerunitevent
EVENT_PLAYER_UNIT_PAWN_ITEM             = ConvertPlayerUnitEvent(277) ---@type playerunitevent

--===================================================
-- For use with TriggerRegisterUnitEvent
--===================================================

EVENT_UNIT_SELL                         = ConvertUnitEvent(286) ---@type unitevent
EVENT_UNIT_CHANGE_OWNER                 = ConvertUnitEvent(287) ---@type unitevent
EVENT_UNIT_SELL_ITEM                    = ConvertUnitEvent(288) ---@type unitevent
EVENT_UNIT_SPELL_CHANNEL                = ConvertUnitEvent(289) ---@type unitevent
EVENT_UNIT_SPELL_CAST                   = ConvertUnitEvent(290) ---@type unitevent
EVENT_UNIT_SPELL_EFFECT                 = ConvertUnitEvent(291) ---@type unitevent
EVENT_UNIT_SPELL_FINISH                 = ConvertUnitEvent(292) ---@type unitevent
EVENT_UNIT_SPELL_ENDCAST                = ConvertUnitEvent(293) ---@type unitevent
EVENT_UNIT_PAWN_ITEM                    = ConvertUnitEvent(294) ---@type unitevent