--Good for bringing, killing, etc...
local grip = CFrame.new(0, 0, -6.04999995, 0, 0, 1, 1, 0, 0, 0, 1, 0)
local toolname = "Foil"

local plr = game:GetService("Players").LocalPlayer
local tool = plr.Backpack:FindFirstChild(toolname) or plr.Character:FindFirstChild(toolname)

if tool and tool:IsA("Tool") then
    tool.Grip = grip
else
    return print("Ass: Dont found tool")
end
