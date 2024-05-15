-- the blueprint will have an id attached and will then index the table to provide the proper information such as required items, etc etc
-- These ids cannot conflict with the crafting ids hence the big number
imgDirectory = 'https://cfx-nui-qb-inventory/html/images/'

if Config.inventory == 'ox_inventory' then
    imgDirectory = 'nui://ox_inventory/web/images/'
end

Config.blueprints = {
    ids = {
        weapon = {
            {
                blueprintId = 'blueprint_microsmg',
                id = 99991,
                itemName = 'weapon_microsmg',
                name = 'Micro SMG',
                image = `${imgDirectory}weapon_microsmg.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Micro SMG',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_machinepistol',
                id = 99992,
                itemName = 'weapon_machinepistol',
                name = 'Machine Pistol',
                image = `${imgDirectory}weapon_machinepistol.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Machine Pistol',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_sawnoffshotgun',
                id = 99993,
                itemName = 'weapon_sawnoffshotgun',
                name = 'Sawn Off Shotgun',
                image = `${imgDirectory}weapon_sawnoffshotgun.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Shawn Off Shotgun',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_advancedrifle',
                id = 99994,
                itemName = 'weapon_advancedrifle',
                name = 'Advanced Rifle',
                image = `${imgDirectory}weapon_advancedrifle.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Advanced Rifle',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_assaultrifle',
                id = 99995,
                itemName = 'weapon_assaultrifle',
                name = 'Assault Rifle',
                image = `${imgDirectory}weapon_assaultrifle.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Assault Rifle',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_speacialcarbine',
                id = 99996,
                itemName = 'weapon_specialcarbine',
                name = 'Special Carbine',
                image = `${imgDirectory}weapon_specialcarbine.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Special Carbine',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
        },
        misc = {
            {
                blueprintId = 'blueprint_scope',
                id = 99991,
                itemName = 'holoscope_attachment',
                name = 'Weapon Holoscope',
                image = `${imgDirectory}holoscope_attachment.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Holographic Scope',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_extendedclip',
                id = 99992,
                itemName = 'clip_attachment',
                name = 'Extended Clip',
                image = `${imgDirectory}clip_attachment.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Extended Clip',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_suppressor',
                id = 99993,
                itemName = 'suppressor_attachment',
                name = 'Weapon Suppressor',
                image = `${imgDirectory}suppressor_attachment.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Suppressorr',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_grip',
                id = 99994,
                itemName = 'grip_attachment',
                name = 'Weapon Grip',
                image = `${imgDirectory}grip_attachment.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Weapon Grip',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
            {
                blueprintId = 'blueprint_molotov',
                id = 99995,
                itemName = 'weapon_molotov',
                name = 'Molotov',
                image = `${imgDirectory}weapon_molotov.png`,
                category = 'blueprints', -- DONT TOUCH THIS!!!
                type = 'blueprint', -- DONT TOUCH THIS!!!
                description = 'Blueprints for a Molotov',
                craftingTime = 20,
                requiredItems = {
                    {
                        itemName = 'metalscrap',
                        name = 'Metal Scrap',
                        amount = 20,
                        myAmount = 0,
                        image = `${imgDirectory}metalscrap.png`,
                    },
                },
            },
        },
    },

    -- These are all the useable items in which it create a useable item
    items = {
        'blueprint_molotov',
        'blueprint_grip',
        'blueprint_suppressor',
        'blueprint_extendedclip',
        'blueprint_scope',
        'blueprint_specialcarbine',
        'blueprint_assaultrifle',
        'blueprint_advancedrifle',
        'blueprint_sawnoffshotgun',
        'blueprint_machinepistol',
        'blueprint_microsmg',
    },
}
