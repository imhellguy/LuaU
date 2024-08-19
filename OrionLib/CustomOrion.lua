-- Customizations for the ORION library
-- Made by: me obviously

OrionSource = game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Orion.lua")
--Colors
mainColor = "Color3.fromRGB(6, 6, 6)"
secondColor = "Color3.fromRGB(6, 6, 6)"
strokeColor = "Color3.fromRGB(255, 0, 255)" 
dividerColor = "Color3.fromRGB(70, 70, 70)" 
textColor = "Color3.fromRGB(230, 230, 230)"
textDarkColor = "Color3.fromRGB(200, 200, 12)"

OrionSource = OrionSource:gsub('Main%s-=%s-Color3.fromRGB%s*%b()', 'Main = ' .. mainColor):gsub('Second%s-=%s-Color3.fromRGB%s*%b()', 'Second = ' .. secondColor):gsub('Stroke%s-=%s-Color3.fromRGB%s*%b()', 'Stroke = ' .. strokeColor):gsub('Divider%s-=%s-Color3.fromRGB%s*%b()', 'Divider = ' .. dividerColor):gsub('Text%s-=%s-Color3.fromRGB%s*%b()', 'Text = ' .. textColor):gsub('TextDark%s-=%s-Color3.fromRGB%s*%b()', 'TextDark = ' .. textDarkColor)

local OrionLib = loadstring(OrionSource)() -- Load the new Orion Source with custom color!

local Window = OrionLib:MakeWindow({
    Name = "Orion Library - imhellguy", 
    HidePremium = false, 
    SaveConfig = false, 
    ConfigFolder = "OrionHellguy", -- Config Folder
    IntroText = "imhellguy",-- Intro Text
    IntroIcon = "rbxassetid://12099513379", --Intro Icon
})

local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Section"
})

OrionLib:MakeNotification({
	Name = "Title!",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})


Tab:AddButton({
	Name = "Button!",
	Callback = function()
      		print("button pressed")
  	end    
})

Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

