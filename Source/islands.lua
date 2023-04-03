local HackCode = "TRIABHAXX"
local outdateDate = "04/10/2023"

function unpackDate(date)
	date = string.split(date, "/")
	return {
		Month = tonumber(date[1]),
		Day = tonumber(date[2]),
		Year = tonumber(date[3]),
	}
end

function outdateCheck()
	local dateTable = unpackDate(outdateDate)
	local now = DateTime.now()
	now = now:ToLocalTime()
	if now.Day >= dateTable.Day and now.Month >= dateTable.Month and now.Year >=  dateTable.Year then
		return true
	else
		return false
	end
end

local StarterGui = game:GetService("StarterGui")



local function sendMessageToChat(text)
	StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = text
	})
end

local function sendMessagesToChat(tabla)
	for i,v in pairs(tabla) do
		sendMessageToChat(v)
	end
end

if outdateCheck() == true then
	sendMessageToChat("Exploit is outdated since " .. outdateDate)
	sendMessageToChat("Exploit may not work as intended.")
end


StarterGui:SetCore("SendNotification", {
	Title = "TRIABHAXX Co. AutoFarm Islands",
	Text = "Script has loaded successfully.",
	Duration = 1000,
	Button1 = "Confirm",
})


if _G.TriabHack then
	for i,v in pairs(_G.TriabHack.Connections) do
		v:Disconnect()
	end
end

_G.TriabHack = {
	Connections = {},
	EnabledHacks = {}
}

if game.Workspace:FindFirstChild(HackCode) then game.Workspace:FindFirstChild(HackCode):Destroy() end 

local futileInstance = Instance.new("Accessory", workspace)

futileInstance.Name = HackCode
local RS = game:GetService("RunService")
task.spawn(function()
	while workspace:FindFirstChild(HackCode) do 
		if game.Players.LocalPlayer.Character:FindFirstChild("axe", true) then
			for i,v in pairs(workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 20)) do
					if v.Parent.Name == "Blocks" and v:FindFirstChild("RockStage") then
						task.defer(function ()
							local ohTable1 = {
								["player_trackingcategory"] = "join_from_web",
								["part"] = v["1"],
								["block"] = v,
								["norm"] = v.Position,
								["pos"] = v.Position,
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(ohTable1)
						end)
						
					end
					if v.Parent.Name == "WildernessBlocks" then
						task.defer(function()
							local ohTable1 = {
								["player_trackingcategory"] = "join_from_web",
								["part"] = v["1"],
								["block"] = v,
								["norm"] = v.Position,
								["pos"] = v.Position,
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(ohTable1)
						end)
						
					end
					if v.Parent.Name == "Blocks" and v:FindFirstChild("trunk") then
						task.defer(function()
						local ohTable1 = {
							["player_tracking_category"] = "join_from_web",
							["part"] = v.trunk,
							["block"] = v,
							["norm"] = v.Position,
							["pos"] = v.Position
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(ohTable1)
						end)
					end
				if v:FindFirstChild("Chest") then
					for i,item in pairs(v.Contents:GetChildren()) do
						task.defer(function()
								

							local ohTable1 = {
								["chest"] = v,
								["player_tracking_category"] = "join_from_web",
								["amount"] = item.Amount.Value,
								["tool"] = item,
								["action"] = "withdraw"
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(ohTable1)
						end)
					end
				end
				if v:FindFirstChild("stage") and v.stage.Value >= 3 then 
					task.defer(function()
						local vName = v.Name
						local vFrame = v.CFrame
						local ohTable1 = {
							["player"] = game:GetService("Players").LocalPlayer,
							["player_tracking_category"] = "join_from_web",
							["model"] = v
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(ohTable1)

						task.wait()
						local ohTable2 = {
							["upperBlock"] = false,
							["cframe"] = vFrame,
							["player_tracking_category"] = "join_from_web",
							["blockType"] = vName
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(ohTable2)
								
					end)
				end
			end
		end
		wait(.1)
	end
end)

task.spawn(function()
	while workspace:FindFirstChild(HackCode) do
		if game.Players.LocalPlayer.Character:FindFirstChild("sword", true) then
			for i,v in pairs(game.Workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 20)) do
				if v.Parent.Parent.Name == "Entities" then
					task.spawn(function ()
						local ohString1 = "11377BD2-6BF3-4D3F-B483-B85E10E9E3BB"
						local ohTable2 = {
							[1] = {
								["crit"] = false,
								["hitUnit"] = v.Parent
							}
						}

					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["dmivxondrwd/oqurspv"]:FireServer(ohString1, ohTable2)
					end)
					
					
				end
			end
		end
		wait(.1)
	end
end)

local vu = game:GetService("VirtualUser")
_G.TriabHack.Connections.AFKSCRIPT = game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


sendMessagesToChat({"[HACKINFO]: Equip any pickaxe you have to start:",
"1- Auto Chest Collect",
"2- Auto Crop Farm",
"3- Auto Ore Farm Aura",
"4- Auto Tree Farm Aura"})

sendMessagesToChat({"[HACKINFO]: Equip any melee (light or heavy) to start KillAura",
"[HACKINFO]: Anti AFK Script also included, don't worry about it", "Credits go to The_Trypha. Created using Hydroxyde and Secure Dex."})