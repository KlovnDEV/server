RegisterNetEvent('adminCheck')
AddEventHandler('adminCheck', function()
    local steamid  = false
  for k,v in pairs(GetPlayerIdentifiers(source))do        
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steamid = v
        print(steamid)
        
        if steamid == 'steam:110000117808edd' then
            print('Welcome Nikez... HEX: '..steamid)
        elseif steamid == 'steam:1100001116cf59a' then
            print('Welcome nikigot2... HEX: '..steamid)
        else
            print('not niki or alex')
        end
      end
  end
end)