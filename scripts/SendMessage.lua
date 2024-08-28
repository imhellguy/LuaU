if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Your message")
else
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Your message", "All")
end
-- Send a message to new roblox chat, and legacy roblox chat.
