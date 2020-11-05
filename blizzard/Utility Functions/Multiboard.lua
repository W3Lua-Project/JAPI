--***************************************************************************
--*
--*  Multiboard Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param cols integer
---@param rows integer
---@param title string
---@return multiboard
function CreateMultiboardBJ(cols, rows, title)
	bj_lastCreatedMultiboard = CreateMultiboard()
	MultiboardSetRowCount(bj_lastCreatedMultiboard, rows)
	MultiboardSetColumnCount(bj_lastCreatedMultiboard, cols)
	MultiboardSetTitleText(bj_lastCreatedMultiboard, title)
	MultiboardDisplay(bj_lastCreatedMultiboard, true)
	return bj_lastCreatedMultiboard
end

--===========================================================================
---@param mb multiboard
function DestroyMultiboardBJ(mb)
	DestroyMultiboard(mb)
end

--===========================================================================
---@return multiboard
function GetLastCreatedMultiboard()
	return bj_lastCreatedMultiboard
end

--===========================================================================
---@param show boolean
---@param mb multiboard
function MultiboardDisplayBJ(show, mb)
	MultiboardDisplay(mb, show)
end

--===========================================================================
---@param minimize boolean
---@param mb multiboard
function MultiboardMinimizeBJ(minimize, mb)
	MultiboardMinimize(mb, minimize)
end

--===========================================================================
---@param mb multiboard
---@param red real
---@param green real
---@param blue real
---@param transparency real
function MultiboardSetTitleTextColorBJ(mb, red, green, blue, transparency)
	MultiboardSetTitleTextColor(mb, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
---@param flag boolean
function MultiboardAllowDisplayBJ(flag)
	MultiboardSuppressDisplay(not flag)
end

--===========================================================================
---@param mb multiboard
---@param col integer
---@param row integer
---@param showValue boolean
---@param showIcon boolean
function MultiboardSetItemStyleBJ(mb, col, row, showValue, showIcon)
	---@type integer
	curRow  = 0
	---@type integer
	curCol  = 0
	---@type integer
	numRows = MultiboardGetRowCount(mb)
	---@type integer
	numCols = MultiboardGetColumnCount(mb)
	---@type multiboarditem
	mbitem  = nil
	
	-- Loop over rows, using 1-based index
	while true do
		curRow = curRow + 1
		if curRow > numRows then break end
		
		-- Apply setting to the requested row, or all rows (if row is 0)
		if (row == 0 or row == curRow) then
			-- Loop over columns, using 1-based index
			curCol = 0
			while true do
				curCol = curCol + 1
				if curCol > numCols then break end
				
				-- Apply setting to the requested column, or all columns (if col is 0)
				if (col == 0 or col == curCol) then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemStyle(mbitem, showValue, showIcon)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
---@param mb multiboard
---@param col integer
---@param row integer
---@param val string
function MultiboardSetItemValueBJ(mb, col, row, val)
	---@type integer
	curRow  = 0
	---@type integer
	curCol  = 0
	---@type integer
	numRows = MultiboardGetRowCount(mb)
	---@type integer
	numCols = MultiboardGetColumnCount(mb)
	---@type multiboarditem
	mbitem  = nil
	
	-- Loop over rows, using 1-based index
	while true do
		curRow = curRow + 1
		if curRow > numRows then break end
		
		-- Apply setting to the requested row, or all rows (if row is 0)
		if (row == 0 or row == curRow) then
			-- Loop over columns, using 1-based index
			curCol = 0
			while true do
				curCol = curCol + 1
				if curCol > numCols then break end
				
				-- Apply setting to the requested column, or all columns (if col is 0)
				if (col == 0 or col == curCol) then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemValue(mbitem, val)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
---@param mb multiboard
---@param col integer
---@param row integer
---@param red real
---@param green real
---@param blue real
---@param transparency real
function MultiboardSetItemColorBJ(mb, col, row, red, green, blue, transparency)
	---@type integer
	curRow  = 0
	---@type integer
	curCol  = 0
	---@type integer
	numRows = MultiboardGetRowCount(mb)
	---@type integer
	numCols = MultiboardGetColumnCount(mb)
	---@type multiboarditem
	mbitem  = nil
	
	-- Loop over rows, using 1-based index
	while true do
		curRow = curRow + 1
		if curRow > numRows then break end
		
		-- Apply setting to the requested row, or all rows (if row is 0)
		if (row == 0 or row == curRow) then
			-- Loop over columns, using 1-based index
			curCol = 0
			while true do
				curCol = curCol + 1
				if curCol > numCols then break end
				
				-- Apply setting to the requested column, or all columns (if col is 0)
				if (col == 0 or col == curCol) then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemValueColor(mbitem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
---@param mb multiboard
---@param col integer
---@param row integer
---@param width real
function MultiboardSetItemWidthBJ(mb, col, row, width)
	---@type integer
	curRow  = 0
	---@type integer
	curCol  = 0
	---@type integer
	numRows = MultiboardGetRowCount(mb)
	---@type integer
	numCols = MultiboardGetColumnCount(mb)
	---@type multiboarditem
	mbitem  = nil
	
	-- Loop over rows, using 1-based index
	while true do
		curRow = curRow + 1
		if curRow > numRows then break end
		
		-- Apply setting to the requested row, or all rows (if row is 0)
		if (row == 0 or row == curRow) then
			-- Loop over columns, using 1-based index
			curCol = 0
			while true do
				curCol = curCol + 1
				if curCol > numCols then break end
				
				-- Apply setting to the requested column, or all columns (if col is 0)
				if (col == 0 or col == curCol) then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemWidth(mbitem, width / 100.0)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
---@param mb multiboard
---@param col integer
---@param row integer
---@param iconFileName string
function MultiboardSetItemIconBJ(mb, col, row, iconFileName)
	---@type integer
	curRow  = 0
	---@type integer
	curCol  = 0
	---@type integer
	numRows = MultiboardGetRowCount(mb)
	---@type integer
	numCols = MultiboardGetColumnCount(mb)
	---@type multiboarditem
	mbitem  = nil
	
	-- Loop over rows, using 1-based index
	while true do
		curRow = curRow + 1
		if curRow > numRows then break end
		
		-- Apply setting to the requested row, or all rows (if row is 0)
		if (row == 0 or row == curRow) then
			-- Loop over columns, using 1-based index
			curCol = 0
			while true do
				curCol = curCol + 1
				if curCol > numCols then break end
				
				-- Apply setting to the requested column, or all columns (if col is 0)
				if (col == 0 or col == curCol) then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemIcon(mbitem, iconFileName)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end