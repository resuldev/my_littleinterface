--[[

    ©resul
    04:37

]]


local FPSLimit, lastTick, framesRendered, FPS = 100, getTickCount(), 0, 0
local font31 = dxCreateFont('fonts/Aharoni.otf', 50)
local font3131 = dxCreateFont('fonts/Aharoni.otf', 60)

local screenWidth, screenHeight = guiGetScreenSize()

local scale = 1
function getScale()
    if ( screenWidth <= 640 ) and ( screenHeight <= 480 ) then
        outputChatBox ( "Oyunu düşük çözünürlükte çalıştırdınız, bu bazı sorunlara sebep olabilir." )
    elseif ( screenWidth <= 1024 ) and ( screenHeight <= 768 ) then
        scale = 1.3
    elseif ( screenWidth <= 1280 ) and ( screenHeight <= 720 ) then
        scale = 1.3
    elseif ( screenWidth <= 1366 ) and ( screenHeight <= 768 ) then
        scale = 1.4
    elseif ( screenWidth <= 1360 ) and ( screenHeight <= 768 ) then
        scale = 1.4
    elseif ( screenWidth <= 1600 ) and ( screenHeight <= 900 ) then
        scale = 1.6
    elseif ( screenWidth <= 1920 ) and ( screenHeight <= 1080 ) then
        scale = 2
    end
end

addEventHandler('onClientResourceStart', resourceRoot, getScale)

local function disableHud() 
    setPlayerHudComponentVisible( "area_name", false)
    setPlayerHudComponentVisible( "vehicle_name", false)
    setPlayerHudComponentVisible( "radio", false)
    setPlayerHudComponentVisible( "wanted", false)
end
addEventHandler("onClientResourceStart", resourceRoot, disableHud)


local sWidth,sHeight = guiGetScreenSize()

-- showing new hud
function displayHUD()

    local currentTick = getTickCount()
    local elapsedTime = currentTick - lastTick
    if elapsedTime >= 1000 then
        FPS = framesRendered
        lastTick = currentTick
        framesRendered = 2
    else
        framesRendered = framesRendered + 1
   end
 if FPS > FPSLimit then
    FPS = FPSLimit
   end
            
	local playerPing = getPlayerPing ( localPlayer ) 
           local hours = getRealTime().hour
           local minutes = getRealTime().minute
           local seconds = getRealTime().second 
           local gercekday = getRealTime().monthday
           local gercekhafta = getRealTime().month
           local gercekyil = getRealTime().year
           if (hours < 10) then
            hours = "0"..hours
        end
        if (minutes < 10) then
            minutes = "0"..minutes
        end
           local formattedTime = string.format("%3d/%02d/%04d", gercekday, gercekhafta + 1, gercekyil + 1900)
    dxDrawText("Tarih:"..formattedTime.."  Saat: "..hours..":"..minutes..":"..seconds.."    FPS: "..tostring(FPS).."    Ping: "..playerPing.." ms ",sWidth*100/1920, sHeight*1835/1080, sWidth*1784/1920, sHeight*301/1080,tocolor(0,0,0),0.25, font31,"center","center",false,false,true,true)
    dxDrawText("#808080Tarih:#FFFFFf"..formattedTime.."  #808080Saat: #ffffff"..hours..":"..minutes..":"..seconds.." #bb0000   #808080FPS: #EEFFEE"..tostring(FPS).."  #bb0000   #808080Ping: #EEFFEE"..playerPing.." ms ",sWidth*100/1920, sHeight*1835/1080, sWidth*1784/1920, sHeight*298/1080,tocolor(0,153,255,255),0.25, font31,"center","center",false,false,true,true)  


end
addEventHandler("onClientRender", root, displayHUD)




isHUDShown = false;
addCommandHandler("hudkapat", function()  
    if not (isHUDShown) then    
        isHUDShown = true;  
        setPlayerHudComponentVisible( "all", false)
        setPlayerHudComponentVisible( "crosshair", true)
    else
        isHUDShown = false;
        setPlayerHudComponentVisible( "ammo", true)
        setPlayerHudComponentVisible( "armour", true)
        setPlayerHudComponentVisible( "breath", true)
        setPlayerHudComponentVisible( "clock", true)
        setPlayerHudComponentVisible( "health", true)
        setPlayerHudComponentVisible( "money", true)
        setPlayerHudComponentVisible( "radar", true)
        setPlayerHudComponentVisible( "weapon", true)
        setPlayerHudComponentVisible( "crosshair", true)
    end
end
)