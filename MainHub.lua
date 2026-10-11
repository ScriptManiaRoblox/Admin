-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Security check
if CoreGui:FindFirstChild("CustomAdminBar") then
    CoreGui.CustomAdminBar:Destroy()
end

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomAdminBar"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = CoreGui

---------------------------------------------------------
-- EPIC INTRO: CONRAY HUB DT NOTIFICATION
---------------------------------------------------------
local IntroFrame = Instance.new("Frame")
IntroFrame.Name = "IntroNotification"
IntroFrame.Size = UDim2.new(0, 280, 0, 56)
IntroFrame.Position = UDim2.new(0.5, -140, 0, -80) -- Starts hidden off-screen
IntroFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IntroFrame.BorderSizePixel = 0
IntroFrame.Parent = ScreenGui

local IntroCorner = Instance.new("UICorner")
IntroCorner.CornerRadius = UDim.new(0, 8)
IntroCorner.Parent = IntroFrame

local IntroGradient = Instance.new("UIGradient")
IntroGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
})
IntroGradient.Rotation = 90
IntroGradient.Parent = IntroFrame

local IntroStroke = Instance.new("UIStroke")
IntroStroke.Color = Color3.fromRGB(255, 255, 255)
IntroStroke.Thickness = 1.5
IntroStroke.Parent = IntroFrame

local IntroTitle = Instance.new("TextLabel")
IntroTitle.Size = UDim2.new(1, 0, 0, 26)
IntroTitle.Position = UDim2.new(0, 0, 0, 6)
IntroTitle.BackgroundTransparency = 1
IntroTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroTitle.TextSize = 16
IntroTitle.Font = Enum.Font.SourceSansBold
IntroTitle.Text = "Conray Hub DT"
IntroTitle.Parent = IntroFrame

local IntroSub = Instance.new("TextLabel")
IntroSub.Size = UDim2.new(1, 0, 0, 18)
IntroSub.Position = UDim2.new(0, 0, 0, 30)
IntroSub.BackgroundTransparency = 1
IntroSub.TextColor3 = Color3.fromRGB(180, 180, 180)
IntroSub.TextSize = 12
IntroSub.Font = Enum.Font.SourceSans
IntroSub.Text = "Admin Systems Online & Ready"
IntroSub.Parent = IntroFrame

-- Smooth Intro Animation (Slides down, waits, slides back up)
task.spawn(function()
    IntroFrame:TweenPosition(UDim2.new(0.5, -140, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.6, true)
    task.wait(3.5)
    IntroFrame:TweenPosition(UDim2.new(0.5, -140, 0, -90), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
    task.wait(0.6)
    IntroFrame:Destroy()
end)

---------------------------------------------------------
-- MAIN COMMAND BAR UI
---------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 310, 0, 36)
MainFrame.Position = UDim2.new(1, -320, 0, 4)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

-- Black and Grey Gradient Styling
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
})
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

-- White Outline (Stroke)
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.25
UIStroke.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Name = "CommandInput"
TextBox.Size = UDim2.new(1, -135, 1, -8)
TextBox.Position = UDim2.new(0, 4, 0, 4)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.BorderSizePixel = 0
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "/command..."
TextBox.Text = ""
TextBox.TextSize = 14
TextBox.Font = Enum.Font.SourceSans
TextBox.ClearTextOnFocus = false
TextBox.Parent = MainFrame

local TextCorner = Instance.new("UICorner")
TextCorner.CornerRadius = UDim.new(0, 4)
TextCorner.Parent = TextBox

local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Name = "ExecuteButton"
ExecuteBtn.Size = UDim2.new(0, 60, 1, -8)
ExecuteBtn.Position = UDim2.new(1, -127, 0, 4)
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
ExecuteBtn.BorderSizePixel = 0
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.Text = "Execute"
ExecuteBtn.TextSize = 13
ExecuteBtn.Font = Enum.Font.SourceSansBold
ExecuteBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 4)
BtnCorner.Parent = ExecuteBtn

local ToggleListBtn = Instance.new("TextButton")
ToggleListBtn.Name = "ToggleListButton"
ToggleListBtn.Size = UDim2.new(0, 55, 1, -8)
ToggleListBtn.Position = UDim2.new(1, -61, 0, 4)
ToggleListBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleListBtn.BorderSizePixel = 0
ToggleListBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleListBtn.Text = "Cmds"
ToggleListBtn.TextSize = 13
ToggleListBtn.Font = Enum.Font.SourceSansBold
ToggleListBtn.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 4)
ToggleCorner.Parent = ToggleListBtn

