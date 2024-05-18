Config.items = {
    weapon = {
        {
            id = 0,
            itemName = 'weapon_heavypistol',
            name = 'Heavy Pistol',
            image = ImageDirectory..'weapon_heavypistol.png',
            description = 'Heavy Pistol',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metalscrap',
                    amount = 50,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 1,
            itemName = 'weapon_snspistol',
            name = 'SNS Pistol',
            image = ImageDirectory..'weapon_snspistol.png',
            description = 'SNS Pistol',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 50,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 2,
            itemName = 'weapon_pistol',
            name = 'Pistol',
            image = ImageDirectory..'weapon_pistol.png',
            description = 'Pistol',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 50,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 3,
            itemName = 'weapon_vintagepistol',
            name = 'Vintage Pistol',
            image = ImageDirectory..'weapon_vintagepistol.png',
            description = 'Vintage Pistol',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 50,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 4,
            itemName = 'weapon_pistol50',
            name = 'Pistol 50',
            image = ImageDirectory..'weapon_pistol50.png',
            description = 'Pistol 50',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 50,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
    },
    misc = {
        {
            id = 0,
            itemName = 'lockpick',
            name = 'Lockpick',
            image = ImageDirectory..'lockpick.png',
            description = 'Lockpick',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'plastic',
                    name = 'Plastic',
                    amount = 10,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'plastic.png',
                },
            },
        },
        {
            id = 1,
            itemName = 'advancedlockpick',
            name = 'Advanced Lockpick',
            image = ImageDirectory..'advancedlockpick.png',
            description = 'Advanced Lockpick',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'plastic',
                    name = 'Plastic',
                    amount = 10,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'plastic.png',
                },
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 10,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 2,
            itemName = 'repairkit',
            name = 'Repair Kit',
            image = ImageDirectory..'repairkit.png',
            description = 'A Repair Kit',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'plastic',
                    name = 'Plastic',
                    amount = 10,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'plastic.png',
                },
            },
        },
        {
            id = 3,
            itemName = 'pistol_ammo',
            name = 'Pistol Ammo',
            image = ImageDirectory..'pistol_ammo.png',
            description = 'Pistol Ammo used within Pistols',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 25,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 4,
            itemName = 'smg_ammo',
            name = 'SMG Ammo',
            image = ImageDirectory..'smg_ammo.png',
            description = 'SMG Ammo used within SMGS',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 35,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
        {
            id = 5,
            itemName = 'rifle_ammo',
            name = 'Rifle Ammo',
            image = ImageDirectory..'rifle_ammo.png',
            description = 'Rifle Ammo used within Rifles',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'metalscrap',
                    name = 'Metal Scrap',
                    amount = 35,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'metalscrap.png',
                },
            },
        },
    },
    cluckinBell = {
        {
            id = 0,
            itemName = 'pure_chickenbucket',
            name = 'Chicken Bucket',
            image = ImageDirectory..'pure_chickenbucket.png',
            description = 'A Bucket of Chicken',
            craftingTime = 30,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 32,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 1,
            itemName = 'pure_popcorn',
            name = 'Popcorn Chicken',
            image = ImageDirectory..'pure_popcorn.png',
            description = 'A Bucket of Popcorn Chicken',
            craftingTime = 20,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 25,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 2,
            itemName = 'pure_drink',
            name = 'Coca Cola',
            image = ImageDirectory..'pure_drink.png',
            description = 'A 500ML Coca Cola',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 3,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 3,
            itemName = 'pure_fries',
            name = 'Fries',
            image = ImageDirectory..'pure_fries.png',
            description = 'Lightly Salted Fries',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 16,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 4,
            itemName = 'pure_onionrings',
            name = 'Onion Rings',
            image = ImageDirectory..'pure_onionrings.png',
            description = 'Onion Rings',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 8,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 5,
            itemName = 'pure_muffin',
            name = 'Muffin',
            image = ImageDirectory..'pure_muffin.png',
            description = 'A Muffin',
            craftingTime = 6,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 5,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 6,
            itemName = 'pure_pizza',
            name = 'Pizza',
            image = ImageDirectory..'pure_pizza.png',
            description = 'A Pizza',
            craftingTime = 15,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 15,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
        {
            id = 7,
            itemName = 'pure_brownie',
            name = 'Brownie',
            image = ImageDirectory..'pure_brownie.png',
            description = 'A Brownie',
            craftingTime = 10,
            requiredItems = {
                {
                    itemName = 'pure_foodingredients',
                    name = 'Food Ingredients',
                    amount = 5,
                    myAmount = 0, -- Ignore
                    image = ImageDirectory..'pure_foodingredients.png',
                },
            },
        },
    },
}

-- DO NOT TOUCH THESE!!!!
Config.categories = {
    {
        icon = 'fa-star',
        category = 'fave',
    },
    {
        icon = 'fa-pen-ruler',
        category = 'blueprints',
    },
}