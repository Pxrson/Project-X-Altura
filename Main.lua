local StarterGui = game:GetService("StarterGui")

local success, gameInfo = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/main/Detect%20Game.lua"))()
end)

if success and type(gameInfo) == "table" and gameInfo.url then
    local loaded, err = pcall(function()
        loadstring(game:HttpGet(gameInfo.url))()
    end)

    if not loaded then
        StarterGui:SetCore("SendNotification", {
            Title = "⚠️ Altura Hub",
            Text = "Not a game for Altura Hub, loading selector.. ⏳",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/main/Selector.lua"))()
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "⚠️ Altura Hub",
        Text = "Not a game for Altura Hub, loading selector.. ⏳",
        Duration = 3
    })
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/main/Selector.lua"))()
end
