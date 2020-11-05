--***************************************************************************
--*
--*  Melee Template Granted Hero Items
--*
--***************************************************************************

--===========================================================================
---@return boolean
function MeleeTrainedUnitIsHeroBJFilter()
	return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO)
end

--===========================================================================
-- The first N heroes trained or hired for each player start off with a
-- standard set of items.  This is currently:
--   - 1x Scroll of Town Portal
--
---@param whichUnit unit
function MeleeGrantItemsToHero(whichUnit)
	---@type integer
	owner = GetPlayerId(GetOwningPlayer(whichUnit))
	
	-- If we haven't twinked N heroes for this player yet, twink away.
	if (bj_meleeTwinkedHeroes[owner] < bj_MELEE_MAX_TWINKED_HEROES) then
		UnitAddItemById(whichUnit, FourCC('stwp'))
		bj_meleeTwinkedHeroes[owner] = bj_meleeTwinkedHeroes[owner] + 1
	end
end

--===========================================================================
function MeleeGrantItemsToTrainedHero()
	MeleeGrantItemsToHero(GetTrainedUnit())
end

--===========================================================================
function MeleeGrantItemsToHiredHero()
	MeleeGrantItemsToHero(GetSoldUnit())
end

--===========================================================================
function MeleeGrantHeroItems()
	---@type integer
	index = nil
	---@type trigger
	trig  = nil
	
	-- Initialize the twinked hero counts.
	index = 0
	while true do
		bj_meleeTwinkedHeroes[index] = 0
		
		index                        = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
	
	-- Register for an event whenever a hero is trained, so that we can give
	-- him/her their starting items.
	index = 0
	while true do
		trig = CreateTrigger()
		TriggerRegisterPlayerUnitEvent(trig, Player(index), EVENT_PLAYER_UNIT_TRAIN_FINISH, filterMeleeTrainedUnitIsHeroBJ)
		TriggerAddAction(trig, MeleeGrantItemsToTrainedHero)
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
	
	-- Register for an event whenever a neutral hero is hired, so that we
	-- can give him/her their starting items.
	trig = CreateTrigger()
	TriggerRegisterPlayerUnitEvent(trig, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_UNIT_SELL, filterMeleeTrainedUnitIsHeroBJ)
	TriggerAddAction(trig, MeleeGrantItemsToHiredHero)
	
	-- Flag that we are giving starting items to heroes, so that the melee
	-- starting units code can create them as necessary.
	bj_meleeGrantHeroItems = true
end