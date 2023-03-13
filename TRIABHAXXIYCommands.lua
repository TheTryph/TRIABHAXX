local Plugin = {
    ["PluginName"] = "TRIABHAXX's commands",
    ["PluginDescription"] = "made by TRIABHAXX Co., v0.0.5-release",
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
        }
    }
}

return Plugin
