# fxserver-esx_epiceriejob

FXServer ESX Epicerie JOB

Crédit : 
Thanks to @Delduwaht#4029 (discord)

[REQUIREMENTS]

* Player management (billing and boss actions)
  * esx_society => https://github.com/ESX-Org/esx_society
  * esx_billing => https://github.com/ESX-Org/esx_billing

* Items effects (hunger, thirst, drunk)
  * esx_status => https://github.com/ESX-Org/esx_status
  * esx_basicneeds => https://github.com/ESX-Org/esx_basicneeds
  * esx_optionalsneeds => https://github.com/ESX-Org/esx_optionalneeds
  * Items and effects should be added separately in their appropriate files
  * You need to add animations + items effects (basicneeds, optionnalneeds) for an optimal experience


[INSTALLATION]

1) CD in your resources/[esx] folder



3) Import esx_epicerie.sql in your database

4) Add this in your server.cfg :

```
start esx_epicerie
```
5) If you want player management you have to set Config.EnablePlayerManagement to true in config.lua
   You can config VaultManagement & Helicopters with true/false (don't forget to comment the area in the same file)

6) If you want real onject, add items and effects in esx_basicneeds and esx_optionalsneeds.

Here are examples of what you could add:

esx_basicneeds\server\main.lua:
```lua
ESX.RegisterUsableItem('tent', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tent', 1)
	
	TriggerClientEvent('item', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tent'))
	
end)

ESX.RegisterUsableItem('tonnelle', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tonnelle', 1)
	
	TriggerClientEvent('item2', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tonnelle'))
	
end)

ESX.RegisterUsableItem('parasol', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('parasol', 1)
	
	TriggerClientEvent('item3', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_parasol'))
	
end)

ESX.RegisterUsableItem('barbecue', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('barbecue', 1)
	
	TriggerClientEvent('item4', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_barbecue'))
	
end)

ESX.RegisterUsableItem('baguette', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('baguette', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_baguette'))

end)

ESX.RegisterUsableItem('cheeseburger', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cheeseburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cheeseburger'))

end)

ESX.RegisterUsableItem('coca cola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coca cola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coca cola'))

end)

ESX.RegisterUsableItem('redbull', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('redbull', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 325000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_redbull'))

end)

ESX.RegisterUsableItem('ice tea', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ice tea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 275000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_ice tea'))

end)

ESX.RegisterUsableItem('tacos', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tacos', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 375000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tacos'))

end)

ESX.RegisterUsableItem('pizza', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza'))

end)

ESX.RegisterUsableItem('magret de canard', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('magret de canard', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_magret de canard'))

end)

ESX.RegisterUsableItem('kebab', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kebab', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kebab'))

end)
```


esx_basicneed\local\fr.lua:
```lua
['used_tent'] = 'Vous avez posé votre tente',
	['used_tonnelle'] = 'Vous avez posé votre Tonnelle',
	['used_parasol'] = 'Vous avez posé votre Parasol',
	['used_barbecue'] = 'Vous avez posé votre Barbecue',
	['used_baguette'] = 'Manger votre baguette',
	['used_cheeseburger'] = 'Vous mangez votre cheeseburger',
	['used_coca cola'] = 'Vous buvez votre coca',
	['used_redbull'] = 'Vous buvez votre redbull',
	['used_ice tea'] = 'Vous buvez votre ice tea',
	['used_pizza'] = 'Vous mangez votre pizza',
	['used_magret de canard'] = 'Vous mangez votre magret de canard',
	['used_kebab'] = 'Vous mangez votre kebab <3',
```

esx_basicneed\sql
```
INSERT INTO `items` (name, label) VALUES
	('tent', 'Tente'),
	('parasol', 'Parasol'),
	('tonnelle', 'Tonnelle'),
	('barbecue', 'Barbecue')
;
```

   
[FEATURES]

* Epicerie job
  * Fully customizable job
  * Boss action, grade of employe
  * Cloakroom, Vault, Fridge, Vehicles, BossActions
  * Shops (harvesting)
  * Crafting menu for Bosses
  * Spawning car without dust
  * Teleport marker to be behind the bar
  * Players can miss the crafting part (~10% miss) and lose the components used
  * Billing menu
  * Item which can use
