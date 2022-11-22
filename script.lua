if getgenv().__mpho_1__loaded__ then return warn("mopsHub is already loaded!") end
getgenv().__mpho_1__loaded__ = true
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/mopsfl/rbxmopshub/main/lib.lua", true))()
local ESPFramework = loadstring(game:HttpGet("https://raw.githubusercontent.com/NougatBitz/Femware-Leak/main/ESP.lua", true))()
local window = lib:CreateWindow({ gameName = "Test Game", title = "mopsHub" })
local ESPSettings = { PlayerESP = { Enabled = false, TracersOn = false, BoxesOn = false, NamesOn = false, DistanceOn = false, HealthOn = false, ToolOn = false, FaceCamOn = false, Distance = 2000 }, ScrapESP = { Enabled = false, Distance = 2000, LegendaryOnly = true, RareOnly = true, GoodOnly = true, BadOnly = true }, SafeESP = { Enabled = false, Distance = 2000, BigOnly = true, SmallOnly = true }, RegisterESP = { Enabled = false, Distance = 2000 }, ESPColor = Color3.fromRGB(255, 255, 255), ToolColor = Color3.fromRGB(255, 255, 255)};

--> Visual
local tab1 = window:CreateTab({ tabtitle = "Weapon" })
local tab2 = window:CreateTab({ tabtitle = "Visual" })
local tab3 = window:CreateTab({ tabtitle = "Character" })

-- ESP
function updateespvalues()ESPFramework.Color = ESPSettings.ESPColor;ESPFramework.ToolColor = ESPSettings.ToolColor;ESPFramework.Tracers = ESPSettings.PlayerESP.TracersOn;ESPFramework.Names = ESPSettings.PlayerESP.NamesOn;ESPFramework.Health = ESPSettings.PlayerESP.HealthOn;ESPFramework.Distance = ESPSettings.PlayerESP.DistanceOn;ESPFramework.Tool = ESPSettings.PlayerESP.ToolOn;ESPFramework.Boxes = ESPSettings.PlayerESP.BoxesOn;ESPFramework.FaceCamera = ESPSettings.PlayerESP.FaceCamOn;ESPFramework:Toggle(ESPSettings.PlayerESP.Enabled)end

tab2:CreateLabel({LabelText="ESP"})
tab2:CreateToggle({toggleText="ESP"}, function(t)
	ESPSettings.PlayerESP.Enabled = t
	updateespvalues()
end)

tab2:CreateCheckbox({checkboxText="Boxes"}, function(t)
	ESPSettings.PlayerESP.BoxesOn = t
	updateespvalues()
end)
tab2:CreateCheckbox({checkboxText="Tracers"}, function(t)
	ESPSettings.PlayerESP.TracersOn = t
	updateespvalues()
end)
tab2:CreateCheckbox({checkboxText="Names"}, function(t)
	ESPSettings.PlayerESP.NamesOn = t
	updateespvalues()
end)
tab2:CreateCheckbox({checkboxText="Distance"}, function(t)
	ESPSettings.PlayerESP.DistanceOn = t
	updateespvalues()
end)

--Wallbang
getgenv().Wallbang = false
tab1:CreateToggle({toggleText="Wallbang"}, function(t)
	getgenv().Wallbang = t

	local mt = getrawmetatable(game)
	local namecallold = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local Args = {...}
		NamecallMethod = getnamecallmethod()
		if getgenv().Wallbang and tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
			table.insert(Args[2], workspace.Map)
		end
		return namecallold(self, ...)
	end)
	loadstring(game:HttpGet("https://pastebin.com/raw/mNgwcGpj", true))()
	setreadonly(mt, true)
end)

--Silent Aimbot
getgenv().slientaim = false
tab1:CreateToggle({toggleText="Silent Aimbot"}, function(t)
    getgenv().slientaim = t
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
			local Head = V.Character.FindFirstChild(V.Character, "Head")
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
			if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, "Head") then
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
end)

--> Infinite Ammo
getgenv().infammo = false
tab1:CreateToggle({toggleText="Infinite Ammo"}, function(t)
	getgenv().slientaim = t
	while getgenv().slientaim do task.wait()
		game:GetService("\80\108\97\121\101\114\115").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
		game:GetService("\80\108\97\121\101\114\115").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
	end
end)

--Walkspeed
local speed = 16
tab3:CreateSlider({sliderText="Walk Speed", min=16,max=500}, function(v)
	speed = v
end)
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
gmt.__index = newcclosure(function(self,b)
	if b == "WalkSpeed" then
		return speed
	end
	return oldindex(self,b)
end)

--Infinite Jump
getgenv().infjump = false
getgenv().infjumpcd = 2.5
tab3:CreateToggle({toggleText="Infinite Jump"}, function(t)
	getgenv().infjump = t

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
end)

tab3:CreateToggle({toggleText="Fly"}, function(t) 
	
end)

--> No Recoil
local standardgunmods = {}
tab1:CreateToggle({toggleText="No Recoil"}, function(t) 
	for _,v in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
		if v.Name == "RecoilControl" then 
			standardgunmods[v.Parent.Name] = v.Value
			v.Value = 0
		end
	end
	game:GetService("ReplicatedStorage").Events.SpawnMe:FireServer()
end)
tab1:CreateLabel({LabelText="More comming very soon!"})
tab2:CreateLabel({LabelText="More comming very soon!"})
tab3:CreateLabel({LabelText="More comming very soon!"})