---------------------------------------------------------
-- COMMAND LIST GUI PANEL (SCROLLING FRAME)
---------------------------------------------------------
local ListFrame = Instance.new("ScrollingFrame")
ListFrame.Name = "CommandListFrame"
ListFrame.Size = UDim2.new(0, 310, 0, 240)
ListFrame.Position = UDim2.new(1, -320, 0, 44)
ListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ListFrame.BorderSizePixel = 0
ListFrame.Visible = false
ListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ListFrame.ScrollBarThickness = 4
ListFrame.Parent = ScreenGui

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 6)
ListCorner.Parent = ListFrame

local ListGradient = Instance.new("UIGradient")
ListGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
})
ListGradient.Rotation = 90
ListGradient.Parent = ListFrame

local ListStroke = Instance.new("UIStroke")
ListStroke.Color = Color3.fromRGB(255, 255, 255)
ListStroke.Thickness = 1.25
ListStroke.Parent = ListFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Parent = ListFrame

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.PaddingBottom = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.Parent = ListFrame

---------------------------------------------------------
-- STATE & UTILITY VARIABLES
---------------------------------------------------------
local isNoclipping = false
local noclipConnection = nil

local isSpinning = false

local isFlying = false
local flySpeed = 50
local flyConnection = nil

local visionActive = false

-- Command System
local commands = {}

local function registerCommand(name, callback)
    commands[name:lower()] = callback
end

