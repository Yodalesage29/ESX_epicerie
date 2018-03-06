ESX                = nil
local PlayersHarvestingEau    = {}
local PlayersSellingEau 	  = {}
local PlayersHarvestingPain   = {}
local PlayersSellingPain      = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'epicerie', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'epicerie', _U('epicerie_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'epicerie', 'Epicerie', 'society_epicerie', 'society_epicerie', 'society_epicerie', {type = 'private'})


---Eau
local function HarvestEau(source)
  
  SetTimeout(2500, function()

    if PlayersHarvestingEau[source] == true then

      local xPlayer  = ESX.GetPlayerFromId(source)

      local eau = xPlayer.getInventoryItem('ceau')
	  local EauQuantity = xPlayer.getInventoryItem('ceau').count

      if EauQuantity >= 32 then
        TriggerClientEvent('esx:showNotification', source, _U('inv_full'))
      else
        xPlayer.addInventoryItem('ceau', 1)
        HarvestEau(source)
      end

    end
  end)
end

RegisterServerEvent('esx_epiceriejob:startHarvestEau')
AddEventHandler('esx_epiceriejob:startHarvestEau', function()

  local _source = source

  PlayersHarvestingEau[_source] = true

  TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

  HarvestEau(_source)

end)

RegisterServerEvent('esx_epiceriejob:stopHarvestEau')
AddEventHandler('esx_epiceriejob:stopHarvestEau', function()

  local _source = source

  PlayersHarvestingEau[_source] = false

end)

local function SellEau(source)

  SetTimeout(5000, function()

  	local societyAccount = nil

  	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_epicerie', function(account)
  		societyAccount = account
  	end)

    if PlayersSellingEau[source] == true and societyAccount ~= nil then

      local xPlayer  = ESX.GetPlayerFromId(source)

      local eauQuantity = xPlayer.getInventoryItem('ceau').count

      if eauQuantity == 0 then
        TriggerClientEvent('esx:showNotification', source, _U('no_eau_sale'))
      else
        xPlayer.removeInventoryItem('ceau', 1)
        xPlayer.addMoney(Config.PriceResell.eau)
        societyAccount.addMoney(Config.PriceResell.eau * 2)
        TriggerClientEvent('esx:showNotification', source, _U('sold_one_eau'))
		TriggerClientEvent('esx:showNotification', source, _U('earn_eau'))
		TriggerClientEvent('esx:showNotification', source, _U('earn_soci'))

        SellEau(source)
      end

    end
  end)
end

RegisterServerEvent('esx_epiceriejob:startSellEau')
AddEventHandler('esx_epiceriejob:startSellEau', function()

  local _source = source

  PlayersSellingEau[_source] = true

  TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

  SellEau(_source)

end)

RegisterServerEvent('esx_epiceriejob:stopSellEau')
AddEventHandler('esx_epiceriejob:stopSellEau', function()

  local _source = source

  PlayersSellingEau[_source] = false

end)

----Pain

local function HarvestPain(source)
  
  SetTimeout(2500, function()

    if PlayersHarvestingPain[source] == true then

      local xPlayer  = ESX.GetPlayerFromId(source)

      local pain = xPlayer.getInventoryItem('cpain')
	  local PainQuantity = xPlayer.getInventoryItem('cpain').count

      if PainQuantity >= 32 then
        TriggerClientEvent('esx:showNotification', source, _U('inv_full'))
      else
        xPlayer.addInventoryItem('cpain', 1)
        HarvestPain(source)
      end

    end
  end)
end

RegisterServerEvent('esx_epiceriejob:startHarvestPain')
AddEventHandler('esx_epiceriejob:startHarvestPain', function()

  local _source = source

  PlayersHarvestingPain[_source] = true

  TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

  HarvestPain(_source)

end)

RegisterServerEvent('esx_epiceriejob:stopHarvestPain')
AddEventHandler('esx_epiceriejob:stopHarvestPain', function()

  local _source = source

  PlayersHarvestingPain[_source] = false

end)

