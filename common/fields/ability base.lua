--===================================================
-- Instanced Object Operation API s
--===================================================

-- Ability
ABILITY_IF_BUTTON_POSITION_NORMAL_X        = ConvertAbilityIntegerField(FourCC('abpx')) ---@type abilityintegerfield
ABILITY_IF_BUTTON_POSITION_NORMAL_Y        = ConvertAbilityIntegerField(FourCC('abpy')) ---@type abilityintegerfield
ABILITY_IF_BUTTON_POSITION_ACTIVATED_X     = ConvertAbilityIntegerField(FourCC('aubx')) ---@type abilityintegerfield
ABILITY_IF_BUTTON_POSITION_ACTIVATED_Y     = ConvertAbilityIntegerField(FourCC('auby')) ---@type abilityintegerfield
ABILITY_IF_BUTTON_POSITION_RESEARCH_X      = ConvertAbilityIntegerField(FourCC('arpx')) ---@type abilityintegerfield
ABILITY_IF_BUTTON_POSITION_RESEARCH_Y      = ConvertAbilityIntegerField(FourCC('arpy')) ---@type abilityintegerfield
ABILITY_IF_MISSILE_SPEED                   = ConvertAbilityIntegerField(FourCC('amsp')) ---@type abilityintegerfield
ABILITY_IF_TARGET_ATTACHMENTS              = ConvertAbilityIntegerField(FourCC('atac')) ---@type abilityintegerfield
ABILITY_IF_CASTER_ATTACHMENTS              = ConvertAbilityIntegerField(FourCC('acac')) ---@type abilityintegerfield
ABILITY_IF_PRIORITY                        = ConvertAbilityIntegerField(FourCC('apri')) ---@type abilityintegerfield
ABILITY_IF_LEVELS                          = ConvertAbilityIntegerField(FourCC('alev')) ---@type abilityintegerfield
ABILITY_IF_REQUIRED_LEVEL                  = ConvertAbilityIntegerField(FourCC('arlv')) ---@type abilityintegerfield
ABILITY_IF_LEVEL_SKIP_REQUIREMENT          = ConvertAbilityIntegerField(FourCC('alsk')) ---@type abilityintegerfield

-- Get only
ABILITY_BF_HERO_ABILITY                    = ConvertAbilityBooleanField(FourCC('aher')) ---@type abilitybooleanfield
ABILITY_BF_ITEM_ABILITY                    = ConvertAbilityBooleanField(FourCC('aite')) ---@type abilitybooleanfield
ABILITY_BF_CHECK_DEPENDENCIES              = ConvertAbilityBooleanField(FourCC('achd')) ---@type abilitybooleanfield

ABILITY_RF_ARF_MISSILE_ARC                    = ConvertAbilityRealField(FourCC('amac')) ---@type abilityrealfield

-- Get Only
ABILITY_SF_NAME                             = ConvertAbilityStringField(FourCC('anam')) ---@type abilitystringfield
ABILITY_SF_ICON_ACTIVATED                   = ConvertAbilityStringField(FourCC('auar')) ---@type abilitystringfield
ABILITY_SF_ICON_RESEARCH                    = ConvertAbilityStringField(FourCC('arar')) ---@type abilitystringfield
ABILITY_SF_EFFECT_SOUND                     = ConvertAbilityStringField(FourCC('aefs')) ---@type abilitystringfield
ABILITY_SF_EFFECT_SOUND_LOOPING             = ConvertAbilityStringField(FourCC('aefl')) ---@type abilitystringfield