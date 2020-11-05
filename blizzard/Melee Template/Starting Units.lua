--***************************************************************************
--*
--*  Melee Template Starting Units
--*
--***************************************************************************

--===========================================================================
function MeleeEnumFindNearestMine()
	---@type unit
	enumUnit = GetEnumUnit()
	---@type real
	dist     = nil
	---@type location
	unitLoc  = nil
	
	if (GetUnitTypeId(enumUnit) == FourCC('ngol')) then
		unitLoc = GetUnitLoc(enumUnit)
		dist    = DistanceBetweenPoints(unitLoc, bj_meleeNearestMineToLoc)
		RemoveLocation(unitLoc)
		
		-- If this is our first mine, or the closest thusfar, use it instead.
		if (bj_meleeNearestMineDist < 0) or (dist < bj_meleeNearestMineDist) then
			bj_meleeNearestMine     = enumUnit
			bj_meleeNearestMineDist = dist
		end
	end
end

--===========================================================================
---@param src location
---@param range real
---@return unit
function MeleeFindNearestMine(src, range)
	---@type group
	nearbyMines              = nil
	
	bj_meleeNearestMine      = nil
	bj_meleeNearestMineDist  = -1
	bj_meleeNearestMineToLoc = src
	
	nearbyMines              = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(nearbyMines, src, range, nil)
	ForGroup(nearbyMines, MeleeEnumFindNearestMine)
	DestroyGroup(nearbyMines)
	
	return bj_meleeNearestMine
end

--===========================================================================
---@param p player
---@param id1 integer
---@param id2 integer
---@param id3 integer
---@param id4 integer
---@param loc location
---@return unit
function MeleeRandomHeroLoc(p, id1, id2, id3, id4, loc)
	---@type unit
	hero = nil
	---@type integer
	roll = nil
	---@type integer
	pick = nil
	---@type version
	v    = nil
	
	-- The selection of heroes is dependant on the game version.
	v    = VersionGet()
	if (v == VERSION_REIGN_OF_CHAOS) then
		roll = GetRandomInt(1, 3)
	else
		roll = GetRandomInt(1, 4)
	end
	
	-- Translate the roll into a unitid.
	if roll == 1 then
		pick = id1
	elseif roll == 2 then
		pick = id2
	elseif roll == 3 then
		pick = id3
	elseif roll == 4 then
		pick = id4
	else
		-- Unrecognized id index - pick the first hero in the list.
		pick = id1
	end
	
	-- Create the hero.
	hero = CreateUnitAtLoc(p, pick, loc, bj_UNIT_FACING)
	if bj_meleeGrantHeroItems then
		MeleeGrantItemsToHero(hero)
	end
	return hero
end

--===========================================================================
-- Returns a location which is (distance) away from (src) in the direction of (targ).
--
---@param src location
---@param targ location
---@param distance real
---@param deltaAngle real
---@return location
function MeleeGetProjectedLoc(src, targ, distance, deltaAngle)
	---@type real
	srcX      = GetLocationX(src)
	---@type real
	srcY      = GetLocationY(src)
	---@type real
	direction = Atan2(GetLocationY(targ) - srcY, GetLocationX(targ) - srcX) + deltaAngle
	return Location(srcX + distance * Cos(direction), srcY + distance * Sin(direction))
end

--===========================================================================
---@param val real
---@param minVal real
---@param maxVal real
---@return real
function MeleeGetNearestValueWithin(val, minVal, maxVal)
	if (val < minVal) then
		return minVal
	elseif (val > maxVal) then
		return maxVal
	else
		return val
	end
end

--===========================================================================
---@param src location
---@param r rect
---@return location
function MeleeGetLocWithinRect(src, r)
	---@type real
	withinX = MeleeGetNearestValueWithin(GetLocationX(src), GetRectMinX(r), GetRectMaxX(r))
	---@type real
	withinY = MeleeGetNearestValueWithin(GetLocationY(src), GetRectMinY(r), GetRectMaxY(r))
	return Location(withinX, withinY)
end