-- Player Search Helper
local function getPlayerByFuzzyName(name)
    name = name:lower()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower():sub(1, #name) == name or player.DisplayName:lower():sub(1, #name) == name then
            return player
        end
    end
    return nil
end

---------------------------------------------------------
-- COMMAND DEFINITIONS
---------------------------------------------------------

registerCommand("speed", function(args)
    local targetSpeed = tonumber(args[1]) or 100
    targetSpeed = math.clamp(targetSpeed, 0, 1000)
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then humanoid.WalkSpeed = targetSpeed end
    end
end)

registerCommand("noclip", function()
    if isNoclipping then return end
    isNoclipping = true
    noclipConnection = RunService.Stepped:Connect(function()
        if not isNoclipping then
            if noclipConnection then noclipConnection:Disconnect() end
            return
        end
        local character = LocalPlayer.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

registerCommand("unnoclip", function()
    isNoclipping = false
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end)

registerCommand("teleport", function(args)
    if #args == 0 then return end
    local targetPlayer = getPlayerByFuzzyName(args[1])
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myChar = LocalPlayer.Character
        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
            myChar.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        end
    end
end)

registerCommand("tp", function(args)
    commands["teleport"](args)
end)

registerCommand("respawn", function()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then humanoid.Health = 0 end
    end
end)

registerCommand("rs", function()
    commands["respawn"]()
end)

-- Rigid Complete Freeze
registerCommand("freeze", function()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
        end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = true
            end
        end
    end
end)

registerCommand("unfreeze", function()
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
            end
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end)

registerCommand("spin", function()
    if isSpinning then return end
    isSpinning = true
    local character = LocalPlayer.Character
    if not character then return end
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local angularVel = Instance.new("BodyAngularVelocity")
    angularVel.Name = "SpinVelocity"
    angularVel.MaxTorque = Vector3.new(0, math.huge, 0)
    angularVel.AngularVelocity = Vector3.new(0, 100, 0)
    angularVel.Parent = root
end)

registerCommand("unspin", function()
    isSpinning = false
    local character = LocalPlayer.Character
    if character then
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            local vel = root:FindFirstChild("SpinVelocity")
            if vel then vel:Destroy() end
        end
    end
end)

-- Heal Command
registerCommand("heal", function()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
    end
end)

-- TP Tool Command
registerCommand("tptool", function()
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then return end
    
    if backpack:FindFirstChild("Teleport Tool") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Teleport Tool")) then
        return
    end
    
    local tool = Instance.new("Tool")
    tool.Name = "Teleport Tool"
    tool.RequiresHandle = false
    
    local mouse = LocalPlayer:GetMouse()
    
    tool.Activated:Connect(function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        
        local targetCFrame = mouse.Hit
        if targetCFrame then
            char.HumanoidRootPart.CFrame = targetCFrame + Vector3.new(0, 3, 0)
        end
    end)
    
    tool.Parent = backpack
end)

registerCommand("teleporttool", function()
    commands["tptool"]()
end)

-- Clone Commands
registerCommand("clone", function()
    local character = LocalPlayer.Character
    if not character then return end
    
    character.Archivable = true
    local clone = character:Clone()
    
    for _, obj in ipairs(clone:GetDescendants()) do
        if obj:IsA("Script") or obj:IsA("LocalScript") then
            obj:Destroy()
        end
    end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if root and clone:FindFirstChild("HumanoidRootPart") then
        clone.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, 0, -3)
    end
    
    clone.Parent = Workspace
end)

registerCommand("unclone", function()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj.Name == LocalPlayer.Character.Name and obj ~= LocalPlayer.Character then
            obj:Destroy()
        end
    end
end)

registerCommand("title", function(args)
    if #args == 0 then return end

    local targetPlayer = LocalPlayer
    local titleText = ""

    local foundPlayer = getPlayerByFuzzyName(args[1])
    if foundPlayer and #args > 1 then
        targetPlayer = foundPlayer
        table.remove(args, 1)
        titleText = table.concat(args, " ")
    else
        titleText = table.concat(args, " ")
    end

    local character = targetPlayer.Character
    if not character then return end
    local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
    if not head then return end

    if head:FindFirstChild("CustomAdminTitle") then
        head.CustomAdminTitle:Destroy()
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "CustomAdminTitle"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextSize = 18
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Text = titleText
    textLabel.Parent = billboard
end)

registerCommand("untitle", function(args)
    local targetPlayer = LocalPlayer
    if #args > 0 then
        local foundPlayer = getPlayerByFuzzyName(args[1])
        if foundPlayer then
            targetPlayer = foundPlayer
        end
    end

    local character = targetPlayer.Character
    if character then
        local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
        if head and head:FindFirstChild("CustomAdminTitle") then
            head.CustomAdminTitle:Destroy()
        end
    end
end)

local function applyVisionToCharacter(char)
    if char == LocalPlayer.Character then return end
    if not char:FindFirstChild("VisionHighlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "VisionHighlight"
        highlight.Adornee = char
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.OutlineTransparency = 0
        highlight.Parent = char
    end
end

registerCommand("vision", function(args)
    visionActive = true
    local targetArg = args[1] and args[1]:lower() or "all"
    if targetArg == "all" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                applyVisionToCharacter(player.Character)
            end
        end
    else
        local targetPlayer = getPlayerByFuzzyName(targetArg)
        if targetPlayer and targetPlayer.Character then
            applyVisionToCharacter(targetPlayer.Character)
        end
    end
end)

registerCommand("unvision", function()
    visionActive = false
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("VisionHighlight") then
            player.Character.VisionHighlight:Destroy()
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        if visionActive and player ~= LocalPlayer then
            task.wait(1)
            applyVisionToCharacter(char)
        end
    end)
end)

registerCommand("fly", function()
    if isFlying then return end
    isFlying = true
    local character = LocalPlayer.Character
    if not character then return end
    local root = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    local camera = Workspace.CurrentCamera
    flyConnection = RunService.RenderStepped:Connect(function(dt)
        if not isFlying or not root or not root.Parent then
            if flyConnection then flyConnection:Disconnect() end
            return
        end
        local moveVector = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVector = moveVector + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveVector = moveVector - Vector3.new(0, 1, 0) end

        if moveVector.Magnitude > 0 then
            root.CFrame = CFrame.new(root.Position, root.Position + camera.CFrame.LookVector) + (moveVector.Unit * flySpeed * dt)
        else
            root.CFrame = CFrame.new(root.Position, root.Position + camera.CFrame.LookVector)
        end
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end)
end)

registerCommand("unfly", function()
    isFlying = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end
end)

---------------------------------------------------------
-- EXECUTION ENGINE & UI POPULATOR
---------------------------------------------------------
local function executeCommand(text)
    text = text:gsub("^%s*", ""):gsub("%s*$", "")
    if text:sub(1, 1) == "/" then
        text = text:sub(2)
    end
    if text == "" then return end

    local args = {}
    for arg i
