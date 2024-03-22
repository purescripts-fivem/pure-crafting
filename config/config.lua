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
        qb-inventory -
    --]]
    inventory = 'qb-inventory', 

    debug = true, -- This just enables debug prints, if having issues with your script, enable this and then check the console and react out to me in the discord
    
    targetingOptions = {
        -- TODO: finish target
        interaction = 'interaction', -- 'target' or 'interaction'

        target = 'qb', -- if using target then this is the target system you use, 'ox', 'qb', 'standalone'

        distance = 3.0, -- distance
    },

    placingBench = {
        rotationSpeed = 0.5, -- speed of rotation for placing benches

        leftControl = 44, -- left control to rotate left

        rightControl = 38, -- right control to rotate right

        placeControl = 23, -- control to place the bench

        cancelControl = 120, -- control to cancel placing the bench

        object = `prop_toolchest_05`, -- object to place

        minusOffset = -1.0, -- this is the rotation y, for how it is placed on the ground for the red and green lines

        plusOffset = 1.0 -- this is the rotation y, for how it is placed on the ground for the red and green lines
    },

    -- just of ox notify, can use your own goto client/notify and server/notify and replace the inside of the function
    libText = {
        notfiyPoistion = 'center-left',
        textUIPosition = 'left-center',
    },
}

-- TODO: make a limit on the amount you can place