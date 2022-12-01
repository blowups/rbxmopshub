local L_1_, L_2_ = pcall(function()
	if not game.PlaceId == 292439477 then
		return
	end
	getgenv = getgenv
	repeat
		task.wait()
	until game:IsLoaded()
	getgenv().__mpho_1__loaded__ = true
	local L_3_ = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
	local L_4_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
	local L_5_ = L_4_.Notify
	local L_6_, L_7_, L_8_, L_9_ = ((syn and syn.write_clipboard) or setclipboard), ((syn and syn.crypt.base64.encode) or (Krnl and Krnl.Base64.Encode)), ((syn and syn.crypt.base64.decode) or (Krnl and Krnl.Base64.Decode)), (http_request or syn and syn.request or request or nil)
	local L_10_ = {}
	local L_11_ = game:GetService("Players").LocalPlayer
	local L_12_ = {
		autoLoadConfigs = nil
	}
	local L_13_ = nil
	if isfile("/mopsHub/settings.mhs") then
		local L_45_, L_46_ = pcall(function()
			local L_47_ = readfile("/mopsHub/settings.mhs")
			local L_48_ = {}
			local L_49_, L_50_ = pcall(function()
				L_48_ = game:GetService("HttpService"):JSONDecode(L_47_)
			end)
			if L_49_ then
				for L_51_forvar1, L_52_forvar2 in pairs(L_48_) do
					L_12_[L_51_forvar1] = L_52_forvar2
				end
			else
				warn("[mopsHub Error]: Unable to parse local saved settings json.\nError:\n\n> "..L_50_)
			end
		end)
		if not L_45_ and L_46_ then
			print(L_46_)
		end
	else
		autoLoadConfigs = true
		writefile("/mopsHub/settings.mhs", tostring(game:GetService("HttpService"):JSONEncode(L_12_)))
		print("[mopsHub Debug]: Created local config file.")
	end
	getgenv()._WINDOW = {
		Tabs = {}
	}
	getgenv().camera = {
		no_sway = false,
		no_shake = false
	}
	getgenv()._hextsize = 5
	getgenv()._hexttransparency = 0.5
	getgenv()._hteamcolor = false
	getgenv()._hitbox = "Head"
	local L_16_ = {
		"Weapon",
		"Visual",
		"Character",
		"Misc",
		"Settings",
		"Credits"
	}
	local L_17_ = {
		["Weapon"] = {
			{
				Function = "CreateSection",
				Args = "━ Aimbot ━"
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Silent Aimbot",
					Flag = "_slientaimbot",
					Callback = function(L_53_arg1)
						getgenv()._slientaimbot = L_53_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Visible Check",
					Flag = "visibleCheck",
					Callback = function(L_54_arg1)
						getgenv().visibleCheck = L_54_arg1
					end
				}
			},
			{
				Function = "CreateDropdown",
				_envState = "Random",
				Args = {
					Name = "Hit Part",
					Flag = "targetedPart",
					Options = {
						"Random",
						"Head",
						"Torso"
					},
					CurrentOption = getgenv().targetedPart or "Random",
					Callback = function(L_55_arg1)
						getgenv().targetedPart = L_55_arg1
					end
				}
			},
			{
				Function = "CreateSlider",
				_envState = 50,
				Args = {
					Name = "Head Hit Chance",
					Flag = "headChance",
					Range = {
						0,
						100
					},
					Increment = 1,
					Suffix = "%",
					CurrentValue = 50,
					Callback = function(L_56_arg1)
						getgenv().headChance = math.clamp(L_56_arg1 / 100, 0, 100)
					end
				}
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "Note:",
					Content = "Currently the Head Hit Chance only works, if Hit Part is 'Random'."
				}
			},
			{
				Function = "CreateSection",
				Args = "━ Gun Mods ━"
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "No Sway",
					Flag = "_nosway",
					Callback = function(L_57_arg1)
						getgenv().camera.no_sway = L_57_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "No Camera Shake",
					Flag = "_nocamshake",
					Callback = function(L_58_arg1)
						getgenv().camera.no_shake = L_58_arg1
					end
				}
			}
		},
		["Visual"] = {
			{
				Function = "CreateSection",
				Args = "━ ESP ━"
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "ESP",
					Flag = "_esp",
					Callback = function(L_59_arg1)
						getgenv().esp.enabled = L_59_arg1
						getgenv().esp.text.enabled = L_59_arg1
						getgenv().esp.highlight_target.enabled = L_59_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Boxes",
					Flag = "_espboxes",
					Callback = function(L_60_arg1)
						getgenv().esp.misc_layout.box.enabled = L_60_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Health",
					Flag = "_esphealth",
					Callback = function(L_61_arg1)
						getgenv().esp.text_layout.health.enabled = L_61_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Health Bar",
					Flag = "_esphealthbar",
					Callback = function(L_62_arg1)
						getgenv().esp.misc_layout.health.enabled = L_62_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Names",
					Flag = "_espnames",
					Callback = function(L_63_arg1)
						getgenv().esp.text_layout.name.enabled = L_63_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Distance",
					Flag = "_espdistance",
					Callback = function(L_64_arg1)
						getgenv().esp.text_layout.distance.enabled = L_64_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Tool",
					Flag = "_esptool",
					Callback = function(L_65_arg1)
						getgenv().esp.text_layout.tool.enabled = L_65_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Highlight",
					Flag = "_esphighlight",
					Callback = function(L_66_arg1)
						getgenv().esp.misc_layout.highlight.enabled = L_66_arg1
					end
				}
			},
			{
				Function = "CreateSlider",
				_envState = 8,
				Args = {
					Name = "Font Size",
					Flag = "_espfontsize",
					Range = {
						1,
						30
					},
					Increment = 1,
					Suffix = "",
					CurrentValue = 13,
					Callback = function(L_67_arg1)
						getgenv().esp.fontsize = L_67_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Show enemies on radar",
					Flag = "_enemiesonradar",
					Callback = function(L_68_arg1)
						getgenv()._enemiesonradar = L_68_arg1
						L_10_:toggleShowEnemiesOnRadar()
					end
				}
			},
			{
				Function = "CreateSection",
				Args = "━ Hitbox Extender ━"
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Hitbox Extender",
					Flag = "_hitboxext",
					Callback = function(L_69_arg1)
						getgenv()._hitboxext = L_69_arg1
					end
				}
			},
			{
				Function = "CreateDropdown",
				_envState = "Head",
				Args = {
					Name = "Hitbox",
					Flag = "_hitbox",
					Options = {
						"Head",
						"Torso"
					},
					CurrentOption = getgenv()._hitbox or "Head",
					Callback = function(L_70_arg1)
						getgenv()._hitbox = L_70_arg1
					end
				}
			},
			{
				Function = "CreateSlider",
				_envState = 8,
				Args = {
					Name = "Hitbox Size",
					Flag = "_hextsize",
					Range = {
						1,
						8
					},
					Increment = 0.1,
					Suffix = "",
					CurrentValue = getgenv()._hextsize,
					Callback = function(L_71_arg1)
						getgenv()._hextsize = L_71_arg1
					end
				}
			},
			{
				Function = "CreateSlider",
				_envState = 0.5,
				Args = {
					Name = "Hitbox Transparency",
					Flag = "_hexttransparency",
					Range = {
						0,
						1
					},
					Increment = 0.1,
					Suffix = "",
					CurrentValue = 0.5,
					Callback = function(L_72_arg1)
						getgenv()._hexttransparency = L_72_arg1
					end
				}
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "Note:",
					Content = "Sadly the size can't be bigger than 8 due the anticheat."
				}
			},
			{
				Function = "CreateSection",
				Args = "━ Gun Customization ━"
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "",
					Content = "Soon."
				}
			}
		},
		["Character"] = {
			{
				Function = "CreateSection",
				Args = "━ Walkspeed Changer ━"
			},
			{
				Function = "CreateSlider",
				_envState = 16,
				Args = {
					Name = "Walkspeed Modifier",
					Flag = "_walkspeed",
					Range = {
						0,
						40
					},
					Increment = 1,
					Suffix = "",
					CurrentValue = 16,
					Callback = function(L_73_arg1)
						getgenv()._walkspeed = L_73_arg1
					end
				}
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "Notes:",
					Content = "! Switch your weapon once to apply the walkspeed !\nSadly the walkspeed can't be higher than 40 due the anticheat."
				}
			},
			{
				Function = "CreateSection",
				Args = "━ Infinite Jump ━"
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Infinite Jump",
					Flag = "_infjump",
					Callback = function(L_74_arg1)
						getgenv()._infinitejump = L_74_arg1
					end
				}
			},
			{
				Function = "CreateSlider",
				_envState = 50,
				Args = {
					Name = "Infinite Jump Height",
					Flag = "_infjumpheight",
					Range = {
						0,
						100
					},
					Increment = 1,
					Suffix = "",
					CurrentValue = 50,
					Callback = function(L_75_arg1)
						getgenv()._infjumpheight = L_75_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Bunny Hop",
					Flag = "_bhop",
					Callback = function(L_76_arg1)
						getgenv()._bhop = L_76_arg1
					end
				}
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "Notes:",
					Content = "Hold the spacebar to Bunny Hop!"
				}
			}
		},
		["Misc"] = {
			{
				Function = "CreateSection",
				Args = "━ Automatic Actions ━"
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Auto Respawn",
					Flag = "_autorespawn",
					Callback = function(L_77_arg1)
						getgenv()._autorespawn = L_77_arg1
					end
				}
			},
			{
				Function = "CreateToggle",
				_envState = false,
				Args = {
					Name = "Join new server on votekick",
					Flag = "_votekickrejoin",
					Callback = function(L_78_arg1)
						getgenv()._votekickrejoin = L_78_arg1
					end
				}
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "Note:",
					Content = "Its recommended to put the script in your auto execute folder of your executor, so the script can auto load after a join."
				}
			},
			{
				Function = "CreateSection",
				Args = "━ Other ━"
			}
		},
		["Settings"] = {
			{
				Function = "CreateSection",
				Args = "━ Script Settings ━"
			},
			{
				Function = "CreateToggle",
				Args = {
					Name = "Auto Load configs",
					CurrentValue = L_12_.autoLoadConfigs,
					Callback = function(L_79_arg1)
						L_12_.autoLoadConfigs = L_79_arg1
						writefile("/mopsHub/settings.mhs", tostring(game:GetService("HttpService"):JSONEncode(L_12_)))
					end
				}
			},
			{
				Function = "CreateParagraph",
				_envState = false,
				Args = {
					Title = "Note:",
					Content = "This means, your recently used settings will automatically load when you execute the script."
				}
			}
		}
	}
	local L_18_ = {
		["Special Thanks"] = {
			{
				"@yukihooked",
				""
			},
			{
				"@mickeydev",
				""
			},
			{
				"@LURKLURKLURKLURKLURKLURKLURKLURK",
				""
			}
		},
		["Developers"] = {
			{
				"ShyFlooo",
				"Programmer"
			}
		}
	}
	local L_19_ = L_3_:CreateWindow({
		Name = "mopsHub - Phantom Forces",
		LoadingTitle = "mopsHub - Phantom Forces",
		LoadingSubtitle = "by ShyFlooo",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = "/mopsHub/.config",
			FileName = "mopshub_phantomforces"
		},
		KeySystem = false,
		KeySettings = {
			Title = "mopsHub - Phantom Forces",
			Subtitle = "Key System",
			Note = "Key here (copied): discord.gg/g4EGAwjUAK",
			FileName = "MOPSHUBKEY",
			SaveKey = true,
			GrabKeyFromSite = false,
			Key = "disabled bc of the synapsex rule"
		}
	})
	for L_80_forvar1, L_81_forvar2 in pairs(L_16_) do
		local L_82_ = L_19_:CreateTab(L_81_forvar2)
		getgenv()._WINDOW.Tabs[L_81_forvar2] = L_82_
	end
	for L_83_forvar1, L_84_forvar2 in pairs(L_18_) do
		local L_85_ = ""
		for L_86_forvar1, L_87_forvar2 in pairs(L_84_forvar2) do
			if #L_87_forvar2[2] > 0 then
				L_85_ = L_85_.."\n"..L_87_forvar2[1].." - "..L_87_forvar2[2]
			else
				L_85_ = L_85_.."\n"..L_87_forvar2[1]
			end
		end
		getgenv()._WINDOW.Tabs["Credits"]:CreateSection(L_83_forvar1)
		getgenv()._WINDOW.Tabs["Credits"]:CreateParagraph({
			Title = L_83_forvar1,
			Content = L_85_
		})
	end
	for L_88_forvar1, L_89_forvar2 in pairs(L_17_) do
		print("Loaded "..#L_89_forvar2.." function(s) for "..L_88_forvar1)
		for L_90_forvar1, L_91_forvar2 in pairs(L_89_forvar2) do
			if L_91_forvar2.Function and L_91_forvar2.Args then
				local L_92_ = getgenv()._WINDOW.Tabs[L_88_forvar1]
				if L_92_ then
					local L_93_, L_94_ = pcall(function()
						local L_95_, L_96_ = L_91_forvar2.Function, true
						if L_95_ == "CreateSection" then
							L_92_:CreateSection(L_91_forvar2.Args)
						elseif L_95_ == "CreateButton" then
							L_92_:CreateButton(L_91_forvar2.Args)
						elseif L_95_ == "CreateToggle" then
							L_92_:CreateToggle(L_91_forvar2.Args)
						elseif L_95_ == "CreateDropdown" then
							L_92_:CreateDropdown(L_91_forvar2.Args)
						elseif L_95_ == "CreateInput" then
							L_92_:CreateInput(L_91_forvar2.Args)
						elseif L_95_ == "CreateSlider" then
							L_92_:CreateSlider(L_91_forvar2.Args)
						elseif L_95_ == "CreateParagraph" then
							L_92_:CreateParagraph(L_91_forvar2.Args)
						elseif L_95_ == "CreateLabel" then
							L_92_:CreateLabel(L_91_forvar2.Args)
						elseif L_95_ == "CreateKeybind" then
							L_92_:CreateKeybind(L_91_forvar2.Args)
						else
							L_96_ = false
						end
						if L_96_ == true then
						else
						end
						if L_91_forvar2.Args.Flag then
							getgenv()[L_91_forvar2.Args.Flag] = L_91_forvar2._envState
						end
					end)
					if not L_93_ and L_94_ then
						print("[mopsHub UI Loader Error]: > "..L_94_)
					end
				end
			end
		end
	end
	local L_20_ = {}
	do
		local L_97_ = getgc(true)
		local L_98_ = getloadedmodules()
		for L_99_forvar1 = 1, #L_97_ do
			local L_100_ = L_97_[L_99_forvar1]
			if typeof(L_100_) == "table" then
				if rawget(L_100_, "send") and rawget(L_100_, "fetch") then
					L_10_.network = L_100_
				elseif rawget(L_100_, 'goingLoud') and rawget(L_100_, 'isInSight') then
					L_10_.spotting_interface = L_100_
				elseif rawget(L_100_, 'setMinimapStyle') and rawget(L_100_, 'setRelHeight') then
					L_10_.radar_interface = L_100_
				elseif rawget(L_100_, "getCharacterModel") and rawget(L_100_, 'popCharacterModel') then
					L_10_.third_person_object = L_100_
				elseif rawget(L_100_, "getCharacterObject") then
					L_10_.character_interface = L_100_
				elseif rawget(L_100_, "isSprinting") and rawget(L_100_, "getArmModels") then
					L_10_.character_object = L_100_
				elseif rawget(L_100_, "updateReplication") and rawget(L_100_, "getThirdPersonObject") then
					L_10_.replication_object = L_100_
				elseif rawget(L_100_, "setHighMs") and rawget(L_100_, "setLowMs") then
					L_10_.replication_interface = L_100_
				elseif rawget(L_100_, 'setSway') and rawget(L_100_, "_applyLookDelta") then
					L_10_.main_camera_object = L_100_
				elseif rawget(L_100_, 'getActiveCamera') and rawget(L_100_, "getCameraType") then
					L_10_.camera_interface = L_100_
				elseif rawget(L_100_, 'getFirerate') and rawget(L_100_, "getFiremode") then
					L_10_.firearm_object = L_100_
				elseif rawget(L_100_, 'canMelee') and rawget(L_100_, "_processMeleeStateChange") then
					L_10_.melee_object = L_100_
				elseif rawget(L_100_, 'canCancelThrow') and rawget(L_100_, "canThrow") then
					L_10_.grenade_object = L_100_
				elseif rawget(L_100_, "vote") then
					L_10_.votekick_interface = L_100_
				elseif rawget(L_100_, "getActiveWeapon") then
					L_10_.weapon_controller_object = L_100_
				elseif rawget(L_100_, "getController") then
					L_10_.weapon_controller_interface = L_100_
				elseif rawget(L_100_, "updateVersion") and rawget(L_100_, "inMenu") then
					L_10_.chat_interface = L_100_
				elseif rawget(L_100_, "trajectory") and rawget(L_100_, "timehit") then
					L_10_.physics = L_100_
				elseif rawget(L_100_, "slerp") and rawget(L_100_, "toanglesyx") then
					L_10_.vector = L_100_
				end
			end
		end
		for L_101_forvar1 = 1, #L_98_ do
			local L_102_ = L_98_[L_101_forvar1]
			if L_102_.Name == "PlayerSettingsInterface" then
				L_10_.player_settings = require(L_102_)
			elseif L_102_.Name == "PublicSettings" then
				L_10_.public_settings = require(L_102_)
			elseif L_102_.Name == "particle" then
				L_10_.particle = require(L_102_)
			elseif L_102_.Name == "BulletCheck" then
				L_10_.bullet_check = require(L_102_)
			end
		end
	end
	local L_21_ = L_10_.main_camera_object.setSway
	local L_22_ = L_10_.main_camera_object.shake
	function L_10_:setWalkspeed(L_103_arg1)
		L_103_arg1 = math.clamp(L_103_arg1, 0, 40)
		if L_10_.weapon_controller_interface.getController() then
			local L_104_ = L_10_.weapon_controller_interface.getController()._activeWeaponRegistry
			for L_105_forvar1, L_106_forvar2 in pairs(L_104_) do
				for L_107_forvar1, L_108_forvar2 in pairs(L_106_forvar2) do
					L_106_forvar2._weaponData.walkspeed = L_103_arg1
				end
			end
		end
	end
	function L_10_:isEnemy(L_109_arg1)
		if L_109_arg1.Parent.Name == tostring(game.Players.LocalPlayer.TeamColor) then
			return false
		else
			return true
		end
	end
	function L_10_:getAllEnemies()
		local L_110_ = {}
		for L_111_forvar1, L_112_forvar2 in pairs(L_10_.replication_interface.getAllBodyParts()) do
			if L_112_forvar2.Parent.Name == "Player" and isEnemy(L_112_forvar2) and L_112_forvar2.Name == "Head" then
				table.insert(L_110_, L_112_forvar2.Parent)
			end
		end
		return L_110_
	end
	function L_10_:setHeadSize(L_113_arg1, L_114_arg2)
		sethiddenproperty(L_113_arg1.Head, "Massless", true)
		L_113_arg1.Head.CanCollide = false
		if L_113_arg1.Head.Size ~= Vector3.new(L_114_arg2, L_114_arg2, L_114_arg2) and L_113_arg1.Head.Mesh.Scale ~= Vector3.new(L_114_arg2, L_114_arg2, L_114_arg2) then
			L_113_arg1.Head.Size = Vector3.new(L_114_arg2, L_114_arg2, L_114_arg2)
			L_113_arg1.Head.Mesh.Scale = Vector3.new(L_114_arg2, L_114_arg2, L_114_arg2)
		end
	end
	function L_10_:addPlayer(L_115_arg1)
		if L_115_arg1 then
			L_20_[L_115_arg1] = L_115_arg1
		end
	end
	function L_10_:removePlayer(L_116_arg1)
		if rawget(L_20_, L_116_arg1) then
			L_20_[L_116_arg1] = nil
		end
	end
	function L_10_:giveAlotAmmo()
		local L_117_ = L_10_:getActiveWeaponObject()
		if L_117_ then
			L_117_.addAmmo(L_117_, 9999)
		end
	end
	function L_10_:inGame()
		local L_118_ = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HudScreenGui")
		if L_118_.Enabled then
			return true
		end
		return false
	end
	function L_10_:inMenu()
		local L_119_ = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MenuScreenGui")
		if L_119_.Enabled then
			return true
		end
		return false
	end
	function L_10_:get_character(L_120_arg1)
		local L_121_ = L_10_.replication_interface.getEntry(L_120_arg1)
		if L_121_ then
			local L_122_ = L_121_._thirdPersonObject
			if L_122_ then
				return L_122_._character
			end
		end
	end
	function L_10_:get_health(L_123_arg1)
		local L_124_ = L_10_.replication_interface.getEntry(L_123_arg1)
		if L_124_ then
			return L_124_._healthstate.health0, L_124_._healthstate.maxhealth
		end
	end
	function L_10_:check_status(L_125_arg1)
		local L_126_ = L_10_.replication_interface.getEntry(L_125_arg1)
		if L_126_ then
			return L_126_._alive
		end
	end
	function L_10_:get_tool(L_127_arg1)
		local L_128_ = L_10_.replication_interface.getEntry(L_127_arg1)
		if L_128_ then
			local L_129_ = L_128_._thirdPersonObject
			if L_129_ then
				return L_129_._weaponname or ''
			end
		end
	end
	function L_10_:getPlayerInfo(L_130_arg1)
		local L_131_ = L_10_:get_character(L_130_arg1)
		return {
			character = L_131_,
			health = L_10_:get_health(L_130_arg1),
			tool = L_10_:get_tool(L_130_arg1),
			status = L_10_:check_status(L_130_arg1)
		}
	end
	function L_10_:getCurrentWeaponRegistry()
		if L_10_.weapon_controller_interface.getController() then
			return L_10_.weapon_controller_interface.getController()._activeWeaponRegistry or {}
		end
	end
	function L_10_:getActiveWeaponIndex()
		if L_10_.weapon_controller_object and L_10_.weapon_controller_interface.getController() then
			return L_10_.weapon_controller_object.getActiveWeaponIndex(L_10_.weapon_controller_interface.getController())
		end
	end
	function L_10_:getActiveWeapon()
		if L_10_.weapon_controller_object and L_10_.weapon_controller_interface.getController() then
			return L_10_.weapon_controller_object.getActiveWeapon(L_10_.weapon_controller_interface.getController())
		end
	end
	function L_10_:getActiveWeaponData()
		local L_132_ = L_10_:getActiveWeaponObject()
		if L_132_ then
			return L_132_._weaponData
		else
			return {}
		end
	end
	function L_10_:toggleShowEnemiesOnRadar()
		local L_133_ = L_10_.spotting_interface.isSpotted
		L_10_.spotting_interface.isSpotted = function(L_134_arg1)
			if L_10_.character_interface.isAlive() and getgenv()._enemiesonradar then
				return true
			else
				return L_133_(L_134_arg1)
			end
		end
	end
	local function L_23_func()
		local L_135_ = "https://games.roblox.com/v1/games/292439477/servers/0?sortOrder=Desc&limit=100&excludeFullGames=true"
		local L_136_ = nil
		local L_137_ = L_9_({
			["Url"] = L_135_,
			["Method"] = "GET",
			["Headers"] = {
				["Content-Type"] = "application/json"
			}
		})
		if L_137_.StatusCode ~= 200 or not L_137_.Success then
			return warn("[mopsHub Error]: Unable to get servers.")
		else
			L_136_ = L_137_.Body
		end
		return game:GetService("HttpService"):JSONDecode(L_136_)
	end
	local L_24_ = coroutine.create(function()
		local L_138_, L_139_ = pcall(function()
			game:GetService("TeleportService"):Teleport(game.PlaceId, L_11_)
		end)
		if L_139_ and not L_138_ then
			warn(L_139_)
		end
	end)
	local L_25_ = game:GetService("Players")
	local L_26_ = L_25_.LocalPlayer
	local L_27_ = workspace.CurrentCamera
	local L_28_ = getrenv().shared
	local L_29_ = L_28_.require("physics")
	local L_30_ = L_28_.require("particle")
	local L_31_ = L_28_.require("ReplicationInterface")
	local L_32_ = debug.getupvalue(L_29_.timehit, 2)
	local function L_33_func(L_140_arg1, L_141_arg2)
		return #L_27_:GetPartsObscuringTarget({
			L_140_arg1
		}, L_141_arg2) == 0
	end
	local function L_34_func(L_142_arg1, L_143_arg2, L_144_arg3)
		local L_145_ = math.rad(fov or 180)
		local L_146_, L_147_
		L_31_.operateOnAllEntries(function(L_148_arg1, L_149_arg2)
			local L_150_ = L_149_arg2 and L_149_arg2._thirdPersonObject
			local L_151_ = L_150_ and L_150_._character
			if L_151_ and L_148_arg1.Team ~= L_26_.Team then
				local L_152_ = L_151_[getgenv().targetedPart == "Random" and (math.random() < (getgenv().headChance or 0.5) and "Head" or "Torso") or (getgenv().targetedPart or "Head")].Position
				if not(getgenv().visibleCheck and not L_33_func(L_152_, L_144_arg3)) and getgenv()._slientaimbot then
					local L_153_ = L_142_arg1.Unit:Dot((L_152_ - L_143_arg2).Unit)
					local L_154_ = math.acos(L_153_)
					if L_154_ < L_145_ then
						L_145_ = L_154_
						L_146_ = L_152_
						L_147_ = L_149_arg2
					end
				end
			end
		end)
		return L_146_, L_147_
	end
	local function L_35_func(L_155_arg1, L_156_arg2, L_157_arg3, L_158_arg4)
		local L_159_, L_160_, L_161_, L_162_ = L_32_(L_157_arg3:Dot(L_157_arg3) * 0.25, L_157_arg3:Dot(L_156_arg2), L_157_arg3:Dot(L_155_arg1) + L_156_arg2:Dot(L_156_arg2) - L_158_arg4 ^ 2, L_155_arg1:Dot(L_156_arg2) * 2, L_155_arg1:Dot(L_155_arg1))
		local L_163_ = (L_159_ > 0 and L_159_) or (L_160_ > 0 and L_160_) or (L_161_ > 0 and L_161_) or L_162_
		local L_164_ = 0.5 * L_157_arg3 * L_163_ + L_155_arg1 / L_163_ + L_156_arg2
		return L_164_, L_163_
	end
	local L_36_
	L_36_ = hookfunction(L_30_.new, function(L_165_arg1)
		if debug.info(2, "n") == "fireRound" then
			local L_166_, L_167_ = L_34_func(L_165_arg1.velocity, L_165_arg1.visualorigin, L_165_arg1.physicsignore)
			if L_166_ and L_167_ then
				local L_168_ = table.find(debug.getstack(2), L_165_arg1.velocity)
				L_165_arg1.velocity = L_35_func(L_166_ - L_165_arg1.visualorigin, L_167_._velspring._p0, -L_165_arg1.acceleration, L_165_arg1.velocity.Magnitude)
				debug.setstack(2, L_168_, L_165_arg1.velocity)
			end
		end
		return L_36_(L_165_arg1)
	end)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LURKLURKLURKLURKLURKLURKLURKLURK/pf/main/esp.lua"))()
	local L_37_ = 1
	local L_38_ = 0
	game:GetService("RunService").Stepped:Connect(function()
		if getgenv()._hitboxext then
			L_37_ = getgenv()._hextsize
			L_38_ = getgenv()._hexttransparency
		else
			L_37_ = 1
			L_38_ = 0
		end
		for L_169_forvar1, L_170_forvar2 in next, workspace.Players:GetDescendants() do
			if L_170_forvar2:FindFirstChild("Head") and L_170_forvar2:FindFirstChild("Torso") and not L_170_forvar2:FindFirstChildWhichIsA("MeshPart") then
				if getgenv()._hitbox == "Head" then
					sethiddenproperty(L_170_forvar2.Torso, "Massless", false)
					L_170_forvar2.Torso.Size = Vector3.new(1, 1, 1)
					L_170_forvar2.Torso.Mesh.Scale = Vector3.new(1, 1, 1)
					L_170_forvar2.Torso.BrickColor = BrickColor.new("Cashmere")
					L_170_forvar2.Torso.Transparency = 0
				elseif getgenv()._hitbox == "Torso" then
					sethiddenproperty(L_170_forvar2.Head, "Massless", false)
					L_170_forvar2.Head.Size = Vector3.new(1, 1, 1)
					L_170_forvar2.Head.Mesh.Scale = Vector3.new(1, 1, 1)
					L_170_forvar2.Head.BrickColor = BrickColor.new("Cashmere")
					L_170_forvar2.Head.Transparency = 0
				end
				local L_171_, L_172_ = pcall(function()
					sethiddenproperty(L_170_forvar2[getgenv()._hitbox], "Massless", true)
					L_170_forvar2[getgenv()._hitbox].CanCollide = false
					L_170_forvar2[getgenv()._hitbox].Transparency = L_38_
					if getgenv()._hitbox == "Torso" then
						L_170_forvar2[getgenv()._hitbox].Shirt.Transparency = L_38_
						L_170_forvar2[getgenv()._hitbox].Pant.Transparency = L_38_
					else
						L_170_forvar2.Torso.Shirt.Transparency = 0
						L_170_forvar2.Torso.Pant.Transparency = 0
					end
					if L_170_forvar2[getgenv()._hitbox].Size ~= Vector3.new(L_37_, L_37_, L_37_) and L_170_forvar2[getgenv()._hitbox].Mesh.Scale ~= Vector3.new(L_37_, L_37_, L_37_) then
						L_170_forvar2[getgenv()._hitbox].Size = Vector3.new(L_37_, L_37_, L_37_)
						L_170_forvar2[getgenv()._hitbox].Mesh.Scale = Vector3.new(L_37_, L_37_, L_37_)
					end
					if getgenv()._hitboxext then
						if getgenv()._hteamcolor and L_170_forvar2[getgenv()._hitbox].Parent.Parent.Name == "Bright blue" then
							L_170_forvar2[getgenv()._hitbox].BrickColor = BrickColor.new("Bright blue")
						else
							L_170_forvar2[getgenv()._hitbox].BrickColor = BrickColor.new("Cashmere")
						end
						if getgenv()._hteamcolor and L_170_forvar2[getgenv()._hitbox].Parent.Parent.Name == "Bright orange" then
							L_170_forvar2[getgenv()._hitbox].BrickColor = BrickColor.new("Bright orange")
						else
							L_170_forvar2[getgenv()._hitbox].BrickColor = BrickColor.new("Cashmere")
						end
					else
						L_170_forvar2[getgenv()._hitbox].BrickColor = BrickColor.new("Cashmere")
					end
				end)
				if not L_171_ and L_172_ then
					warn(L_172_)
				end
			end
		end
	end)
	local L_39_ = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("HudScreenGui")
	game:GetService("RunService").Stepped:Connect(function(L_173_arg1, L_174_arg2)
		if L_10_:inGame() then
			L_10_:setWalkspeed(getgenv()._walkspeed)
		end
	end)
	L_39_:GetPropertyChangedSignal("Enabled"):Connect(function()
		if L_39_.Enabled == true then
			L_10_:setWalkspeed(getgenv()._walkspeed)
		end
	end)
	function Action(L_175_arg1, L_176_arg2)
		if L_175_arg1 ~= nil then
			L_176_arg2(L_175_arg1)
		end
	end
	game:GetService('UserInputService').InputBegan:Connect(function(L_177_arg1)
		if L_177_arg1.UserInputType == Enum.UserInputType.Keyboard and L_177_arg1.KeyCode == Enum.KeyCode.Space then
			if not getgenv()._infinitejump then
				return
			end
			Action(game:GetService('Players').LocalPlayer.Character.Humanoid, function(L_178_arg1)
				if L_178_arg1:GetState() == Enum.HumanoidStateType.Jumping or L_178_arg1:GetState() == Enum.HumanoidStateType.Freefall then
					Action(L_178_arg1.Parent.HumanoidRootPart, function(L_179_arg1)
						L_179_arg1.Velocity = Vector3.new(0, getgenv()._infjumpheight or 50, 0)
					end)
				end
			end)
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if getgenv()._bhop and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
			local L_180_ = L_10_.character_interface.getCharacterObject()
			local L_181_ = L_10_.weapon_controller_interface.getController()
			local L_182_ = 4
			if L_180_ and L_181_ then
				if L_180_._floorMaterial == Enum.Material.Air then
					return
				end
				local L_183_ = L_181_:getActiveWeapon()
				if L_183_:getWeaponType() == "Melee" then
					L_182_ = L_182_ * 1.15
				end
				local L_184_ = L_180_._rootPart.Velocity.y
				L_182_ = L_182_ and (2 * game.Workspace.Gravity * L_182_) ^ 0.5 or 40
				local L_185_ = L_182_
				if L_184_ < 0 then
					L_185_ = L_182_
				end
				if L_180_._movementMode == "prone" or L_180_._movementMode == "crouch" then
					L_180_:setMovementMode("stand")
					return
				end
				if L_183_:getWeaponType() == "Firearm" and L_183_:isAiming() then
					L_180_._humanoid.JumpPower = L_185_
					L_180_._humanoid.Jump = true
					return true
				end
				L_180_._humanoid.JumpPower = L_185_
				L_180_._humanoid.Jump = true
			end
		end
	end)
	local L_40_ = L_11_.PlayerGui:FindFirstChild("MenuScreenGui")
	local L_41_ = L_11_.PlayerGui:FindFirstChild("ChatScreenGui").Main.DisplayVoteKick
	function spawnplr()
		if not keypress then
			return warn("[mopsHub Loader Error]: Missing function keypress. Your executor might be too bad and doesn't support it!")
		end
		keypress(0x20)
		task.wait()
		keyrelease(0x20)
	end
	game:GetService("RunService").Stepped:Connect(function()
		if getgenv()._autorespawn == true then
			task.wait(0.5)
			if L_10_:inMenu() then
				repeat
					spawnplr()
				until L_40_.Enabled == false
			end
		end
		if getgenv()._votekickrejoin == true then
			if L_41_.Visible == true then
				local L_186_ = L_41_.TextTitle.Text
				if string.find(L_186_, L_11_.Name) then
					local L_187_ = L_23_func()
					if L_187_ then
						local L_188_ = math.random(1, #L_187_.data)
						local L_189_ = L_187_.data[L_188_].id
						task.wait(2)
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, L_189_)
					end
				end
			end
		end
		if L_10_:inMenu() then
			L_10_.main_camera_object.setSway = function(L_190_arg1, L_191_arg2)
				local L_192_ = L_191_arg2
				return L_21_(L_190_arg1, L_192_)
			end
			L_10_.main_camera_object.shake = function(L_193_arg1, L_194_arg2)
				local L_195_ = L_194_arg2
				return L_22_(L_193_arg1, L_195_)
			end
		elseif L_10_:inGame() then
			if getgenv().camera.no_sway then
				L_10_.main_camera_object.setSway = function(L_196_arg1, L_197_arg2)
					local L_198_ = getgenv().camera.no_sway and 0 or L_197_arg2
					return L_21_(L_196_arg1, L_198_)
				end
			else
				L_10_.main_camera_object.setSway = function(L_199_arg1, L_200_arg2)
					local L_201_ = L_200_arg2
					return L_21_(L_199_arg1, L_201_)
				end
			end
			if getgenv().camera.no_shake then
				L_10_.main_camera_object.shake = function(L_202_arg1, L_203_arg2)
					local L_204_ = getgenv().camera.no_shake and Vector3.zero or L_203_arg2
					return L_22_(L_202_arg1, L_204_)
				end
			else
				L_10_.main_camera_object.shake = function(L_205_arg1, L_206_arg2)
					local L_207_ = L_206_arg2
					return L_22_(L_205_arg1, L_207_)
				end
			end
		end
	end)
	if L_12_.autoLoadConfigs then
		L_3_:LoadConfiguration()
	end
end)
if not L_1_ and L_2_ then
	error("[mopsHub Error]: "..L_2_)
end
