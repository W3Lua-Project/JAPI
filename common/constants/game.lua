--===================================================
-- Game Constants
--===================================================

-- pfff
FALSE                           = false ---@type boolean
TRUE                            = true ---@type boolean
JASS_MAX_ARRAY_SIZE             = 32768 ---@type integer

PLAYER_NEUTRAL_PASSIVE          = GetPlayerNeutralPassive() ---@type integer
PLAYER_NEUTRAL_AGGRESSIVE       = GetPlayerNeutralAggressive() ---@type integer

PLAYER_COLOR_RED                = ConvertPlayerColor(0) ---@type playercolor
PLAYER_COLOR_BLUE               = ConvertPlayerColor(1) ---@type playercolor
PLAYER_COLOR_CYAN               = ConvertPlayerColor(2) ---@type playercolor
PLAYER_COLOR_PURPLE             = ConvertPlayerColor(3) ---@type playercolor
PLAYER_COLOR_YELLOW             = ConvertPlayerColor(4) ---@type playercolor
PLAYER_COLOR_ORANGE             = ConvertPlayerColor(5) ---@type playercolor
PLAYER_COLOR_GREEN              = ConvertPlayerColor(6) ---@type playercolor
PLAYER_COLOR_PINK               = ConvertPlayerColor(7) ---@type playercolor
PLAYER_COLOR_LIGHT_GRAY         = ConvertPlayerColor(8) ---@type playercolor
PLAYER_COLOR_LIGHT_BLUE         = ConvertPlayerColor(9) ---@type playercolor
PLAYER_COLOR_AQUA               = ConvertPlayerColor(10) ---@type playercolor
PLAYER_COLOR_BROWN              = ConvertPlayerColor(11) ---@type playercolor
PLAYER_COLOR_MAROON             = ConvertPlayerColor(12) ---@type playercolor
PLAYER_COLOR_NAVY               = ConvertPlayerColor(13) ---@type playercolor
PLAYER_COLOR_TURQUOISE          = ConvertPlayerColor(14) ---@type playercolor
PLAYER_COLOR_VIOLET             = ConvertPlayerColor(15) ---@type playercolor
PLAYER_COLOR_WHEAT              = ConvertPlayerColor(16) ---@type playercolor
PLAYER_COLOR_PEACH              = ConvertPlayerColor(17) ---@type playercolor
PLAYER_COLOR_MINT               = ConvertPlayerColor(18) ---@type playercolor
PLAYER_COLOR_LAVENDER           = ConvertPlayerColor(19) ---@type playercolor
PLAYER_COLOR_COAL               = ConvertPlayerColor(20) ---@type playercolor
PLAYER_COLOR_SNOW               = ConvertPlayerColor(21) ---@type playercolor
PLAYER_COLOR_EMERALD            = ConvertPlayerColor(22) ---@type playercolor
PLAYER_COLOR_PEANUT             = ConvertPlayerColor(23) ---@type playercolor

RACE_HUMAN                      = ConvertRace(1) ---@type race
RACE_ORC                        = ConvertRace(2) ---@type race
RACE_UNDEAD                     = ConvertRace(3) ---@type race
RACE_NIGHTELF                   = ConvertRace(4) ---@type race
RACE_DEMON                      = ConvertRace(5) ---@type race
RACE_OTHER                      = ConvertRace(7) ---@type race

PLAYER_GAME_RESULT_VICTORY      = ConvertPlayerGameResult(0) ---@type playergameresult
PLAYER_GAME_RESULT_DEFEAT       = ConvertPlayerGameResult(1) ---@type playergameresult
PLAYER_GAME_RESULT_TIE          = ConvertPlayerGameResult(2) ---@type playergameresult
PLAYER_GAME_RESULT_NEUTRAL      = ConvertPlayerGameResult(3) ---@type playergameresult

