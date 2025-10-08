local Compat = {}

Compat.isfile = isfile or function() return false end
Compat.readfile = readfile or function() return "" end
Compat.writefile = writefile or function() end
Compat.makefolder = makefolder or function() end
Compat.delfolder = delfolder or function() end
Compat.delfile = delfile or function() end
Compat.listfiles = listfiles or function() return {} end
Compat.isfolder = isfolder or function() return false end

Compat.request = http_request or request or (syn and syn.request) or function()
    return {Success = false, StatusCode = 0, Body = ""}
end

Compat.gethwid = gethwid or function()
    return tostring(game:GetService("Players").LocalPlayer.UserId)
end

Compat.setclipboard = setclipboard or toclipboard or set_clipboard or function() end

Compat.getcustomasset = getcustomasset or getsynasset or function(path)
    return "rbxasset://textures/ui/GuiImagePlaceholder.png"
end

Compat.protectgui = protectgui or (syn and syn.protect_gui) or function() end

Compat.gethui = gethui or function()
    return game:GetService("CoreGui")
end

local Library = {}
Library.Compat = Compat

local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function Tween(obj, time, props, style, direction)
    return TweenService:Create(obj, TweenInfo.new(time, style or Enum.EasingStyle.Quint, direction or Enum.EasingDirection.Out), props)
end

