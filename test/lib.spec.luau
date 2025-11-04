local PriorityStore = require("../src/lib")

local frktest = require("../lune_packages/frktest")
local test = frktest.test
local check = frktest.assert.check

return function()
    test.suite("PriorityStore", function()
        test.case("Retrieve the highest-priority value when one value are assigned.", function()
            local store = PriorityStore.new()

            store:add("apple", 5, 1)

            check.equal(store:getTop(), 5)
        end)

        test.case("Retrieve the highest-priority value when multiple values are assigned.", function()
            local store = PriorityStore.new()

            store:add("apple", 5, 1)
            store:add("banana", 3, 2)
            store:add("mango", 1, 3)

            check.equal(store:getTop(), 1)
        end)

        test.case("Verify that updates to existing values are properly reflected.", function()
            local store = PriorityStore.new()

            store:add("apple", 5, 1)

            check.equal(store:getTop(), 5)

            store:set("apple", 4)

            check.equal(store:getTop(), 4)
        end)
    end)
end