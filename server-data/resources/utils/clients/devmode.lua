RegisterNetEvent("np-admin:devmode")
AddEventHandler("np-admin:devmode", function(devmodeToggle)
	devmodetoggle = not devmodetoggle
    if devmodetoggle then
        RPC.execute('client', 'np-admin:currentDevmode', true)
    else
        RPC.execute('client', 'np-admin:currentDevmode', false)
    end
end)