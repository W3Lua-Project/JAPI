--============================================================================
-- Multiboard API
--============================================================================

-- Create a multiboard object
---@return multiboard
function CreateMultiboard() end

---@param lb multiboard
function DestroyMultiboard(lb) end


---@param lb multiboard
---@param show boolean
function MultiboardDisplay(lb, show) end

---@param lb multiboard
---@return boolean
function IsMultiboardDisplayed(lb) end


---@param lb multiboard
---@param minimize boolean
function MultiboardMinimize(lb, minimize) end

---@param lb multiboard
---@return boolean
function IsMultiboardMinimized(lb) end

---@param lb multiboard
function MultiboardClear(lb) end


---@param lb multiboard
---@param label string
function MultiboardSetTitleText(lb, label) end

---@param lb multiboard
---@return string
function MultiboardGetTitleText(lb) end

---@param lb multiboard
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function MultiboardSetTitleTextColor(lb, red, green, blue, alpha) end


---@param lb multiboard
---@return integer
function MultiboardGetRowCount(lb) end

---@param lb multiboard
---@return integer
function MultiboardGetColumnCount(lb) end


---@param lb multiboard
---@param count integer
function MultiboardSetColumnCount(lb, count) end

---@param lb multiboard
---@param count integer
function MultiboardSetRowCount(lb, count) end


-- broadcast settings to all items
---@param lb multiboard
---@param showValues boolean
---@param showIcons boolean
function MultiboardSetItemsStyle(lb, showValues, showIcons) end

---@param lb multiboard
---@param value string
function MultiboardSetItemsValue(lb, value) end

---@param lb multiboard
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function MultiboardSetItemsValueColor(lb, red, green, blue, alpha) end

---@param lb multiboard
---@param width real
function MultiboardSetItemsWidth(lb, width) end

---@param lb multiboard
---@param iconPath string
function MultiboardSetItemsIcon(lb, iconPath) end



-- funcs for modifying individual items
---@param lb multiboard
---@param row integer
---@param column integer
---@return multiboarditem
function MultiboardGetItem(lb, row, column) end

---@param mbi multiboarditem
function MultiboardReleaseItem(mbi) end


---@param mbi multiboarditem
---@param showValue boolean
---@param showIcon boolean
function MultiboardSetItemStyle(mbi, showValue, showIcon) end

---@param mbi multiboarditem
---@param val string
function MultiboardSetItemValue(mbi, val) end

---@param mbi multiboarditem
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function MultiboardSetItemValueColor(mbi, red, green, blue, alpha) end

---@param mbi multiboarditem
---@param width real
function MultiboardSetItemWidth(mbi, width) end

---@param mbi multiboarditem
---@param iconFileName string
function MultiboardSetItemIcon(mbi, iconFileName) end


-- meant to unequivocally suspend display of existing and
-- subsequently displayed multiboards
--
---@param flag boolean
function MultiboardSuppressDisplay(flag) end