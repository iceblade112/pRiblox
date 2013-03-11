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
local toolbarbutton = toolbar:CreateButton("", "Join Server", "joinServ.png")
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
frame.Name = "IP"
frame.Position = UDim2.new(0.25, 0, 0.1, 0)
frame.Size = UDim2.new(0.22, 5, 0.02, 0)
local port= Instance.new("TextBox", box)
port.Name = "PORT"
port.Position = UDim2.new(0.47, 0, 0.1, 0)
port.Size = UDim2.new(0.22, 5, 0.02, 0)
local acc = Instance.new("TextButton", box)
acc.Name = "Accept"
acc.Text = "Okay"
acc.Position = UDim2.new(0.7, 0, 0.1, 0)
acc.Size = UDim2.new(0.05, 0, 0.02, 0)
acc.MouseButton1Down:connect(function() game:GetService("NetworkServer"):PlayerConnect(0, frame.Text, tonumber(port.Text)) end)
	
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