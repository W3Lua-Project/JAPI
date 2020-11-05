--***************************************************************************
--*
--*  Dialog Utility Functions
--*
--***************************************************************************

--===========================================================================
---@param flag boolean
---@param whichDialog dialog
---@param whichPlayer player
function DialogDisplayBJ(flag, whichDialog, whichPlayer)
	DialogDisplay(whichPlayer, whichDialog, flag)
end

--===========================================================================
---@param whichDialog dialog
---@param message string
function DialogSetMessageBJ(whichDialog, message)
	DialogSetMessage(whichDialog, message)
end

--===========================================================================
---@param whichDialog dialog
---@param buttonText string
---@return button
function DialogAddButtonBJ(whichDialog, buttonText)
	bj_lastCreatedButton = DialogAddButton(whichDialog, buttonText, 0)
	return bj_lastCreatedButton
end

--===========================================================================
---@param whichDialog dialog
---@param buttonText string
---@param hotkey integer
---@return button
function DialogAddButtonWithHotkeyBJ(whichDialog, buttonText, hotkey)
	bj_lastCreatedButton = DialogAddButton(whichDialog, buttonText, hotkey)
	return bj_lastCreatedButton
end

--===========================================================================
---@param whichDialog dialog
function DialogClearBJ(whichDialog)
	DialogClear(whichDialog)
end

--===========================================================================
---@return button
function GetLastCreatedButtonBJ()
	return bj_lastCreatedButton
end

--===========================================================================
---@return button
function GetClickedButtonBJ()
	return GetClickedButton()
end

--===========================================================================
---@return dialog
function GetClickedDialogBJ()
	return GetClickedDialog()
end