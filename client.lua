NDCore = exports["ND_Core"]:GetCoreObject()

--  Multi Zone Integration

local Wash1 = 
    BoxZone:Create(vector3(-699.99, -932.35, 19.01), 5.2, 10.6, {
        name = "Wash1",
        heading = 270,
       -- debugPoly = false, -- Found in Config
        minZ = 18.01,
        maxZ = 22.01
      })

local Wash2 = 
    BoxZone:Create(vector3(21.07, -1391.84, 29.31), 4.6, 30.6, {
    name = "Wash2",
    heading = 0,
    --debugPoly = true, -- Found in Config
     minZ = 28.31,
     maxZ = 32.31
  })
     
local carWash = ComboZone:Create({Wash1, Wash2}, {name="carWash", debugPoly = Zones.Settings.debug})
local inCarWash = false
local inVeh = false
ped = nil
dirty = nil
washing = nil

-- Blips
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


-- Zone check, Player in Vehicle Check, Payment Trigger
carWash:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if isPointInside then
        ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped)
        -- This checks if player is in a vehicle before giving zone options.
        if veh ~= 0 then 
            inVeh = true
        if inVeh then
       -- Beginning of zone options.
        inCarWash = true
        if inCarWash then
            -- Vehicle dirty level check - Values in Config 0.0-15.0
            if GetVehicleDirtLevel(veh) >= Config.Settings.minDirt then
                clean = false
                dirty = true 
                TriggerServerEvent('fiji:paywash')
            elseif GetVehicleDirtLevel(veh) <= Config.Settings.minClean then
                dirty = false
                clean = true
                TriggerEvent('fiji:clean')
            end
            end 
        end
    end
end
end)

carWash:onPlayerInOut(function(isPointInside, point)
    inCarWash = isPointInside
end)

CreateThread(function()
    while true do
        ped = PlayerPedId()
        local coord = GetEntityCoords(ped)
        inCarWash = carWash:isPointInside(coord)
        Wait(wait)
    end
end)


--[[ EVENTS ]]

-- WASHES CAR AFTER PAYMENT
RegisterNetEvent('fiji:washevent', function()
    ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
  if dirty then
        if lib.progressBar({
            duration = 3000,
            label = 'Washing Vehicle',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
            },
        }) then 
            SetVehicleDirtLevel(veh, Config.Settings.washLevel)  
            Wait(wait)
            lib.notify({
                id = 'Wash',
                title = 'Car Wash',
                description = 'You have washed your vehicle!',
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
                icon = 'car',
                iconColor = '#20fc03'
            })

        end
        end
    
end)

-- NOT ENOUGH CASH
RegisterNetEvent('fiji:washfail', function()
    local wait = 250
    Wait(wait)
    lib.notify({
        id = 'Wash',
        title = 'Car Wash',
        description = 'You do not have enough cash!',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
        icon = 'money-bill',
        iconColor = '#eb4034'
    })
end)

-- ALREADY CLEAN
RegisterNetEvent('fiji:clean', function() 
if clean then 
    lib.notify({
        id = 'Washd',
        title = 'Car Wash',
        description = 'Your vehicle is already clean!',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
        icon = 'car',
        iconColor = '#20fc03'
    })
end
end)





