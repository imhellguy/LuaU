--Inspirated in Skid Flinger.lua from anthony.

local trg = {"PlayerName"} -- target

local plr = game:GetService("Players")
local me = plr.LocalPlayer

local findPlr = function(nm)
    nm = nm:lower()
    for _,p in next, plr:GetPlayers() do
        if p ~= me then
            if p.Name:lower():match("^"..nm) then
                return p
            elseif p.DisplayName:lower():match("^"..nm) then
                return p
            end
        end
    end
end

local notify = function(tit, txt, dur)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = tit, Text = txt, Duration = dur})
end

local fling = function(tgt)
    local char = me.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = hum and hum.RootPart

    local charTgt = tgt.Character
    local humTgt = charTgt and charTgt:FindFirstChildOfClass("Humanoid")
    local rootTgt = humTgt and humTgt.RootPart
    local headTgt = charTgt and charTgt:FindFirstChild("Head")

    if char and hum and root then
        if root.Velocity.Magnitude < 50 then
            getgenv().OldPos = root.CFrame
        end

        if humTgt and humTgt.Sit then
            return notify("Error", "The target is sitting", 5)
        end

        local movePos = function(part, pos, ang)
            root.CFrame = CFrame.new(part.Position) * pos * ang
            char:SetPrimaryPartCFrame(CFrame.new(part.Position) * pos * ang)
            root.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end

        local move = function(part)
            local tLimit = 2
            local startT = tick()
            local ang = 0

            repeat
                if root and humTgt then
                    if part.Velocity.Magnitude < 50 then
                        ang = ang + 100

                        movePos(part, CFrame.new(0, 1.5, 0) + humTgt.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(ang), 0, 0))
                        task.wait()

                        movePos(part, CFrame.new(0, -1.5, 0) + humTgt.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(ang), 0, 0))
                        task.wait()
                    else
                        movePos(part, CFrame.new(0, 1.5, humTgt.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until part.Velocity.Magnitude > 500 or part.Parent ~= tgt.Character or tgt.Parent ~= plr or not tgt.Character == charTgt or humTgt.Sit or hum.Health <= 0 or tick() > startT + tLimit
        end

        workspace.FallenPartsDestroyHeight = 0/0

        local bv = Instance.new("BodyVelocity")
        bv.Name = "EpixVel"
        bv.Parent = root
        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
        bv.MaxForce = Vector3.new(1/0, 1/0, 1/0)

        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if rootTgt and headTgt then
            move(headTgt)
        elseif rootTgt then
            move(rootTgt)
        elseif headTgt then
            move(headTgt)
        else
            return notify("Error", "Target is missing required parts", 4)
        end

        bv:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = hum

        repeat
            root.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            char:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            hum:ChangeState("GettingUp")
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Velocity, part.RotVelocity = Vector3.new(), Vector3.new()
                end
            end
            task.wait()
        until (root.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return notify("Error", "WTF Error", 3)
    end
end

if trg[1] then for _,p in next, trg do findPlr(p) end else return end

for _,p in next, trg do
    local curTgt = findPlr(p)
    if curTgt and curTgt ~= me then
        fling(curTgt)
    elseif not curTgt then
        notify("Error", "I didnt find the target :(", 4)
    end
end
