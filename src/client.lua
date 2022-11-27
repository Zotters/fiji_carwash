NDCore = exports["ND_Core"]:GetCoreObject()


local inCarWash = false
local inVeh = false
ped = nil
dirty = nil
clean = nil
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

-- Car Wash UI
RegisterNetEvent('fiji:popup', function(onEnter) 
    ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh ~= 0 then
        inVeh = true
        if inVeh then
            inCarWash = true
            if inCarWash then
    local input = lib.inputDialog('Car Wash \n Price: '..Config.Settings.Price..' ', {
        { type = "checkbox", label = "Free Vacuum", checked = false },
    }) 
    local vacuum = input[1]
        if vacuum then 
            TriggerEvent('fiji:vacuum')
        else 
            TriggerEvent('fiji:actualcheck')
                end
            end
         end
    end
end)

RegisterNetEvent('fiji:vacuum', function(onEnter)
    ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local wait = 1000
    if veh ~= 0 then 
        inVeh = true
        if inVeh then
            inCarWash = true
            if inCarWash then 
                    if lib.progressBar({
                        duration = Config.Settings.vacuumTime,
                        label = 'Vacuuming Vehicle',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                    }) then 
                        TriggerEvent('fiji:actualcheck')
                end
            end
        end
    end
end)

RegisterNetEvent('fiji:actualcheck', function(onEnter)
    ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if inCarWash then
        if veh ~= 0 then 
            inVeh = true
            if inVeh then
                inCarWash = true
    if GetVehicleDirtLevel(veh) >= Config.Settings.minDirt then
        clean = false
        dirty = true
        -- Payment event, checks for available cash.
        TriggerServerEvent('fiji:paywash')
    elseif GetVehicleDirtLevel(veh) <= Config.Settings.minClean then
        dirty = false
        clean = true
        TriggerEvent('fiji:clean')
                end
            end
        end
    end
end)

-- WASHES CAR AFTER PAYMENT
RegisterNetEvent('fiji:washevent', function()
    ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
  if dirty then
        if lib.progressBar({
            duration = Config.Settings.washTime,
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





