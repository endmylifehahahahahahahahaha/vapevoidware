
repeat
    task.wait()
until game:IsLoaded()
repeat
    task.wait()
until shared.VapeFullyLoaded

local _Players = game:GetService('Players')

game:GetService('TextService')
game:GetService('Lighting')
game:GetService('TextChatService')
game:GetService('UserInputService')
game:GetService('RunService')
game:GetService('TweenService')
game:GetService('CollectionService')
game:GetService('ReplicatedStorage')

local _ = workspace.CurrentCamera
local _LocalPlayer = _Players.LocalPlayer
local u3

if shared.GuiLibrary then
    u3 = shared.GuiLibrary
else
    u3 = nil

    repeat
        task.wait()
    until shared.GuiLibrary
end
if shared.vapeConnections and type(shared.vapeConnections) == 'table' then
    local _ = shared.vapeConnections
else
    shared.vapeConnections = {}
end
if shared.GlobalStore then
    local _ = shared.GlobalStore
end

local u4 = not shared.RunLoops and {} or shared.RunLoops
local _vapeentity = shared.vapeentity
local _ = shared.vapewhitelist

runcode(function()
    ({}).Enabled = false

    local u6 = 0
    local v10 = {
        Name = 'TPFly',
        Function = function(p7)
            if p7 then
                u4:BindToStepped('TPFly', function()
                    u6 = u6 + 1

                    local _X = _vapeentity.character.HumanoidRootPart.Velocity.X
                    local _Z = _vapeentity.character.HumanoidRootPart.Velocity.Z

                    _vapeentity.character.HumanoidRootPart.Velocity = Vector3.new(_X, 2 + math.sin(u6 / 8) * 17, _Z)

                    if u6 % 13 == 0 then
                        _vapeentity.character.HumanoidRootPart.CFrame = _vapeentity.character.HumanoidRootPart.CFrame + _vapeentity.character.Humanoid.MoveDirection * 1.6
                    end
                end)
            else
                u4:UnbindFromStepped('TPFly')
            end
        end,
        HoverText = 'Simplest fly',
    }

    u3.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton(v10)
end)
runcode(function()
    local u11 = {Enabled = false}
    local v16 = {
        Name = 'HypixelFly',
        HoverText = 'A Fly',
        Function = function(p12)
            if p12 then
                if not _vapeentity.isAlive or game.Players.LocalPlayer.character.HumanoidRootPart.Position.y ~= game.Players.LocalPlayer.character.HumanoidRootPart.Position.y then
                end

                game.workspace.Gravity = 0

                local _TweenService = game:GetService('TweenService')

                for _ = 1, 3 do
                    task.wait()

                    local _CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
                    local v15 = _TweenService:Create(game.Players.LocalPlayer.Character.PrimaryPart, TweenInfo.new(0.5), {
                        CFrame = _CFrame + _CFrame.lookVector * 10,
                    })

                    v15:play()
                    v15.Completed:Wait()
                end

                while true do
                    task.wait()

                    if workspace:Raycast(_vapeentity.character.HumanoidRootPart.Position, Vector3.new(0, -32, 0), blockraycast) and u11.Enabled then
                        u11.ToggleButton(false)
                    end
                    if not u11.Enabled then
                    end
                end
            else
                game.workspace.Gravity = 192.6

                return
            end
        end,
    }

    u11 = u3.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton(v16)
end)
runcode(function()
    ({}).Enabled = false

    local v18 = {
        Name = 'FastTPHighJump',
        HoverText = "tp's u up alot v2 (2x faster)",
        Function = function(p17)
            betterjump = p17

            if betterjump then
                Workspace.Gravity = 0
                _LocalPlayer.Character.HumanoidRootPart.CFrame = _LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3, 0)

                spawn(function()
                    while betterjump do
                        Workspace.Gravity = 0
                        _LocalPlayer.Character.HumanoidRootPart.CFrame = _LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)

                        task.wait(0.04)

                        _LocalPlayer.Character.HumanoidRootPart.CFrame = _LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)

                        if not betterjump then
                            return
                        end
                    end
                end)
            else
                Workspace.Gravity = 196.2
            end
        end,
    }

    u3.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton(v18)
