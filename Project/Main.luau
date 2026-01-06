local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local Version = "v5.4"
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = PlayerGui

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.AnchorPoint = Vector2.new(0, 0)
Background.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
Background.BackgroundTransparency = 0.3
Background.BorderSizePixel = 0
Background.ZIndex = 1
Background.Parent = ScreenGui

local ProfileContainer = Instance.new("Frame")
ProfileContainer.AnchorPoint = Vector2.new(0.5, 0)
ProfileContainer.Position = UDim2.new(0.5, 0, 0.12, 0)
ProfileContainer.Size = UDim2.new(0, 95, 0, 95)
ProfileContainer.BackgroundColor3 = Color3.fromRGB(25, 15, 40)
ProfileContainer.BorderSizePixel = 0
ProfileContainer.ZIndex = 2
ProfileContainer.Parent = Background

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0.5, 0)
ContainerCorner.Parent = ProfileContainer

local ProfileBorder = Instance.new("UIStroke")
ProfileBorder.Color = Color3.fromRGB(160, 110, 220)
ProfileBorder.Thickness = 3.5
ProfileBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ProfileBorder.Parent = ProfileContainer

local UserImage = Instance.new("ImageLabel")
UserImage.Size = UDim2.new(0.88, 0, 0.88, 0)
UserImage.Position = UDim2.new(0.5, 0, 0.5, 0)
UserImage.AnchorPoint = Vector2.new(0.5, 0.5)
UserImage.BackgroundTransparency = 1
UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
UserImage.ZIndex = 3
UserImage.Parent = ProfileContainer

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(0.5, 0)
ImageCorner.Parent = UserImage

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.8, 0, 0.1, 0)
Title.Position = UDim2.new(0.5, 0, 0.28, 0)
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundTransparency = 1
Title.Text = "Project X Altura"
Title.TextColor3 = Color3.fromRGB(210, 160, 255)
Title.TextSize = 44
Title.Font = Enum.Font.SourceSansBold
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(100, 70, 150)
Title.ZIndex = 2
Title.Parent = Background

local UserDisplay = Instance.new("TextLabel")
UserDisplay.Size = UDim2.new(0.8, 0, 0.04, 0)
UserDisplay.Position = UDim2.new(0.5, 0, 0.315, 0)
UserDisplay.AnchorPoint = Vector2.new(0.5, 0.5)
UserDisplay.BackgroundTransparency = 1
UserDisplay.Text = "User: " .. LocalPlayer.Name
UserDisplay.TextColor3 = Color3.fromRGB(190, 140, 230)
UserDisplay.TextSize = 18
UserDisplay.Font = Enum.Font.RobotoMono
UserDisplay.ZIndex = 2
UserDisplay.Parent = Background

local ProgressFrame = Instance.new("Frame")
ProgressFrame.Size = UDim2.new(0.6, 0, 0.08, 0)
ProgressFrame.Position = UDim2.new(0.5, 0, 0.46, 0)
ProgressFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ProgressFrame.BackgroundColor3 = Color3.fromRGB(25, 15, 35)
ProgressFrame.BackgroundTransparency = 0.2
ProgressFrame.BorderSizePixel = 0
ProgressFrame.ZIndex = 2
ProgressFrame.Parent = Background

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 10)
ProgressCorner.Parent = ProgressFrame

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(160, 110, 220)
ProgressBar.BackgroundTransparency = 0.1
ProgressBar.BorderSizePixel = 0
ProgressBar.ZIndex = 3
ProgressBar.Parent = ProgressFrame

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 10)
BarCorner.Parent = ProgressBar

local Percentage = Instance.new("TextLabel")
Percentage.Size = UDim2.new(1, 0, 1, 0)
Percentage.Position = UDim2.new(0.5, 0, 0.5, 0)
Percentage.AnchorPoint = Vector2.new(0.5, 0.5)
Percentage.BackgroundTransparency = 1
Percentage.Text = "0%"
Percentage.TextColor3 = Color3.fromRGB(230, 200, 255)
Percentage.TextSize = 25
Percentage.Font = Enum.Font.RobotoMono
Percentage.TextXAlignment = Enum.TextXAlignment.Center
Percentage.TextYAlignment = Enum.TextYAlignment.Center
Percentage.TextScaled = true
Percentage.ZIndex = 4
Percentage.Parent = ProgressFrame

local TipText = Instance.new("TextLabel")
TipText.Size = UDim2.new(0.8, 0, 0.06, 0)
TipText.Position = UDim2.new(0.5, 0, 0.56, 0)
TipText.AnchorPoint = Vector2.new(0.5, 0.5)
TipText.BackgroundTransparency = 1
TipText.Text = "TIP: run once for proper function | use left ctrl on PC to open/close"
TipText.TextColor3 = Color3.fromRGB(150, 120, 200)
TipText.TextSize = 16
TipText.Font = Enum.Font.RobotoMono
TipText.TextWrapped = true
TipText.ZIndex = 2
TipText.Parent = Background

