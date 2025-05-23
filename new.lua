local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local PrefabsId = `rbxassetid://{ReGui.PrefabsId}`

--// Externally import the Prefabs asset
ReGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})
local Smoothnessvalue = Instance.new("IntValue")
Smoothnessvalue.Parent = game:GetService("Players").LocalPlayer
Smoothnessvalue.Name = "VerySmoothSigma"
local FovDesiredSized = Instance.new("IntValue")
FovDesiredSized.Parent = game:GetService("Players").LocalPlayer
FovDesiredSized.Name = "kfjskjfs"


local player = game.Players.LocalPlayer
local espObjects = {} -- Table to hold the ESP parts (labels, boxes, etc.)
local highlightObjects = {} -- Table to store Highlights for glow effect

-- Function to update ESP with glow effect and wall hack ability
local function updateESP(espEnabled)
	-- Remove all existing ESP elements when disabled
	if not espEnabled then
		for _, espPart in ipairs(espObjects) do
			espPart:Destroy()
		end
		espObjects = {} -- Clear the table

		for _, highlight in ipairs(highlightObjects) do
			highlight:Destroy()
		end
		highlightObjects = {} -- Clear the table

		return -- Exit early to prevent adding ESP elements when disabled
	end

	-- Loop through all players in the game and create/update ESP
	for _, v in ipairs(game.Players:GetPlayers()) do
		if v.Character and v.Character:FindFirstChild("Head") then
			-- Create the BillboardGui for the ESP name label
			local espPart = Instance.new("BillboardGui")
			espPart.Adornee = v.Character:FindFirstChild("Head")
			espPart.Parent = player.PlayerGui
			espPart.Size = UDim2.new(0, 100, 0, 50)
			espPart.StudsOffset = Vector3.new(0, 2, 0)
			espPart.AlwaysOnTop = true

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, 0, 1, 0)
			label.Text = v.Name
			label.TextColor3 = Color3.fromRGB(255, 255, 255)
			label.BackgroundTransparency = 1
			label.Font = Enum.Font.SourceSansBold
			label.TextSize = 18
			label.Parent = espPart

			-- Create a highlight for the entire rig (all parts of the character)
			for _, part in ipairs(v.Character:GetChildren()) do
				if part:IsA("BasePart") then
					local highlight = Instance.new("Highlight")
					highlight.Parent = part
					highlight.Adornee = part
					highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red glow effect
					highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- Green outline effect
					highlight.FillTransparency = 0.5
					highlight.OutlineTransparency = 0.5
					table.insert(highlightObjects, highlight)
				end
			end

			-- Store the ESP part in the table
			table.insert(espObjects, espPart)

			-- Add a SurfaceGui to simulate wall hack (part visibility through walls)
			local surfaceGui = Instance.new("SurfaceGui")
			surfaceGui.Parent = v.Character:FindFirstChild("Head")
			surfaceGui.Face = Enum.NormalId.Front
			surfaceGui.AlwaysOnTop = true

			local frame = Instance.new("Frame")
			frame.Size = UDim2.new(1, 0, 1, 0)
			frame.BackgroundTransparency = 0.5
			frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame.Parent = surfaceGui
		end
	end
end









local aimpartvalue = Instance.new("StringValue")
aimpartvalue.Name = "AimPartValue"
aimpartvalue.Parent = game:GetService("Players").LocalPlayer
local keybindvalue = Instance.new("StringValue")
keybindvalue.Parent = game:GetService("Players").LocalPlayer
keybindvalue.Name = "savedkey"




local RunService = game:GetService("RunService")

