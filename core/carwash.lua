NDCore = exports["ND_Core"]:GetCoreObject()

-- [[ Car Wash Rebuilt ]] --

CreateThread(function()
    
    local player = PlayerPedId(-1)

    while true do
        local playerPos = GetEntityCoords(player, true)
        local onPoint = false  
       
        for _, coord in pairs(Locations) do   
        local dist = #(playerPos - vector3(coord.x, coord.y, coord.z))

        if dist <= 10.0 then
               DrawMarker(42, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 153, 153, 222, false, false, 0, true, false, false, false)
               if dist <= 2.0 then
                onPoint = true
               else
                checked = false
               end
            else 
            end
        
            if onPoint and not checked then
                TriggerEvent('fiji:deploy')
                checked = true
            end

        end
        Wait(0)
    end
end)

CreateThread(function()
    for _, info in pairs(Blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, 100)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, 0)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Car Wash')
        EndTextCommandSetBlipName(info.blip)
    end
end)















