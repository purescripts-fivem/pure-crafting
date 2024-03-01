Queue = {}
Users = {}

-- add to queue
-- remove from queue
-- check if in queue

--[[
    it will work by first appending the queue to add the item
    when it is the index 0 it will then begin the timer
    after the timer has finished it will add it to the finished table
    they can collect the finished table visa verse
    works offline so it takes the time from when it started similar to deathbeds
--]]

function Queue:new(source)

    local data = {
        source = source,
        items = {},
        currentItem = nil
    }

    debugPrint('Queue:new | ', json.encode(data))
    return setmetatable(data, {__index = Queue})
end

function initQueue(source)
    local user = Queue:new(source)
    Users[tostring(source)] = user
end

function Queue:add(item)
    self.items[#self.items + 1] = item
    debugPrint('Queue:add | ', json.encode(item), json.ecode(self.items))
end