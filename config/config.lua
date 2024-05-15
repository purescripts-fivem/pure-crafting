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

        object = `gr_prop_gr_bench_04a`, -- object to place (if you change this to prop_toolchest_05 and use qb-inventory make sure to remove this from their config)

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
        {itemName = 'weapon_bench', type = 'weapon'},
        {itemName = 'misc_bench', type = 'misc'},
        -- {itemName = 'chicken_bench', type = 'cluckinBell'},
    },

    previewBlueprints = true, -- if you want to preview blueprints in the crafting menu

    enableFavourites = true, -- if you want to enable the favourites system

    unlimitedBlueprints = true, -- if you want blueprints to be unlimited uses
}