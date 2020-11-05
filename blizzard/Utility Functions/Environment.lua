--***************************************************************************
--*
--*  Environment Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param where rect
---@param effectID integer
---@return weathereffect
function AddWeatherEffectSaveLast(where, effectID)
	bj_lastCreatedWeatherEffect = AddWeatherEffect(where, effectID)
	return bj_lastCreatedWeatherEffect
end

--===========================================================================
---@return weathereffect
function GetLastCreatedWeatherEffect()
	return bj_lastCreatedWeatherEffect
end

--===========================================================================
---@param whichWeatherEffect weathereffect
function RemoveWeatherEffectBJ(whichWeatherEffect)
	RemoveWeatherEffect(whichWeatherEffect)
end

--===========================================================================
---@param duration real
---@param permanent boolean
---@param where location
---@param radius real
---@param depth real
---@return terraindeformation
function TerrainDeformationCraterBJ(duration, permanent, where, radius, depth)
	bj_lastCreatedTerrainDeformation = TerrainDeformCrater(GetLocationX(where), GetLocationY(where), radius, depth, R2I(duration * 1000), permanent)
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
---@param duration real
---@param limitNeg boolean
---@param where location
---@param startRadius real
---@param endRadius real
---@param depth real
---@param wavePeriod real
---@param waveWidth real
---@return terraindeformation
function TerrainDeformationRippleBJ(duration, limitNeg, where, startRadius, endRadius, depth, wavePeriod, waveWidth)
	---@type real
	spaceWave   = nil
	---@type real
	timeWave    = nil
	---@type real
	radiusRatio = nil
	
	if (endRadius <= 0 or waveWidth <= 0 or wavePeriod <= 0) then
		return nil
	end
	
	timeWave                         = 2.0 * duration / wavePeriod
	spaceWave                        = 2.0 * endRadius / waveWidth
	radiusRatio                      = startRadius / endRadius
	
	bj_lastCreatedTerrainDeformation = TerrainDeformRipple(GetLocationX(where), GetLocationY(where), endRadius, depth, R2I(duration * 1000), 1, spaceWave, timeWave, radiusRatio, limitNeg)
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
---@param duration real
---@param source location
---@param target location
---@param radius real
---@param depth real
---@param trailDelay real
---@return terraindeformation
function TerrainDeformationWaveBJ(duration, source, target, radius, depth, trailDelay)
	---@type real
	distance = nil
	---@type real
	dirX     = nil
	---@type real
	dirY     = nil
	---@type real
	speed    = nil
	
	distance = DistanceBetweenPoints(source, target)
	if (distance == 0 or duration <= 0) then
		return nil
	end
	
	dirX                             = (GetLocationX(target) - GetLocationX(source)) / distance
	dirY                             = (GetLocationY(target) - GetLocationY(source)) / distance
	speed                            = distance / duration
	
	bj_lastCreatedTerrainDeformation = TerrainDeformWave(GetLocationX(source), GetLocationY(source), dirX, dirY, distance, speed, radius, depth, R2I(trailDelay * 1000), 1)
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
---@param duration real
---@param where location
---@param radius real
---@param minDelta real
---@param maxDelta real
---@param updateInterval real
---@return terraindeformation
function TerrainDeformationRandomBJ(duration, where, radius, minDelta, maxDelta, updateInterval)
	bj_lastCreatedTerrainDeformation = TerrainDeformRandom(GetLocationX(where), GetLocationY(where), radius, minDelta, maxDelta, R2I(duration * 1000), R2I(updateInterval * 1000))
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
---@param deformation terraindeformation
---@param duration real
function TerrainDeformationStopBJ(deformation, duration)
	TerrainDeformStop(deformation, R2I(duration * 1000))
end

--===========================================================================
---@return terraindeformation
function GetLastCreatedTerrainDeformation()
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
---@param codeName string
---@param where1 location
---@param where2 location
---@return lightning
function AddLightningLoc(codeName, where1, where2)
	bj_lastCreatedLightning = AddLightningEx(codeName, true, GetLocationX(where1), GetLocationY(where1), GetLocationZ(where1), GetLocationX(where2), GetLocationY(where2), GetLocationZ(where2))
	return bj_lastCreatedLightning
end

--===========================================================================
---@param whichBolt lightning
---@return boolean
function DestroyLightningBJ(whichBolt)
	return DestroyLightning(whichBolt)
end

