_G.Api = game:HttpGet("https://pastebin.com/raw/12414") -- Pastebin RAW Link
_G.Discord = "discord.gg/12345678" -- Your discord
if G_Api ~= "false" then -- if false, then continue, else script expired!
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Script Expired!",
        Text = _G.Discord,
        Duration = 5,
        Button1 = "Copy Discord"
    })
    return setclipboard(_G.Discord)
end
