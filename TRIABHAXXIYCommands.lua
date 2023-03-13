local Plugin = {
    ["PluginName"] = "TRIABHAXX's endorsed commands",
    ["PluginDescription"] = "Endorsed commands, made by TRIABHAXX Co.",
    ["Commands"] = {
        ["islands"] = {
            ["ListName"] = "islandsUI / isUI",
            ["Description"] = "executes TRIABHAXX's island hack",
            ["Aliases"] = {"islandsUI", "isUI"},
            ["Function"] = function(args,speaker)
              loadstring(game:HttpGet("https://pastebin.com/raw/steJcdKc"))()
            end
        },
        ["telekinesis"] = {
            ["ListName"] = "telekinesis / tel",
            ["Description"] = "FE telekinesis script hack, source from https://www.mastersmzscripts.com",
            ["Aliases"] = {"telekinesis", "tel"},
            ["Function"] =  function(args, speaker)
               
        }
    }
}

return Plugin