local function SellPain(source)

  SetTimeout(5000, function()

  	local societyAccount = nil

  	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_epicerie', function(account)
  		societyAccount = account
  	end)

    if PlayersSellingPain[source] == true and societyAccount ~= nil then

      local xPlayer  = ESX.GetPlayerFromId(source)

      local painQuantity = xPlayer.getInventoryItem('cpain').count

      if painQuantity == 0 then
        TriggerClientEvent('esx:showNotification', source, _U('no_pain_sale'))
      else
        xPlayer.removeInventoryItem('cpain', 1)
        xPlayer.addMoney(Config.PriceResell.pain)
        societyAccount.addMoney(Config.PriceResell.pain * 2)
        TriggerClientEvent('esx:showNotification', source, _U('sold_one_pain'))
		TriggerClientEvent('esx:showNotification', source, _U('earn_pain'))
		TriggerClientEvent('esx:showNotification', source, _U('earn_soci2'))

        SellPain(source)
      end

    end
  end)
end

RegisterServerEvent('esx_epiceriejob:startSellPain')
AddEventHandler('esx_epiceriejob:startSellPain', function()

  local _source = source

  PlayersSellingPain[_source] = true

  TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

  SellPain(_source)

end)

RegisterServerEvent('esx_epiceriejob:stopSellPain')
AddEventHandler('esx_epiceriejob:stopSellPain', function()

  local _source = source

  PlayersSellingPain[_source] = false

end)


