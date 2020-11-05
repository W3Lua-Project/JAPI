--============================================================================
-- Image API
--
---@param file string
---@param sizeX real
---@param sizeY real
---@param sizeZ real
---@param posX real
---@param posY real
---@param posZ real
---@param originX real
---@param originY real
---@param originZ real
---@param imageType integer
---@return image
function CreateImage(file, sizeX, sizeY, sizeZ, posX, posY, posZ, originX, originY, originZ, imageType) end

---@param whichImage image
function DestroyImage(whichImage) end

---@param whichImage image
---@param flag boolean
function ShowImage(whichImage, flag) end

---@param whichImage image
---@param flag boolean
---@param height real
function SetImageConstantHeight(whichImage, flag, height) end

---@param whichImage image
---@param x real
---@param y real
---@param z real
function SetImagePosition(whichImage, x, y, z) end

---@param whichImage image
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetImageColor(whichImage, red, green, blue, alpha) end

---@param whichImage image
---@param flag boolean
function SetImageRender(whichImage, flag) end

---@param whichImage image
---@param flag boolean
function SetImageRenderAlways(whichImage, flag) end

---@param whichImage image
---@param flag boolean
---@param useWaterAlpha boolean
function SetImageAboveWater(whichImage, flag, useWaterAlpha) end

---@param whichImage image
---@param imageType integer
function SetImageType(whichImage, imageType) end