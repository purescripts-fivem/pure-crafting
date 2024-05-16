Config = {
        -- [[ Frameworks Supported ]] --
    --[[
        qbcore - https://github.com/qbcore-framework
        esx - https://github.com/esx-framework/esx_core
        qbox - https://github.com/Qbox-project/qbx-core
        standalone - 
    --]]
    framework = 'qbcore',

    language = 'en',

    --[[
        qb-inventory
        esx
        ox_inventory
        ps-inventory
        qs-inventory
    --]]

    inventory = 'qb-inventory', 

    debug = false, -- This just enables debug prints, if having issues with your script, enable this and then check the console and react out to me in the discord

    targetingOptions = {
        interaction = 'target', -- 'target' or 'interaction'

        target = 'qb', -- if using target then this is the target system you use, 'ox', 'qb', 'standalone'
    },

    placingBench = {
        rotationSpeed = 0.5, -- speed of rotation for placing benches

        leftControl = 44, -- left control to rotate left

        rightControl = 38, -- right control to rotate right

        placeControl = 23, -- control to place the bench

        cancelControl = 120, -- control to cancel placing the bench

        minusOffset = -5.0, -- this is the rotation y, for how it is placed on the ground for the red and green lines

        plusOffset = 5.0, -- this is the rotation y, for how it is placed on the ground for the red and green lines

        limit = 3, -- limit on the amount of benches that can be placed by person, set this to nil if you want to have no limit
    },

    -- just of ox notify, can use your own goto client/notify and server/notify and replace the inside of the function
    libText = {
        notfiyPoistion = 'center-left',
        textUIPosition = 'left-center',
    },

    -- these are the items in which allow you to place your bench down
    benchItems = {
        {itemName = 'weap_bench', type = 'weapon', object = `gr_prop_gr_bench_04a`},
        {itemName = 'misc_bench', type = 'misc', object = `gr_prop_gr_bench_04a`},
        -- {itemName = 'chicken_bench', type = 'cluckinBell'},
    },

    prePlacedBenches = {
        {location = vector3(-986, -434, 36), rotation = vector3(0, 0, 0), type = 'weapon'}, -- TYPE needs to be one from above as this is where it will index the object from! {location = vector3(x, y, z), rotation = vector3(x, y, z), type = 'weapon'}
    },

    previewBlueprints = true, -- if you want to preview blueprints in the crafting menu

    enableFavourites = true, -- if you want to enable the favourites system

    unlimitedBlueprints = true, -- if you want blueprints to be unlimited uses

    inventoryItemImagesAuto = true, -- if true it will automatically generate the images for the items in the inventory, if false you will need to add the images yourself wtihin the config
}