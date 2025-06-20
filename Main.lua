local StarterGui = game:GetService("StarterGui")

local detectScriptUrl = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Detect%20Game.lua"))()

if detectScriptUrl then
    loadstring(game:HttpGet(detectScriptUrl))()
else
    StarterGui:SetCore("SendNotification", {
        Title = "Altura Hub",
        Text = "🚀 Not a game for Altura Hub, loading selector...",
        Duration = 3
    })
    openModeSelector()
end