ALLIANCE_PASSIVE                = ConvertAllianceType(0) ---@type alliancetype
ALLIANCE_HELP_REQUEST           = ConvertAllianceType(1) ---@type alliancetype
ALLIANCE_HELP_RESPONSE          = ConvertAllianceType(2) ---@type alliancetype
ALLIANCE_SHARED_XP              = ConvertAllianceType(3) ---@type alliancetype
ALLIANCE_SHARED_SPELLS          = ConvertAllianceType(4) ---@type alliancetype
ALLIANCE_SHARED_VISION          = ConvertAllianceType(5) ---@type alliancetype
ALLIANCE_SHARED_CONTROL         = ConvertAllianceType(6) ---@type alliancetype
ALLIANCE_SHARED_ADVANCED_CONTROL= ConvertAllianceType(7) ---@type alliancetype
ALLIANCE_RESCUABLE              = ConvertAllianceType(8) ---@type alliancetype
ALLIANCE_SHARED_VISION_FORCED   = ConvertAllianceType(9) ---@type alliancetype

VERSION_REIGN_OF_CHAOS          = ConvertVersion(0) ---@type version
VERSION_FROZEN_THRONE           = ConvertVersion(1) ---@type version

ATTACK_TYPE_NORMAL              = ConvertAttackType(0) ---@type attacktype
ATTACK_TYPE_MELEE               = ConvertAttackType(1) ---@type attacktype
ATTACK_TYPE_PIERCE              = ConvertAttackType(2) ---@type attacktype
ATTACK_TYPE_SIEGE               = ConvertAttackType(3) ---@type attacktype
ATTACK_TYPE_MAGIC               = ConvertAttackType(4) ---@type attacktype
ATTACK_TYPE_CHAOS               = ConvertAttackType(5) ---@type attacktype
ATTACK_TYPE_HERO                = ConvertAttackType(6) ---@type attacktype

DAMAGE_TYPE_UNKNOWN             = ConvertDamageType(0) ---@type damagetype
DAMAGE_TYPE_NORMAL              = ConvertDamageType(4) ---@type damagetype
DAMAGE_TYPE_ENHANCED            = ConvertDamageType(5) ---@type damagetype
DAMAGE_TYPE_FIRE                = ConvertDamageType(8) ---@type damagetype
DAMAGE_TYPE_COLD                = ConvertDamageType(9) ---@type damagetype
DAMAGE_TYPE_LIGHTNING           = ConvertDamageType(10) ---@type damagetype
DAMAGE_TYPE_POISON              = ConvertDamageType(11) ---@type damagetype
DAMAGE_TYPE_DISEASE             = ConvertDamageType(12) ---@type damagetype
DAMAGE_TYPE_DIVINE              = ConvertDamageType(13) ---@type damagetype
DAMAGE_TYPE_MAGIC               = ConvertDamageType(14) ---@type damagetype
DAMAGE_TYPE_SONIC               = ConvertDamageType(15) ---@type damagetype
DAMAGE_TYPE_ACID                = ConvertDamageType(16) ---@type damagetype
DAMAGE_TYPE_FORCE               = ConvertDamageType(17) ---@type damagetype
DAMAGE_TYPE_DEATH               = ConvertDamageType(18) ---@type damagetype
DAMAGE_TYPE_MIND                = ConvertDamageType(19) ---@type damagetype
DAMAGE_TYPE_PLANT               = ConvertDamageType(20) ---@type damagetype
DAMAGE_TYPE_DEFENSIVE           = ConvertDamageType(21) ---@type damagetype
DAMAGE_TYPE_DEMOLITION          = ConvertDamageType(22) ---@type damagetype
DAMAGE_TYPE_SLOW_POISON         = ConvertDamageType(23) ---@type damagetype
DAMAGE_TYPE_SPIRIT_LINK         = ConvertDamageType(24) ---@type damagetype
DAMAGE_TYPE_SHADOW_STRIKE       = ConvertDamageType(25) ---@type damagetype
DAMAGE_TYPE_UNIVERSAL           = ConvertDamageType(26) ---@type damagetype

