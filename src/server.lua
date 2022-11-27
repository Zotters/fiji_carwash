NDCore = exports["ND_Core"]:GetCoreObject()

-- Removes cash if it's available if not returns an error. 
RegisterNetEvent("fiji:paywash", function(amount)
    local player = source
    local amount = Config.Settings.Price
   local success = nil
  local ped = NDCore.Functions.GetPlayer(source)
   local canAfford = Config.Settings.Price >= 0 and ped.cash >= Config.Settings.Price

   if canAfford then
    success = NDCore.Functions.DeductMoney(Config.Settings.Price, player, "cash") 
    TriggerClientEvent("fiji:washevent", player)
   else
        TriggerClientEvent("fiji:washfail", player)
    end
end)

