local backFrame = Instance.new("Frame")

local UIS = game:GetService('UserInputService')
local TS = game:GetService("TweenService")
local frame = backFrame
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updateInput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end


frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
		dragToggle = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragToggle then
			updateInput(input)
		end
	end
end)

local WindowTable = {}

for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
	if v.Name == "mopshubui" then
		v:Destroy()
	end
end

function WindowTable:Window(title, gameName)
	local WindowTitle = title or "mopsHub"
	local gameName = game.Name or gameName or "-"
	
	-- Instances:

	local mopshubui = Instance.new("ScreenGui")
	local introClipper = Instance.new("Frame")
	local _1 = Instance.new("Frame")
	local _2 = Instance.new("Frame")
	local _3 = Instance.new("Frame")
	local _4 = Instance.new("Frame")
	local UIPadding = Instance.new("UIPadding")
	local mH = Instance.new("TextLabel")
	local title = Instance.new("TextLabel")

	--Properties:

	mopshubui.Name = "mopshubui"
	mopshubui.Parent = game.Players.LocalPlayer.PlayerGui
	mopshubui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	introClipper.Name = "introClipper"
	introClipper.Parent = mopshubui
	introClipper.AnchorPoint = Vector2.new(0.5, 0.5)
	introClipper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	introClipper.BackgroundTransparency = 1.000
	introClipper.BorderSizePixel = 0
	introClipper.ClipsDescendants = true
	introClipper.Position = UDim2.new(0.5, 0, 0.5, 0)
	introClipper.Size = UDim2.new(0, 100, 0, 100)

	_1.Name = "1"
	_1.Parent = introClipper
	_1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	_1.BorderSizePixel = 0
	_1.Size = UDim2.new(0, 48, 0, 48)

	_2.Name = "2"
	_2.Parent = introClipper
	_2.AnchorPoint = Vector2.new(1, 0)
	_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	_2.BorderSizePixel = 0
	_2.Position = UDim2.new(1, 0, 0, 0)
	_2.Size = UDim2.new(0, 48, 0, 48)

	_3.Name = "3"
	_3.Parent = introClipper
	_3.AnchorPoint = Vector2.new(1, 1)
	_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	_3.BorderSizePixel = 0
	_3.Position = UDim2.new(1, 0, 1, 0)
	_3.Size = UDim2.new(0, 48, 0, 48)

	_4.Name = "4"
	_4.Parent = introClipper
	_4.AnchorPoint = Vector2.new(0, 1)
	_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	_4.BorderSizePixel = 0
	_4.Position = UDim2.new(0, 0, 1, 0)
	_4.Size = UDim2.new(0, 48, 0, 48)

	UIPadding.Parent = introClipper
	UIPadding.PaddingBottom = UDim.new(0, 2)
	UIPadding.PaddingLeft = UDim.new(0, 2)
	UIPadding.PaddingRight = UDim.new(0, 2)
	UIPadding.PaddingTop = UDim.new(0, 2)

	mH.Name = "mH"
	mH.Parent = introClipper
	mH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mH.BackgroundTransparency = 1.000
	mH.BorderSizePixel = 0
	mH.Size = UDim2.new(1, 0, 0.729166687, 0)
	mH.Font = Enum.Font.SciFi
	mH.Text = "mH"
	mH.TextColor3 = Color3.fromRGB(255, 255, 255)
	mH.TextSize = 43.000
	mH.TextWrapped = true

	title.Name = "title"
	title.Parent = introClipper
	title.AnchorPoint = Vector2.new(0.5, 0.5)
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.5, 0, 0.75, 0)
	title.Size = UDim2.new(1, 0, 0.166666672, 0)
	title.Font = Enum.Font.SciFi
	title.Text = "mopsHub"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.TextSize = 43.000
	title.TextWrapped = true
	
	local tempTable,tweentime = {}, .5
	
	for _,v in pairs(introClipper:GetChildren()) do
		if v:IsA("Frame") then
			table.insert(tempTable,v)
		end
	end
	for _,v:Frame in pairs(tempTable) do
		if v.Name == "1" then
			TS:Create(v, TweenInfo.new(0), {Position = UDim2.new(-.5,0,-.5,0)}):Play()
		elseif v.Name == "2" then
			TS:Create(v, TweenInfo.new(0), {Position = UDim2.new(1.5,0,-0.5,0)}):Play()
		elseif v.Name == "3" then
			TS:Create(v, TweenInfo.new(0), {Position = UDim2.new(1.5,0,1.5,0)}):Play()
		elseif v.Name == "4" then
			TS:Create(v, TweenInfo.new(0), {Position = UDim2.new(-.5,0,1.5,0)}):Play()
		end
	end
	introClipper.mH.TextTransparency = 1
	introClipper.title.TextTransparency = 1
	introClipper.mH.Size = UDim2.new(1,0,1,0)
	TS:Create(introClipper.UIPadding, TweenInfo.new(0), {PaddingTop=UDim.new(0,1),PaddingBottom=UDim.new(0,1),PaddingLeft=UDim.new(0,1),PaddingRight=UDim.new(0,1)}):Play()
	task.wait(1.5)
	for _,v:Frame in pairs(tempTable) do
		if v.Name == "1" then
			TS:Create(v, TweenInfo.new(tweentime), {Position = UDim2.new(0,0,0,0)}):Play()
		elseif v.Name == "2" then
			TS:Create(v, TweenInfo.new(tweentime), {Position = UDim2.new(1,0,0,0)}):Play()
		elseif v.Name == "3" then
			TS:Create(v, TweenInfo.new(tweentime), {Position = UDim2.new(1,0,1,0)}):Play()
		elseif v.Name == "4" then
			TS:Create(v, TweenInfo.new(tweentime), {Position = UDim2.new(0,0,1,0)}):Play()
		end
		task.wait(tweentime)
	end
	TS:Create(introClipper.UIPadding, TweenInfo.new(.5), { PaddingTop=UDim.new(0,2), PaddingBottom=UDim.new(0,2), PaddingLeft=UDim.new(0,2), PaddingRight=UDim.new(0,2) }):Play()
	task.wait(.75)
	TS:Create(introClipper.mH, TweenInfo.new(.5), {TextTransparency=0}):Play()
	task.wait(1)
	TS:Create(introClipper.mH, TweenInfo.new(.5), {Size=UDim2.new(1, 0,0.729, 0)}):Play()
	TS:Create(introClipper.mH, TweenInfo.new(.5), {Position=UDim2.new(0, 0,0, 0)}):Play()
	TS:Create(introClipper.title, TweenInfo.new(.5), {TextTransparency=0}):Play()
	task.wait(2)
	TS:Create(introClipper, TweenInfo.new(.5), {Rotation=360}):Play()
	for _,v:Frame in pairs(tempTable) do
		if v:IsA("Frame") then
			TS:Create(v, TweenInfo.new(.5), {BackgroundTransparency = 1}):Play()
		end
	end
	TS:Create(introClipper.title, TweenInfo.new(.5), {TextTransparency=1}):Play()
	TS:Create(introClipper.mH, TweenInfo.new(.5), {TextTransparency=1}):Play()
end

return WindowTable
