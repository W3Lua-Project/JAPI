--===================================================
-- Animatable Camera Fields
--===================================================

CAMERA_FIELD_TARGET_DISTANCE       = ConvertCameraField(0) ---@type camerafield
CAMERA_FIELD_FARZ                  = ConvertCameraField(1) ---@type camerafield
CAMERA_FIELD_ANGLE_OF_ATTACK       = ConvertCameraField(2) ---@type camerafield
CAMERA_FIELD_FIELD_OF_VIEW         = ConvertCameraField(3) ---@type camerafield
CAMERA_FIELD_ROLL                  = ConvertCameraField(4) ---@type camerafield
CAMERA_FIELD_ROTATION              = ConvertCameraField(5) ---@type camerafield
CAMERA_FIELD_ZOFFSET               = ConvertCameraField(6) ---@type camerafield
CAMERA_FIELD_NEARZ                 = ConvertCameraField(7) ---@type camerafield
CAMERA_FIELD_LOCAL_PITCH           = ConvertCameraField(8) ---@type camerafield
CAMERA_FIELD_LOCAL_YAW             = ConvertCameraField(9) ---@type camerafield
CAMERA_FIELD_LOCAL_ROLL            = ConvertCameraField(10) ---@type camerafield

BLEND_MODE_NONE                    = ConvertBlendMode(0) ---@type blendmode
BLEND_MODE_DONT_CARE               = ConvertBlendMode(0) ---@type blendmode
BLEND_MODE_KEYALPHA                = ConvertBlendMode(1) ---@type blendmode
BLEND_MODE_BLEND                   = ConvertBlendMode(2) ---@type blendmode
BLEND_MODE_ADDITIVE                = ConvertBlendMode(3) ---@type blendmode
BLEND_MODE_MODULATE                = ConvertBlendMode(4) ---@type blendmode
BLEND_MODE_MODULATE_2X             = ConvertBlendMode(5) ---@type blendmode

RARITY_FREQUENT                 = ConvertRarityControl(0) ---@type raritycontrol
RARITY_RARE                     = ConvertRarityControl(1) ---@type raritycontrol

TEXMAP_FLAG_NONE                = ConvertTexMapFlags(0) ---@type texmapflags
TEXMAP_FLAG_WRAP_U              = ConvertTexMapFlags(1) ---@type texmapflags
TEXMAP_FLAG_WRAP_V              = ConvertTexMapFlags(2) ---@type texmapflags
TEXMAP_FLAG_WRAP_UV             = ConvertTexMapFlags(3) ---@type texmapflags

FOG_OF_WAR_MASKED               = ConvertFogState(1) ---@type fogstate
FOG_OF_WAR_FOGGED               = ConvertFogState(2) ---@type fogstate
FOG_OF_WAR_VISIBLE              = ConvertFogState(4) ---@type fogstate

--===================================================
-- Camera Margin s for use with GetCameraMargin
--===================================================

CAMERA_MARGIN_LEFT              = 0 ---@type integer
CAMERA_MARGIN_RIGHT             = 1 ---@type integer
CAMERA_MARGIN_TOP               = 2 ---@type integer
CAMERA_MARGIN_BOTTOM            = 3 ---@type integer