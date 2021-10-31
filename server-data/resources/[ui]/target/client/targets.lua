Citizen.CreateThread(function()
    local atms = {
        -1364697528,
        -1126237515,
        -870868698,
         506770882,
    }
    
    AddTargetModel(atms,{
      options = {
        {
            event = "np-target:atm",
            icon = "fas fa-credit-card",
            label = "Use ATM",
        },
    },
    distance = 1.5,
    job = {"all"}
    })
    
    AddBoxZone("PoliceDuty", vector3(441.79, -982.07, 30.69), 0.4, 0.6, {
	name="PoliceDuty",
	heading=91,
	debugPoly=true,
	minZ=30.79,
	maxZ=30.99
    }, {
        options = {
            {
                event = "signon",
                icon = "far fa-clipboard",
                label = "Sign On",
            },
            {
                event = "signoff",
                icon = "far fa-clipboard",
                label = "Sign Off",
            },
        },
        job = {"all"},
        distance = 1.5
    })
end)