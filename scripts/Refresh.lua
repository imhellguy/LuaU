--Work R6 & R15 
local plr = game.Players.LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")
local lastPos = hrp.Position

plr.Character:WaitForChild("Humanoid").Health = 0

local connection

connection = plr.CharacterAdded:Connect(function(char)
    local humanoidRootPart = char:WaitForChild("HumanoidRootPart")

    repeat task.wait() until humanoidRootPart.Parent ~= nil

    humanoidRootPart.CFrame = CFrame.new(lastPos)
    
    connection:Disconnect()
end)