end)
runcode(function()
    local u19 = {Enabled = false}
    local v21 = {
        Name = 'DoubleTPHighJump',
        HoverText = 'HighJump but velocity',
        Function = function(p20)
            if p20 then
                workspace.Gravity = 196.2

                if _vapeentity.isAlive then
                    _vapeentity.character.HumanoidRootPart.Velocity = _vapeentity.character.HumanoidRootPart.Velocity + Vector3.new(0, 450, 0)
                end

                u19.ToggleButton(false)
            end
        end,
    }

    u19 = u3.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton(v21)
end)
runcode(function()
    ({}).Enabled = false

    u3.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
        Name = 'ChatMover',
        HoverText = 'moves chat to the bottom',
        Function = function(p22)
            if p22 then
                game:GetService('StarterGui'):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0.73, 0))
            else
                game:GetService('StarterGui'):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0, 0))
            end
        end,
    })
end)
runcode(function()
    ({}).Enabled = false

    u3.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
        Name = 'PurpleAmbience',
        Function = function(p23)
            if p23 then
                game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(170, 170, 255)
                game.Lighting.Ambient = Color3.fromRGB(170, 170, 255)
                game.Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 255)
            else
                game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
                game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            end
        end,
    })
end)

local u24 = {Enabled = false}
local v27 = {
    Name = 'RainbowHPBar',
    Function = function(p25)
        if p25 then
            task.spawn(function()
                function TapeRB(p26)
                    return math.acos(math.cos(p26 * math.pi)) / math.pi
                end

                counter = 0

                while wait(0.1) and u24.Enabled do
                    game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromHSV(TapeRB(counter), 1, 1)
                    counter = counter + 0.01
                end
            end)
        else
            game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromRGB(203, 54, 36)
        end
    end,
    HoverText = 'Makes your health bar rainbow',
}

u24 = u3.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton(v27)

runcode(function()
    local u28 = {Enabled = false}
    local u29 = nil
    local u30 = nil
    local v36 = {
        Name = 'FunnyFly',
        Function = function(p31)
            if p31 then
                local u32 = nil

                tick()
                task.spawn(function()
                    local v33 = 0
                    local _ = _vapeentity.character.HumanoidRootPart.Position

                    u29 = Instance.new('TextLabel')
                    u29.Text = 'Unsafe'
                    u29.Font = Enum.Font.Gotham
                    u29.TextStrokeTransparency = 0
                    u29.TextColor3 = Color3.new(0.9, 0.9, 0.9)
                    u29.TextSize = 20
                    u29.Size = UDim2.new(0, 0, 0, 20)
                    u29.BackgroundTransparency = 1
                    u29.Position = UDim2.new(0.5, 0, 0.5, 40)
                    u29.Parent = u3.MainGui

                    while true do
                        v33 = v33 + 1

                        if not _vapeentity.isAlive then
                            break
                        end

                        local _HumanoidRootPart = _vapeentity.character.HumanoidRootPart

                        if u32 == nil then
                            u32 = _HumanoidRootPart.Position.Y
                        end
                        if u30 then
                            u30.Parent = _HumanoidRootPart
                        else
                            u30 = Instance.new('BodyVelocity')
                            u30.MaxForce = Vector3.new(0, 1000000, 0)
                            u30.Parent = _HumanoidRootPart
                            u30.Velocity = Vector3.zero
                        end

                        for v35 = 2, 30, 2 do
                            task.wait(0.01)

                            if not u28.Enabled then
                                break
                            end

                            u29.Text = workspace:Raycast(_HumanoidRootPart.Position + _vapeentity.character.Humanoid.MoveDirection * 50, Vector3.new(0, -2000, 0), blockraycast) and 'Safe' or 'Unsafe'
                            u30.Velocity = Vector3.new(0, 25 + v35, 0)
                        end

                        if not (networkownerfunc(_HumanoidRootPart) and u28.Enabled) then
                            break
                        end
                    end

                    if u28.Enabled then
                        u28.ToggleButton(false)
                    end
                end)
            else
                if u30 then
                    u30:Destroy()

                    u30 = nil
                end
                if u29 then
                    u29:Destroy()
                end
            end
        end,
    }

    u28 = u3.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton(v36)
end)