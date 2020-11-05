--===================================================
-- Unit Type Constants for use with ChooseRandomItemEx()
--===================================================

ITEM_TYPE_PERMANENT                   = ConvertItemType(0) ---@type itemtype
ITEM_TYPE_CHARGED                     = ConvertItemType(1) ---@type itemtype
ITEM_TYPE_POWERUP                     = ConvertItemType(2) ---@type itemtype
ITEM_TYPE_ARTIFACT                    = ConvertItemType(3) ---@type itemtype
ITEM_TYPE_PURCHASABLE                 = ConvertItemType(4) ---@type itemtype
ITEM_TYPE_CAMPAIGN                    = ConvertItemType(5) ---@type itemtype
ITEM_TYPE_MISCELLANEOUS               = ConvertItemType(6) ---@type itemtype
ITEM_TYPE_UNKNOWN                     = ConvertItemType(7) ---@type itemtype
ITEM_TYPE_ANY                         = ConvertItemType(8) ---@type itemtype

-- Deprecated, should use ITEM_TYPE_POWERUP
ITEM_TYPE_TOME                        = ConvertItemType(2) ---@type itemtype