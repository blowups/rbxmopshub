getgenv().__mpho_1__loaded__ = true
getgenv().__mpho_1__loaded__bpalrd = true
if getgenv().__mpho_1__loaded__ and getgenv().__mpho_1__loaded__bpalrd == false then return warn("mopsHub already loaded") end
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local ESPFramework = loadstring(game:HttpGet("https://raw.githubusercontent.com/NougatBitz/Femware-Leak/main/ESP.lua", true))()
local ESPSettings = { PlayerESP = { Enabled = false, TracersOn = false, BoxesOn = false, NamesOn = false, DistanceOn = false, HealthOn = false, ToolOn = false, FaceCamOn = false, Distance = 2000 }, ScrapESP = { Enabled = false, Distance = 2000, LegendaryOnly = true, RareOnly = true, GoodOnly = true, BadOnly = true }, SafeESP = { Enabled = false, Distance = 2000, BigOnly = true, SmallOnly = true }, RegisterESP = { Enabled = false, Distance = 2000 }, ESPColor = Color3.fromRGB(255, 255, 255), ToolColor = Color3.fromRGB(255, 255, 255)};
local standardgunmods: { { recoil: number, spread: number } } = {}

local Window = Rayfield:CreateWindow({
	Name = "mopsHub",
	LoadingTitle = "mopsHub V1",
	LoadingSubtitle = "by ShyFlooo",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "mopsHubConfig", -- Create a custom folder for your hub/game
		FileName = "mopshub"
	}, 
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "mopsHub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})

local Tab1 = Window:CreateTab("Weapon")
local Tab2 = Window:CreateTab("Visual")
local Tab3 = Window:CreateTab("Character")

-- ESP
function updateespvalues()ESPFramework.Color = ESPSettings.ESPColor;ESPFramework.ToolColor = ESPSettings.ToolColor;ESPFramework.Tracers = ESPSettings.PlayerESP.TracersOn;ESPFramework.Names = ESPSettings.PlayerESP.NamesOn;ESPFramework.Health = ESPSettings.PlayerESP.HealthOn;ESPFramework.Distance = ESPSettings.PlayerESP.DistanceOn;ESPFramework.Tool = ESPSettings.PlayerESP.ToolOn;ESPFramework.Boxes = ESPSettings.PlayerESP.BoxesOn;ESPFramework.FaceCamera = ESPSettings.PlayerESP.FaceCamOn;ESPFramework:Toggle(ESPSettings.PlayerESP.Enabled)end

Tab2:CreateSection("ESP")
local _esp = Tab2:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Flag = "_esp",
	Callback = function(Value)
		ESPSettings.PlayerESP.Enabled = Value
		updateespvalues()
	end,
})
Tab2:CreateSection("ESP Settings")
local _esp = Tab2:CreateToggle({
	Name = "Boxes",
	CurrentValue = false,
	Flag = "_espboxes",
	Callback = function(Value)
		ESPSettings.PlayerESP.BoxesOn = Value
		updateespvalues()
	end,
})
local _esp = Tab2:CreateToggle({
	Name = "Tracers",
	CurrentValue = false,
	Flag = "_esptracers",
	Callback = function(Value)
		ESPSettings.PlayerESP.TracersOn = Value
		updateespvalues()
	end,
})
local _esp = Tab2:CreateToggle({
	Name = "Names",
	CurrentValue = false,
	Flag = "_espnames",
	Callback = function(Value)
		ESPSettings.PlayerESP.NamesOn = Value
		updateespvalues()
	end,
})
local _esp = Tab2:CreateToggle({
	Name = "Distance",
	CurrentValue = false,
	Flag = "_espdistance",
	Callback = function(Value)
		ESPSettings.PlayerESP.DistanceOn = Value
		updateespvalues()
	end,
})

--Silent Aimbot
getgenv().silentaim = false
local _silentaimbot = Tab1:CreateToggle({
	Name = "Silent Aimbot",
	CurrentValue = false,
	Flag = "_silentaimbot",
	Callback = function(Value)
		getgenv().slientaim = Value
	local CurrentCamera = workspace.CurrentCamera
	local Players = game.GetService(game, "Players")
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	function ClosestPlayer()
		local MaxDist, Closest = math.huge
		for I,V in pairs(Players.GetPlayers(Players)) do
			if V == LocalPlayer then continue end
			if V.Team == LocalPlayer then continue end
			if not V.Character then continue end
			local Head = V.Character.FindFirstChild(V.Character, getgenv()._hitpart or "Torso")
			if not Head then continue end
			local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
			if not Vis then continue end
			local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
			local Dist = (TheirPos - MousePos).Magnitude
			if Dist < MaxDist then
				MaxDist = Dist
				Closest = V
			end
		end
		return Closest
	end
	local MT = getrawmetatable(game)
	local OldNC = MT.__namecall
	local OldIDX = MT.__index
	setreadonly(MT, false)
	MT.__namecall = newcclosure(function(self, ...)
		local Args, Method = {...}, getnamecallmethod()
		if getgenv().slientaim and Method == "FindPartOnRayWithIgnoreList" and not checkcaller() then
			local CP = ClosestPlayer()
			if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, getgenv()._hitpart or "Torso") then
				Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character.Head.Position - CurrentCamera.CFrame.Position).Unit * 1000)
				return OldNC(self, unpack(Args))
			end
		end
		return OldNC(self, ...)
	end)
	MT.__index = newcclosure(function(self, K)
		if K == "Clips" then
			return workspace.Map
		end
		return OldIDX(self, K)
	end)
	setreadonly(MT, true)
	end,
})