local AuthorText = Instance.new("TextLabel")
AuthorText.Size = UDim2.new(0.8, 0, 0.05, 0)
AuthorText.Position = UDim2.new(0.5, 0, 0.91, 0)
AuthorText.AnchorPoint = Vector2.new(0.5, 0.5)
AuthorText.BackgroundTransparency = 1
AuthorText.Text = "created by .pxrson#2630 on discord"
AuthorText.TextColor3 = Color3.fromRGB(190, 140, 230)
AuthorText.TextSize = 18
AuthorText.Font = Enum.Font.RobotoMono
AuthorText.TextWrapped = true
AuthorText.ZIndex = 2
AuthorText.Parent = Background

local SkipButton = Instance.new("TextButton")
SkipButton.Size = UDim2.new(0.15, 0, 0.06, 0)
SkipButton.Position = UDim2.new(0.95, 0, 0.95, 0)
SkipButton.AnchorPoint = Vector2.new(1, 1)
SkipButton.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
SkipButton.BackgroundTransparency = 0.3
SkipButton.Text = "Skip"
SkipButton.TextColor3 = Color3.fromRGB(230, 200, 255)
SkipButton.TextSize = 18
SkipButton.Font = Enum.Font.RobotoMono
SkipButton.ZIndex = 4
SkipButton.Parent = Background

local SkipCorner = Instance.new("UICorner")
SkipCorner.CornerRadius = UDim.new(0, 8)
SkipCorner.Parent = SkipButton

local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(0.3, 0, 0.05, 0)
VersionText.Position = UDim2.new(0.95, 0, 0.05, 0)
VersionText.AnchorPoint = Vector2.new(1, 0)
VersionText.BackgroundTransparency = 1
VersionText.Text = "Build: " .. Version .. " | Time: " .. os.date("%I:%M %p")
VersionText.TextColor3 = Color3.fromRGB(150, 120, 200)
VersionText.TextSize = 14
VersionText.Font = Enum.Font.RobotoMono
VersionText.TextXAlignment = Enum.TextXAlignment.Right
VersionText.ZIndex = 2
VersionText.Parent = Background

task.spawn(function()
    while ProfileContainer.Parent do
        local PulseTween = TweenService:Create(ProfileBorder, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
            Thickness = 5
        })
        PulseTween:Play()
        task.wait(4)
    end
end)

local CurrentProgress = 0
local Loading = true

RunService.RenderStepped:Connect(function()
    Percentage.Text = math.floor(CurrentProgress * 100) .. "%"
end)

local function FadeOut()
    if ScreenGui.Parent then
        local TweenInformation = TweenInfo.new(1)
        local FadeGoal = {BackgroundTransparency = 1}
        TweenService:Create(Background, TweenInformation, FadeGoal):Play()
        
        for _, Element in ipairs(Background:GetDescendants()) do
            if Element:IsA("TextLabel") or Element:IsA("TextButton") then
                TweenService:Create(Element, TweenInformation, {TextTransparency = 1}):Play()
            elseif Element:IsA("Frame") then
                TweenService:Create(Element, TweenInformation, {BackgroundTransparency = 1}):Play()
            elseif Element:IsA("ImageLabel") then
                TweenService:Create(Element, TweenInformation, {ImageTransparency = 1}):Play()
            end
        end
        
        task.wait(1.1)
    end
    if ScreenGui then ScreenGui:Destroy() end
end

local function UpdateProgress(Value)
    CurrentProgress = Value
    ProgressBar.Size = UDim2.new(math.min(CurrentProgress, 1), 0, 1, 0)
end

local GamesList = {
    ["142823291"] = {
        name = "Murder Mystery 2",
        status = "COMPLETE",
        url = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Murder%20Mystery%202.luau"
    },
    ["3623096087"] = {
        name = "Muscle Legends",
        status = "BETA",
        url = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Muscle%20Legends.luau"
    },
    ["3101667897"] = {
        name = "Legends Of Speed",
        status = "BETA",
        url = "https://raw.githubusercontent.com/Pxrson/Project-X-Altura/refs/heads/main/Project/Games/Legends%20Of%20Speed.luau"
    }
}

local function AnimateProgress(From, To, Duration)
    local StartTime = tick()
    while true do
        local ElapsedTime = tick() - StartTime
        local Progress = math.min(ElapsedTime / Duration, 1)
        UpdateProgress(From + (To - From) * Progress)
        if Progress >= 1 then break end
        task.wait()
    end
end

local function ExecuteScript()
    local PlaceIndex = tostring(game.PlaceId)
    local GameData = GamesList[PlaceIndex]
    
    if GameData then
        AnimateProgress(0, 0.2, 0.5)
        local Success, Error = pcall(function()
            AnimateProgress(0.2, 0.4, 0.8)
            local ScriptContent = game:HttpGet(GameData.url)
            AnimateProgress(0.4, 0.7, 0.6)
            loadstring(ScriptContent)()
            AnimateProgress(0.7, 1, 0.4)
        end)
        
        if not Success then
            warn("load err:", Error)
            AnimateProgress(CurrentProgress, 1, 0.3)
        end
    else
        local SupportedList = {"Unsupported\n\nSupported:"}
        for Index, GameObject in pairs(GamesList) do
            table.insert(SupportedList, "- " .. GameObject.name .. " | " .. GameObject.status)
        end
        print(table.concat(SupportedList, "\n"))
        AnimateProgress(0, 1, 0.5)
    end
    
    Loading = false
end

task.spawn(ExecuteScript)

SkipButton.MouseButton1Click:Connect(function()
    Loading = false
end)

while Loading do
    task.wait(0.1)
end

FadeOut()
