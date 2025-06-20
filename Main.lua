local StarterGui = game:GetService("StarterGui")

local detectScriptUrl = game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Detect%20Game.lua")

if detectScriptUrl and detectScriptUrl ~= "" then
    local scriptSource = game:HttpGet(detectScriptUrl)
    loadstring(scriptSource)()
else
    StarterGui:SetCore("SendNotification", {
        Title = "Altura Hub",
        Text = "🚀 Not a game for Altura Hub, loading selector...",
        Duration = 3
    })

    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Selector.lua"))()
end
