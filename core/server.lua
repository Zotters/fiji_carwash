NDCore = exports["ND_Core"]:GetCoreObject()



-- Removes cash if it's available if not returns an error. 
RegisterNetEvent("fiji:pay", function(args)
    local player = source
    local cost = args.cost
   -- local amount = Config.Settings.Price
   local success = nil
  local ped = NDCore.Functions.GetPlayer(source)

if cost > ped.cash then
    TriggerClientEvent('fiji:casherror', player)
    else 
    success = NDCore.Functions.DeductMoney(cost, player, "cash")
    TriggerClientEvent('fiji:wash', player)
  end
end)

