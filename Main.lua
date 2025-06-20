local StarterGui = game:GetService("StarterGui")
local detectScriptUrl = game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Detect%20Game.lua")

if detectScriptUrl and detectScriptUrl ~= "" then
    local detectGame = loadstring(detectScriptUrl)
    if detectGame then
        local gameId = detectGame()
        if type(gameId) == "string" and gameId ~= "" then
        else
            StarterGui:SetCore("SendNotification", {
                Title = "Altura Hub",
                Text = "🚀 Game not supported, loading selector...",
                Duration = 3
            })
            local selectorScriptUrl = game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Selector.lua")
            local selector = loadstring(selectorScriptUrl)
            selector()
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Altura Hub",
            Text = "🚀 Problem with game detection, loading selector...",
            Duration = 3
        })
        local selectorScriptUrl = game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Selector.lua")
        local selector = loadstring(selectorScriptUrl)
        selector()
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "Altura Hub",
        Text = "🚀 Unable to detect game, loading selector...",
        Duration = 3
    })
    local selectorScriptUrl = game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Selector.lua")
    local selector = loadstring(selectorScriptUrl)
    selector()
end