--===========================================================================
-- Starting Units for Human Players
--   - 1 Town Hall, placed at start location
--   - 5 Peasants, placed between start location and nearest gold mine
--
---@param whichPlayer player
---@param startLoc location
---@param doHeroes boolean
---@param doCamera boolean
---@param doPreload boolean
function MeleeStartingUnitsHuman(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	---@type boolean
	useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	---@type real
	unitSpacing   = 64.00
	---@type unit
	nearestMine   = nil
	---@type location
	nearMineLoc   = nil
	---@type location
	heroLoc       = nil
	---@type real
	peonX         = nil
	---@type real
	peonY         = nil
	---@type unit
	townHall      = nil
	
	if (doPreload) then
		Preloader("scripts\\HumanMelee.pld")
	end
	
	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if (nearestMine ~= nil) then
		-- Spawn Town Hall at the start location.
		townHall    = CreateUnitAtLoc(whichPlayer, FourCC('htow'), startLoc, bj_UNIT_FACING)
		
		-- Spawn Peasants near the mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		peonX       = GetLocationX(nearMineLoc)
		peonY       = GetLocationY(nearMineLoc)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX + 0.00 * unitSpacing, peonY + 1.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX + 1.00 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX - 1.00 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX + 0.60 * unitSpacing, peonY - 1.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX - 0.60 * unitSpacing, peonY - 1.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Town Hall at the start location.
		townHall = CreateUnitAtLoc(whichPlayer, FourCC('htow'), startLoc, bj_UNIT_FACING)
		
		-- Spawn Peasants directly south of the town hall.
		peonX    = GetLocationX(startLoc)
		peonY    = GetLocationY(startLoc) - 224.00
		CreateUnit(whichPlayer, FourCC('hpea'), peonX + 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX + 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX + 0.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX - 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('hpea'), peonX - 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.00 * unitSpacing)
	end
	
	if (townHall ~= nil) then
		UnitAddAbilityBJ(FourCC('Amic'), townHall)
		UnitMakeAbilityPermanentBJ(true, FourCC('Amic'), townHall)
	end
	
	if (doHeroes) then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, FourCC('Hamg'), FourCC('Hmkg'), FourCC('Hpal'), FourCC('Hblm'), heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end
	
	if (doCamera) then
		-- Center the camera on the initial Peasants.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Orc Players
--   - 1 Great Hall, placed at start location
--   - 5 Peons, placed between start location and nearest gold mine
--
---@param whichPlayer player
---@param startLoc location
---@param doHeroes boolean
---@param doCamera boolean
---@param doPreload boolean
function MeleeStartingUnitsOrc(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	---@type boolean
	useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	---@type real
	unitSpacing   = 64.00
	---@type unit
	nearestMine   = nil
	---@type location
	nearMineLoc   = nil
	---@type location
	heroLoc       = nil
	---@type real
	peonX         = nil
	---@type real
	peonY         = nil
	
	if (doPreload) then
		Preloader("scripts\\OrcMelee.pld")
	end
	
	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if (nearestMine ~= nil) then
		-- Spawn Great Hall at the start location.
		CreateUnitAtLoc(whichPlayer, FourCC('ogre'), startLoc, bj_UNIT_FACING)
		
		-- Spawn Peons near the mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		peonX       = GetLocationX(nearMineLoc)
		peonY       = GetLocationY(nearMineLoc)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX + 0.00 * unitSpacing, peonY + 1.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX + 1.00 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX - 1.00 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX + 0.60 * unitSpacing, peonY - 1.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX - 0.60 * unitSpacing, peonY - 1.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Great Hall at the start location.
		CreateUnitAtLoc(whichPlayer, FourCC('ogre'), startLoc, bj_UNIT_FACING)
		
		-- Spawn Peons directly south of the town hall.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.00
		CreateUnit(whichPlayer, FourCC('opeo'), peonX + 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX + 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX + 0.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX - 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('opeo'), peonX - 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.00 * unitSpacing)
	end
	
	if (doHeroes) then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, FourCC('Obla'), FourCC('Ofar'), FourCC('Otch'), FourCC('Oshd'), heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end
	
	if (doCamera) then
		-- Center the camera on the initial Peons.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Undead Players
--   - 1 Necropolis, placed at start location
--   - 1 Haunted Gold Mine, placed on nearest gold mine
--   - 3 Acolytes, placed between start location and nearest gold mine
--   - 1 Ghoul, placed between start location and nearest gold mine
--   - Blight, centered on nearest gold mine, spread across a "large area"
--
---@param whichPlayer player
---@param startLoc location
---@param doHeroes boolean
---@param doCamera boolean
---@param doPreload boolean
function MeleeStartingUnitsUndead(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	---@type boolean
	useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	---@type real
	unitSpacing   = 64.00
	---@type unit
	nearestMine   = nil
	---@type location
	nearMineLoc   = nil
	---@type location
	nearTownLoc   = nil
	---@type location
	heroLoc       = nil
	---@type real
	peonX         = nil
	---@type real
	peonY         = nil
	---@type real
	ghoulX        = nil
	---@type real
	ghoulY        = nil
	
	if (doPreload) then
		Preloader("scripts\\UndeadMelee.pld")
	end
	
	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if (nearestMine ~= nil) then
		-- Spawn Necropolis at the start location.
		CreateUnitAtLoc(whichPlayer, FourCC('unpl'), startLoc, bj_UNIT_FACING)
		
		-- Replace the nearest gold mine with a blighted version.
		nearestMine                        = BlightGoldMineForPlayerBJ(nearestMine, whichPlayer)
		
		-- Spawn Ghoul near the Necropolis.
		nearTownLoc                        = MeleeGetProjectedLoc(startLoc, GetUnitLoc(nearestMine), 288, 0)
		ghoulX                             = GetLocationX(nearTownLoc)
		ghoulY                             = GetLocationY(nearTownLoc)
		bj_ghoul[GetPlayerId(whichPlayer)] = CreateUnit(whichPlayer, FourCC('ugho'), ghoulX + 0.00 * unitSpacing, ghoulY + 0.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Spawn Acolytes near the mine.
		nearMineLoc                        = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		peonX                              = GetLocationX(nearMineLoc)
		peonY                              = GetLocationY(nearMineLoc)
		CreateUnit(whichPlayer, FourCC('uaco'), peonX + 0.00 * unitSpacing, peonY + 0.50 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('uaco'), peonX + 0.65 * unitSpacing, peonY - 0.50 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('uaco'), peonX - 0.65 * unitSpacing, peonY - 0.50 * unitSpacing, bj_UNIT_FACING)
		
		-- Create a patch of blight around the gold mine.
		SetBlightLoc(whichPlayer, nearMineLoc, 768, true)
		
		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Necropolis at the start location.
		CreateUnitAtLoc(whichPlayer, FourCC('unpl'), startLoc, bj_UNIT_FACING)
		
		-- Spawn Acolytes and Ghoul directly south of the Necropolis.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.00
		CreateUnit(whichPlayer, FourCC('uaco'), peonX - 1.50 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('uaco'), peonX - 0.50 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('uaco'), peonX + 0.50 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ugho'), peonX + 1.50 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Create a patch of blight around the start location.
		SetBlightLoc(whichPlayer, startLoc, 768, true)
		
		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.00 * unitSpacing)
	end
	
	if (doHeroes) then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, FourCC('Udea'), FourCC('Udre'), FourCC('Ulic'), FourCC('Ucrl'), heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end
	
	if (doCamera) then
		-- Center the camera on the initial Acolytes.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Night Elf Players
--   - 1 Tree of Life, placed by nearest gold mine, already entangled
--   - 5 Wisps, placed between Tree of Life and nearest gold mine
--
---@param whichPlayer player
---@param startLoc location
---@param doHeroes boolean
---@param doCamera boolean
---@param doPreload boolean
function MeleeStartingUnitsNightElf(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	---@type boolean
	useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	---@type real
	unitSpacing   = 64.00
	---@type real
	minTreeDist   = 3.50 * bj_CELLWIDTH
	---@type real
	minWispDist   = 1.75 * bj_CELLWIDTH
	---@type unit
	nearestMine   = nil
	---@type location
	nearMineLoc   = nil
	---@type location
	wispLoc       = nil
	---@type location
	heroLoc       = nil
	---@type real
	peonX         = nil
	---@type real
	peonY         = nil
	---@type unit
	tree          = nil
	
	if (doPreload) then
		Preloader("scripts\\NightElfMelee.pld")
	end
	
	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if (nearestMine ~= nil) then
		-- Spawn Tree of Life near the mine and have it entangle the mine.
		-- Project the Tree's coordinates from the gold mine, and then snap
		-- the X and Y values to within minTreeDist of the Gold Mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 650, 0)
		nearMineLoc = MeleeGetLocWithinRect(nearMineLoc, GetRectFromCircleBJ(GetUnitLoc(nearestMine), minTreeDist))
		tree        = CreateUnitAtLoc(whichPlayer, FourCC('etol'), nearMineLoc, bj_UNIT_FACING)
		IssueTargetOrder(tree, "entangleinstant", nearestMine)
		
		-- Spawn Wisps at the start location.
		wispLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		wispLoc = MeleeGetLocWithinRect(wispLoc, GetRectFromCircleBJ(GetUnitLoc(nearestMine), minWispDist))
		peonX   = GetLocationX(wispLoc)
		peonY   = GetLocationY(wispLoc)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX + 0.00 * unitSpacing, peonY + 1.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX + 1.00 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX - 1.00 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX + 0.58 * unitSpacing, peonY - 1.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX - 0.58 * unitSpacing, peonY - 1.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Tree of Life at the start location.
		CreateUnitAtLoc(whichPlayer, FourCC('etol'), startLoc, bj_UNIT_FACING)
		
		-- Spawn Wisps directly south of the town hall.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.00
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX - 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX - 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX + 0.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX + 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, FourCC('ewsp'), peonX + 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
		
		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.00 * unitSpacing)
	end
	
	if (doHeroes) then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, FourCC('Edem'), FourCC('Ekee'), FourCC('Emoo'), FourCC('Ewar'), heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end
	
	if (doCamera) then
		-- Center the camera on the initial Wisps.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Players Whose Race is Unknown
--   - 12 Sheep, placed randomly around the start location
--
---@param whichPlayer player
---@param startLoc location
---@param doHeroes boolean
---@param doCamera boolean
---@param doPreload boolean
function MeleeStartingUnitsUnknownRace(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	---@type integer
	index = nil
	
	if (doPreload) then
	end
	
	index = 0
	while true do
		CreateUnit(whichPlayer, FourCC('nshe'), GetLocationX(startLoc) + GetRandomReal(-256, 256), GetLocationY(startLoc) + GetRandomReal(-256, 256), GetRandomReal(0, 360))
		index = index + 1
		if index == 12 then break end
	end
	
	if (doHeroes) then
		-- Give them a "free hero" token, out of pity.
		SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
	end
	
	if (doCamera) then
		-- Center the camera on the initial sheep.
		SetCameraPositionLocForPlayer(whichPlayer, startLoc)
		SetCameraQuickPositionLocForPlayer(whichPlayer, startLoc)
	end
end

--===========================================================================
function MeleeStartingUnits()
	---@type integer
	index         = nil
	---@type player
	indexPlayer   = nil
	---@type location
	indexStartLoc = nil
	---@type race
	indexRace     = nil
	
	Preloader("scripts\\SharedMelee.pld")
	
	index = 0
	while true do
		indexPlayer = Player(index)
		if (GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING) then
			indexStartLoc = GetStartLocationLoc(GetPlayerStartLocation(indexPlayer))
			indexRace     = GetPlayerRace(indexPlayer)
			
			-- Create initial race-specific starting units
			if (indexRace == RACE_HUMAN) then
				MeleeStartingUnitsHuman(indexPlayer, indexStartLoc, true, true, true)
			elseif (indexRace == RACE_ORC) then
				MeleeStartingUnitsOrc(indexPlayer, indexStartLoc, true, true, true)
			elseif (indexRace == RACE_UNDEAD) then
				MeleeStartingUnitsUndead(indexPlayer, indexStartLoc, true, true, true)
			elseif (indexRace == RACE_NIGHTELF) then
				MeleeStartingUnitsNightElf(indexPlayer, indexStartLoc, true, true, true)
			else
				MeleeStartingUnitsUnknownRace(indexPlayer, indexStartLoc, true, true, true)
			end
		end
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

end

--===========================================================================
---@param whichRace race
---@param whichPlayer player
---@param loc location
---@param doHeroes boolean
function MeleeStartingUnitsForPlayer(whichRace, whichPlayer, loc, doHeroes)
	-- Create initial race-specific starting units
	if (whichRace == RACE_HUMAN) then
		MeleeStartingUnitsHuman(whichPlayer, loc, doHeroes, false, false)
	elseif (whichRace == RACE_ORC) then
		MeleeStartingUnitsOrc(whichPlayer, loc, doHeroes, false, false)
	elseif (whichRace == RACE_UNDEAD) then
		MeleeStartingUnitsUndead(whichPlayer, loc, doHeroes, false, false)
	elseif (whichRace == RACE_NIGHTELF) then
		MeleeStartingUnitsNightElf(whichPlayer, loc, doHeroes, false, false)
	else
		-- Unrecognized race - ignore the request.
	end
end