--Hit Part
getgenv()._hitpart = getgenv()._hitpart or "Torso"
local Dropdown = Tab1:CreateDropdown({
	Name = "Hit Part",
	Options = {"Head","Torso"},
	CurrentOption = getgenv()._hitpart,
	Flag = "_hitpart", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
	  	  getgenv()._hitpart = Option
	end,
})

--Wallbang
getgenv().wallbang = false
local _wallbang = Tab1:CreateToggle({
	Name = "Wallbang",
	CurrentValue = false,
	Flag = "_wallbang",
	Callback = function(Value)
		getgenv().wallbang = Value
		local mt = getrawmetatable(game)
	local namecallold = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local Args = {...}
		NamecallMethod = getnamecallmethod()
		if getgenv().wallbang and tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
			table.insert(Args[2], workspace.Map)
		end
		return namecallold(self, ...)
	end)
	loadstring(game:HttpGet("https://pastebin.com/raw/mNgwcGpj", true))()
	setreadonly(mt, true)
	end,
})

--Walkspeed
getgenv().wspeed = 16
local _walkspeed = Tab3:CreateSlider({
	Name = "Walkspeed",
	Range = {16, 350},
	Increment = 1,
	Suffix = "",
	CurrentValue = getgenv().wspeed,
	Flag = "_walkspeed",
	Callback = function(Value)
		getgenv().wspeed = Value
	end,
})
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
gmt.__index = newcclosure(function(self,b)
	if b == "WalkSpeed" then
		return getgenv().wspeed
	end
	return oldindex(self,b)
end)


--Infinite Jump
getgenv().infjump = false
getgenv().infjumpcd = 2
local _infjump = Tab3:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Flag = "_infjump",
	Callback = function(Value)
		getgenv().infjump = Value
		local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if getgenv().infjump then
			if k:byte() == 32 then
				humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
				humanoid:ChangeState('Jumping')
				task.wait(getgenv().infjumpcd)
				humanoid:ChangeState('Seated')
			end
		end
	end)
	end,
})

Tab1:CreateSection("Gun Mods (some mods only work after a respawn)")

--Infinite Ammo
getgenv().infammo = false
local _infammo = Tab1:CreateToggle({
	Name = "Infinite Ammo",
	CurrentValue = false,
	Flag = "_infammo",
	Callback = function(Value)
		getgenv().infammo = Value
		local tempoldammo = {
			[1] = game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value,
			[2] = game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value
		}
	while getgenv().infammo do task.wait()
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
		if not getgenv().infammo then
			break
		end
	end
	game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = tempoldammo[1]
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = tempoldammo[2]
	end,
})

--No Recoil
local _norecoil = Tab1:CreateToggle({
	Name = "No Recoil",
	CurrentValue = false,
	Flag = "_norecoil",
	Callback = function(Value)
		for _,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
		if v.Name == "RecoilControl" then 
			v.Value = 0
		end
		--game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
		--task.wait(5)
		--game:GetService("ReplicatedStorage").Events.SpawnMe:FireServer()
	end
	end,
})
--No Spread
local _norecoil = Tab1:CreateToggle({
	Name = "No Spread",
	CurrentValue = false,
	Flag = "_nospread",
	Callback = function(Value)
		for _,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
		if v.Name == "MaxSpread" or v.Name == "Spread" then 
			v.Value = 0
		end
		--game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
		--task.wait(5)
		--game:GetService("ReplicatedStorage").Events.SpawnMe:FireServer()
	end
	end,
})
--Fire Rate
getgenv()._firerate = false
local _firerate = Tab1:CreateToggle({
	Name = "Fire Rate",
	CurrentValue = false,
	Flag = "_firerate",
	Callback = function(Value)
	getgenv()._firerate = Value
		for _,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
		if v.Name == "FireRate" then 
			v.Value = 0.05
		end
		end
	end,
})
--Fast Reload
getgenv()._fastreload = false
local _firerate = Tab1:CreateToggle({
	Name = "Fast Reload",
	CurrentValue = false,
	Flag = "_firerate",
	Callback = function(Value)
	getgenv()._fastreload = Value
		for _,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
		if v.Name == "ReloadTime" then 
			v.Value = 1
		end
		end
	    --game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
		--task.wait(5)
		--game:GetService("ReplicatedStorage").Events.SpawnMe:FireServer()
	end,
})
