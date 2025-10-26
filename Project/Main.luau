local plr = game.Players.LocalPlayer
local gui = plr:WaitForChild("PlayerGui")

local scrngui = Instance.new("ScreenGui")
scrngui.Parent = gui
scrngui.Name = "LoadDisplay"
scrngui.ResetOnSpawn = false
scrngui.IgnoreGuiInset = true
scrngui.ZIndexBehavior = Enum.ZIndexBehavior.Global
scrngui.DisplayOrder = 999999

local bgpnl = Instance.new("Frame")
bgpnl.Size = UDim2.new(1, 0, 1, 0)
bgpnl.Position = UDim2.new(0, 0, 0, 0)
bgpnl.AnchorPoint = Vector2.new(0, 0)
bgpnl.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
bgpnl.BackgroundTransparency = 0.3
bgpnl.BorderSizePixel = 0
bgpnl.ZIndex = 1
bgpnl.Parent = scrngui

local titlelbl = Instance.new("TextLabel")
titlelbl.Size = UDim2.new(0.8, 0, 0.1, 0)
titlelbl.Position = UDim2.new(0.5, 0, 0.25, 0)
titlelbl.AnchorPoint = Vector2.new(0.5, 0.5)
titlelbl.BackgroundTransparency = 1
titlelbl.Text = "Project X Altura"
titlelbl.TextColor3 = Color3.fromRGB(210, 160, 255)
titlelbl.TextSize = 42
titlelbl.Font = Enum.Font.SourceSansBold
titlelbl.TextStrokeTransparency = 0
titlelbl.TextStrokeColor3 = Color3.fromRGB(100, 70, 150)
titlelbl.ZIndex = 2
titlelbl.Parent = bgpnl

local progfrm = Instance.new("Frame")
progfrm.Size = UDim2.new(0.6, 0, 0.08, 0)
progfrm.Position = UDim2.new(0.5, 0, 0.4, 0)
progfrm.AnchorPoint = Vector2.new(0.5, 0.5)
progfrm.BackgroundColor3 = Color3.fromRGB(25, 15, 35)
progfrm.BackgroundTransparency = 0.2
progfrm.BorderSizePixel = 0
progfrm.ZIndex = 2
progfrm.Parent = bgpnl

local progcorner = Instance.new("UICorner")
progcorner.CornerRadius = UDim.new(0, 10)
progcorner.Parent = progfrm

local fillbar = Instance.new("Frame")
fillbar.Size = UDim2.new(0, 0, 1, 0)
fillbar.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
fillbar.BackgroundTransparency = 0.1
fillbar.BorderSizePixel = 0
fillbar.ZIndex = 3
fillbar.Parent = progfrm

local fillcorner = Instance.new("UICorner")
fillcorner.CornerRadius = UDim.new(0, 10)
fillcorner.Parent = fillbar

local perclbl = Instance.new("TextLabel")
perclbl.Size = UDim2.new(1, 0, 1, 0)
perclbl.Position = UDim2.new(0.5, 0, 0.5, 0)
perclbl.AnchorPoint = Vector2.new(0.5, 0.5)
perclbl.BackgroundTransparency = 1
perclbl.Text = "0%"
perclbl.TextColor3 = Color3.fromRGB(230, 200, 255)
perclbl.TextSize = 25
perclbl.Font = Enum.Font.RobotoMono
perclbl.TextXAlignment = Enum.TextXAlignment.Center
perclbl.TextYAlignment = Enum.TextYAlignment.Center
perclbl.TextScaled = true
perclbl.ZIndex = 4
perclbl.Parent = progfrm

local tiplbl = Instance.new("TextLabel")
tiplbl.Size = UDim2.new(0.8, 0, 0.06, 0)
tiplbl.Position = UDim2.new(0.5, 0, 0.55, 0)
tiplbl.AnchorPoint = Vector2.new(0.5, 0.5)
tiplbl.BackgroundTransparency = 1
tiplbl.Text = "TIP: run once for proper function | use left ctrl on PC to open/close"
tiplbl.TextColor3 = Color3.fromRGB(150, 120, 200)
tiplbl.TextSize = 18
tiplbl.Font = Enum.Font.RobotoMono
tiplbl.TextWrapped = true
tiplbl.ZIndex = 2
tiplbl.Parent = bgpnl

