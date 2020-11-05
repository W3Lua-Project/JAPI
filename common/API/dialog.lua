--============================================================================
-- Dialog API
---@return dialog
function DialogCreate() end

---@param whichDialog dialog
function DialogDestroy(whichDialog) end

---@param whichDialog dialog
function DialogClear(whichDialog) end

---@param whichDialog dialog
---@param messageText string
function DialogSetMessage(whichDialog, messageText) end

---@param whichDialog dialog
---@param buttonText string
---@param hotkey integer
---@return button
function DialogAddButton(whichDialog, buttonText, hotkey) end

---@param whichDialog dialog
---@param doScoreScreen boolean
---@param buttonText string
---@param hotkey integer
---@return button
function DialogAddQuitButton(whichDialog, doScoreScreen, buttonText, hotkey) end

---@param whichPlayer player
---@param whichDialog dialog
---@param flag boolean
function DialogDisplay(whichPlayer, whichDialog, flag) end