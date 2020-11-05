-- Move Type
MOVE_TYPE_UNKNOWN               = ConvertMoveType(0) ---@type movetype
MOVE_TYPE_FOOT                  = ConvertMoveType(1) ---@type movetype
MOVE_TYPE_FLY                   = ConvertMoveType(2) ---@type movetype
MOVE_TYPE_HORSE                 = ConvertMoveType(4) ---@type movetype
MOVE_TYPE_HOVER                 = ConvertMoveType(8) ---@type movetype
MOVE_TYPE_FLOAT                 = ConvertMoveType(16) ---@type movetype
MOVE_TYPE_AMPHIBIOUS            = ConvertMoveType(32) ---@type movetype
MOVE_TYPE_UNBUILDABLE           = ConvertMoveType(64) ---@type movetype

-- Target Flag
TARGET_FLAG_NONE                = ConvertTargetFlag(1) ---@type targetflag
TARGET_FLAG_GROUND              = ConvertTargetFlag(2) ---@type targetflag
TARGET_FLAG_AIR                 = ConvertTargetFlag(4) ---@type targetflag
TARGET_FLAG_STRUCTURE           = ConvertTargetFlag(8) ---@type targetflag
TARGET_FLAG_WARD                = ConvertTargetFlag(16) ---@type targetflag
TARGET_FLAG_ITEM                = ConvertTargetFlag(32) ---@type targetflag
TARGET_FLAG_TREE                = ConvertTargetFlag(64) ---@type targetflag
TARGET_FLAG_WALL                = ConvertTargetFlag(128) ---@type targetflag
TARGET_FLAG_DEBRIS              = ConvertTargetFlag(256) ---@type targetflag
TARGET_FLAG_DECORATION          = ConvertTargetFlag(512) ---@type targetflag
TARGET_FLAG_BRIDGE              = ConvertTargetFlag(1024) ---@type targetflag

-- defense type
DEFENSE_TYPE_LIGHT              = ConvertDefenseType(0) ---@type defensetype
DEFENSE_TYPE_MEDIUM             = ConvertDefenseType(1) ---@type defensetype
DEFENSE_TYPE_LARGE              = ConvertDefenseType(2) ---@type defensetype
DEFENSE_TYPE_FORT               = ConvertDefenseType(3) ---@type defensetype
DEFENSE_TYPE_NORMAL             = ConvertDefenseType(4) ---@type defensetype
DEFENSE_TYPE_HERO               = ConvertDefenseType(5) ---@type defensetype
DEFENSE_TYPE_DIVINE             = ConvertDefenseType(6) ---@type defensetype
DEFENSE_TYPE_NONE               = ConvertDefenseType(7) ---@type defensetype

-- Hero Attribute
HERO_ATTRIBUTE_STR              = ConvertHeroAttribute(1) ---@type heroattribute
HERO_ATTRIBUTE_INT              = ConvertHeroAttribute(2) ---@type heroattribute
HERO_ATTRIBUTE_AGI              = ConvertHeroAttribute(3) ---@type heroattribute

-- Armor Type
ARMOR_TYPE_WHOKNOWS             = ConvertArmorType(0) ---@type armortype
ARMOR_TYPE_FLESH                = ConvertArmorType(1) ---@type armortype
ARMOR_TYPE_METAL                = ConvertArmorType(2) ---@type armortype
ARMOR_TYPE_WOOD                 = ConvertArmorType(3) ---@type armortype
ARMOR_TYPE_ETHREAL              = ConvertArmorType(4) ---@type armortype
ARMOR_TYPE_STONE                = ConvertArmorType(5) ---@type armortype

-- Regeneration Type
REGENERATION_TYPE_NONE          = ConvertRegenType(0) ---@type regentype
REGENERATION_TYPE_ALWAYS        = ConvertRegenType(1) ---@type regentype
REGENERATION_TYPE_BLIGHT        = ConvertRegenType(2) ---@type regentype
REGENERATION_TYPE_DAY           = ConvertRegenType(3) ---@type regentype
REGENERATION_TYPE_NIGHT         = ConvertRegenType(4) ---@type regentype

-- Unit Category
UNIT_CATEGORY_GIANT             = ConvertUnitCategory(1) ---@type unitcategory
UNIT_CATEGORY_UNDEAD            = ConvertUnitCategory(2) ---@type unitcategory
UNIT_CATEGORY_SUMMONED          = ConvertUnitCategory(4) ---@type unitcategory
UNIT_CATEGORY_MECHANICAL        = ConvertUnitCategory(8) ---@type unitcategory
UNIT_CATEGORY_PEON              = ConvertUnitCategory(16) ---@type unitcategory
UNIT_CATEGORY_SAPPER            = ConvertUnitCategory(32) ---@type unitcategory
UNIT_CATEGORY_TOWNHALL          = ConvertUnitCategory(64) ---@type unitcategory
UNIT_CATEGORY_ANCIENT           = ConvertUnitCategory(128) ---@type unitcategory
UNIT_CATEGORY_NEUTRAL           = ConvertUnitCategory(256) ---@type unitcategory
UNIT_CATEGORY_WARD              = ConvertUnitCategory(512) ---@type unitcategory
UNIT_CATEGORY_STANDON           = ConvertUnitCategory(1024) ---@type unitcategory
UNIT_CATEGORY_TAUREN            = ConvertUnitCategory(2048) ---@type unitcategory