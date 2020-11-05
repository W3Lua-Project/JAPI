--***************************************************************************
--*
--*  Special Effect Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param where location
---@param modelName string
---@return effect
function AddSpecialEffectLocBJ(where, modelName)
	bj_lastCreatedEffect = AddSpecialEffectLoc(modelName, where)
	return bj_lastCreatedEffect
end

--===========================================================================
---@param attachPointName string
---@param targetWidget widget
---@param modelName string
---@return effect
function AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
	bj_lastCreatedEffect = AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
	return bj_lastCreatedEffect
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
-- Commented out - Destructibles have no attachment points.
--
--function AddSpecialEffectTargetDestructableBJ takes string attachPointName, widget targetWidget, string modelName returns effect
--    return AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
--end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
-- Commented out - Items have no attachment points.
--
--function AddSpecialEffectTargetItemBJ takes string attachPointName, widget targetWidget, string modelName returns effect
--    return AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
--end

--===========================================================================
---@param whichEffect effect
function DestroyEffectBJ(whichEffect)
	DestroyEffect(whichEffect)
end

--===========================================================================
---@return effect
function GetLastCreatedEffectBJ()
	return bj_lastCreatedEffect
end