local addIcon = true -- false to not add an icon

local tool = Instance.new("Tool")
tool.Name = "SelectPlayer"
tool.RequiresHandle = false

if addIcon then
    tool.TextureId = "rbxassetid://7992557358"
end

tool.Activated:Connect(function()
    local p = game.Players.LocalPlayer
    local m = p:GetMouse()
    local tgt = m.Target
    
    if tgt then
        local ch = tgt.Parent
        while ch and not (ch:IsA("Model") and ch:FindFirstChild("Humanoid")) do
            ch = ch.Parent
        end
        
        if ch and ch:IsA("Model") and ch:FindFirstChild("Humanoid") then
            local tp = game.Players:GetPlayerFromCharacter(ch)
            if tp then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Player Selected";
                    Text = "Player: " .. tp.Name;
                    Duration = 0.5;
                })
            end
        end
    end
end)

tool.Parent = game.Players.LocalPlayer.Backpack
--end :)