WEAPON_TYPE_WHOKNOWS            = ConvertWeaponType(0) ---@type weapontype
WEAPON_TYPE_METAL_LIGHT_CHOP    = ConvertWeaponType(1) ---@type weapontype
WEAPON_TYPE_METAL_MEDIUM_CHOP   = ConvertWeaponType(2) ---@type weapontype
WEAPON_TYPE_METAL_HEAVY_CHOP    = ConvertWeaponType(3) ---@type weapontype
WEAPON_TYPE_METAL_LIGHT_SLICE   = ConvertWeaponType(4) ---@type weapontype
WEAPON_TYPE_METAL_MEDIUM_SLICE  = ConvertWeaponType(5) ---@type weapontype
WEAPON_TYPE_METAL_HEAVY_SLICE   = ConvertWeaponType(6) ---@type weapontype
WEAPON_TYPE_METAL_MEDIUM_BASH   = ConvertWeaponType(7) ---@type weapontype
WEAPON_TYPE_METAL_HEAVY_BASH    = ConvertWeaponType(8) ---@type weapontype
WEAPON_TYPE_METAL_MEDIUM_STAB   = ConvertWeaponType(9) ---@type weapontype
WEAPON_TYPE_METAL_HEAVY_STAB    = ConvertWeaponType(10) ---@type weapontype
WEAPON_TYPE_WOOD_LIGHT_SLICE    = ConvertWeaponType(11) ---@type weapontype
WEAPON_TYPE_WOOD_MEDIUM_SLICE   = ConvertWeaponType(12) ---@type weapontype
WEAPON_TYPE_WOOD_HEAVY_SLICE    = ConvertWeaponType(13) ---@type weapontype
WEAPON_TYPE_WOOD_LIGHT_BASH     = ConvertWeaponType(14) ---@type weapontype
WEAPON_TYPE_WOOD_MEDIUM_BASH    = ConvertWeaponType(15) ---@type weapontype
WEAPON_TYPE_WOOD_HEAVY_BASH     = ConvertWeaponType(16) ---@type weapontype
WEAPON_TYPE_WOOD_LIGHT_STAB     = ConvertWeaponType(17) ---@type weapontype
WEAPON_TYPE_WOOD_MEDIUM_STAB    = ConvertWeaponType(18) ---@type weapontype
WEAPON_TYPE_CLAW_LIGHT_SLICE    = ConvertWeaponType(19) ---@type weapontype
WEAPON_TYPE_CLAW_MEDIUM_SLICE   = ConvertWeaponType(20) ---@type weapontype
WEAPON_TYPE_CLAW_HEAVY_SLICE    = ConvertWeaponType(21) ---@type weapontype
WEAPON_TYPE_AXE_MEDIUM_CHOP     = ConvertWeaponType(22) ---@type weapontype
WEAPON_TYPE_ROCK_HEAVY_BASH     = ConvertWeaponType(23) ---@type weapontype

PATHING_TYPE_ANY                = ConvertPathingType(0) ---@type pathingtype
PATHING_TYPE_WALKABILITY        = ConvertPathingType(1) ---@type pathingtype
PATHING_TYPE_FLYABILITY         = ConvertPathingType(2) ---@type pathingtype
PATHING_TYPE_BUILDABILITY       = ConvertPathingType(3) ---@type pathingtype
PATHING_TYPE_PEONHARVESTPATHING = ConvertPathingType(4) ---@type pathingtype
PATHING_TYPE_BLIGHTPATHING      = ConvertPathingType(5) ---@type pathingtype
PATHING_TYPE_FLOATABILITY       = ConvertPathingType(6) ---@type pathingtype
PATHING_TYPE_AMPHIBIOUSPATHING  = ConvertPathingType(7) ---@type pathingtype

