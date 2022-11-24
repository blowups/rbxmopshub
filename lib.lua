--[[

mopsHub UI Libary
IN WORK

]]

local UIS = game:GetService('UserInputService')
local TS = game:GetService("TweenService")
local WindowTable = {}

--> Check for duplicates
if game["Run Service"]:IsStudio() then
	for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
		if v.Name == "mopshubui" then
			v:Destroy()
		end
	end
else
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v.Name == "mopshubui" then
			v:Destroy()
		end
	end
end

--> Create Window Function
function WindowTable:CreateWindow(args)
	local WindowTitle = tostring(args.title) or "Untitled Hub"
	local gameName = tostring(args.gameName) or game.Name or "-"

	local mopshubui = Instance.new("ScreenGui")
	local introClipper = Instance.new("Frame")
	local _1 = Instance.new("Frame")
	local _2 = Instance.new("Frame")
	local _3 = Instance.new("Frame")
	local _4 = Instance.new("Frame")
	local UIPadding = Instance.new("UIPadding")
	local mH = Instance.new("TextLabel")
	local title = Instance.new("TextLabel")

	mopshubui.Name = "mopshubui"
	if game["Run Service"]:IsStudio() then
		mopshubui.Parent = game.Players.LocalPlayer.PlayerGui
	else
		mopshubui.Parent = game.CoreGui
	end
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
	mH.TextTransparency = 1
	title.TextTransparency = 1
	mH.Size = UDim2.new(1,0,1,0)
	TS:Create(UIPadding, TweenInfo.new(0), {PaddingTop=UDim.new(0,1),PaddingBottom=UDim.new(0,1),PaddingLeft=UDim.new(0,1),PaddingRight=UDim.new(0,1)}):Play()
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
	TS:Create(UIPadding, TweenInfo.new(.5), { PaddingTop=UDim.new(0,2), PaddingBottom=UDim.new(0,2), PaddingLeft=UDim.new(0,2), PaddingRight=UDim.new(0,2) }):Play()
	task.wait(.75)
	TS:Create(mH, TweenInfo.new(.5), {TextTransparency=0}):Play()
	task.wait(1)
	TS:Create(mH, TweenInfo.new(.5), {Size=UDim2.new(1, 0,0.729, 0)}):Play()
	TS:Create(mH, TweenInfo.new(.5), {Position=UDim2.new(0, 0,0, 0)}):Play()
	TS:Create(title, TweenInfo.new(.5), {TextTransparency=0}):Play()
	task.wait(2)
	TS:Create(introClipper, TweenInfo.new(.5), {Rotation=360}):Play()
	for _,v:Frame in pairs(tempTable) do
		if v:IsA("Frame") then
			TS:Create(v, TweenInfo.new(.5), {BackgroundTransparency = 1}):Play()
		end
	end
	TS:Create(title, TweenInfo.new(.5), {TextTransparency=1}):Play()
	TS:Create(mH, TweenInfo.new(.5), {TextTransparency=1}):Play()
	task.wait(1)
	introClipper:Destroy()

	local hub = Instance.new("Frame")
	hub.Name = "hub"
	hub.AnchorPoint = Vector2.new(0.5, 0.5)
	hub.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	hub.BorderSizePixel = 0
	hub.ClipsDescendants = true
	hub.Position = UDim2.fromScale(0.15, 0.5)
	hub.Size = UDim2.fromOffset(447, 280)

	local title = Instance.new("TextLabel")
	title.Name = "title"
	title.Text = WindowTitle.. gameName
	title.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")
	title.TextColor3 = Color3.fromRGB(177, 177, 177)
	title.TextSize = 18
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.BorderSizePixel = 0
	title.Size = UDim2.fromOffset(447, 31)

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 10)
	uIPadding.PaddingRight = UDim.new(0, 10)
	uIPadding.Parent = title

	local div = Instance.new("Frame")
	div.Name = "div"
	div.AnchorPoint = Vector2.new(0.5, 1)
	div.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	div.BorderSizePixel = 0
	div.Position = UDim2.fromScale(0.5, 1)
	div.Size = UDim2.fromOffset(427, 1)
	div.Parent = title

	title.Parent = hub

	local hbtns = Instance.new("Frame")
	hbtns.Name = "hbtns"
	hbtns.AnchorPoint = Vector2.new(1, 0)
	hbtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	hbtns.BackgroundTransparency = 1
	hbtns.BorderSizePixel = 0
	hbtns.Position = UDim2.fromScale(1, 0)
	hbtns.Size = UDim2.fromOffset(116, 30)

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "UIListLayout"
	uIListLayout.FillDirection = Enum.FillDirection.Horizontal
	uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = hbtns

	local min = Instance.new("TextButton")
	min.Name = "min"
	min.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	min.Text = "_"
	min.TextColor3 = Color3.fromRGB(177, 177, 177)
	min.TextSize = 14
	min.TextWrapped = true
	min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	min.BackgroundTransparency = 1
	min.BorderSizePixel = 0
	min.Size = UDim2.fromOffset(30, 30)
	min.Parent = hbtns

	local close = Instance.new("TextButton")
	close.Name = "close"
	close.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	close.Text = "X"
	close.TextColor3 = Color3.fromRGB(177, 177, 177)
	close.TextSize = 14
	close.TextWrapped = true
	close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	close.BackgroundTransparency = 1
	close.BorderSizePixel = 0
	close.Size = UDim2.fromOffset(30, 30)
	close.Parent = hbtns

	hbtns.Parent = hub

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.Color = Color3.fromRGB(31, 31, 31)
	uIStroke.Parent = hub

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 2)
	uICorner.Parent = hub

	local main = Instance.new("Frame")
	main.Name = "main"
	main.AnchorPoint = Vector2.new(0, 0.5)
	main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	main.BackgroundTransparency = 1
	main.BorderSizePixel = 0
	main.Position = UDim2.fromScale(0, 0.556)
	main.Size = UDim2.fromOffset(447, 248)
	main.ZIndex = 2

	local tabs = Instance.new("Frame")
	tabs.Name = "tabs"
	tabs.AnchorPoint = Vector2.new(0, 0.5)
	tabs.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	tabs.BackgroundTransparency = 1
	tabs.BorderSizePixel = 0
	tabs.Position = UDim2.fromScale(0, 0.5)
	tabs.Size = UDim2.fromOffset(99, 238)
	tabs.ZIndex = 2

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 2)
	uICorner1.Parent = tabs

	local div1 = Instance.new("Frame")
	div1.Name = "div"
	div1.AnchorPoint = Vector2.new(1, 0.5)
	div1.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	div1.BorderSizePixel = 0
	div1.Position = UDim2.fromScale(1, 0.5)
	div1.Size = UDim2.fromOffset(1, 238)
	div1.Parent = tabs

	local list = Instance.new("Frame")
	list.Name = "list"
	list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	list.BackgroundTransparency = 1
	list.BorderSizePixel = 0
	list.Size = UDim2.fromOffset(99, 238)

	local uIListLayout1 = Instance.new("UIListLayout")
	uIListLayout1.Name = "UIListLayout"
	uIListLayout1.Padding = UDim.new(0, 3)
	uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout1.Parent = list

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingRight = UDim.new(0, 5)
	uIPadding1.Parent = list

	list.Parent = tabs

	tabs.Parent = main

	local uIPadding2 = Instance.new("UIPadding")
	uIPadding2.Name = "UIPadding"
	uIPadding2.PaddingBottom = UDim.new(0, 5)
	uIPadding2.PaddingLeft = UDim.new(0, 5)
	uIPadding2.PaddingRight = UDim.new(0, 5)
	uIPadding2.PaddingTop = UDim.new(0, 5)
	uIPadding2.Parent = main

	local tabsf = Instance.new("Frame")
	tabsf.Name = "tabsf"
	tabsf.AnchorPoint = Vector2.new(0.5, 0.5)
	tabsf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabsf.BackgroundTransparency = 1
	tabsf.BorderSizePixel = 0
	tabsf.ClipsDescendants = true
	tabsf.Position = UDim2.fromScale(0.62, 0.5)
	tabsf.Size = UDim2.fromOffset(331, 238)

	local uIPageLayout = Instance.new("UIPageLayout")
	uIPageLayout.Name = "UIPageLayout"
	uIPageLayout.EasingDirection = Enum.EasingDirection.InOut
	uIPageLayout.EasingStyle = Enum.EasingStyle.Cubic
	uIPageLayout.Padding = UDim.new(0, 15)
	uIPageLayout.TweenTime = 0.5
	uIPageLayout.FillDirection = Enum.FillDirection.Vertical
	uIPageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIPageLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uIPageLayout.Parent = tabsf

	local uIPadding3 = Instance.new("UIPadding")
	uIPadding3.Name = "UIPadding"
	uIPadding3.PaddingBottom = UDim.new(0, 5)
	uIPadding3.PaddingTop = UDim.new(0, 5)
	uIPadding3.Parent = tabsf

	tabsf.Parent = main

	main.Parent = hub
	
	local closed, inanim = false, false
	close.MouseButton1Click:Connect(function()
		if not closed then
			closed = not closed
			local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(200,280)})
			t:Play()
			inanim = true
			t.Completed:Wait()
			local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(200,0)})
			t:Play()
			t.Completed:Wait()
			hub.Visible = false
			inanim = false
		end
	end)
	
	UIS.InputBegan:Connect(function(Input, IsTyping)
		if IsTyping or inanim then return end
		if Input.KeyCode == Enum.KeyCode.RightControl then
			if closed then
				closed = not closed
				hub.Visible = true
				local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(200,280)})
				t:Play()
				inanim = true
				t.Completed:Wait()
				local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(447,280)})
				t:Play()
				t.Completed:Wait()
				inanim = false
			else
				closed = not closed
				local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(200,280)})
				t:Play()
				inanim = true
				t.Completed:Wait()
				local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(200,0)})
				t:Play()
				t.Completed:Wait()
				hub.Visible = false
				inanim = false
			end
		end
	end)
	
	local minimized, inanim2 = false, false
	min.MouseButton1Click:Connect(function()
		if inanim2 or inanim then return end
		if not minimized then
			minimized = not minimized
			local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(447,30)})
			t:Play()
			inanim2 = true
			t.Completed:Wait()
			inanim2 = false
		else
			minimized = not minimized
			local t = TS:Create(hub, TweenInfo.new(.5), {Size = UDim2.fromOffset(447,280)})
			t:Play()
			inanim2 = true
			t.Completed:Wait()
			inanim2 = false
		end
	end)
	
	local gui = hub
	local dragging
	local dragInput
	local dragStart
	local startPos
	local mouse = game.Players.LocalPlayer:GetMouse()
	local x,y = mouse.ViewSizeX, mouse.ViewSizeY
	local function update(input)
		local delta = input.Position - dragStart
		TS:Create(gui, TweenInfo.new(.2), {Position=UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
	end
	title.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	main.Parent = hub
	hub.Parent = mopshubui

	title.Text = WindowTitle or "mopsHub"

	local TabHandler,tabs,selectedtab = {},0,0

	function TabHandler:CreateTab(args)
		local TabTitle = args.tabtitle or "Unknown Tab"
		local btn = Instance.new("TextButton")
		local tab = Instance.new("ScrollingFrame")
		tabs+=1;

		tab.Name = "tab"
		tab.AutomaticCanvasSize = Enum.AutomaticSize.Y
		tab.BottomImage = "rbxassetid://11619264876"
		tab.CanvasSize = UDim2.new(0,0,0,0)
		tab.LayoutOrder = tabs-1
		tab.MidImage = "rbxassetid://11619264876"
		tab.ScrollBarImageTransparency = 0.95
		tab.ScrollBarThickness = 2
		tab.TopImage = "rbxassetid://11619264876"
		tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tab.BackgroundTransparency = 1
		tab.BorderSizePixel = 0
		tab.ClipsDescendants = false
		tab.Selectable = false
		tab.Size = UDim2.fromScale(1, 1)
		tab.SelectionGroup = false

		local uIListLayout = Instance.new("UIListLayout")
		uIListLayout.Name = "UIListLayout"
		uIListLayout.Padding = UDim.new(0, 5)
		uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uIListLayout.Parent = tab

		local uIPadding = Instance.new("UIPadding")
		uIPadding.Name = "UIPadding"
		uIPadding.PaddingLeft = UDim.new(0, 5)
		uIPadding.PaddingRight = UDim.new(0, 5)
		uIPadding.Parent = tab

		btn.Name = "tbtn:"..TabTitle
		btn.FontFace = Font.new(
			"rbxasset://fonts/families/RobotoMono.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		btn.Text = TabTitle
		btn.TextColor3 = Color3.fromRGB(177, 177, 177)
		btn.TextSize = 11
		btn.TextWrapped = true
		btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		btn.BackgroundTransparency = 1
		btn.BorderSizePixel = 0
		btn.Size = UDim2.new(1, 0, 0, 30)
		btn.AutoButtonColor = false

		local uICorner = Instance.new("UICorner")
		uICorner.Name = "UICorner"
		uICorner.CornerRadius = UDim.new(0, 3)
		uICorner.Parent = btn

		btn.MouseEnter:Connect(function()
			TS:Create(btn,TweenInfo.new(.5),{BackgroundTransparency=.95}):Play()
		end);btn.MouseLeave:Connect(function()
			TS:Create(btn,TweenInfo.new(.5),{BackgroundTransparency=1}):Play()
		end);btn.MouseButton1Down:Connect(function()
			TS:Create(btn,TweenInfo.new(.25),{BackgroundTransparency=.8}):Play()
		end);btn.MouseButton1Up:Connect(function()
			TS:Create(btn,TweenInfo.new(.25),{BackgroundTransparency=.95}):Play()
		end);btn.MouseButton1Click:Connect(function()
			uIPageLayout:JumpToIndex(tab.LayoutOrder)
		end)

		btn.Parent = list
		tab.Parent = tabsf

		local ElementsHandler = {}

		function ElementsHandler:CreateLabel(args)
			local LabelText = args.LabelText or "Untitled Label"

			local label = Instance.new("TextLabel")
			label.Name = "Label"
			label.Text = LabelText
			label.FontFace = Font.new(
				"rbxasset://fonts/families/RobotoMono.json",
				Enum.FontWeight.Bold,
				Enum.FontStyle.Normal
			)
			label.TextColor3 = Color3.fromRGB(177, 177, 177)
			label.TextSize = 14
			label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			label.BackgroundTransparency = 1
			label.BorderSizePixel = 0
			label.Size = UDim2.new(1, 0, 0, 25)

			local uICorner = Instance.new("UICorner")
			uICorner.Name = "UICorner"
			uICorner.CornerRadius = UDim.new(0, 1)
			uICorner.Parent = label

			local div = Instance.new("Frame")
			div.Name = "div"
			div.AnchorPoint = Vector2.new(0.5, 1)
			div.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			div.BorderSizePixel = 0
			div.Position = UDim2.fromScale(0.5, 1)
			div.Size = UDim2.new(1, 0, 0, 1)
			div.Parent = label

			label.Parent = tab
		end

		function ElementsHandler:CreateButton(args, callback)
			local ButtonText = args.btnText or "Untitled Button"
			callback = callback or function() end

			local tbtn = Instance.new("TextButton")
			tbtn.Name = "tbtn"
			tbtn.Text = ButtonText
			tbtn.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")
			tbtn.TextColor3 = Color3.fromRGB(177, 177, 177)
			tbtn.TextSize = 14
			tbtn.TextWrapped = true
			tbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tbtn.BackgroundTransparency = 1
			tbtn.BorderSizePixel = 0
			tbtn.LayoutOrder = 1
			tbtn.Position = UDim2.fromScale(0, 0)
			tbtn.Size = UDim2.new(1, 0, 0, 30)

			local uICorner = Instance.new("UICorner")
			uICorner.Name = "UICorner"
			uICorner.CornerRadius = UDim.new(0, 3)
			uICorner.Parent = tbtn

			tbtn.MouseEnter:Connect(function()
				TS:Create(tbtn,TweenInfo.new(.5),{BackgroundTransparency=.95}):Play()
			end);tbtn.MouseLeave:Connect(function()
				TS:Create(tbtn,TweenInfo.new(.5),{BackgroundTransparency=1}):Play()
			end);tbtn.MouseButton1Down:Connect(function()
				TS:Create(tbtn,TweenInfo.new(.25),{BackgroundTransparency=.8}):Play()
			end);tbtn.MouseButton1Up:Connect(function()
				TS:Create(tbtn,TweenInfo.new(.25),{BackgroundTransparency=.95}):Play()
			end);tbtn.MouseButton1Click:Connect(function()
				local _callbackState, _callbackError = pcall(function()callback();end)
				if not _callbackState and _callbackError then
					return error(string.format("[mopsHub Callback Error]: %s", _callbackError or "unknown error"))
				end
			end)

			tbtn.Parent = tab
		end

		function ElementsHandler:CreateToggle(args, callback)
			local toggleText = args.toggleText or "Untitled Toggle"
			callback = callback or function() end

			local tgbtn = Instance.new("Frame")
			tgbtn.Name = "tgbtn"
			tgbtn.Active = true
			tgbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tgbtn.BackgroundTransparency = 1
			tgbtn.BorderSizePixel = 0
			tgbtn.LayoutOrder = 1
			tgbtn.Position = UDim2.fromScale(0, -0.0219)
			tgbtn.Selectable = true
			tgbtn.Size = UDim2.new(1, 0, 0, 30)

			local uICorner = Instance.new("UICorner")
			uICorner.Name = "UICorner"
			uICorner.CornerRadius = UDim.new(0, 3)
			uICorner.Parent = tgbtn

			local uIPadding = Instance.new("UIPadding")
			uIPadding.Name = "UIPadding"
			uIPadding.PaddingBottom = UDim.new(0, 5)
			uIPadding.PaddingLeft = UDim.new(0, 10)
			uIPadding.PaddingRight = UDim.new(0, 5)
			uIPadding.PaddingTop = UDim.new(0, 5)
			uIPadding.Parent = tgbtn

			local title = Instance.new("TextLabel")
			title.Name = "title"
			title.Text = toggleText
			title.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")
			title.TextColor3 = Color3.fromRGB(177, 177, 177)
			title.TextSize = 14
			title.TextXAlignment = Enum.TextXAlignment.Left
			title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			title.BackgroundTransparency = 1
			title.BorderSizePixel = 0
			title.Size = UDim2.fromScale(0.805, 1)
			title.Parent = tgbtn

			local toggle = Instance.new("TextButton")
			toggle.Name = "toggle"
			toggle.Text = ""
			toggle.TextTransparency = 1
			toggle.AutoButtonColor = false
			toggle.Active = false
			toggle.AnchorPoint = Vector2.new(1, 0.5)
			toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggle.BackgroundTransparency = 0.95
			toggle.BorderSizePixel = 0
			toggle.Position = UDim2.fromScale(1, 0.5)
			toggle.Selectable = false
			toggle.Size = UDim2.fromScale(0.161, 0.9)

			local uICorner1 = Instance.new("UICorner")
			uICorner1.Name = "UICorner"
			uICorner1.CornerRadius = UDim.new(0, 3)
			uICorner1.Parent = toggle

			local item = Instance.new("Frame")
			item.Name = "item"
			item.AnchorPoint = Vector2.new(0, 0.5)
			item.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
			item.BorderSizePixel = 0
			item.Position = UDim2.fromScale(0, 0.5)
			item.Size = UDim2.fromScale(0.5, 1)

			local uICorner2 = Instance.new("UICorner")
			uICorner2.Name = "UICorner"
			uICorner2.CornerRadius = UDim.new(0, 2)
			uICorner2.Parent = item

			item.Parent = toggle

			local uIPadding1 = Instance.new("UIPadding")
			uIPadding1.Name = "UIPadding"
			uIPadding1.PaddingBottom = UDim.new(0, 3)
			uIPadding1.PaddingLeft = UDim.new(0, 3)
			uIPadding1.PaddingRight = UDim.new(0, 3)
			uIPadding1.PaddingTop = UDim.new(0, 3)
			uIPadding1.Parent = toggle

			local t,ntcolor, tcolor = false, Color3.fromRGB(120, 120, 120), Color3.fromRGB(203, 203, 203)

			toggle.MouseButton1Click:Connect(function()
				t = not t
				if t then
					TS:Create(item, TweenInfo.new(.35), {AnchorPoint=Vector2.new(1, 0.5), Position=UDim2.new(1,0,.5,0),BackgroundColor3=tcolor}):Play()
				else
					TS:Create(item, TweenInfo.new(.35), {AnchorPoint=Vector2.new(0, 0.5), Position=UDim2.new(0,0,.5,0),BackgroundColor3=ntcolor}):Play()
				end
				local _callbackState, _callbackError = pcall(function()callback(t);end)
				if not _callbackState and _callbackError then
					return error(string.format("[mopsHub Callback Error]: %s", _callbackError or "unknown error"))
				end
			end)

			toggle.Parent = tgbtn
			tgbtn.Parent = tab
		end
		
		function ElementsHandler:CreateCheckbox(args, callback)
			local checkboxText = args.checkboxText or "Untitled Checkbox"
			callback = callback or function() end
			
			local checkbox = Instance.new("Frame")
			checkbox.Name = "checkbox"
			checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			checkbox.BackgroundTransparency = 1
			checkbox.BorderSizePixel = 0
			checkbox.Size = UDim2.new(1, 0, 0, 30)

			local text = Instance.new("TextLabel")
			text.Name = "text"
			text.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")
			text.Text = checkboxText
			text.TextColor3 = Color3.fromRGB(177, 177, 177)
			text.TextSize = 14
			text.TextXAlignment = Enum.TextXAlignment.Left
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1
			text.BorderSizePixel = 0
			text.Position = UDim2.fromScale(0.0171, 0)
			text.Size = UDim2.fromOffset(265, 28)
			text.Parent = checkbox

			local box = Instance.new("Frame")
			box.Name = "box"
			box.AnchorPoint = Vector2.new(1, 0.5)
			box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			box.BackgroundTransparency = 0.95
			box.BorderSizePixel = 0
			box.ClipsDescendants = true
			box.Position = UDim2.fromScale(1, 0.5)
			box.Size = UDim2.fromOffset(20, 20)

			local uICorner = Instance.new("UICorner")
			uICorner.Name = "UICorner"
			uICorner.CornerRadius = UDim.new(0, 3)
			uICorner.Parent = box

			local uIPadding = Instance.new("UIPadding")
			uIPadding.Name = "UIPadding"
			uIPadding.PaddingBottom = UDim.new(0, 3)
			uIPadding.PaddingLeft = UDim.new(0, 3)
			uIPadding.PaddingRight = UDim.new(0, 3)
			uIPadding.PaddingTop = UDim.new(0, 3)
			uIPadding.Parent = box

			local check = Instance.new("TextButton")
			check.Name = "check"
			check.Text = ""
			check.TextStrokeTransparency = 0
			check.AutoButtonColor = false
			check.Active = false
			check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			check.BackgroundTransparency = .999
			check.BorderSizePixel = 0
			check.Selectable = false
			check.Size = UDim2.fromScale(1, 1)

			local uICorner1 = Instance.new("UICorner")
			uICorner1.Name = "UICorner"
			uICorner1.CornerRadius = UDim.new(0, 3)
			uICorner1.Parent = check

			check.Parent = box

			box.Parent = checkbox
			checkbox.Parent = tab
			
			local checked = false
			
			check.MouseEnter:Connect(function()
				if not checked then return end
				TS:Create(check,TweenInfo.new(.5),{BackgroundTransparency=.5}):Play()
			end);check.MouseLeave:Connect(function()
				if not checked then return end
				TS:Create(check,TweenInfo.new(.5),{BackgroundTransparency=.7}):Play()
			end);check.MouseButton1Down:Connect(function()
				if not checked then return end
				TS:Create(check,TweenInfo.new(.25),{BackgroundTransparency=.35}):Play()
			end);check.MouseButton1Up:Connect(function()
				if checked then
					TS:Create(check,TweenInfo.new(.25),{BackgroundTransparency=.5}):Play()
				else
					TS:Create(check,TweenInfo.new(.25),{BackgroundTransparency=.999}):Play()
				end
			end);check.MouseButton1Click:Connect(function()
				checked = not checked
				if checked then
					TS:Create(check,TweenInfo.new(.35),{BackgroundTransparency=.999}):Play()
				else
					TS:Create(check,TweenInfo.new(.35),{BackgroundTransparency=.7}):Play()
				end
				local _callbackState, _callbackError = pcall(function()callback(checked);end)
				if not _callbackState and _callbackError then
					return error(string.format("[mopsHub Callback Error]: %s", _callbackError or "unknown error"))
				end
			end)
		end
		
		function ElementsHandler:CreateSlider(args, callback)
			local sliderText = args.sliderText or "Untitled Slider"
			local min,max = args.min or 0,args.max or 10
			callback = callback or function() end
			
			local mouse = game.Players.LocalPlayer:GetMouse()
			local Value
			
			local sframe = Instance.new("Frame")
			sframe.Name = "sframe"
			sframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			sframe.BackgroundTransparency = 1
			sframe.BorderSizePixel = 0
			sframe.Size = UDim2.new(1, 0, 0, 30)

			local slider = Instance.new("TextButton")
			slider.Name = "Slider"
			slider.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			slider.Text = ""
			slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			slider.TextSize = 14
			slider.AutoButtonColor = false
			slider.AnchorPoint = Vector2.new(1, 0.5)
			slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slider.BackgroundTransparency = 0.95
			slider.BorderSizePixel = 0
			slider.Position = UDim2.fromScale(1, 0.5)
			slider.Size = UDim2.fromOffset(150, 6)

			local indicator = Instance.new("Frame")
			indicator.Name = "Indicator"
			indicator.BackgroundColor3 = Color3.fromRGB(177, 177, 177)
			indicator.BorderSizePixel = 0
			indicator.Size = UDim2.fromScale(0, 1)

			local uICorner = Instance.new("UICorner")
			uICorner.Name = "UICorner"
			uICorner.CornerRadius = UDim.new(0, 2)
			uICorner.Parent = indicator

			local holderButton = Instance.new("TextLabel")
			holderButton.Name = "HolderButton"
			holderButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			holderButton.Text = ""
			holderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			holderButton.TextSize = 14
			holderButton.AnchorPoint = Vector2.new(0.5, 0.5)
			holderButton.BackgroundColor3 = Color3.fromRGB(177, 177, 177)
			holderButton.BorderSizePixel = 0
			holderButton.Position = UDim2.fromScale(1, 0.5)
			holderButton.Size = UDim2.new(0, 10, 1, 0)

			local uICorner1 = Instance.new("UICorner")
			uICorner1.Name = "UICorner"
			uICorner1.CornerRadius = UDim.new(0, 3)
			uICorner1.Parent = holderButton

			local value = Instance.new("TextLabel")
			value.Name = "Value"
			value.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json")
			value.Text = "0"
			value.TextColor3 = Color3.fromRGB(255, 255, 255)
			value.TextSize = 14
			value.TextTransparency = 1
			value.AnchorPoint = Vector2.new(0.5, 0.5)
			value.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
			value.BackgroundTransparency = 1
			value.BorderSizePixel = 0
			value.Position = UDim2.fromScale(0.5, -2.3)
			value.Size = UDim2.fromOffset(36, 18)

			local uICorner2 = Instance.new("UICorner")
			uICorner2.Name = "UICorner"
			uICorner2.CornerRadius = UDim.new(0, 3)
			uICorner2.Parent = value

			value.Parent = holderButton

			local arrowPointingDown = Instance.new("TextLabel")
			arrowPointingDown.Name = "ArrowPointingDown"
			arrowPointingDown.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json")
			arrowPointingDown.Text = ""
			arrowPointingDown.TextColor3 = Color3.fromRGB(255, 255, 255)
			arrowPointingDown.TextSize = 14
			arrowPointingDown.AnchorPoint = Vector2.new(0.5, 0.5)
			arrowPointingDown.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
			arrowPointingDown.BackgroundTransparency = 1
			arrowPointingDown.BorderSizePixel = 0
			arrowPointingDown.Position = UDim2.fromScale(0.5, -1.6)
			arrowPointingDown.Rotation = 45
			arrowPointingDown.Size = UDim2.fromOffset(13, 13)
			arrowPointingDown.ZIndex = 0

			local uICorner3 = Instance.new("UICorner")
			uICorner3.Name = "UICorner"
			uICorner3.CornerRadius = UDim.new(0, 3)
			uICorner3.Parent = arrowPointingDown

			arrowPointingDown.Parent = holderButton

			holderButton.Parent = indicator

			indicator.Parent = slider

			local uICorner4 = Instance.new("UICorner")
			uICorner4.Name = "UICorner"
			uICorner4.CornerRadius = UDim.new(0, 2)
			uICorner4.Parent = slider

			local value1 = Instance.new("IntValue")
			value1.Name = "Value"
			value1.Parent = slider

			local uIGradient = Instance.new("UIGradient")
			uIGradient.Name = "UIGradient"
			uIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
			})
			uIGradient.Parent = slider

			slider.Parent = sframe

			local text = Instance.new("TextLabel")
			text.Name = "text"
			text.Text = sliderText
			text.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")
			text.TextColor3 = Color3.fromRGB(177, 177, 177)
			text.TextSize = 14
			text.TextXAlignment = Enum.TextXAlignment.Left
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1
			text.BorderSizePixel = 0
			text.Position = UDim2.fromScale(0.0171, 0)
			text.Size = UDim2.fromOffset(154, 28)
			text.Parent = sframe
			
			local Dragging = false
			local lastValue = nil
			
			local function Update()
				if Dragging == true then
					local MousePos = UIS:GetMouseLocation()
					local MinPoint = (slider.AbsolutePosition.X)
					local MaxPoint = (slider.AbsolutePosition.X + slider.AbsoluteSize.X)

					if MousePos.X < MinPoint then
						slider.Indicator:TweenSize(UDim2.fromScale(0, 1), "Out", "Sine", 0.1, true)
					elseif MousePos.X > MaxPoint then
						slider.Indicator:TweenSize(UDim2.fromScale(1, 1), "Out", "Sine", 0.1, true)
					else
						slider.Indicator:TweenSize(UDim2.fromScale((MousePos.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 1), "Out", "Sine", 0.1, true)
					end
					task.wait(0.1)
					local Percent = (slider.Indicator.HolderButton.AbsolutePosition.X - slider.AbsolutePosition.X) / (slider.AbsoluteSize.X - slider.Indicator.HolderButton.Size.X.Offset) * max
					slider.Value.Value = Percent
					if math.floor(slider.Value.Value) < min then
						slider.Value.Value = min
					elseif math.floor(slider.Value.Value) > max then
						slider.Value.Value = max
					end
					slider.Indicator.HolderButton.Value.Text = tostring(math.floor(slider.Value.Value))
				end
			end

			slider.MouseEnter:Connect(function()
				if Dragging == false then
					TS:Create(holderButton, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
				end
			end)

			slider.MouseLeave:Connect(function()
				if Dragging == false then
					TS:Create(holderButton, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(190, 190, 190)}):Play()
				end	
			end)

			slider.MouseButton1Down:Connect(function()
				Dragging = true
				--TS:Create(slider.Indicator.HolderButton, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
				TS:Create(slider.Indicator.HolderButton.Value, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
				TS:Create(slider.Indicator.HolderButton.ArrowPointingDown, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				Update()
			end)

			UIS.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					Dragging = false
					--TS:Create(slider.Indicator.HolderButton, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(190, 190, 190)}):Play()
					TS:Create(slider.Indicator.HolderButton.Value, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
					TS:Create(slider.Indicator.HolderButton.ArrowPointingDown, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					if not (lastValue == slider.Value.Value) then
						lastValue = slider.Value.Value
						callback(slider.Value.Value)
					end
				end
			end)

			UIS.InputChanged:Connect(Update)

			local Percent = (slider.Indicator.HolderButton.AbsolutePosition.X - slider.AbsolutePosition.X) / (slider.AbsoluteSize.X - slider.Indicator.HolderButton.Size.X.Offset) * max

			if math.floor(slider.Value.Value) < min then
				slider.Value.Value = min
			elseif math.floor(slider.Value.Value) > max then
				slider.Value.Value = max
			end

			slider.Indicator.HolderButton.Value.Text = tostring(math.floor(slider.Value.Value))
			
			sframe.Parent = tab
		end


		return ElementsHandler
	end

	return TabHandler
end

return WindowTable
