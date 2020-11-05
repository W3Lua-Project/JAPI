---@param frameType originframetype
---@param index integer
---@return framehandle
function BlzGetOriginFrame(frameType, index) end

---@param enable boolean
function BlzEnableUIAutoPosition(enable) end

---@param enable boolean
function BlzHideOriginFrames(enable) end

---@param name string
---@param owner framehandle
---@param priority integer
---@param createContext integer
---@return framehandle
function BlzCreateFrame(name, owner, priority, createContext) end

---@param name string
---@param owner framehandle
---@param createContext integer
---@return framehandle
function BlzCreateSimpleFrame(name, owner, createContext) end

---@param typeName string
---@param name string
---@param owner framehandle
---@param inherits string
---@param createContext integer
---@return framehandle
function BlzCreateFrameByType(typeName, name, owner, inherits, createContext) end

---@param frame framehandle
function BlzDestroyFrame(frame) end

---@param frame framehandle
---@param point framepointtype
---@param relative framehandle
---@param relativePoint framepointtype
---@param x real
---@param y real
function BlzFrameSetPoint(frame, point, relative, relativePoint, x, y) end

---@param frame framehandle
---@param point framepointtype
---@param x real
---@param y real
function BlzFrameSetAbsPoint(frame, point, x, y) end

---@param frame framehandle
function BlzFrameClearAllPoints(frame) end

---@param frame framehandle
---@param relative framehandle
function BlzFrameSetAllPoints(frame, relative) end

---@param frame framehandle
---@param visible boolean
function BlzFrameSetVisible(frame, visible) end

---@param frame framehandle
---@return boolean
function BlzFrameIsVisible(frame) end

---@param name string
---@param createContext integer
---@return framehandle
function BlzGetFrameByName(name, createContext) end

---@param frame framehandle
---@return string
function BlzFrameGetName(frame) end

---@param frame framehandle
function BlzFrameClick(frame) end

---@param frame framehandle
---@param text string
function BlzFrameSetText(frame, text) end

---@param frame framehandle
---@return string
function BlzFrameGetText(frame) end

---@param frame framehandle
---@param text string
function BlzFrameAddText(frame, text) end

---@param frame framehandle
---@param size integer
function BlzFrameSetTextSizeLimit(frame, size) end

---@param frame framehandle
---@return integer
function BlzFrameGetTextSizeLimit(frame) end

---@param frame framehandle
---@param color integer
function BlzFrameSetTextColor(frame, color) end

---@param frame framehandle
---@param flag boolean
function BlzFrameSetFocus(frame, flag) end

---@param frame framehandle
---@param modelFile string
---@param cameraIndex integer
function BlzFrameSetModel(frame, modelFile, cameraIndex) end

---@param frame framehandle
---@param enabled boolean
function BlzFrameSetEnable(frame, enabled) end

---@param frame framehandle
---@return boolean
function BlzFrameGetEnable(frame) end

---@param frame framehandle
---@param alpha integer
function BlzFrameSetAlpha(frame, alpha) end

---@param frame framehandle
---@return integer
function BlzFrameGetAlpha(frame) end

---@param frame framehandle
---@param primaryProp integer
---@param flags integer
function BlzFrameSetSpriteAnimate(frame, primaryProp, flags) end

---@param frame framehandle
---@param texFile string
---@param flag integer
---@param blend boolean
function BlzFrameSetTexture(frame, texFile, flag, blend) end

---@param frame framehandle
---@param scale real
function BlzFrameSetScale(frame, scale) end

---@param frame framehandle
---@param tooltip framehandle
function BlzFrameSetTooltip(frame, tooltip) end

---@param frame framehandle
---@param enable boolean
function BlzFrameCageMouse(frame, enable) end

---@param frame framehandle
---@param value real
function BlzFrameSetValue(frame, value) end

---@param frame framehandle
---@return real
function BlzFrameGetValue(frame) end

---@param frame framehandle
---@param minValue real
---@param maxValue real
function BlzFrameSetMinMaxValue(frame, minValue, maxValue) end

---@param frame framehandle
---@param stepSize real
function BlzFrameSetStepSize(frame, stepSize) end

---@param frame framehandle
---@param width real
---@param height real
function BlzFrameSetSize(frame, width, height) end

---@param frame framehandle
---@param color integer
function BlzFrameSetVertexColor(frame, color) end

---@param frame framehandle
---@param level integer
function BlzFrameSetLevel(frame, level) end

---@param frame framehandle
---@param parent framehandle
function BlzFrameSetParent(frame, parent) end

---@param frame framehandle
---@return framehandle
function BlzFrameGetParent(frame) end

---@param frame framehandle
---@return real
function BlzFrameGetHeight(frame) end

---@param frame framehandle
---@return real
function BlzFrameGetWidth(frame) end

---@param frame framehandle
---@param fileName string
---@param height real
---@param flags integer
function BlzFrameSetFont(frame, fileName, height, flags) end

---@param frame framehandle
---@param vert textaligntype
---@param horz textaligntype
function BlzFrameSetTextAlignment(frame, vert, horz) end

---@param whichTrigger trigger
---@param frame framehandle
---@param eventId frameeventtype
---@return event
function BlzTriggerRegisterFrameEvent(whichTrigger, frame, eventId) end

---@return framehandle
function BlzGetTriggerFrame() end

---@return frameeventtype
function BlzGetTriggerFrameEvent() end

---@return real
function BlzGetTriggerFrameValue() end

---@return string
function BlzGetTriggerFrameText() end