local ver = "v0.3.12-beta"
local companyInfo = {
    Name = game:HttpGet("https://raw.githubusercontent.com/TheTryph/TRIABHAXX/main/additionalInfo/companyName.txt"),
    Date = game:HttpGet("https://raw.githubusercontent.com/TheTryph/TRIABHAXX/main/additionalInfo/companyDate.txt")
}

local installedMacros = {
    ["project_beatdown"] = function()
        function getStaminaPercent()
            local gui = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.BarFrame.StaminaFrame.Clip
            return gui.Size.X.Scale * 100
        end

        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

        while tool.Parent == game.Players.LocalPlayer.Character do
            if getStaminaPercent() > 94 then
                game:GetService("VirtualUser"):ClickButton1(Vector2.new(.5, .5))
            end
            wait(1)
        end
    end,
}

local installedScripts = {
    ["islands"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheTryph/TRIABHAXX/main/Source/islands.lua"))()
    end,
}

local Plugin = {
    ["PluginName"] = companyInfo.Name .. " commands",
    ["PluginDescription"] = "made by " .. companyInfo.Name .. " " .. companyInfo.Date .. ", " .. ver,
    ["Commands"] = {
        ["telekinesis"] = {
            ["ListName"] = "telekinesis / tel",
            ["Description"] = "FE telekinesis script hack, source from https://www.mastersmzscripts.com",
            ["Aliases"] = {"telekinesis", "tel"},
            ["Function"] = function(args, speaker)
                loadstring(game:HttpGet(
                    "https://raw.githubusercontent.com/TheTryph/TRIABHAXX/main/Source/telekinesis.lua"))()
            end
        },
        ["macro"] = {
            ["ListName"] = "macro / mcr",
            ["Description"] = "Executes various macros, check the current macros by using the command 'macros'",
            ["Aliases"] = {"macro", "mcr"},
            ["Function"] = function(args, speaker)
                installedMacros[args[1]]()
            end
        },
        ["getMacro"] = {
            ["ListName"] = "macros / gmcr",
            ["Description"] = "Shows you a list of currently available macros.",
            ["Aliases"] = {"macros", "gmcr"},
            ["Function"] = function(args, speaker)
                local stringToShow = "Currently installed macros: "
                for i,v in pairs(installedMacros) do
                    stringToShow = stringToShow .. i .. ", "
                end
                notify(stringToShow)
            end
        },
        ["gamescript"] = {
            ["ListName"] = "script / scr",
            ["Description"] = "Executes various scripts, check the currently installed scripts by using the command 'scripts'",
            ["Aliases"] = {"script", "scr"},
            ["Function"] = function(args, speaker)
                installedScripts[args[1]]()
            end
        },
        ["getScript"] = {
            ["ListName"] = "scripts / gscr",
            ["Description"] = "Shows you a list of currently available scripts.",
            ["Aliases"] = {"scripts", "gscr"},
            ["Function"] = function(args, speaker)
                local stringToShow = "Currently installed scripts: "
                for i,v in pairs(installedScripts) do
                    stringToShow = stringToShow .. i .. ", "
                end
                notify(stringToShow)
            end
        },
        ["createClouds"] = {
            ["ListName"] = "clouds / clds (CLIENT)",
            ["Description"] = "Creates ROBLOX's new volumetric clouds.",
            ["Aliases"] = {"clouds", "clds"},
            ["Function"] = function(args, speaker)
                if not workspace.Terrain:FindFirstChild("Clouds") then
                    Instance.new("Clouds", workspace.Terrain)
                    notify("Clouds added successfully!")
                else
                    notify("There are already clouds.")
                end
            end
        },
        ["removeClouds"] = {
            ["ListName"] = "noclouds / noclds (CLIENT)",
            ["Description"] = "Removes ROBLOX's new volumetric clouds.",
            ["Aliases"] = {"noclouds", "noclds"},
            ["Function"] = function(args, speaker)
                if workspace.Terrain:FindFirstChild("Clouds") then
                    workspace.Terrain.Clouds:Destroy()
                    notify("Clouds removed successfully!")
                else
                    notify("There are already no clouds.")
                end
            end
        },
        ["cloudsDensity"] = {
            ["ListName"] = "setcldsDensity [num] (CLIENT)",
            ["Description"] = "Sets ROBLOX's new volumetric clouds density.",
            ["Aliases"] = {"setcldsdensity"},
            ["Function"] = function(args, speaker)
                if workspace.Terrain:FindFirstChild("Clouds") then
                    workspace.Terrain.Clouds.Density = tonumber(args[1])
                    notify("Clouds density successfully set to: " .. args[1] .. "!")
                else
                    notify("There are no clouds.")
                end
            end
        },
        ["cloudsCover"] = {
            ["ListName"] = "setcldsCover [num] (CLIENT)",
            ["Description"] = "Sets ROBLOX's new volumetric clouds cover.",
            ["Aliases"] = {"setcldscover"},
            ["Function"] = function(args, speaker)
                if workspace.Terrain:FindFirstChild("Clouds") then
                    workspace.Terrain.Clouds.Cover = tonumber(args[1])
                    notify("Clouds cover successfully set to: " .. args[1] .. "!")
                else
                    notify("There are no clouds.")
                end

            end
        },
        ["cloudsColor"] = {
            ["ListName"] = "setcldsColor [R] [G] [B] (CLIENT)",
            ["Description"] = "Sets ROBLOX's new volumetric clouds color.",
            ["Aliases"] = {"setcldscolor"},
            ["Function"] = function(args, speaker)
                if workspace.Terrain:FindFirstChild("Clouds") then
                    workspace.Terrain.Clouds.Color = Color3.fromRGB(tonumber(args[1]), tonumber(args[2]),
                        tonumber(args[3]))
                    notify("Clouds color successfully set!")
                else
                    notify("There are no clouds.")
                end

            end
        },
        ["SetSkybox"] = {
            ["ListName"] = "skybox [ImageID] (CLIENT)",
            ["Description"] = "Creates a new skybox with the ImageID repeated on 6 sides.",
            ["Aliases"] = {"skybox"},
            ["Function"] = function(args, speaker)
                _G.isInSkybox = true
                if not game.ReplicatedStorage:FindFirstChild("ServerSky") then
                    local sky = game.Lighting:FindFirstChildOfClass("Sky")
                    if sky then
                        sky.Name = "ServerSky"
                        sky.Parent = game.ReplicatedStorage
                    end
                end

                local skyboxImageId = args[1] or 12245026315

                if game.Lighting:FindFirstChildOfClass("Sky") then
                    game.Lighting:FindFirstChildOfClass("Sky"):Destroy()
                end

                local Skybox = Instance.new("Sky", game.Lighting)
                Skybox.SkyboxBk = "rbxassetid://" .. tostring(skyboxImageId)
                Skybox.SkyboxDn = "rbxassetid://" .. tostring(skyboxImageId)
                Skybox.SkyboxFt = "rbxassetid://" .. tostring(skyboxImageId)
                Skybox.SkyboxUp = "rbxassetid://" .. tostring(skyboxImageId)
                Skybox.SkyboxLf = "rbxassetid://" .. tostring(skyboxImageId)
                Skybox.SkyboxRt = "rbxassetid://" .. tostring(skyboxImageId)

                notify("Skybox created successfully.")
            end
        },
        ["RestoreSkybox"] = {
            ["ListName"] = "restoreskybox / rskybox (CLIENT)",
            ["description"] = "Restores to the server's initial skybox.",
            ["Aliases"] = {"restoreskybox", "rskybox"},
            ["Function"] = function(args, speaker)
                if _G.isInSkybox == true then
                    _G.isInSkybox = false
                    game.Lighting:FindFirstChildOfClass("Sky"):Destroy()
                    if game.ReplicatedStorage:FindFirstChild("ServerSky") then
                        local sky = game.ReplicatedStorage:FindFirstChild("ServerSky")
                        sky.Parent = game.Lighting
                        sky.Name = "Sky"
                    end
                    notify("Skybox restored successfully.")
                else
                    notify("You have not added a new skybox.")
                end
            end
        },
        ["TRIABHAXXInfo"] = {
            ["ListName"] = "tinfo",
            ["description"] = "Information about the plugin",
            ["Aliases"] = {"tinfo"},
            ["Function"] = function(args, speaker)
                notify(
                    "Commands plugin made by " .. companyInfo.Name .. " " .. companyInfo.Date .. ", plugin version: " ..
                        ver .. ", Discord community server coming soon.")
            end
        }
    }
}

return Plugin