--===========================================================================
---@param whichBolt lightning
---@param where1 location
---@param where2 location
---@return boolean
function MoveLightningLoc(whichBolt, where1, where2)
	return MoveLightningEx(whichBolt, true, GetLocationX(where1), GetLocationY(where1), GetLocationZ(where1), GetLocationX(where2), GetLocationY(where2), GetLocationZ(where2))
end

--===========================================================================
---@param whichBolt lightning
---@return real
function GetLightningColorABJ(whichBolt)
	return GetLightningColorA(whichBolt)
end

--===========================================================================
---@param whichBolt lightning
---@return real
function GetLightningColorRBJ(whichBolt)
	return GetLightningColorR(whichBolt)
end

--===========================================================================
---@param whichBolt lightning
---@return real
function GetLightningColorGBJ(whichBolt)
	return GetLightningColorG(whichBolt)
end

--===========================================================================
---@param whichBolt lightning
---@return real
function GetLightningColorBBJ(whichBolt)
	return GetLightningColorB(whichBolt)
end

--===========================================================================
---@param whichBolt lightning
---@param r real
---@param g real
---@param b real
---@param a real
---@return boolean
function SetLightningColorBJ(whichBolt, r, g, b, a)
	return SetLightningColor(whichBolt, r, g, b, a)
end

--===========================================================================
---@return lightning
function GetLastCreatedLightningBJ()
	return bj_lastCreatedLightning
end

--===========================================================================
---@param abilcode integer
---@param t effecttype
---@param index integer
---@return string
function GetAbilityEffectBJ(abilcode, t, index)
	return GetAbilityEffectById(abilcode, t, index)
end

--===========================================================================
---@param abilcode integer
---@param t soundtype
---@return string
function GetAbilitySoundBJ(abilcode, t)
	return GetAbilitySoundById(abilcode, t)
end


