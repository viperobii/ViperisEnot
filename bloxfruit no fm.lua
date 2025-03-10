--[[BloxFruit Fully Fixed and Optimized Script]]--

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", playerGui)

-- UI Elements
local backgroundFrame = Instance.new("Frame", screenGui)
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.new(0, 0, 0)
backgroundFrame.BackgroundTransparency = 0.99

local textLabel = Instance.new("TextLabel", screenGui)
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0.5, -100, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Text = "Viper Hub is Loaded"
textLabel.TextScaled = true
textLabel.TextWrapped = true
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextStrokeTransparency = 0
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextSize = 20
textLabel.TextTransparency = 0

wait(1)
textLabel:TweenPosition(UDim2.new(0.5, -100, 0.5, -25), "Out", "Quint", 1, true)

-- Detect Game Worlds
local placeId = game.PlaceId
local OldWorld, NewWorld, ThreeWorld, BloxFruit = false, false, false, false

if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
    ThreeWorld = true
end

if OldWorld or NewWorld or ThreeWorld then
    BloxFruit = true
end

-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Viper Hub",
    SubTitle = "by Viper_",
    TabWidth = 130,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Create Floating UI Toggle Button
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FloatingUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local floatingButton = Instance.new("ImageButton")
floatingButton.Name = "ToggleButton"
floatingButton.Image = "rbxassetid://7229442422" -- Crying Cat Image
floatingButton.Size = UDim2.new(0, 40, 0, 40)
floatingButton.Position = UDim2.new(0, 20, 0, 100)
floatingButton.BackgroundTransparency = 1
floatingButton.Active = true
floatingButton.Draggable = true
floatingButton.Parent = screenGui

-- Ensure UI is initially visible
Window.Root.Visible = true

-- Toggle UI visibility with floating button
local uiVisible = true
local function toggleUI()
    uiVisible = not uiVisible
    Window.Root.Visible = uiVisible
end

floatingButton.MouseButton1Click:Connect(toggleUI)