RegisterServerEvent('esx_epiceriejob:getStockItem')
AddEventHandler('esx_epiceriejob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_epicerie', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_epiceriejob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_epicerie', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_epiceriejob:putStockItems')
AddEventHandler('esx_epiceriejob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_epicerie', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_epiceriejob:getFridgeStockItem')
AddEventHandler('esx_epiceriejob:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_epicerie_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_epiceriejob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_epicerie_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_epiceriejob:putFridgeStockItems')
AddEventHandler('esx_epiceriejob:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_epicerie_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_epiceriejob:buyItem')
AddEventHandler('esx_epiceriejob:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_epicerie', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty > limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


RegisterServerEvent('esx_epiceriejob:craftingCoktails')
AddEventHandler('esx_epiceriejob:craftingCoktails', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))

    if _itemValue == 'baguette' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('farine').count
            local bethQuantity      = xPlayer.getInventoryItem('levure').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('farine') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('levure') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('farine', 2)
                    xPlayer.removeInventoryItem('levure', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('baguette') .. ' ~w~!')
                    xPlayer.removeInventoryItem('farine', 2)
                    xPlayer.removeInventoryItem('levure', 1)
                    xPlayer.addInventoryItem('baguette', 1)
                end
            end

        end)
    end

    if _itemValue == 'cheeseburger' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('steak').count
            local bethQuantity      = xPlayer.getInventoryItem('salade').count
            local gimelQuantity     = xPlayer.getInventoryItem('fromage').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('steak') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('salade') .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('steak', 2)
                    xPlayer.removeInventoryItem('salade', 1)
                    xPlayer.removeInventoryItem('fromage', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('cheeseburger') .. ' ~w~!')
                    xPlayer.removeInventoryItem('steak', 2)
                    xPlayer.removeInventoryItem('salade', 1)
                    xPlayer.removeInventoryItem('fromage', 2)
                    xPlayer.addInventoryItem('cheeseburger', 1)
                end
            end

        end)
    end
    
    if _itemValue == 'coca cola' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('eau sucre').count
            local bethQuantity      = xPlayer.getInventoryItem('gaz').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('eau sucre') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('gaz') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('eau sucre', 2)
                    xPlayer.removeInventoryItem('gaz', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('coca cola') .. ' ~w~!')
                    xPlayer.removeInventoryItem('eau sucre', 2)
                    xPlayer.removeInventoryItem('gaz', 2)
                    xPlayer.addInventoryItem('coca cola', 1)
                end
            end

        end)
    end

    if _itemValue == 'redbull' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('soda').count
            local bethQuantity      = xPlayer.getInventoryItem('cafeine').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('soda') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('cafeine') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('soda', 2)
                    xPlayer.removeInventoryItem('cafeine', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('redbull') .. ' ~w~!')
                    xPlayer.removeInventoryItem('soda', 2)
                    xPlayer.removeInventoryItem('cafeine', 2)
                    xPlayer.addInventoryItem('redbull', 1)
                end
            end

        end)
    end

    if _itemValue == 'tacos' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('tomate').count
            local bethQuantity      = xPlayer.getInventoryItem('salade').count
            local gimelQuantity     = xPlayer.getInventoryItem('poulet grille').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomate') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('salade') .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('poulet grille') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('tomate', 2)
                    xPlayer.removeInventoryItem('salade', 2)
                    xPlayer.removeInventoryItem('poulet grille', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('tacos') .. ' ~w~!')
                    xPlayer.removeInventoryItem('tomate', 2)
                    xPlayer.removeInventoryItem('salade', 2)
                    xPlayer.removeInventoryItem('poulet grille', 1)
                    xPlayer.addInventoryItem('tacos', 1)
                end
            end

        end)
    end

    if _itemValue == 'ice tea' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('jusfruit').count
            local bethQuantity      = xPlayer.getInventoryItem('arome').count
            local gimelQuantity     = xPlayer.getInventoryItem('ice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('jusfruit') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('arome') .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ice') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('jusfruit', 2)
                    xPlayer.removeInventoryItem('arome', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('ice tea') .. ' ~w~!')
                    xPlayer.removeInventoryItem('jusfruit', 2)
                    xPlayer.removeInventoryItem('arome', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                    xPlayer.addInventoryItem('ice tea', 1) 
                end
            end

        end)
    end

    if _itemValue == 'pizza' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('farine').count
            local bethQuantity      = xPlayer.getInventoryItem('tomate').count
            local gimelQuantity     = xPlayer.getInventoryItem('fromage').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('farine') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomate') .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('farine', 2)
                    xPlayer.removeInventoryItem('tomate', 2)
                    xPlayer.removeInventoryItem('fromage', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza') .. ' ~w~!')
                    xPlayer.removeInventoryItem('farine', 2)
                    xPlayer.removeInventoryItem('tomate', 2)
                    xPlayer.removeInventoryItem('fromage', 1)
                    xPlayer.addInventoryItem('pizza', 1)
                end
            end

        end)
    end

    if _itemValue == 'magret de canard' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('canard').count
            local bethQuantity      = xPlayer.getInventoryItem('epice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('canard') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('epice') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('canard', 2)
                    xPlayer.removeInventoryItem('epice', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('magret de canard') .. ' ~w~!')
                    xPlayer.removeInventoryItem('canard', 2)
                    xPlayer.removeInventoryItem('epice', 2)
                    xPlayer.addInventoryItem('magret de canard', 1)
                end
            end

        end)
    end

    if _itemValue == 'kebab' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('salade').count
            local bethQuantity      = xPlayer.getInventoryItem('tomate').count
            local gimelQuantity     = xPlayer.getInventoryItem('oignon').count
            local daletQuantity      = xPlayer.getInventoryItem('poulet grille').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('salade') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomate') .. '~w~')
            elseif gimelQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('oignon') .. '~w~')
            elseif daletQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('poulet grille') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('salade', 2)
                    xPlayer.removeInventoryItem('tomate', 2)
                    xPlayer.removeInventoryItem('oignon', 2)
                    xPlayer.removeInventoryItem('poulet grille', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('kebab') .. ' ~w~!')
                    xPlayer.removeInventoryItem('salade', 2)
                    xPlayer.removeInventoryItem('tomate', 2)
                    xPlayer.removeInventoryItem('oignon', 2)
                    xPlayer.removeInventoryItem('poulet grille', 1)
                    xPlayer.addInventoryItem('kebab', 1)
                end
            end

        end)
    end

end)


ESX.RegisterServerCallback('esx_epiceriejob:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_epicerie', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_epiceriejob:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_epicerie', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_epiceriejob:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_epicerie', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_epiceriejob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)
