function notifySystem(source, table)
    -- Change this function to add your own notify system
    if not table then return end
    if not source then return end

    lib.notify(source, table)
end