local Tabs = {
    Main = Window:AddTab({ Title = "General", Icon = "home" }),
    Stats = Window:AddTab({ Title = "Stats", Icon = "rbxassetid://11422155046" }),
    Automatic = Window:AddTab({ Title = "Automatic", Icon = "swords" }),
    Interface = Window:AddTab({ Title = "Interface", Icon = "rbxassetid://12975600393" }),
    V4 = Window:AddTab({ Title = "EspV4", Icon = "rbxassetid://11422924864" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "rbxassetid://12967404433" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Tabs.Main:AddParagraph({
    Title = "Information",
    Content = "Use This Script The Smoothest Auto Farm"
})

-- AutoFarm Toggle
local Toggle = Tabs.Main:AddToggle("AutoFarm", { Title = "AutoFarm (Fixing)", Default = false })
Toggle:OnChanged(function(Value)
_G.AutoFarm = Value
end)



Fluent:Notify({ Title = "Setup Complete", Content = "Script successfully loaded", Duration = 5 })

-- Automatic
local section = Tabs.Automatic:AddSection("EXP x2 Code")
Tabs.Automatic:AddButton({
    Title = "RedeemAllCode",
    Callback = function()
        local codes = {
            "CODESLIDE", "NOOB2ADMIN", "fruitconcepts", "ADMINDARES", "ADMINHACKED",
            "TRIPLEABUSE", "SEATROLLING", "24NOADMIN", "REWARDFUN", "NEWTROLL", 
            "SECRET_ADMIN", "KITT_RESET", "CHANDLER", "Sub2CaptainMaui", "kittgaming", 
            "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy", 
            "fudd10_v2", "SUB2GAMERROBOT_EXP1", "SUB2GAMERROBOT_RESET1", "Sub2UncleKizaru", 
            "Axiore", "Sub2Daigrock", "Bignews", "Sub2NoobMaster123", "StrawHatMaine", 
            "TantaiGaming", "Fudd10", "TheGreatAce", "Sub2OfficialNoobie", "krazydares"
        }
        local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem")
        for _, code in ipairs(codes) do
            remote:InvokeServer(code)
        end
    end
})

-- Auto Buy SuperHuman Fighting Style
local SuperHumanToggle = Tabs.Automatic:AddToggle("AutoSuperHuman", { Title = "Auto Buy SuperHuman", Default = false })
SuperHumanToggle:OnChanged(function(Value)
    _G.AutoSuperHuman = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
end)

-- AutoBuy Electro
local ElectroToggle = Tabs.Automatic:AddToggle("AutoElectro", { Title = "Auto Buy Electro", Default = false })
ElectroToggle:OnChanged(function(Value)
    _G.AutoElectro = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
end)

-- Auto Buy Water Kung Fu
local WaterKungFuToggle = Tabs.Automatic:AddToggle("AutoWaterKungFu", { Title = "Auto Buy Water Kung Fu", Default = false })
WaterKungFuToggle:OnChanged(function(Value)
    _G.AutoWaterKungFu = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
end)

-- Auto Buy Sharkman Karate
local SharkmanKarateToggle = Tabs.Automatic:AddToggle("AutoSharkmanKarate", { Title = "Auto Buy Sharkman Karate", Default = false })
SharkmanKarateToggle:OnChanged(function(Value)
    _G.AutoSharkmanKarate = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
end)

-- Auto Buy Dragon Talon (Requires Dragon Breath First)
local DragonTalonToggle = Tabs.Automatic:AddToggle("AutoDragonTalon", { Title = "Auto Buy Dragon Talon", Default = false })
DragonTalonToggle:OnChanged(function(Value)
    _G.AutoDragonTalon = Value
    if Value then
        local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
        remote:InvokeServer("BuyDragonTalon") -- Corrected to directly buy Dragon Talon
    end
end)

-- Auto Buy Electric Claw
local ElectricClawToggle = Tabs.Automatic:AddToggle("AutoElectricClaw", { Title = "Auto Buy Electric Claw", Default = false })
ElectricClawToggle:OnChanged(function(Value)
    _G.AutoElectricClaw = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
end)

-- Auto Buy God Human
local GodHumanToggle = Tabs.Automatic:AddToggle("AutoGodHuman", { Title = "Auto Buy God Human", Default = false })
GodHumanToggle:OnChanged(function(Value)
    _G.AutoGodHuman = Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodHuman")
    end
end)


-- Open Various Interfaces
Tabs.Interface:AddButton({
    Title = "Open Fruit Store (Fixing)",
    Description = "Opens the Fruit Store UI",
    Callback = function()
        Fluent:Notify({ Title = "Notification", Content = "Opening Fruit Store...", Duration = 1 })
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        playerGui.Main.FruitShop.Visible = true
    end
})

Tabs.Interface:AddButton({
    Title = "Open Awaken Fruit",
    Description = "Opens the Awaken Fruit UI",
    Callback = function()
        Fluent:Notify({ Title = "Notification", Content = "Opening Awaken Fruit UI...", Duration = 1 })
        playerGui.Main.AwakeningToggler.Visible = true
    end
})

Tabs.Interface:AddButton({
    Title = "Open Color Haki",
    Description = "Opens the Color Haki UI",
    Callback = function()
        Fluent:Notify({ Title = "Notification", Content = "Opening Color Haki UI...", Duration = 1 })
        playerGui.Main.Colors.Visible = true
    end
})

Tabs.Interface:AddButton({
    Title = "Open Title Name",
    Description = "Opens the Title UI",
    Callback = function()
        Fluent:Notify({ Title = "Notification", Content = "Opening Title UI...", Duration = 1 })
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
        playerGui.Main.Titles.Visible = true
    end
})

Fluent:Notify({
    Title = "Setup Complete",
    Content = "Script successfully loaded!",
    Duration = 5
})








-- TP
local OldWorld = game.PlaceId == 2753915549  -- First Sea
local NewWorld = game.PlaceId == 4442272183 -- Second Sea
local ThirdSea = game.PlaceId == 7449423635 -- Third Sea

local islands = {}

if OldWorld then
    islands = {"Pirate Starter", "Marine Starter", "Jungle", "Pirate Village", "Desert", "Frozen Village", "MarineFord", "Sky 1st Floor", "Prison", "Sky 2nd Floor", "Sky 3rd Floor"}

    function getCFrameForIsland(islandName)
        local positions = {
            ["Pirate Starter"] = CFrame.new(1071.2832, 16.3085976, 1426.86792),
            ["Marine Starter"] = CFrame.new(-2573.3374, 6.88881969, 2046.99817),
            ["Jungle"] = CFrame.new(-1249.77222, 11.8870859, 341.356476),
            ["Pirate Village"] = CFrame.new(-1122.34998, 4.78708982, 3855.91992),
            ["Desert"] = CFrame.new(1094.14587, 6.47350502, 4192.88721),
            ["Frozen Village"] = CFrame.new(1198.00928, 27.0074959, -1211.73376),
            ["MarineFord"] = CFrame.new(-4505.375, 20.687294, 4260.55908),
            ["Sky 1st Floor"] = CFrame.new(-4970.21875, 717.707275, -2622.35449),
            ["Prison"] = CFrame.new(4854.16455, 5.68742752, 740.194641),
            ["Sky 2nd Floor"] = CFrame.new(-4813.0249, 903.708557, -1912.69055),
            ["Sky 3rd Floor"] = CFrame.new(-7952.31006, 5545.52832, -320.704956)
        }
        return positions[islandName]
    end

elseif NewWorld then
    islands = {"Mansion", "Green Zone", "Graveyard", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island", "Haunted Castle"}

    function getCFrameForIsland(islandName)
        local positions = {
            ["Mansion"] = CFrame.new(-12550, 335, -7500),
            ["Green Zone"] = CFrame.new(-2372, 72, -3160),
            ["Graveyard"] = CFrame.new(-5450, 8, -720),
            ["Dark Arena"] = CFrame.new(5223, 8, -25),
            ["Snow Mountain"] = CFrame.new(540, 427, -5297),
            ["Hot and Cold"] = CFrame.new(-5471, 15, -5047),
            ["Cursed Ship"] = CFrame.new(900, 124, 33030),
            ["Ice Castle"] = CFrame.new(5405, 28, -6238),
            ["Forgotten Island"] = CFrame.new(-3057, 238, -10191),
            ["Haunted Castle"] = CFrame.new(-9500, 142, 5535)
        }
        return positions[islandName]
    end

elseif ThirdSea then
    islands = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Castle on the Sea", "Haunted Castle", "Sea of Treats"}

    function getCFrameForIsland(islandName)
        local positions = {
            ["Port Town"] = CFrame.new(-29740, 57, 2585),
            ["Hydra Island"] = CFrame.new(5227, 604, 345),
            ["Great Tree"] = CFrame.new(3020.11, 2330.64, -7321.3),
            ["Floating Turtle"] = CFrame.new(-11398, 400, -8221),
            ["Castle on the Sea"] = CFrame.new(-5021, 315, -3162),
            ["Haunted Castle"] = CFrame.new(-9515, 142, 5535),
            ["Sea of Treats"] = CFrame.new(-2066, 198, -12127)
        }
        return positions[islandName]
    end
end

function Tween(targetCFrame)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new((player.Character.HumanoidRootPart.Position - targetCFrame.Position).Magnitude / 350, Enum.EasingStyle.Linear)
        local tween = tweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
    end
end

function is(land)
    local targetCFrame = getCFrameForIsland(land)
    if targetCFrame then
        Tween(targetCFrame)
    else
        print("Unknown island: " .. land)
    end
end

local section = Tabs.Teleport:AddSection("Island Teleport")
local Dropdown = Tabs.Teleport:AddDropdown("Dropdown", {
    Title = "Select Island",
    Values = islands, -- Now correctly assigned based on world
    Multi = false,
    Default = 1,
})

local Toggle = Tabs.Teleport:AddToggle("TeleportToggle", {Title = "Enable Teleport", Default = false})

Toggle:OnChanged(function(Value)
    if Value then
        is(Dropdown.Value)  -- Teleport when toggle is enabled
    end
end)






local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- Remove Fog Button
Tabs.Settings:AddButton({
    Title = "Remove Fog",
    Description = "Remove All Fog",
    Callback = function()
        Fluent:Notify({
            Title = "Notification",
            Content = "Remove Fog!",
            Duration = 5 -- Set to nil to make the notification not disappear
        })

        Lighting.FogEnd = 100000
        for _, v in pairs(Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    end
})

-- FullBright Toggle
local isFullBrightEnabled = false
local defaultBrightness = Lighting.Brightness
local defaultClockTime = Lighting.ClockTime
local defaultGlobalShadows = Lighting.GlobalShadows
local defaultOutdoorAmbient = Lighting.OutdoorAmbient

local function applyFullBright()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end

local function resetLighting()
    Lighting.Brightness = defaultBrightness
    Lighting.ClockTime = defaultClockTime
    Lighting.GlobalShadows = defaultGlobalShadows
    Lighting.OutdoorAmbient = defaultOutdoorAmbient
end

local Toggle = Tabs.Settings:AddToggle("MyToggle", { Title = "FullBright", Default = false })

Toggle:OnChanged(function(Value)
    isFullBrightEnabled = Value

    if isFullBrightEnabled then
        applyFullBright()
        RunService:BindToRenderStep("FullBright", Enum.RenderPriority.Camera.Value, applyFullBright)
    else
        RunService:UnbindFromRenderStep("FullBright")
        resetLighting()
    end
end)




-- STATS
-------------------------------------------[[AutoStats]]--------------------------------------------
Tabs.Stats:AddParagraph({
     Title = "Information",
     Content = "This Upgrade Your Stats"
})
local section = Tabs.Stats:AddSection("Stats Upgrade")

-- Auto Add Melee Points
local MeleeToggle = Tabs.Stats:AddToggle("MeleeToggle", { Title = "Melee", Default = false })
MeleeToggle:OnChanged(function(Value)
    _G.Melee = Value
    while _G.Melee do
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", point)
    end
end)

-- Auto Add Defense Points
local DefenseToggle = Tabs.Stats:AddToggle("DefenseToggle", { Title = "Defense", Default = false })
DefenseToggle:OnChanged(function(Value)
    _G.Defense = Value
    while _G.Defense do
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", point)
    end
end)

-- Auto Add Sword Points
local SwordToggle = Tabs.Stats:AddToggle("SwordToggle", { Title = "Sword", Default = false })
SwordToggle:OnChanged(function(Value)
    _G.Sword = Value
    while _G.Sword do
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", point)
    end
end)

-- Auto Add Gun Points
local GunToggle = Tabs.Stats:AddToggle("GunToggle", { Title = "Gun", Default = false })
GunToggle:OnChanged(function(Value)
    _G.Gun = Value
    while _G.Gun do
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", point)
    end
end)

-- Auto Add BloxFruit Points
local BloxFruitToggle = Tabs.Stats:AddToggle("BloxFruitToggle", { Title = "BloxFruit", Default = false })
BloxFruitToggle:OnChanged(function(Value)
    _G.BloxFruit = Value
    while _G.BloxFruit do
        task.wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", point)
    end
end)

-- Point Stats Section
local section = Tabs.Stats:AddSection("PointStats Section")

-- Point Stats Slider
local Slider = Tabs.Stats:AddSlider("Slider", {
    Title = "PointStats",
    Default = 10,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        point = Value
    end
})
Slider:SetValue(10)

Tabs.Settings:AddButton({
     Title = "Hop to a low server",
     Description = "Hop ServerToFind The Low PLayers",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "Hop to a low server...",
                    Duration = 5               -- Set to nil to make the notification not disappear
               })
          end
          task.wait(.2)
          local Http = game:GetService("HttpService")
          local TPS = game:GetService("TeleportService")
          local Api = "https://games.roblox.com/v1/games/"
          local _place = game.PlaceId
          local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
          function ListServers(cursor)
               local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
               return Http:JSONDecode(Raw)
          end
          local Server, Next; repeat
               local Servers = ListServers(Next)
               Server = Servers.data[1]
               Next = Servers.nextPageCursor
          until Server
          TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
     end
})

-- Race
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local tweenService = game:GetService("TweenService")

-- Race Door Positions
local raceDoors = {
    ["Ghoul"] = CFrame.new(28673.27, 14890.43, 451.45),
    ["Shark"] = CFrame.new(28224.74, 14890.73, -211.14),
    ["Angel"] = CFrame.new(28967.98, 14919.37, 235.12),
    ["Cyborg"] = CFrame.new(28497.43, 14895.72, -422.1),
    ["Mink"] = CFrame.new(29016, 14891, -379),
    ["Human"] = CFrame.new(29234.06, 14890.73, -206.79)
}

-- Tween function for smooth teleport
function Tween(targetCFrame)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local distance = (character.HumanoidRootPart.Position - targetCFrame.Position).Magnitude
        local tweenInfo = TweenInfo.new(distance / 350, Enum.EasingStyle.Linear)
        local tween = tweenService:Create(character.HumanoidRootPart, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
    else
        warn("HumanoidRootPart not found!")
    end
end

-- Teleport function
function TeleportToRaceDoor(race)
    local targetCFrame = raceDoors[race]
    if targetCFrame then
        Tween(targetCFrame)
    else
        warn("Invalid race selected.")
    end
end

-- Fluent UI Implementation
local section = Tabs.V4:AddSection("Race Door Teleport")
local Dropdown = Tabs.V4:AddDropdown("RaceDropdown", {
    Title = "Select Race Door",
    Values = {"Ghoul", "Shark", "Angel", "Cyborg", "Mink", "Human"},
    Multi = false,
    Default = 1,
})

local Toggle = Tabs.V4:AddToggle("RaceTeleportToggle", {Title = "Enable Teleport", Default = false})

Toggle:OnChanged(function(Value)
    if Value then
        TeleportToRaceDoor(Dropdown.Value) -- Teleport to selected race door when enabled
    end
end)