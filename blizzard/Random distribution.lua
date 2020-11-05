--***************************************************************************
--*
--*  Random distribution
--*
--*  Used to select a random object from a given distribution of chances
--*
--*  - RandomDistReset clears the distribution list
--*
--*  - RandomDistAddItem adds a new object to the distribution list
--*    with a given identifier and an integer chance to be chosen
--*
--*  - RandomDistChoose will use the current distribution list to choose
--*    one of the objects randomly based on the chance distribution
--*
--*  Note that the chances are effectively normalized by their sum,
--*  so only the relative values of each chance are important
--*
--***************************************************************************

--===========================================================================
function RandomDistReset()
	bj_randDistCount = 0
end

--===========================================================================
---@param inID integer
---@param inChance integer
function RandomDistAddItem(inID, inChance)
	bj_randDistID[bj_randDistCount]     = inID
	bj_randDistChance[bj_randDistCount] = inChance
	bj_randDistCount                    = bj_randDistCount + 1
end

--===========================================================================
---@return integer
function RandomDistChoose()
	---@type integer
	sum     = 0
	---@type integer
	chance  = 0
	---@type integer
	index   = nil
	---@type integer
	foundID = -1
	---@type boolean
	done    = nil
	
	-- No items?
	if (bj_randDistCount == 0) then
		return -1
	end
	
	-- Find sum of all chances
	index = 0
	while true do
		sum   = sum + bj_randDistChance[index]
		
		index = index + 1
		if index == bj_randDistCount then break end
	end
	
	-- Choose random number within the total range
	chance = GetRandomInt(1, sum)
	
	-- Find ID which corresponds to this chance
	index  = 0
	sum    = 0
	done   = false
	while true do
		sum = sum + bj_randDistChance[index]
		
		if (chance <= sum) then
			foundID = bj_randDistID[index]
			done    = true
		end
		
		index = index + 1
		if (index == bj_randDistCount) then
			done = true
		end
		
		if done == true then break end
	end
	
	return foundID
end