ReGui:DefineTheme("Cherry", {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(120, 100, 120),
	Text = Color3.fromRGB(200, 180, 200),

	FrameBg = Color3.fromRGB(25, 20, 25),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(120, 100, 120),
	FrameBgTransparencyActive = 0.4,

	CheckMark = Color3.fromRGB(150, 100, 150),
	SliderGrab = Color3.fromRGB(150, 100, 150),
	ButtonsBg = Color3.fromRGB(150, 100, 150),
	CollapsingHeaderBg = Color3.fromRGB(150, 100, 150),
	CollapsingHeaderText = Color3.fromRGB(200, 180, 200),
	RadioButtonHoveredBg = Color3.fromRGB(150, 100, 150),

	WindowBg = Color3.fromRGB(35, 30, 35),
	TitleBarBg = Color3.fromRGB(35, 30, 35),
	TitleBarBgActive = Color3.fromRGB(50, 45, 50),

	Border = Color3.fromRGB(50, 45, 50),
	ResizeGrab = Color3.fromRGB(50, 45, 50),
	RegionBgTransparency = 1,
})

--// Tabs
local Window = ReGui:Window({
	Title = "Not Matcha - L I T E",
	Theme = "Cherry",
	NoClose = true,
	Size = UDim2.new(0, 600, 0, 400),
}):Center()
local ModalWindow = Window:PopupModal({
	Title = "Loaded Not matcha L I T E ",
	AutoSize = "Y"
})

ModalWindow:Label({
	Text = [[Hello, Not matcha -L I T E has loaded!. 
Thank you for buying our external😁.]],
	TextWrapped = true
})
ModalWindow:Separator()

ModalWindow:Button({
	Text = "Okay",
	Callback = function()
		ModalWindow:ClosePopup()
	end,
})


-->>List of tabs
local Group = Window:List({
	UiPadding = 2,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
})


--->>creating tabs
local TabsBar = Group:List({
	Border = true,
	UiPadding = 5,
	BorderColor = Window:GetThemeKey("Border"),
	BorderThickness = 1,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
	HorizontalAlignment = Enum.HorizontalAlignment.Center,
	AutomaticSize = Enum.AutomaticSize.None,
	FlexMode = Enum.UIFlexMode.None,
	Size = UDim2.new(0, 40, 1, 0),
	CornerRadius = UDim.new(0, 5)
})
local TabSelector = Group:TabSelector({
	NoTabsBar = true,
	Size = UDim2.fromScale(0.5, 1)
})

local function CreateTab(Name: string, Icon)
	local Tab = TabSelector:CreateTab({
		Name = Name
	})

	local List = Tab:List({
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		UiPadding = 1,
		Spacing = 10
	})

	local Button = TabsBar:Image({
		Image = Icon,
		Ratio = 1,
		RatioAxis = Enum.DominantAxis.Width,
		Size = UDim2.fromScale(1, 1),
		Callback = function(self)
			TabSelector:SetActiveTab(Tab)
		end,
	})

	ReGui:SetItemTooltip(Button, function(Canvas)
		Canvas:Label({
			Text = Name
		})
	end)

	return List
end

local function CreateRegion(Parent, Title)
	local Region = Parent:Region({
		Border = true,
		BorderColor = Window:GetThemeKey("Border"),
		BorderThickness = 1,
		CornerRadius = UDim.new(0, 5)
	})

	Region:Label({
		Text = Title
	})

	return Region
end

local General = CreateTab("General", 139650104834071)
local Settings = CreateTab("Settings", ReGui.Icons.Settings)

--// General Tab
local AimbotSection = CreateRegion(General, "Aimbot") 
local ESPSection = CreateRegion(General, "ESP") 






