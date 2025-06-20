local placeId = game.PlaceId

if placeId == 142823291 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Murder%20Mystery%202.lua", true))() -- Murder Mystery 2
elseif placeId == 8737899170 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/oMega-Obby/refs/heads/main/Script", true))() -- oMega Obby
elseif placeId == 125822183289695 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Wall-Hop-Obby/refs/heads/main/Script.lua", true))() -- Wall Hop Obby
else
    warn("This game is not supported by Altura Hub.")
end