function Library:CreateWindow(config)
    local Window = {
        Tabs = {},
        CurrentTab = nil,
        Elements = {}
    }
    
    for _, gui in pairs(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if CollectionService:HasTag(gui, "main") then
            gui:Destroy()
        end
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name or "UILibrary"
    ScreenGui.Parent = Compat.gethui()
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    CollectionService:AddTag(ScreenGui, "main")
    Compat.protectgui(ScreenGui)
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0.27604, 0, 0.36705, 0)
    MainFrame.Position = UDim2.new(0.35625, 0, -0.5, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundTransparency = 1
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.Parent = MainFrame
    
    local UIAspectRatio = Instance.new("UIAspectRatioConstraint")
    UIAspectRatio.AspectRatio = 1.50568
    UIAspectRatio.Parent = MainFrame
    
    local TopBar = Instance.new("TextLabel")
    TopBar.Name = "TextBox"
    TopBar.Size = UDim2.new(0, 318, 0, 22)
    TopBar.Position = UDim2.new(0.2566, 0, 0.02273, 4)
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BackgroundTransparency = 0.1
    TopBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.Text = config.Name or "PROJECT X"
    TopBar.TextColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.TextSize = 24
    TopBar.Font = Enum.Font.SourceSansBold
    TopBar.Parent = MainFrame
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 10)
    TopBarCorner.Parent = TopBar
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.RichText = true
    CloseButton.BorderSizePixel = 0
    CloseButton.TextSize = 24
    CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Size = UDim2.new(0, 34, 0, 28)
    CloseButton.Position = UDim2.new(0, 484, 0, 10)
    CloseButton.Text = "X"
    CloseButton.Style = Enum.ButtonStyle.RobloxButtonDefault
    CloseButton.Parent = MainFrame
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseButton
    
    local TabContainer = Instance.new("TextButton")
    TabContainer.Name = "MainTab"
    TabContainer.BorderSizePixel = 0
    TabContainer.TextSize = 28
    TabContainer.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundColor3 = Color3.fromRGB(92, 67, 218)
    TabContainer.Size = UDim2.new(0, 78, 0, 26)
    TabContainer.Position = UDim2.new(0.02264, 0, 0.11364, 16)
    TabContainer.Text = "Main"
    TabContainer.Parent = MainFrame
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 2)
    TabCorner.Parent = TabContainer
    
    local ContentFrame = Instance.new("Frame")
    ContentFrame.BorderSizePixel = 0
    ContentFrame.BackgroundColor3 = Color3.fromRGB(62, 59, 141)
    ContentFrame.Style = Enum.FrameStyle.ChatRed
    ContentFrame.Size = UDim2.new(0, 414, 0, 290)
    ContentFrame.Position = UDim2.new(0.18491, 2, 0.13068, 0)
    ContentFrame.BorderColor3 = Color3.fromRGB(68, 55, 155)
    ContentFrame.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.Parent = ContentFrame
    
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Active = true
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
    ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
    ScrollingFrame.ScrollBarThickness = 8
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScrollingFrame.Parent = ContentFrame
    
    local ContentList = Instance.new("UIListLayout")
    ContentList.Padding = UDim.new(0, 5)
    ContentList.SortOrder = Enum.SortOrder.LayoutOrder
    ContentList.Parent = ScrollingFrame
    
    local BottomLabel = Instance.new("TextLabel")
    BottomLabel.Name = "BottomText"
    BottomLabel.TextSize = 18
    BottomLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    BottomLabel.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
    BottomLabel.Size = UDim2.new(0, 380, 0, 18)
    BottomLabel.Position = UDim2.new(0.18868, 8, 0.92614, 32)
    BottomLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BottomLabel.Text = config.Credit or "Made with Custom Library"
    BottomLabel.Parent = MainFrame
    
    local BottomCorner = Instance.new("UICorner")
    BottomCorner.CornerRadius = UDim.new(0, 5)
    BottomCorner.Parent = BottomLabel
    
    local dragging, dragInput, dragStart, startPos
    
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        local spinTween = Tween(CloseButton, 0.3, {Rotation = 90})
        spinTween:Play()
        Tween(MainFrame, 0.5, {Position = UDim2.new(0.35625, 0, -0.5, 0)}, Enum.EasingStyle.Back, Enum.EasingDirection.In):Play()
        Tween(MainFrame, 0.5, {BackgroundTransparency = 1}):Play()
        wait(0.5)
        ScreenGui:Destroy()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        Tween(CloseButton, 0.2, {Size = UDim2.new(0, 38, 0, 32), Rotation = 180}, Enum.EasingStyle.Elastic):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        Tween(CloseButton, 0.2, {Size = UDim2.new(0, 34, 0, 28), Rotation = 0}):Play()
    end)
    
    TabContainer.MouseEnter:Connect(function()
        Tween(TabContainer, 0.3, {Size = UDim2.new(0, 90, 0, 32), BackgroundColor3 = Color3.fromRGB(110, 85, 255)}, Enum.EasingStyle.Back):Play()
    end)
    
    TabContainer.MouseLeave:Connect(function()
        Tween(TabContainer, 0.3, {Size = UDim2.new(0, 78, 0, 26), BackgroundColor3 = Color3.fromRGB(92, 67, 218)}, Enum.EasingStyle.Back):Play()
    end)
    
    TabContainer.MouseButton1Click:Connect(function()
        local clickTween = Tween(TabContainer, 0.1, {Size = UDim2.new(0, 75, 0, 24)})
        clickTween:Play()
        wait(0.1)
        Tween(TabContainer, 0.1, {Size = UDim2.new(0, 78, 0, 26)}):Play()
    end)
    
    Tween(MainFrame, 0.5, {Position = UDim2.new(0.35625, 0, 0.32325, 0)}, Enum.EasingStyle.Bounce):Play()
    Tween(MainFrame, 0.5, {BackgroundTransparency = 0.2}):Play()
    
    function Window:Button(config)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -10, 0, 35)
        Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        Button.Text = config.Name or "Button"
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.SourceSansBold
        Button.TextSize = 16
        Button.Parent = ScrollingFrame
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 6)
        ButtonCorner.Parent = Button
        
        Button.MouseButton1Click:Connect(function()
            if config.Callback then
                config.Callback()
            end
        end)
        
        Button.MouseEnter:Connect(function()
            Tween(Button, 0.2, {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            Tween(Button, 0.2, {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
        end)
        
        return Button
    end
    
    function Window:Toggle(config)
        local value = config.Default or false
        
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(1, -10, 0, 35)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        ToggleFrame.Parent = ScrollingFrame
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 6)
        ToggleCorner.Parent = ToggleFrame
        
        local ToggleLabel = Instance.new("TextLabel")
        ToggleLabel.Size = UDim2.new(1, -55, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Text = config.Name or "Toggle"
        ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleLabel.Font = Enum.Font.SourceSansBold
        ToggleLabel.TextSize = 16
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        ToggleLabel.Parent = ToggleFrame
        
        local ToggleButton = Instance.new("Frame")
        ToggleButton.Size = UDim2.new(0, 41.6, 0, 26)
        ToggleButton.Position = UDim2.new(1, -46, 0.5, 0)
        ToggleButton.AnchorPoint = Vector2.new(0, 0.5)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        ToggleButton.BackgroundTransparency = 0.2
        ToggleButton.Parent = ToggleFrame
        
        local ToggleCorner2 = Instance.new("UICorner")
        ToggleCorner2.CornerRadius = UDim.new(0, 13)
        ToggleCorner2.Parent = ToggleButton
        
        local ToggleIndicator = Instance.new("Frame")
        ToggleIndicator.Size = UDim2.new(0, 18, 0, 18)
        ToggleIndicator.Position = UDim2.new(0, 4, 0.5, 0)
        ToggleIndicator.AnchorPoint = Vector2.new(0, 0.5)
        ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleIndicator.Parent = ToggleButton
        
        local IndicatorCorner = Instance.new("UICorner")
        IndicatorCorner.CornerRadius = UDim.new(0, 10)
        IndicatorCorner.Parent = ToggleIndicator
        
        local Layer = Instance.new("Frame")
        Layer.Name = "Layer"
        Layer.Size = UDim2.new(1, 0, 1, 0)
        Layer.BackgroundColor3 = Color3.fromRGB(92, 67, 218)
        Layer.BackgroundTransparency = 1
        Layer.Parent = ToggleButton
        
        local LayerCorner = Instance.new("UICorner")
        LayerCorner.CornerRadius = UDim.new(0, 13)
        LayerCorner.Parent = Layer
        
        if value then
            ToggleIndicator.Position = UDim2.new(1, -22, 0.5, 0)
            Layer.BackgroundTransparency = 0
        end
        
        local ClickButton = Instance.new("TextButton")
        ClickButton.Size = UDim2.new(1, 0, 1, 0)
        ClickButton.BackgroundTransparency = 1
        ClickButton.Text = ""
        ClickButton.Parent = ToggleFrame
        
        ClickButton.MouseButton1Click:Connect(function()
            value = not value
            
            if value then
                Tween(ToggleIndicator, 0.15, {Position = UDim2.new(1, -22, 0.5, 0)}, Enum.EasingStyle.Quint):Play()
                Tween(Layer, 0.1, {BackgroundTransparency = 0}):Play()
            else
                Tween(ToggleIndicator, 0.15, {Position = UDim2.new(0, 4, 0.5, 0)}, Enum.EasingStyle.Quint):Play()
                Tween(Layer, 0.1, {BackgroundTransparency = 1}):Play()
            end
            
            if config.Callback then
                config.Callback(value)
            end
        end)
        
        return ToggleFrame
    end
    
    function Window:Input(config)
        local InputFrame = Instance.new("Frame")
        InputFrame.Size = UDim2.new(1, -10, 0, 35)
        InputFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        InputFrame.Parent = ScrollingFrame
        
        local InputCorner = Instance.new("UICorner")
        InputCorner.CornerRadius = UDim.new(0, 6)
        InputCorner.Parent = InputFrame
        
        local InputBox = Instance.new("TextBox")
        InputBox.Size = UDim2.new(1, -10, 1, 0)
        InputBox.Position = UDim2.new(0, 5, 0, 0)
        InputBox.BackgroundTransparency = 1
        InputBox.PlaceholderText = config.Placeholder or "Enter text..."
        InputBox.Text = ""
        InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        InputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
        InputBox.Font = Enum.Font.SourceSans
        InputBox.TextSize = 16
        InputBox.TextXAlignment = Enum.TextXAlignment.Left
        InputBox.Parent = InputFrame
        
        InputBox.FocusLost:Connect(function()
            if config.Callback then
                config.Callback(InputBox.Text)
            end
        end)
        
        return InputFrame
    end
    
    function Window:Paragraph(config)
        local ParagraphFrame = Instance.new("Frame")
        ParagraphFrame.Size = UDim2.new(1, -10, 0, 0)
        ParagraphFrame.AutomaticSize = Enum.AutomaticSize.Y
        ParagraphFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        ParagraphFrame.Parent = ScrollingFrame
        
        local ParagraphCorner = Instance.new("UICorner")
        ParagraphCorner.CornerRadius = UDim.new(0, 6)
        ParagraphCorner.Parent = ParagraphFrame
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -10, 0, 0)
        Title.AutomaticSize = Enum.AutomaticSize.Y
        Title.Position = UDim2.new(0, 5, 0, 5)
        Title.BackgroundTransparency = 1
        Title.Text = config.Title or "Title"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.Font = Enum.Font.SourceSansBold
        Title.TextSize = 18
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.TextWrapped = true
        Title.RichText = true
        Title.Parent = ParagraphFrame
        
        local Content = Instance.new("TextLabel")
        Content.Size = UDim2.new(1, -10, 0, 0)
        Content.AutomaticSize = Enum.AutomaticSize.Y
        Content.Position = UDim2.new(0, 5, 0, Title.TextBounds.Y + 10)
        Content.BackgroundTransparency = 1
        Content.Text = config.Content or "Content"
        Content.TextColor3 = Color3.fromRGB(200, 200, 200)
        Content.Font = Enum.Font.SourceSans
        Content.TextSize = 16
        Content.TextXAlignment = Enum.TextXAlignment.Left
        Content.TextWrapped = true
        Content.RichText = true
        Content.Parent = ParagraphFrame
        
        local Padding = Instance.new("UIPadding")
        Padding.PaddingTop = UDim.new(0, 5)
        Padding.PaddingBottom = UDim.new(0, 5)
        Padding.PaddingLeft = UDim.new(0, 5)
        Padding.PaddingRight = UDim.new(0, 5)
        Padding.Parent = ParagraphFrame
        
        Title.Changed:Connect(function()
            Content.Position = UDim2.new(0, 5, 0, Title.TextBounds.Y + 10)
        end)
        
        return ParagraphFrame
    end
    
    function Window:Label(text)
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, -10, 0, 30)
        Label.BackgroundTransparency = 1
        Label.Text = text or "Label"
        Label.TextColor3 = Color3.fromRGB(200, 200, 200)
        Label.Font = Enum.Font.SourceSans
        Label.TextSize = 16
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = ScrollingFrame
        
        return Label
    end
    
    return Window
end

return Library
