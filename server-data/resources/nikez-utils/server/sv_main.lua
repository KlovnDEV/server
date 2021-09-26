local admin = false

RegisterNetEvent('adminCheck')
AddEventHandler('adminCheck', function(LastSteam)
    local steamid = false
     for k,v in pairs(GetPlayerIdentifiers(source))do        
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steamid = v
        print(steamid)
    
        LastSteam = steamid

        if steamid == 'steam:110000117808edd' then
            print('Welcome Nikez... HEX: '..steamid)
            admin = true
            print(admin)
        elseif steamid == 'steam:1100001116cf59a' then
            print('Welcome nikigot2... HEX: '..steamid)
            admin = true
            print(admin)
        else
            print('not niki or alex')
            admin = false
            print(admin)
        end
      end
  end
end)