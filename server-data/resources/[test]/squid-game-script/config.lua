Config = {}

Config.Locale = "en" -- Language "en" "ru"

Config.Fee = 0 -- How much money cost to participate in game
Config.StartPoint = vector3(2084.704, 3363.02, 45.91064) -- Lobby point
Config.EnablePlayerNPCs = true -- Spawns NPC's

Config.DollyWatchingRandomTime = {1000, 2000, 3000, 4000, 5000, 6000, 7000} -- Doll watching time in milliseconds (random)
Config.GameDuration = 2 * 60 * 1000 -- Game duration is 2 minutes
Config.GameStartInterval = 1 * 60 * 1000 -- Game automatically starts every 1 minute

-- Player spawns when game starts, finish and guards position
Config.SpawnCoords = {
    GameStarted = {
        vector3(-253.1465, -3276.012, 290.00985),
        vector3(1127.96, 7151.004, 20.40002),
        vector3(1152.963, 7154.185, 20.40002),
        vector3(1171.701, 7153.426, 20.41687),
        vector3(1167.864, 7152.598, 20.41687),
        vector3(1167.864, 7153.598, 20.41687),
        vector3(1166.004, 7153.13, 20.41687),
        vector3(1162.378, 7152.657, 20.41687),
        vector3(1157.96, 7152.495, 20.41687),
        vector3(1153.714, 7152.525, 20.41687),
        vector3(1150.246, 7155.571, 20.41687),
        vector3(1153.714, 7153.525, 20.41687),
        vector3(1150.246, 7152.571, 20.41687),
        vector3(1144.312, 7152.281, 20.41687),
        vector3(1140.659, 7154.158, 20.41687),
        vector3(1137.692, 7152.323, 20.41687),
        vector3(1134.501, 7153.053, 20.41687),
        vector3(1132.167, 7151.033, 20.41687),
        vector3(1129.068, 7153.512, 20.41687),
        vector3(1124.36, 7153.883, 20.41687),
        vector3(1165.464, 7154.336, 20.41687),
        vector3(1170.382, 7154.213, 20.41687),
    },
    GameFinished = {
        vector3(1723.16, 3214.826, 42.82715),
        vector3(1717.556, 3225.191, 41.74878),
        vector3(1729.094, 3223.978, 42.22046),
    },
    GuardsNPC = {
        vector3(1143.029, 7252.681, 20.41687),
        vector3(1150.029, 7252.681, 20.41687),
    },
}


-- Clothes https://forum.cfx.re/t/release-paid-squid-game-clothing-pack-optimisation/
-- Guidline: https://forum.cfx.re/t/squid-game-level-1-esx-qbcore-standalone/4768952/31?u=draobrehtom
Config.PlayerOutfits = {
    ["male"] = {
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {75, 0},

            [1] = {38, 0}, -- MASK: vMenu values 2 and 39
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {75, 1},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {75, 2},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {75, 3},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },

        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {74, 0},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {74, 1},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {74, 2},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {74, 3},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },

        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {0, 0},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {0, 1},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {0, 2},

            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
        {
            [4] = {5, 0},
            [6] = {43, 0},
            [8] = {0, 0},
            [11] = {0, 3},
            
            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
    },
    ["female"] = {
        {
            [4] = {66, 0},
            [6] = {80, 0},
            [8] = {2, 0},
            [11] = {147, 0},
            
            [1] = {0, 0},
            [2] = {0, 0},
            [3] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
    }
}

-- Guard clothes, credits https://de.gta5-mods.com/player/squid-game-mask-for-mp-male-sp-fivem
Config.GuardOutfits = {
    {
        [1] = {4, 0},
        [4] = {19, 0}, -- b1608 {19, 0}, b2189 {122, 0}, 
        [3] = {16, 0},
        [11] = {65, 0},
        [6] = {25, 0}, -- b1608 {25, 0}, b2189 {97, 0},
        [8] = {15, 0},
    },
    {
        [1] = {4, 1},
        [4] = {19, 0}, 
        [3] = {16, 0},
        [11] = {65, 0},
        [6] = {25, 0},
        [8] = {15, 0},

    },
    {
        [1] = {4, 2},
        [4] = {19, 0}, 
        [3] = {16, 0},
        [11] = {65, 0},
        [6] = {25, 0},
        [8] = {15, 0},
    },
}

-- When the game ends player will be respawned naked
Config.GameOverOutfits = {
    ["male"] = {
        {
            [3] = {15, 0},
            [4] = {61, 0},
            [6] = {34, 0},
            [8] = {15, 0},
            [11] = {15, 0},
    
            [1] = {0, 0},
            [2] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
    },
    ["female"] = {
        {
            [3] = {4, 0},
            [4] = {17, 0},
            [6] = {35, 0},
            [8] = {2, 0},
            [11] = {5, 0},
    
            [1] = {0, 0},
            [2] = {0, 0},
            [5] = {0, 0},
            [7] = {0, 0},
            [9] = {0, 0},
            [10] = {0, 0},
        },
    },
}

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- Variables bellow are only for devs, 
-- but you can try to change it if you want to experiment
-- just make a backup of files.
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
Config.DollyCoords = vector3(1147.029, 7252.681, 20.41687) -- Doll position
Config.DollyIsWatchingHeading = 0.0 -- Angle of the Doll when she is watching
Config.DollyIsNotWatchingHeading = 180.0 -- Angle of the Doll when she is not watching
Config.GunCoords = { -- Gun positions where shoots are comming from
    vector3(1117.00500000, 7154.95200000, 32.22739000),
    vector3(1116.89100000, 7176.52800000, 32.16578000),
    vector3(1116.89100000, 7214.59300000, 32.16578000),
    vector3(1117.00500000, 7193.01700000, 32.22739000),
    vector3(1177.62300000, 7249.56900000, 32.16578000),
    vector3(1177.70200000, 7227.99300000, 32.22739000),
    vector3(1177.70200000, 7190.06200000, 32.22739000),
    vector3(1177.62300000, 7211.63800000, 32.16578000),
    vector3(1177.70200000, 7152.09800000, 32.22739000),
    vector3(1177.62300000, 7173.67500000, 32.16578000),
    vector3(1117.00500000, 7230.30600000, 32.22739000),
    vector3(1116.89100000, 7251.88100000, 32.16578000),
}

-- Auto plug-in framework. See `server/framework.lua` for API.

if GetResourceState('es_extended') == 'started' or GetResourceState('extendedmode') == 'started' then -- ESX
    Config.Framework = "ESX"
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif GetResourceState('qb-core') == 'started' then -- QBCore
    Config.Framework = "QB"
	TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
elseif GetResourceState('veles') == 'started' then -- Renamed ESX
    Config.Framework = "ESX"
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif GetResourceState('Your_Framework') == 'started' then -- Your_Framework
    Config.Framework = "Your_Framework"
else -- Standalone
    Config.Framework = "standalone"
end