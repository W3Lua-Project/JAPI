--***************************************************************************
--*
--*  Melee Template Hero Limit
--*
--***************************************************************************

--===========================================================================
---@param whichPlayer player
---@param techId integer
---@param limit integer
function ReducePlayerTechMaxAllowed(whichPlayer, techId, limit)
	---@type integer
	oldMax = GetPlayerTechMaxAllowed(whichPlayer, techId)
	
	-- A value of -1 is used to indicate no limit, so check for that as well.
	if (oldMax < 0 or oldMax > limit) then
		SetPlayerTechMaxAllowed(whichPlayer, techId, limit)
	end
end

--===========================================================================
function MeleeStartingHeroLimit()
	---@type integer
	index = nil
	
	index = 0
	while true do
		-- max heroes per player
		SetPlayerMaxHeroesAllowed(bj_MELEE_HERO_LIMIT, Player(index))
		
		-- each player is restricted to a limit per hero type as well
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Hamg'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Hmkg'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Hpal'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Hblm'), bj_MELEE_HERO_TYPE_LIMIT)
		
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Obla'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Ofar'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Otch'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Oshd'), bj_MELEE_HERO_TYPE_LIMIT)
		
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Edem'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Ekee'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Emoo'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Ewar'), bj_MELEE_HERO_TYPE_LIMIT)
		
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Udea'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Udre'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Ulic'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Ucrl'), bj_MELEE_HERO_TYPE_LIMIT)
		
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Npbm'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Nbrn'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Nngs'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Nplh'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Nbst'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Nalc'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Ntin'), bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), FourCC('Nfir'), bj_MELEE_HERO_TYPE_LIMIT)
		
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end