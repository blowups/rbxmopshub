if not getgenv().__12____2 then
getgenv().__12____2 = false
end

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

if not getgenv().__12____2 then
	getgenv().__12____2 = true
	Notify({
		Title = "<font color='#00ff00'>Kill all script loaded!</font>";
		Description = "by ShyFlooo";
		Duration = 5;
	});
end

local currentweapon

for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Tool") and v:FindFirstChild("Configuration") then
		print(v)
		currentweapon = v
	end
end
if not currentweapon then
	Notify({
		Title = "<font color='#ff0000'>No weapon equipped</font>";
		Description = "Please equip a weapon!";
		Duration = 5;
	});
	return print("no equipped weapon found")
end

if currentweapon then
	Notify({
		Title = "<font color='#00ff00'>Kill all enabled</font>";
		Description = "To disable, unequip your weapon once.";
		Duration = 3;
	});
	while currentweapon.Parent ~= game.Players.LocalPlayer.Backpack do task.wait(.1)
		for _,v in pairs(workspace.Enemies:GetChildren()) do
			if v:FindFirstChild("Head") or v:FindFirstChild("UpperTorso") then 
				local A_1 = currentweapon
					local A_2 = 
					{
						["p"] = Vector3.new(-9030.994140625, -18.28540802001953, -202.16648864746094), 
						["pid"] = 1, 
						["part"] = v:FindFirstChild("Head") or v:FindFirstChild("UpperTorso"), 
						["d"] = 204.1572723388672, 
						["maxDist"] = 204.08331298828125, 
						["h"] = v.Humanoid,
						["m"] = Enum.Material.Plastic, 
						["sid"] = 55, 
						["t"] = 0.205522199488169, 
						["n"] = Vector3.new(-0.5452762246131897, 0.03474240377545357, -0.8375362157821655)
					}
					local Event = game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit
					Event:FireServer(A_1, A_2)
			end
		end 
		if currentweapon.Parent == game.Players.LocalPlayer.Backpack then
			Notify({
				Title = "<font color='#00ff00'>Kill all disabled</font>";
				Description = "Kill all has been disabled.";
				Duration = 3;
			});
		end
	end
	else
		Notify({
		Title = "<font color='#ff0000'>No weapon equipped</font>";
		Description = "Please equip a weapon!";
		Duration = 5;
	});
	return print("no equipped weapon found")
end
