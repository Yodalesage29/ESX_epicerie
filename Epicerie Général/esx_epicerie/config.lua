Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.PriceResell                = {eau = 4, pain = 5}
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'mule',     label = 'Véhicule de transport' },
	{ name = 'baller3',  label = 'Véhicule de vente' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = -3036.246, y = 590.363, z = 7.501 },
      Sprite  = 52,
      Display = 4,
      Scale   = 2.2,
      Colour  = 69,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -3045.111, y = 585.221, z = 7.188 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 0, b = 255 },
        Type  = 27,
    },

    Vaults = {
        Pos   = { x = -3047.406, y = 585.753, z = 7.188 },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 0, g = 0, b = 255 },
        Type  = 23,
    },

    --Fridge = {
    --    Pos   = { x = -3047.478, y = 589.615, z = 7.189 },
    --    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    --    Color = { r = 0, g = 0, b = 255 },
    --    Type  = 23,
    --},

    Vehicles = {
        Pos          = { x = -3050.177, y = 591.757, z = 7.371 },
        SpawnPoint   = { x = -3041.436, y = 603.095, z = 7.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    VehicleDeleters = {
        Pos   = { x = -3055.203, y = 609.573, z = 7.196 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
	
	EauFarm = {
        Pos   = { x = 45.128, y = 6301.310, z = 31.109 },
        Size  = { x = 3.0001, y = 3.0001, z = 1.0001 },
        Color = { r = 0, g = 155, b = 255, a = 160},
        Type  = 0,
    },
	
	EauResell = {
        Pos   = { x = 1702.952, y = 4916.665, z = 42.134 },
        Size  = { x = 1.0001, y = 1.0001, z = 1.0001 },
        Color = { r = 0, g = 155, b = 255, a = 160},
        Type  = 0,
    },
	
	PainFarm = {
        Pos   = { x = -752.128, y = -2569.310, z = 13.109 },
        Size  = { x = 3.0001, y = 3.0001, z = 1.0001 },
        Color = { r = 0, g = 155, b = 255, a = 160},
        Type  = 0,
    },
	
	PainResell = {
        Pos   = { x = 372.952, y = 340.665, z = 103.134 },
        Size  = { x = 1.0001, y = 1.0001, z = 1.0001 },
        Color = { r = 0, g = 155, b = 255, a = 160},
        Type  = 0,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = -3046.951, y = 582.021, z = 7.168 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------

    Flacons = {
        Pos   = { x = 1168.242, y = -2973.897, z = 5.041 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'levure',      label = _U('levure'),   price = 1 },
            { name = 'cafeine',      label = _U('cafeine'),   price = 3 },
            { name = 'gaz',       label = _U('gaz'),    price = 1 },
            { name = 'soda',     label = _U('soda'),  price = 2 },
            { name = 'eau sucre',    label = _U('eau sucre'), price = 1 },
            { name = 'farine',    label = _U('farine'), price = 2 }
        },
    },

    NoAlcool = {
        Pos   = { x = -2506.028, y = 3614.467, z = 13.192 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'salade',        label = _U('salade'),     price = 1 },
            { name = 'tomate',    label = _U('tomate'), price = 2 },
            { name = 'ice',      label = _U('ice'),   price = 2 },
            { name = 'arome',      label = _U('arome'),   price = 1 },
            { name = 'epice',    label = _U('epice'), price = 1 },
            { name = 'oignon',    label = _U('oignon'), price = 2 }
        },
    },

    Apero = {
        Pos   = { x = 969.675, y = -2109.498, z = 31.095 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'steak',   label = _U('steak'),    price = 2 },
            { name = 'poulet grille',    label = _U('poulet grille'),     price = 3 },
            { name = 'canard',     label = _U('canard'),      price = 3 },
            { name = 'fromage',        label = _U('fromage'),         price = 2 }
        },
    },

    Ice = {
        Pos   = { x = 2685.979, y = 3464.457, z = 56.117 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'tent',     label = _U('tent'),      price = 5 },
            { name = 'tonnelle',  label = _U('tonnelle'),   price = 5 },
			{ name = 'parasol',  label = _U('parasol'),   price = 5 },
			{ name = 'barbecue',  label = _U('barbecue'),   price = 5 }
        },
    },

}


-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = 132.608, y = -1293.978, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 126.742, y = -1278.386, z = 28.569 }
  },

  ExitBuilding = {
    Pos       = { x = 132.517, y = -1290.901, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 131.175, y = -1295.598, z = 28.569 },
  },

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Epicerie = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 43,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 11,
        ['pants_1'] = 4,   ['pants_2'] = 0,
        ['shoes_1'] = 1,   ['shoes_2'] = 15,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 8,    ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 5,
        ['pants_1'] = 1,   ['pants_2'] = 4,
        ['shoes_1'] = 0,    ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 2
    }
  },
  dancer_outfit_1 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 111,   ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 24,   ['pants_2'] = 0,
        ['shoes_1'] = 30,   ['shoes_2'] = 1,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 22,   ['pants_2'] = 0,
        ['shoes_1'] = 18,   ['shoes_2'] = 0,
        ['chain_1'] = 61,   ['chain_2'] = 1
    }
  },
  dancer_outfit_2 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 62,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 1,
        ['pants_1'] = 4,    ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 20,   ['pants_2'] = 2,
        ['shoes_1'] = 18,   ['shoes_2'] = 2,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_3 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 4,    ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 19,   ['pants_2'] = 1,
        ['shoes_1'] = 19,   ['shoes_2'] = 3,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_4 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 61,   ['pants_2'] = 5,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 82,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 11,
        ['shoes_1'] = 41,   ['shoes_2'] = 11,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_5 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 21,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 5,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 2,
        ['shoes_1'] = 41,   ['shoes_2'] = 2,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_6 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 81,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 18,   ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 10,
        ['shoes_1'] = 41,   ['shoes_2'] = 10,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  dancer_outfit_7 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 61,   ['pants_2'] = 9,
        ['shoes_1'] = 16,   ['shoes_2'] = 9,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 111,  ['torso_2'] = 6,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 6,
        ['shoes_1'] = 41,   ['shoes_2'] = 6,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  }
}
