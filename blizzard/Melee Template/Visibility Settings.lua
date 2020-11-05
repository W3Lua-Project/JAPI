--***************************************************************************
--*
--*  Melee Template Visibility Settings
--*
--***************************************************************************

--===========================================================================
function MeleeStartingVisibility()
	-- Start by setting the ToD.
	SetFloatGameState(GAME_STATE_TIME_OF_DAY, bj_MELEE_STARTING_TOD)
	
	-- call FogMaskEnable(true)
	-- call FogEnable(true)
end