local authlbl = Instance.new("TextLabel")
authlbl.Size = UDim2.new(0.8, 0, 0.05, 0)
authlbl.Position = UDim2.new(0.5, 0, 0.9, 0)
authlbl.AnchorPoint = Vector2.new(0.5, 0.5)
authlbl.BackgroundTransparency = 1
authlbl.Text = "created by .pxrson#0000 on discord"
authlbl.TextColor3 = Color3.fromRGB(190, 140, 230)
authlbl.TextSize = 20
authlbl.Font = Enum.Font.RobotoMono
authlbl.TextWrapped = true
authlbl.ZIndex = 2
authlbl.Parent = bgpnl

local skipbtn = Instance.new("TextButton")
skipbtn.Size = UDim2.new(0.15, 0, 0.06, 0)
skipbtn.Position = UDim2.new(0.95, 0, 0.95, 0)
skipbtn.AnchorPoint = Vector2.new(1, 1)
skipbtn.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
skipbtn.BackgroundTransparency = 0.3
skipbtn.Text = "Skip"
skipbtn.TextColor3 = Color3.fromRGB(230, 200, 255)
skipbtn.TextSize = 18
skipbtn.Font = Enum.Font.RobotoMono
skipbtn.ZIndex = 4
skipbtn.Parent = bgpnl

local skipcorner = Instance.new("UICorner")
skipcorner.CornerRadius = UDim.new(0, 8)
skipcorner.Parent = skipbtn

local debuglbl = Instance.new("TextLabel")
debuglbl.Size = UDim2.new(0.3, 0, 0.05, 0)
debuglbl.Position = UDim2.new(0.95, 0, 0.05, 0)
debuglbl.AnchorPoint = Vector2.new(1, 0)
debuglbl.BackgroundTransparency = 1
debuglbl.Text = "Build: v4.5 | Time: " .. os.date("%I:%M %p")
debuglbl.TextColor3 = Color3.fromRGB(150, 120, 200)
debuglbl.TextSize = 14
debuglbl.Font = Enum.Font.RobotoMono
debuglbl.TextXAlignment = Enum.TextXAlignment.Right
debuglbl.ZIndex = 2
debuglbl.Parent = bgpnl

local twensrv = game:GetService("TweenService")
local tween = twensrv:Create(fillbar, TweenInfo.new(5, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)})

local runsrv = game:GetService("RunService")
runsrv.RenderStepped:Connect(function()
    perclbl.Text = math.floor(fillbar.Size.X.Scale * 100) .. "%"
end)

local function fade()
    local info = TweenInfo.new(1)
    local goals = {BackgroundTransparency = 1}
    twensrv:Create(bgpnl, info, goals):Play()
    for _, child in ipairs(bgpnl:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            twensrv:Create(child, info, {TextTransparency = 1}):Play()
        elseif child:IsA("Frame") then
            twensrv:Create(child, info, {BackgroundTransparency = 1}):Play()
        end
    end
    wait(1)
    scrngui:Destroy()
end

local function load()
    local games = {
        ["142823291"] = {"Murder Mystery 2", "COMPLETE", "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Murder%20Mystery%202.luau"},
        ["3623096087"] = {"Muscle Legends", "FIXING", "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Muscle%20Legends.luau"},
        ["3101667897"] = {"Legends Of Speed", "SOON", "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Legends%20Of%20Speed.luau"}
    }

    local data = games[tostring(game.PlaceId)]

    if data then
        local s, e = pcall(function()
            loadstring(game:HttpGet(data[3]))()
        end)
        if not s then warn("error:", e) end
    else
        local msg = {"❌ Unsupported\n\n✅ Supported:"}
        for _, info in pairs(games) do
            table.insert(msg, "- " .. info[1] .. " | " .. info[2])
        end
        print(table.concat(msg, "\n"))
    end
end

tween:Play()
tween.Completed:Connect(function()
    fade()
    load()
end)

skipbtn.MouseButton1Click:Connect(function()
    tween:Cancel()
    fade()
    load()
end)
