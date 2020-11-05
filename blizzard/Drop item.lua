--***************************************************************************
--*
--*  Drop item
--*
--*  Makes the given unit drop the given item
--*
--*  Note: This could potentially cause problems if the unit is standing
--*        right on the edge of an unpathable area and happens to drop the
--*        item into the unpathable area where nobody can get it...
--*
--***************************************************************************

---@param inUnit unit
---@param inItemID integer
---@return item
function UnitDropItem(inUnit, inItemID)
	---@type real
	x           = nil
	---@type real
	y           = nil
	---@type real
	radius      = 32
	---@type real
	unitX       = nil
	---@type real
	unitY       = nil
	---@type item
	droppedItem = nil
	
	if (inItemID == -1) then
		return nil
	end
	
	unitX       = GetUnitX(inUnit)
	unitY       = GetUnitY(inUnit)
	
	x           = GetRandomReal(unitX - radius, unitX + radius)
	y           = GetRandomReal(unitY - radius, unitY + radius)
	
	droppedItem = CreateItem(inItemID, x, y)
	
	SetItemDropID(droppedItem, GetUnitTypeId(inUnit))
	UpdateStockAvailability(droppedItem)
	
	return droppedItem
end

--===========================================================================
---@param inWidget widget
---@param inItemID integer
---@return item
function WidgetDropItem(inWidget, inItemID)
	---@type real
	x       = nil
	---@type real
	y       = nil
	---@type real
	radius  = 32
	---@type real
	widgetX = nil
	---@type real
	widgetY = nil
	
	if (inItemID == -1) then
		return nil
	end
	
	widgetX = GetWidgetX(inWidget)
	widgetY = GetWidgetY(inWidget)
	
	x       = GetRandomReal(widgetX - radius, widgetX + radius)
	y       = GetRandomReal(widgetY - radius, widgetY + radius)
	
	return CreateItem(inItemID, x, y)
end