AimbotSection:Checkbox({
	Label = "Enabled",
	Value = false,
	Callback = function(self, Value)
		-- Destroy UI when disabled
		if Value == false then
			if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("verysigma") then 
				game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("verysigma"):Destroy()
			end
			if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("dafo") then
				game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("dafo"):Destroy()
			end
			return
		end


		-- Aimbot variable
		local keyString = keybindvalue.Value
		local keyName = keyString:match("Enum%.KeyCode%.(%w+)") 
		local lockKey = Enum.KeyCode[keyName]
		print(lockKey)
		local aimpart = aimpartvalue.Value
		print(aimpart)
		local aimRadius = FovDesiredSized.Value

		local Players = game:GetService("Players")
		local UserInputService = game:GetService("UserInputService")
		local RunService = game:GetService("RunService")

		local player = Players.LocalPlayer
		local mouse = player:GetMouse()
		local camera = workspace.CurrentCamera
		local aimLockEnabled = false
		local targetPlayer = nil
		local defaultMouseIconEnabled = UserInputService.MouseIconEnabled

		-- Prevent multiple UI creations
		if player:FindFirstChild("PlayerGui"):FindFirstChild("dafo") then
			return
		end

		-- Create UI
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = player:WaitForChild("PlayerGui")
		ScreenGui.ResetOnSpawn = true
		ScreenGui.Name = "dafo"

		local FOVCircle = Instance.new("Frame")
		FOVCircle.Size = UDim2.new(0, aimRadius * 2, 0, aimRadius * 2)
		FOVCircle.BackgroundTransparency = 1
		FOVCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		FOVCircle.Position = UDim2.new(0, mouse.X - aimRadius, 0, mouse.Y - aimRadius)
		FOVCircle.Parent = ScreenGui

		local DAAK = Instance.new("UIStroke")
		DAAK.Color = Color3.fromRGB(225, 225, 225)
		DAAK.Parent = FOVCircle

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = FOVCircle

		RunService.RenderStepped:Connect(function()
			FOVCircle.Position = UDim2.new(0, mouse.X - aimRadius, 0, mouse.Y - aimRadius)
		end)

		-- Function to get the closest player
		local function getClosestPlayer()
			local closestTarget = nil
			local shortestDistance = aimRadius

			for _, v in pairs(workspace:GetChildren()) do
				if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= player.Character then
					local part = v:FindFirstChild(aimpart)
					if part then
						local screenPoint, onScreen = camera:WorldToViewportPoint(part.Position)
						if onScreen then
							local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
							if distance < shortestDistance then
								-- Check if the player is in the FOV (field of view)
								local viewAngle = math.acos(camera.CFrame.LookVector:Dot((part.Position - camera.CFrame.Position).unit))
								if math.deg(viewAngle) < 60 then  -- Adjust the FOV angle as needed (e.g., 60 degrees)
									closestTarget = v
									shortestDistance = distance
								end
							end
						end
					end
				end
			end

			return closestTarget
		end

		-- Function to toggle aimbot with FOV check
		local function toggleAimLock()
			aimLockEnabled = not aimLockEnabled
			if aimLockEnabled then
				targetPlayer = getClosestPlayer()
				UserInputService.MouseIconEnabled = true
			else
				targetPlayer = nil
				UserInputService.MouseIconEnabled = defaultMouseIconEnabled  
			end
		end

		if Value == false then return
		end 
		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if not gameProcessed and input.KeyCode == lockKey then
				toggleAimLock()
			end
		end)


		local smoothnessValue = Smoothnessvalue.Value
		local smoothFactor = math.clamp(smoothnessValue / 100, 0.01, 1)

		RunService.RenderStepped:Connect(function()
			if aimLockEnabled and targetPlayer then
				local targetPart = getClosestPlayer() and getClosestPlayer():FindFirstChild(aimpart)
				if targetPart then
					local targetPosition = targetPart.Position
					local targetCFrame = CFrame.new(camera.CFrame.Position, targetPosition)
					camera.CFrame = camera.CFrame:Lerp(targetCFrame, smoothFactor) 
				end
			end
		end)


		-- Create mobile button
		if not player.PlayerGui:FindFirstChild("verysigma") then
			local fsscreen = Instance.new("ScreenGui")
			fsscreen.Parent = player:WaitForChild("PlayerGui")
			fsscreen.Name = "verysigma"

			local button = Instance.new("TextButton")
			button.Size = UDim2.new(0, 100, 0, 50)
			button.Position = UDim2.new(0.85, 0, 0.8, 0)
			button.Text = "Aim Lock"
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			button.Parent = fsscreen

			button.MouseButton1Click:Connect(function()
				toggleAimLock()
				button.BackgroundColor3 = aimLockEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
			end)
		end
	end
})



