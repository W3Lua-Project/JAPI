--============================================================================
-- Widget API
---@param whichWidget widget
---@return real
function GetWidgetLife(whichWidget) end

---@param whichWidget widget
---@param newLife real
function SetWidgetLife(whichWidget, newLife) end

---@param whichWidget widget
---@return real
function GetWidgetX(whichWidget) end

---@param whichWidget widget
---@return real
function GetWidgetY(whichWidget) end

---@return widget
function GetTriggerWidget() end