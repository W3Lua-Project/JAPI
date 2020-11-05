-- Item
ITEM_IF_LEVEL                 = ConvertItemIntegerField(FourCC('ilev')) ---@type itemintegerfield
ITEM_IF_NUMBER_OF_CHARGES     = ConvertItemIntegerField(FourCC('iuse')) ---@type itemintegerfield
ITEM_IF_COOLDOWN_GROUP        = ConvertItemIntegerField(FourCC('icid')) ---@type itemintegerfield
ITEM_IF_MAX_HIT_POINTS        = ConvertItemIntegerField(FourCC('ihtp')) ---@type itemintegerfield
ITEM_IF_HIT_POINTS            = ConvertItemIntegerField(FourCC('ihpc')) ---@type itemintegerfield
ITEM_IF_PRIORITY              = ConvertItemIntegerField(FourCC('ipri')) ---@type itemintegerfield
ITEM_IF_ARMOR_TYPE            = ConvertItemIntegerField(FourCC('iarm')) ---@type itemintegerfield
ITEM_IF_TINTING_COLOR_RED     = ConvertItemIntegerField(FourCC('iclr')) ---@type itemintegerfield
ITEM_IF_TINTING_COLOR_GREEN   = ConvertItemIntegerField(FourCC('iclg')) ---@type itemintegerfield
ITEM_IF_TINTING_COLOR_BLUE    = ConvertItemIntegerField(FourCC('iclb')) ---@type itemintegerfield
ITEM_IF_TINTING_COLOR_ALPHA   = ConvertItemIntegerField(FourCC('ical')) ---@type itemintegerfield

ITEM_RF_SCALING_VALUE            = ConvertItemRealField(FourCC('isca')) ---@type itemrealfield

ITEM_BF_DROPPED_WHEN_CARRIER_DIES         = ConvertItemBooleanField(FourCC('idrp')) ---@type itembooleanfield
ITEM_BF_CAN_BE_DROPPED                    = ConvertItemBooleanField(FourCC('idro')) ---@type itembooleanfield
ITEM_BF_PERISHABLE                        = ConvertItemBooleanField(FourCC('iper')) ---@type itembooleanfield
ITEM_BF_INCLUDE_AS_RANDOM_CHOICE          = ConvertItemBooleanField(FourCC('iprn')) ---@type itembooleanfield
ITEM_BF_USE_AUTOMATICALLY_WHEN_ACQUIRED   = ConvertItemBooleanField(FourCC('ipow')) ---@type itembooleanfield
ITEM_BF_CAN_BE_SOLD_TO_MERCHANTS          = ConvertItemBooleanField(FourCC('ipaw')) ---@type itembooleanfield
ITEM_BF_ACTIVELY_USED                     = ConvertItemBooleanField(FourCC('iusa')) ---@type itembooleanfield

ITEM_SF_MODEL_USED                         = ConvertItemStringField(FourCC('ifil')) ---@type itemstringfield