local Plugin = {
    ["PluginName"] = "TRIABHAXX's commands",
    ["PluginDescription"] = "made by TRIABHAXX Co., v0.1.0-release",
    ["Commands"] = {
        ["islands"] = {
            ["ListName"] = "islandsUI / isUI",
            ["Description"] = "executes TRIABHAXX's island hack",
            ["Aliases"] = {"islandsUI", "isUI"},
            ["Function"] = function(args,speaker)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheTryph/TRIABHAXX/main/Source/islands.lua"))()
            end
        },
        ["telekinesis"] = {
            ["ListName"] = "telekinesis / tel",
            ["Description"] = "FE telekinesis script hack, source from https://www.mastersmzscripts.com",
            ["Aliases"] = {"telekinesis", "tel"},
            ["Function"] =  function(args, speaker)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/TheTryph/TRIABHAXX/main/Source/telekinesis.lua"))()
            end
        },
        ["createClouds"] = {
            ["ListName"] = "clouds / clds",
            ["Description"] = "Creates ROBLOX's new volumetric clouds.",
            ["Aliases"] = {"clouds" , "clds"},
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
            ["ListName"] = "noclouds / noclds",
            ["Description"] = "Removes ROBLOX'S new volumetric clouds if found.",
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
            ["ListName"] = "setcldsDensity [num]",
            ["Description"] = "Sets ROBLOX'S new volumetric clouds density.",
            ["Aliases"] = {"setcldsDensity"},
            ["Function"] = function(args, speaker)
                if workspace.Terrain:FindFirstChild("Clouds") then
                    workspace.Terrain.Clouds.Density = args[1]
                    notify("Clouds density successfully set to: " .. args[1] .. "!")
                else
                    notify("There are no clouds.")
                end

            end
        },
        ["cloudsCover"] = {
            ["ListName"] = "setcldsCover [num]",
            ["Description"] = "Sets ROBLOX'S new volumetric clouds cover.",
            ["Aliases"] = {"setcldsCover"},
            ["Function"] = function(args, speaker)
                if workspace.Terrain:FindFirstChild("Clouds") then
                    workspace.Terrain.Clouds.Cover = args[1]
                    notify("Clouds cover successfully set to: " .. args[1] .. "!")
                else
                    notify("There are no clouds.")
                end

            end
        }
    }
}

return Plugin