MOUSE_BUTTON_TYPE_LEFT          = ConvertMouseButtonType(1) ---@type mousebuttontype
MOUSE_BUTTON_TYPE_MIDDLE        = ConvertMouseButtonType(2) ---@type mousebuttontype
MOUSE_BUTTON_TYPE_RIGHT         = ConvertMouseButtonType(3) ---@type mousebuttontype

ANIM_TYPE_BIRTH                 = ConvertAnimType(0) ---@type animtype
ANIM_TYPE_DEATH                 = ConvertAnimType(1) ---@type animtype
ANIM_TYPE_DECAY                 = ConvertAnimType(2) ---@type animtype
ANIM_TYPE_DISSIPATE             = ConvertAnimType(3) ---@type animtype
ANIM_TYPE_STAND                 = ConvertAnimType(4) ---@type animtype
ANIM_TYPE_WALK                  = ConvertAnimType(5) ---@type animtype
ANIM_TYPE_ATTACK                = ConvertAnimType(6) ---@type animtype
ANIM_TYPE_MORPH                 = ConvertAnimType(7) ---@type animtype
ANIM_TYPE_SLEEP                 = ConvertAnimType(8) ---@type animtype
ANIM_TYPE_SPELL                 = ConvertAnimType(9) ---@type animtype
ANIM_TYPE_PORTRAIT              = ConvertAnimType(10) ---@type animtype

