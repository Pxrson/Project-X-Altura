local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1377406998991339671/kaZAy3FTR_gzXqZgQd94_BK1mhv0o_by6OqCky1onbHXKPZvF2tWRWuCcZGd3yum1A_8"
local DETECT_SCRIPT_URL = "https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/Detect%20Game.lua"
local MM2_SCRIPT_URL = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Murder%20Mystery%202.lua"

local player = Players.LocalPlayer
local userId = player.UserId

local function getGameName()
    local info = MarketplaceService:GetProductInfo(game.PlaceId)
    return info and info.Name or "Unknown Game"
end

local function sendWebhookLog()
    local gameName = getGameName()
    
    local embedData = {
        embeds = {{
            title = "Project X Altura - Script Executed",
            color = 3447003,
            fields = {
                {
                    name = "👤 Username",
                    value = player.Name,
                    inline = true
                },
                {
                    name = "📝 Display Name", 
                    value = player.DisplayName ~= "" and player.DisplayName or "None",
                    inline = true
                },
                {
                    name = "🔢 User ID",
                    value = tostring(userId),
                    inline = true
                },
                {
                    name = "🎮 Game",
                    value = gameName,
                    inline = true
                },
                {
                    name = "⏰ Executed At",
                    value = os.date("%Y-%m-%d %H:%M:%S UTC"),
                    inline = false
                }
            },
            footer = {
                text = "Project X Altura Exec Logger",
                icon_url = "https://raw.githubusercontent.com/Pxrson/Altura-Hub/refs/heads/main/IMG_2209.png"
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    local requestFunc = syn and syn.request or http_request or request or (http and http.request)
    
    if requestFunc then
        spawn(function()
            requestFunc({
                Url = WEBHOOK_URL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode(embedData)
            })
        end)
    end
end

local function showNotification(message)
    StarterGui:SetCore("SendNotification", {
        Title = "Project X Altura",
        Text = message,
        Duration = 3
    })
end

local function loadMM2Script()
    local mm2Code = game:HttpGet(MM2_SCRIPT_URL)
    
    if mm2Code then
        local mm2Script = loadstring(mm2Code)
        if mm2Script then
            mm2Script()
        end
    end
end

local function main()
    sendWebhookLog()
    
    local detectCode = game:HttpGet(DETECT_SCRIPT_URL)
    
    if detectCode and detectCode ~= "" then
        local detectScript = loadstring(detectCode)
        
        if detectScript then
            local gameId = detectScript()
            
            if type(gameId) == "string" and gameId ~= "" then
                showNotification("🎯 Game detected! Loading features...")
                    loadMM2Script()
            else
                showNotification("🚀 Game not supported, its mm2 btw")
            end
        end
    end
end

main()
