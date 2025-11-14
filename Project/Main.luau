local plyr = game:GetService("Players")
local rnsv = game:GetService("RunService")
local twsv = game:GetService("TweenService")
local http = game:GetService("HttpService")

local pplr = plyr.LocalPlayer
local pgui = pplr:WaitForChild("PlayerGui")

local sgui = Instance.new("ScreenGui")
sgui.Name = "LoadScreen"
sgui.ResetOnSpawn = false
sgui.IgnoreGuiInset = true
sgui.ZIndexBehavior = Enum.ZIndexBehavior.Global
sgui.DisplayOrder = 999999
sgui.Parent = pgui

local bgnd = Instance.new("Frame")
bgnd.Size = UDim2.new(1, 0, 1, 0)
bgnd.Position = UDim2.new(0, 0, 0, 0)
bgnd.AnchorPoint = Vector2.new(0, 0)
bgnd.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
bgnd.BackgroundTransparency = 0.3
bgnd.BorderSizePixel = 0
bgnd.ZIndex = 1
bgnd.Parent = sgui

local titl = Instance.new("TextLabel")
titl.Size = UDim2.new(0.8, 0, 0.1, 0)
titl.Position = UDim2.new(0.5, 0, 0.25, 0)
titl.AnchorPoint = Vector2.new(0.5, 0.5)
titl.BackgroundTransparency = 1
titl.Text = "Project X Altura"
titl.TextColor3 = Color3.fromRGB(210, 160, 255)
titl.TextSize = 42
titl.Font = Enum.Font.SourceSansBold
titl.TextStrokeTransparency = 0
titl.TextStrokeColor3 = Color3.fromRGB(100, 70, 150)
titl.ZIndex = 2
titl.Parent = bgnd

local pfrm = Instance.new("Frame")
pfrm.Size = UDim2.new(0.6, 0, 0.08, 0)
pfrm.Position = UDim2.new(0.5, 0, 0.4, 0)
pfrm.AnchorPoint = Vector2.new(0.5, 0.5)
pfrm.BackgroundColor3 = Color3.fromRGB(25, 15, 35)
pfrm.BackgroundTransparency = 0.2
pfrm.BorderSizePixel = 0
pfrm.ZIndex = 2
pfrm.Parent = bgnd

local pcor = Instance.new("UICorner")
pcor.CornerRadius = UDim.new(0, 10)
pcor.Parent = pfrm

local pbar = Instance.new("Frame")
pbar.Size = UDim2.new(0, 0, 1, 0)
pbar.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
pbar.BackgroundTransparency = 0.1
pbar.BorderSizePixel = 0
pbar.ZIndex = 3
pbar.Parent = pfrm

local bcor = Instance.new("UICorner")
bcor.CornerRadius = UDim.new(0, 10)
bcor.Parent = pbar

local perc = Instance.new("TextLabel")
perc.Size = UDim2.new(1, 0, 1, 0)
perc.Position = UDim2.new(0.5, 0, 0.5, 0)
perc.AnchorPoint = Vector2.new(0.5, 0.5)
perc.BackgroundTransparency = 1
perc.Text = "0%"
perc.TextColor3 = Color3.fromRGB(230, 200, 255)
perc.TextSize = 25
perc.Font = Enum.Font.RobotoMono
perc.TextXAlignment = Enum.TextXAlignment.Center
perc.TextYAlignment = Enum.TextYAlignment.Center
perc.TextScaled = true
perc.ZIndex = 4
perc.Parent = pfrm

local tipt = Instance.new("TextLabel")
tipt.Size = UDim2.new(0.8, 0, 0.06, 0)
tipt.Position = UDim2.new(0.5, 0, 0.55, 0)
tipt.AnchorPoint = Vector2.new(0.5, 0.5)
tipt.BackgroundTransparency = 1
tipt.Text = "TIP: run once for proper function | use left ctrl on PC to open/close"
tipt.TextColor3 = Color3.fromRGB(150, 120, 200)
tipt.TextSize = 18
tipt.Font = Enum.Font.RobotoMono
tipt.TextWrapped = true
tipt.ZIndex = 2
tipt.Parent = bgnd

