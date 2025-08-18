local placeId = game.PlaceId
local games = {
    [142823291] = {"Murder Mystery 2","FIXING","https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Murder%20Mystery%202.lua"},
    [13772394625] = {"Blade Ball","SOON","https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Blade%20Ball.lua"},
    [3101667897] = {"Legends Of Speed","SOON","https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/project/games/Legends%20Of%20Speed.lua"}
}

local gameData = games[placeId]
if gameData then
    local ok, err = pcall(function() loadstring(game:HttpGet(gameData[3]))() end)
    if ok then
        print("✅ Loaded:", gameData[1])
    else
        warn("⚠️ Failed:", err)
    end
else
    local list = {}
    for _, g in pairs(games) do
        table.insert(list, "- "..g[1].." | "..g[2])
    end
    print("❌ Unsupported game\n\n✅ Supported Games:\n"..table.concat(list,"\n"))
end

print("for the skids ⤵")
print(string.char(
65,32,112,105,99,116,117,114,101,32,116,97,107,101,110,32,102,114,111,109,32,121,111,117,114,32,119,101,98,99,97,109,58,10,
32,32,32,32,32,32,44,45,46,32,32,32,44,45,46,10,32,32,32,32,32,32,62,32,32,92,95,32,32,32,60,10,32,32,32,32,32,124,32,32,
46,45,46,32,32,46,45,124,10,32,32,32,32,32,124,32,40,32,64,32,41,32,40,32,64,32,41,124,10,32,32,32,32,32,124,32,32,40,39,
45,39,32,32,32,39,45,46,34,124,32,60,45,45,32,117,103,108,121,32,109,102,32,115,107,105,100,10,32,32,32,32,32,32,92,32,32,
32,92,95,95,92,32,32,32,47,10,32,32,32,32,32,32,32,39,45,46,92,92,92,92,92,46,45,39,10,32,32,32,32,32,32,39,45,47,92,92,
92,92,92,92,92,47,45,39,10,32,32,32,32,32,99,117,116,32,116,104,101,32,103,114,97,115,115,32,107,105,100,100,111,46))
