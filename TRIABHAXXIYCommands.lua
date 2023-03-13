local Plugin = {
    ["PluginName"] = "TRIABHAXX's endorsed commands",
    ["PluginDescription"] = "Endorsed commands, made by TRIABHAXX Co.",
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
        }
    }
}

return Plugin