local autx = Instance.new("TextLabel")
autx.Size = UDim2.new(0.8, 0, 0.05, 0)
autx.Position = UDim2.new(0.5, 0, 0.9, 0)
autx.AnchorPoint = Vector2.new(0.5, 0.5)
autx.BackgroundTransparency = 1
autx.Text = "created by .pxrson#0000 on discord"
autx.TextColor3 = Color3.fromRGB(190, 140, 230)
autx.TextSize = 20
autx.Font = Enum.Font.RobotoMono
autx.TextWrapped = true
autx.ZIndex = 2
autx.Parent = bgnd

local skip = Instance.new("TextButton")
skip.Size = UDim2.new(0.15, 0, 0.06, 0)
skip.Position = UDim2.new(0.95, 0, 0.95, 0)
skip.AnchorPoint = Vector2.new(1, 1)
skip.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
skip.BackgroundTransparency = 0.3
skip.Text = "Skip"
skip.TextColor3 = Color3.fromRGB(230, 200, 255)
skip.TextSize = 18
skip.Font = Enum.Font.RobotoMono
skip.ZIndex = 4
skip.Parent = bgnd

local skcr = Instance.new("UICorner")
skcr.CornerRadius = UDim.new(0, 8)
skcr.Parent = skip

local vers = Instance.new("TextLabel")
vers.Size = UDim2.new(0.3, 0, 0.05, 0)
vers.Position = UDim2.new(0.95, 0, 0.05, 0)
vers.AnchorPoint = Vector2.new(1, 0)
vers.BackgroundTransparency = 1
vers.Text = "Build: v4.8 | Time: " .. os.date("%I:%M %p")
vers.TextColor3 = Color3.fromRGB(150, 120, 200)
vers.TextSize = 14
vers.Font = Enum.Font.RobotoMono
vers.TextXAlignment = Enum.TextXAlignment.Right
vers.ZIndex = 2
vers.Parent = bgnd

local curr = 0
local load = true

rnsv.RenderStepped:Connect(function()
    perc.Text = math.floor(curr * 100) .. "%"
end)

local function fade()
    if sgui.Parent then
        local info = TweenInfo.new(1)
        local goal = {BackgroundTransparency = 1}
        twsv:Create(bgnd, info, goal):Play()
        
        for _, elem in ipairs(bgnd:GetDescendants()) do
            if elem:IsA("TextLabel") or elem:IsA("TextButton") then
                twsv:Create(elem, info, {TextTransparency = 1}):Play()
            elseif elem:IsA("Frame") then
                twsv:Create(elem, info, {BackgroundTransparency = 1}):Play()
            end
        end
        
        wait(1.1)
    end
    if sgui then sgui:Destroy() end
end

local function uprg(val)
    curr = val
    pbar.Size = UDim2.new(math.min(curr, 1), 0, 1, 0)
end

local games = {
    ["142823291"] = {
        name = "Murder Mystery 2",
        status = "COMPLETE",
        url = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Murder%20Mystery%202.luau"
    },
    ["3623096087"] = {
        name = "Muscle Legends",
        status = "FIXING",
        url = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Muscle%20Legends.luau"
    },
    ["3101667897"] = {
        name = "Legends Of Speed",
        status = "SOON",
        url = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Legends%20Of%20Speed.luau"
    }
}

local function anim(from, to, duration)
    local start = tick()
    while true do
        local elapsed = tick() - start
        local prog = math.min(elapsed / duration, 1)
        uprg(from + (to - from) * prog)
        if prog >= 1 then break end
        task.wait()
    end
end

local function exec()
    local pidx = tostring(game.PlaceId)
    local data = games[pidx]
    
    if data then
        anim(0, 0.2, 0.5)
        local succ, err = pcall(function()
            anim(0.2, 0.4, 0.8)
            local cont = game:HttpGet(data.url)
            anim(0.4, 0.7, 0.6)
            loadstring(cont)()
            anim(0.7, 1, 0.4)
        end)
        
        if not succ then
            warn("load err:", err)
            anim(curr, 1, 0.3)
        end
    else
        local list = {"Unsupported\n\nSupported:"}
        for idx, obj in pairs(games) do
            table.insert(list, "- " .. obj.name .. " | " .. obj.status)
        end
        print(table.concat(list, "\n"))
        anim(0, 1, 0.5)
    end
    
    load = false
end

task.spawn(exec)

skip.MouseButton1Click:Connect(function()
    load = false
end)

while load do
    wait(0.1)
end

fade()
