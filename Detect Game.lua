local placeId = game.PlaceId

if placeId == 142823291 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Main.lua",true))() -- project x altura
elseif placeId == 8737899170 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/oMega-Obby/refs/heads/main/Script", true))() -- omega obby
elseif placeId == 125822183289695 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Wall-Hop-Obby/refs/heads/main/Script.lua", true))() -- wall hop obby
else
    warn("This game is not supported by Altura Hub.")
end
