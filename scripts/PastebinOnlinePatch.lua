_G.Api = game:HttpGet("https://pastebin.com/raw/12345")
_G.Discord = "discord.gg/12345"
if _G.Api ~= "false" then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Expired!",
        Text = _G.Discord,
        Duration = 3,
        Button1 = "Copy Discord"
    })
    setclipboard(_G.Discord)
    return
end