SUBANIM_TYPE_ROOTED             = ConvertSubAnimType(11) ---@type subanimtype
SUBANIM_TYPE_ALTERNATE_EX       = ConvertSubAnimType(12) ---@type subanimtype
SUBANIM_TYPE_LOOPING            = ConvertSubAnimType(13) ---@type subanimtype
SUBANIM_TYPE_SLAM               = ConvertSubAnimType(14) ---@type subanimtype
SUBANIM_TYPE_THROW              = ConvertSubAnimType(15) ---@type subanimtype
SUBANIM_TYPE_SPIKED             = ConvertSubAnimType(16) ---@type subanimtype
SUBANIM_TYPE_FAST               = ConvertSubAnimType(17) ---@type subanimtype
SUBANIM_TYPE_SPIN               = ConvertSubAnimType(18) ---@type subanimtype
SUBANIM_TYPE_READY              = ConvertSubAnimType(19) ---@type subanimtype
SUBANIM_TYPE_CHANNEL            = ConvertSubAnimType(20) ---@type subanimtype
SUBANIM_TYPE_DEFEND             = ConvertSubAnimType(21) ---@type subanimtype
SUBANIM_TYPE_VICTORY            = ConvertSubAnimType(22) ---@type subanimtype
SUBANIM_TYPE_TURN               = ConvertSubAnimType(23) ---@type subanimtype
SUBANIM_TYPE_LEFT               = ConvertSubAnimType(24) ---@type subanimtype
SUBANIM_TYPE_RIGHT              = ConvertSubAnimType(25) ---@type subanimtype
SUBANIM_TYPE_FIRE               = ConvertSubAnimType(26) ---@type subanimtype
SUBANIM_TYPE_FLESH              = ConvertSubAnimType(27) ---@type subanimtype
SUBANIM_TYPE_HIT                = ConvertSubAnimType(28) ---@type subanimtype
SUBANIM_TYPE_WOUNDED            = ConvertSubAnimType(29) ---@type subanimtype
SUBANIM_TYPE_LIGHT              = ConvertSubAnimType(30) ---@type subanimtype
SUBANIM_TYPE_MODERATE           = ConvertSubAnimType(31) ---@type subanimtype
SUBANIM_TYPE_SEVERE             = ConvertSubAnimType(32) ---@type subanimtype
SUBANIM_TYPE_CRITICAL           = ConvertSubAnimType(33) ---@type subanimtype
SUBANIM_TYPE_COMPLETE           = ConvertSubAnimType(34) ---@type subanimtype
SUBANIM_TYPE_GOLD               = ConvertSubAnimType(35) ---@type subanimtype
SUBANIM_TYPE_LUMBER             = ConvertSubAnimType(36) ---@type subanimtype
SUBANIM_TYPE_WORK               = ConvertSubAnimType(37) ---@type subanimtype
SUBANIM_TYPE_TALK               = ConvertSubAnimType(38) ---@type subanimtype
SUBANIM_TYPE_FIRST              = ConvertSubAnimType(39) ---@type subanimtype
SUBANIM_TYPE_SECOND             = ConvertSubAnimType(40) ---@type subanimtype
SUBANIM_TYPE_THIRD              = ConvertSubAnimType(41) ---@type subanimtype
SUBANIM_TYPE_FOURTH             = ConvertSubAnimType(42) ---@type subanimtype
SUBANIM_TYPE_FIFTH              = ConvertSubAnimType(43) ---@type subanimtype
SUBANIM_TYPE_ONE                = ConvertSubAnimType(44) ---@type subanimtype
SUBANIM_TYPE_TWO                = ConvertSubAnimType(45) ---@type subanimtype
SUBANIM_TYPE_THREE              = ConvertSubAnimType(46) ---@type subanimtype
SUBANIM_TYPE_FOUR               = ConvertSubAnimType(47) ---@type subanimtype
SUBANIM_TYPE_FIVE               = ConvertSubAnimType(48) ---@type subanimtype
SUBANIM_TYPE_SMALL              = ConvertSubAnimType(49) ---@type subanimtype
SUBANIM_TYPE_MEDIUM             = ConvertSubAnimType(50) ---@type subanimtype
SUBANIM_TYPE_LARGE              = ConvertSubAnimType(51) ---@type subanimtype
SUBANIM_TYPE_UPGRADE            = ConvertSubAnimType(52) ---@type subanimtype
SUBANIM_TYPE_DRAIN              = ConvertSubAnimType(53) ---@type subanimtype
SUBANIM_TYPE_FILL               = ConvertSubAnimType(54) ---@type subanimtype
SUBANIM_TYPE_CHAINLIGHTNING     = ConvertSubAnimType(55) ---@type subanimtype
SUBANIM_TYPE_EATTREE            = ConvertSubAnimType(56) ---@type subanimtype
SUBANIM_TYPE_PUKE               = ConvertSubAnimType(57) ---@type subanimtype
SUBANIM_TYPE_FLAIL              = ConvertSubAnimType(58) ---@type subanimtype
SUBANIM_TYPE_OFF                = ConvertSubAnimType(59) ---@type subanimtype
SUBANIM_TYPE_SWIM               = ConvertSubAnimType(60) ---@type subanimtype
SUBANIM_TYPE_ENTANGLE           = ConvertSubAnimType(61) ---@type subanimtype
SUBANIM_TYPE_BERSERK            = ConvertSubAnimType(62) ---@type subanimtype

-- Pathing Flag
PATHING_FLAG_UNWALKABLE             = ConvertPathingFlag(2) ---@type pathingflag
PATHING_FLAG_UNFLYABLE              = ConvertPathingFlag(4) ---@type pathingflag
PATHING_FLAG_UNBUILDABLE            = ConvertPathingFlag(8) ---@type pathingflag
PATHING_FLAG_UNPEONHARVEST          = ConvertPathingFlag(16) ---@type pathingflag
PATHING_FLAG_BLIGHTED               = ConvertPathingFlag(32) ---@type pathingflag
PATHING_FLAG_UNFLOATABLE            = ConvertPathingFlag(64) ---@type pathingflag
PATHING_FLAG_UNAMPHIBIOUS           = ConvertPathingFlag(128) ---@type pathingflag
PATHING_FLAG_UNITEMPLACABLE         = ConvertPathingFlag(256) ---@type pathingflag