--===========================================================================
---@param where location
---@return integer
function GetTerrainCliffLevelBJ(where)
	return GetTerrainCliffLevel(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
---@param where location
---@return integer
function GetTerrainTypeBJ(where)
	return GetTerrainType(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
---@param where location
---@return integer
function GetTerrainVarianceBJ(where)
	return GetTerrainVariance(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
---@param where location
---@param terrainType integer
---@param variation integer
---@param area integer
---@param shape integer
function SetTerrainTypeBJ(where, terrainType, variation, area, shape)
	SetTerrainType(GetLocationX(where), GetLocationY(where), terrainType, variation, area, shape)
end

--===========================================================================
---@param where location
---@param t pathingtype
---@return boolean
function IsTerrainPathableBJ(where, t)
	return IsTerrainPathable(GetLocationX(where), GetLocationY(where), t)
end

--===========================================================================
---@param where location
---@param t pathingtype
---@param flag boolean
function SetTerrainPathableBJ(where, t, flag)
	SetTerrainPathable(GetLocationX(where), GetLocationY(where), t, flag)
end

--===========================================================================
---@param red real
---@param green real
---@param blue real
---@param transparency real
function SetWaterBaseColorBJ(red, green, blue, transparency)
	SetWaterBaseColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param whichPlayer player
---@param whichFogState fogstate
---@param r rect
---@param afterUnits boolean
---@return fogmodifier
function CreateFogModifierRectSimple(whichPlayer, whichFogState, r, afterUnits)
	bj_lastCreatedFogModifier = CreateFogModifierRect(whichPlayer, whichFogState, r, true, afterUnits)
	return bj_lastCreatedFogModifier
end

--===========================================================================
---@param whichPlayer player
---@param whichFogState fogstate
---@param center location
---@param radius real
---@param afterUnits boolean
---@return fogmodifier
function CreateFogModifierRadiusLocSimple(whichPlayer, whichFogState, center, radius, afterUnits)
	bj_lastCreatedFogModifier = CreateFogModifierRadiusLoc(whichPlayer, whichFogState, center, radius, true, afterUnits)
	return bj_lastCreatedFogModifier
end

--===========================================================================
-- Version of CreateFogModifierRect that assumes use of sharedVision and
-- gives the option of immediately enabling the modifier, so that triggers
-- can default to modifiers that are immediately enabled.
--
---@param enabled boolean
---@param whichPlayer player
---@param whichFogState fogstate
---@param r rect
---@return fogmodifier
function CreateFogModifierRectBJ(enabled, whichPlayer, whichFogState, r)
	bj_lastCreatedFogModifier = CreateFogModifierRect(whichPlayer, whichFogState, r, true, false)
	if enabled then
		FogModifierStart(bj_lastCreatedFogModifier)
	end
	return bj_lastCreatedFogModifier
end

--===========================================================================
-- Version of CreateFogModifierRadius that assumes use of sharedVision and
-- gives the option of immediately enabling the modifier, so that triggers
-- can default to modifiers that are immediately enabled.
--
---@param enabled boolean
---@param whichPlayer player
---@param whichFogState fogstate
---@param center location
---@param radius real
---@return fogmodifier
function CreateFogModifierRadiusLocBJ(enabled, whichPlayer, whichFogState, center, radius)
	bj_lastCreatedFogModifier = CreateFogModifierRadiusLoc(whichPlayer, whichFogState, center, radius, true, false)
	if enabled then
		FogModifierStart(bj_lastCreatedFogModifier)
	end
	return bj_lastCreatedFogModifier
end

--===========================================================================
---@return fogmodifier
function GetLastCreatedFogModifier()
	return bj_lastCreatedFogModifier
end

--===========================================================================
function FogEnableOn()
	FogEnable(true)
end

--===========================================================================
function FogEnableOff()
	FogEnable(false)
end

--===========================================================================
function FogMaskEnableOn()
	FogMaskEnable(true)
end

--===========================================================================
function FogMaskEnableOff()
	FogMaskEnable(false)
end

--===========================================================================
---@param flag boolean
function UseTimeOfDayBJ(flag)
	SuspendTimeOfDay(not flag)
end

--===========================================================================
---@param style integer
---@param zstart real
---@param zend real
---@param density real
---@param red real
---@param green real
---@param blue real
function SetTerrainFogExBJ(style, zstart, zend, density, red, green, blue)
	SetTerrainFogEx(style, zstart, zend, density, red * 0.01, green * 0.01, blue * 0.01)
end

--===========================================================================
function ResetTerrainFogBJ()
	ResetTerrainFog()
end

--===========================================================================
---@param animName string
---@param doodadID integer
---@param radius real
---@param center location
function SetDoodadAnimationBJ(animName, doodadID, radius, center)
	SetDoodadAnimation(GetLocationX(center), GetLocationY(center), radius, doodadID, false, animName, false)
end

--===========================================================================
---@param animName string
---@param doodadID integer
---@param r rect
function SetDoodadAnimationRectBJ(animName, doodadID, r)
	SetDoodadAnimationRect(r, doodadID, animName, false)
end

--===========================================================================
---@param add boolean
---@param animProperties string
---@param whichUnit unit
function AddUnitAnimationPropertiesBJ(add, animProperties, whichUnit)
	AddUnitAnimationProperties(whichUnit, animProperties, add)
end


--============================================================================
---@param file string
---@param size real
---@param where location
---@param zOffset real
---@param imageType integer
---@return image
function CreateImageBJ(file, size, where, zOffset, imageType)
	bj_lastCreatedImage = CreateImage(file, size, size, size, GetLocationX(where), GetLocationY(where), zOffset, 0, 0, 0, imageType)
	return bj_lastCreatedImage
end

--============================================================================
---@param flag boolean
---@param whichImage image
function ShowImageBJ(flag, whichImage)
	ShowImage(whichImage, flag)
end

--============================================================================
---@param whichImage image
---@param where location
---@param zOffset real
function SetImagePositionBJ(whichImage, where, zOffset)
	SetImagePosition(whichImage, GetLocationX(where), GetLocationY(where), zOffset)
end

--============================================================================
---@param whichImage image
---@param red real
---@param green real
---@param blue real
---@param alpha real
function SetImageColorBJ(whichImage, red, green, blue, alpha)
	SetImageColor(whichImage, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha))
end

--============================================================================
---@return image
function GetLastCreatedImage()
	return bj_lastCreatedImage
end

--============================================================================
---@param where location
---@param name string
---@param red real
---@param green real
---@param blue real
---@param alpha real
---@param forcePaused boolean
---@param noBirthTime boolean
---@return ubersplat
function CreateUbersplatBJ(where, name, red, green, blue, alpha, forcePaused, noBirthTime)
	bj_lastCreatedUbersplat = CreateUbersplat(GetLocationX(where), GetLocationY(where), name, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha), forcePaused, noBirthTime)
	return bj_lastCreatedUbersplat
end

--============================================================================
---@param flag boolean
---@param whichSplat ubersplat
function ShowUbersplatBJ(flag, whichSplat)
	ShowUbersplat(whichSplat, flag)
end

--============================================================================
---@return ubersplat
function GetLastCreatedUbersplat()
	return bj_lastCreatedUbersplat
end