AimbotSection:Combo({
	Label = "Aim part",
	Selected = "Head",
	Items = {
		"Head",
		"LowerTorso",
		"HumanoidRootPart",
		"UpperTorso",
		"RightUpperLeg",
		"RightUpperArm",
		"RightLowerLeg",
		"RightLowerArm",
		"RightHand",
		"RightFoot",
		"LeftUpperLeg",
		"LeftUpperArm",
		"LeftLowerLeg",
		"LeftLowerArm",
		"LeftHand",
		"LeftFoot",
	},
	Callback = function(self, Value)
		aimpartvalue.Value = Value
		print(Value)
	end,
})

AimbotSection:SliderFloat({
	Label = "Smoothness",
	Minimum = 1, 
	Maximum = 100,
	Value = 50,
	Format = "%.3f",
	Callback = function(self, Value)
		Smoothnessvalue.Value = Value
		print(Value)
	end,

})

AimbotSection:SliderFloat({
	Label = "Fov size",
	Minimum = 1,
	Maximum = 1000,
	Value = 130,
	Format = "%.3f",
	Callback = function(self, Value)
		FovDesiredSized.Value = Value
	end,
})


ESPSection:Checkbox({
	Label = "Enabled",
	Value = false, -- Initial state of the checkbox
	Callback = function(self, Value)
		updateESP(Value) -- Call updateESP function with the current checkbox value (true or false)
	end
})


local OptionsSection = CreateRegion(Settings, "Options") 
local ConfigSection = CreateRegion(Settings, "Configurations") 

OptionsSection:Keybind({
	Label = "Show / Hide GUI",
	Value = Enum.KeyCode.RightShift,
	Callback = function(_, NewKeybind)
		local IsVisible = Window.Visible
		Window:SetVisible(not IsVisible)
	end
})

OptionsSection:Button({
	Text = "Unload Script",
	Callback = function()
		Window:Close()
	end
})

--// Configurations
ConfigSection:Combo({
	Label = "Config",
	Items = {
		"Legit",
		"Rage",
		"Blatant"
	},
	Selected = 1,
})




ReGui:DefineTheme("KeyBindTheme", {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(168, 235, 153),
	Text = Color3.fromRGB(111, 141, 113),

	FrameBg = Color3.fromRGB(6, 11, 6),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(0, 0, 0),
	FrameBgTransparencyActive = 0,

	CheckMark = Color3.fromRGB(143, 108, 150),
	SliderGrab = Color3.fromRGB(134, 150, 134),
	ButtonsBg = Color3.fromRGB(126, 150, 130),
	CollapsingHeaderBg = Color3.fromRGB(122, 150, 126),
	CollapsingHeaderText = Color3.fromRGB(170, 200, 163),
	RadioButtonHoveredBg = Color3.fromRGB(119, 150, 129),

	WindowBg = Color3.fromRGB(29, 44, 32),
	TitleBarBg = Color3.fromRGB(61, 139, 66),
	TitleBarBgActive = Color3.fromRGB(30, 50, 33),

	Border = Color3.fromRGB(50, 45, 50),
	ResizeGrab = Color3.fromRGB(50, 45, 50),
	RegionBgTransparency = 1,
})




local KeyBinds = ReGui:Window({
	Title = "KeyBind list",
	Theme = "KeyBindTheme",
	Size = UDim2.fromOffset(150, 100)
})

KeyBinds:Separator({Text=""})
KeyBinds:Keybind({
	Label = "Lock bind",
	Value = Enum.KeyCode.Q,
	OnKeybindSet = function(self, KeyId)
		game:GetService("Players").LocalPlayer:WaitForChild("savedkey").Value = tostring(KeyId)
	end
})


--script.Parent.Parent:WaitForChild("savedkey").Value = tostring(KeyId)
