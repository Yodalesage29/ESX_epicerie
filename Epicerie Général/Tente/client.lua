RegisterNetEvent("item")
AddEventHandler("item", function()
	Citizen.CreateThread(function()
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.95))
		local tents = {
		'prop_skid_tent_01',
		'prop_skid_tent_01b',
		'prop_skid_tent_03',
		}
		local randomint = math.random(1,3)
		local tent = GetHashKey(tents[randomint])
		local prop = CreateObject(tent, x, y, z, true, false, true)
		SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
		--PlaceObjectOnGroundProperly(prop)
	end)
	
end)

RegisterNetEvent("item2")
AddEventHandler("item2", function()
	Citizen.CreateThread(function()
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -0.95))
		local tents = {
		'prop_gazebo_02',
		}
		local randomint = math.random(1,3)
		local tent = GetHashKey(tents[randomint])
		local prop = CreateObject(tent, x, y, z, true, false, true)
		SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
		--PlaceObjectOnGroundProperly(prop)
	end)
	
end)

RegisterNetEvent("item3")
AddEventHandler("item3", function()
	Citizen.CreateThread(function()
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -0.95))
		local tents = {
		'prop_parasol_01_b',
		}
		local randomint = math.random(1,3)
		local tent = GetHashKey(tents[randomint])
		local prop = CreateObject(tent, x, y, z, true, false, true)
		SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
		--PlaceObjectOnGroundProperly(prop)
	end)
	
end)

RegisterNetEvent("item4")
AddEventHandler("item4", function()
	Citizen.CreateThread(function()
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -0.95))
		local tents = {
		'prop_bbq_1',
		}
		local randomint = math.random(1,3)
		local tent = GetHashKey(tents[randomint])
		local prop = CreateObject(tent, x, y, z, true, false, true)
		SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
		--PlaceObjectOnGroundProperly(prop)
	end)
	
end)