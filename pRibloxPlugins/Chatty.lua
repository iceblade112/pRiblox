--Define variables
local Gui = game:GetService("CoreGui")
local loaded = false
local on = false

--Plugin setup
local plugin = PluginManager():CreatePlugin()
plugin.Deactivation:connect(function()
	Off()
end)
local toolbar = plugin:CreateToolbar("Chatty")
local toolbarbutton = toolbar:CreateButton("", "Chat", "Chat.png")
toolbarbutton.Click:connect(function()
	if on then
		Off()
	elseif loaded then
		On()
	end
end)
--code
local chatFrame = Instance.new("ScreenGui", Gui)
chatFrame.Name = "chattyFrame"
local box = Instance.new("Frame", chatFrame)
box.Name = "Screen"
box.Size = UDim2.new(1, 0, 1, 0)
box.BackgroundTransparency = 1
box.Visible = false
local frame = Instance.new("TextBox", box)
frame.Name = "Input"
frame.Position = UDim2.new(0.25, 0, 0.1, 0)
frame.Size = UDim2.new(0.45, 0, 0.02, 0)
local acc = Instance.new("TextButton", box)
acc.Name = "Accept"
acc.Text = "Okay"
acc.Position = UDim2.new(0.7, 0, 0.1, 0)
acc.Size = UDim2.new(0.05, 0, 0.02, 0)
acc.MouseButton1Down:connect(function() game.Players:Chat(frame.Text) end)
	
-- Run when the popup is activated.
function On()
	plugin:Activate(true)
	toolbarbutton:SetActive(true)
	box.Visible = true
	on = true
end

-- Run when the popup is deactivated.
function Off()
	toolbarbutton:SetActive(false)
	box.Visible = false
	on = false
		
end

--Loaded thingy
loaded = true