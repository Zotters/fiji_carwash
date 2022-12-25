-- [[ Fiji Car Wash V1.1 -- Extended Update -- For settings visit config.lua ]]
NDCore = exports["ND_Core"]:GetCoreObject()

local check = false
local inVeh = false
local detailed = nil
local basic = nil
local rinse = nil
local ped = PlayerPedId()
veh = GetVehiclePedIsIn(ped)
dirty = nil
clean = nil




-- [[ Start Event ]] --
RegisterNetEvent('fiji:deploy', function()
        local settings = Config.Settings.UI
        local debug = Config.Settings.debug
        local inVeh = false

        if veh ~= 0 then
        inVeh = true
        check = true
        if check then
            dirtCheck()
        if inVeh and settings then
                 TriggerEvent('fiji:uideploy') -- Interface boot
            else
                -- DO SOMETHING IF UI DISABLED
                end
            end
        end
end)


-- [[ Interface ]] -- 
lib.registerContext({
    id = 'carwash',
    title = 'Car Wash',
    onExit = function()
    end,
    options = {
        {
            title = ' '..carWash.Settings.rinseCost..' - Rinse',
            icon = 'dollar-sign',
            arrow = true,
            event = 'fiji:rinse',
            args  = {
                cost = carWash.Settings.rinseCost, 
                wash = 1,
            },
        },
        {
            title = ' '..carWash.Settings.basicCost.. ' - Basic Wash',
            icon = 'dollar-sign',
            arrow = true,
            event = 'fiji:basic',
            args =  {
                cost = carWash.Settings.basicCost, 
                wash = 2,
            },
        },
        {
            title = ' '..carWash.Settings.detailedCost.. ' - Detailed Wash',
            icon = 'dollar-sign',
            arrow = true,
            event = 'fiji:detailed',
            args =  {
                cost = carWash.Settings.detailedCost, 
                wash = 3,
            },
        }
    }
})


-- [[ UI DEPLOY ]] -- 
RegisterNetEvent('fiji:uideploy', function()
    if dirty then
    lib.showContext('carwash')
    else 
    TriggerEvent('fiji:cleanerror')
    end
end)
-- [[ Different Wash Events ]] -- 
RegisterNetEvent('fiji:rinse', function(args)
    if dirty then
       rinse = true
        basic = false
        detailed = false
    TriggerServerEvent('fiji:pay', args)
    end
end)
RegisterNetEvent('fiji:basic', function(args)
    if dirty then
        basic = true
        rinse = false
        detailed = false
    TriggerServerEvent('fiji:pay', args)
    end
end)
RegisterNetEvent('fiji:detailed', function(args)
    if dirty then
        detailed = true
        basic = false
        rinse = false
    TriggerServerEvent('fiji:pay', args)
    end
end)
RegisterNetEvent('fiji:wash', function(args) 
    if dirty then
        if rinse then
        washRinse()
        elseif basic then
        washBasic()
        elseif detailed then
        washDetailed()
        end
    end
end)


-- [[ ERROR NOTIFICATIONS ]]
RegisterNetEvent('fiji:casherror', function()
    lib.notify({
        id = 'fiji_error',
        title = 'Car Wash',
        description = 'You do not have enough cash',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
        icon = 'dollar-sign',
        iconColor = '#C53030'
    })
end)

RegisterNetEvent('fiji:cleanerror', function()
    if clean then
    lib.notify({
        id = 'fiji_error',
        title = 'Car Wash',
        description = 'Vehicle already clean!',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
        icon = 'ban',
        iconColor = '#C53030'
    })
end
end)

--[[ FUNCTIONS ]]--
function dirtCheck()
    if GetVehicleDirtLevel(veh) >= carWash.Settings.minDirt then
        clean  = false
        dirty = true
    elseif GetVehicleDirtLevel(veh) < carWash.Settings.minDirt then
        dirty = false
        clean = true
    end
end

function washRinse()
    local sleep = 1000
    if rinse then 
        local rinsed = false
        if lib.progressBar({
            duration = carWash.Settings.rinseTime,
            label = 'Rinsing vehicle',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        }) then
            lib.notify({
                id = 'fiji_rinseerror',
                title = 'Car Wash',
                description = carWash.Settings.rinseNoti,
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
                icon = carWash.Settings.cWicon,
                iconColor = '#C53030'
            })
            if GetVehicleDirtLevel(veh) < carWash.Settings.rinseLevel then
                local dirt = GetVehicleDirtLevel(veh)
                SetVehicleDirtLevel(veh, dirt)
            elseif GetVehicleDirtLevel(veh) > carWash.Settings.rinseLevel then
                SetVehicleDirtLevel(veh, carWash.Settings.rinseLevel)
            end
        end
    end
end

function washBasic()
    local sleep = 1000
    if basic then 
        local rinsed = false
        if lib.progressBar({
            duration = carWash.Settings.basicTime,
            label = 'Washing vehicle',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        }) then
            lib.notify({
                id = 'fiji_basicerror',
                title = 'Car Wash',
                description = carWash.Settings.basicNoti,
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
                icon = carWash.Settings.cWicon,
                iconColor = '#C53030'
            })
            if GetVehicleDirtLevel(veh) < carWash.Settings.rinseLevel then
                local dirt = GetVehicleDirtLevel(veh)
                SetVehicleDirtLevel(veh, dirt)
            elseif GetVehicleDirtLevel(veh) > carWash.Settings.rinseLevel then
                SetVehicleDirtLevel(veh, carWash.Settings.rinseLevel)
            end
        end
    end
end

function washDetailed()
    if detailed then 
    local sleep = 1000
        if GetVehicleDirtLevel(veh) > carWash.Settings.detailedLevel then
            if lib.progressBar({
                duration = carWash.Settings.detailTime,
                label = 'Detailing',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
            }) then
                SetVehicleDirtLevel(veh, carWash.Settings.detailedLevel)
                    Wait(sleep)
                lib.notify({
                    id = 'fiji_detailed',
                    title = 'Car Wash',
                    description = carWash.Settings.detailNoti,
                    position = 'top',
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                    icon = 'car-side',
                    iconColor = '#C53030'
                })
            end
        end
    end
end

