--------------------------------------------------------------------------------
local function ByValue(name, search_value, domain)
    for _, value in pairs(domain) do
        if value[name] == search_value then
            return value
        end
    end

    return domain['']
end

--------------------------------------------------------------------------------
local function AllByValue(name, search_value, domain)
    local matches = {}
    for _, value in pairs(domain) do
        if value[name] == search_value then
            table.insert(matches, value)
        end
    end

    table.insert(matches, domain[''])
    return matches
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Keys = {}
Keys.Values = {}

-- Nil Key
Keys.Values['']   = { id = 0000, idx = 0, en = '' }

-- Keys
Keys.Values[8973] = { id = 8973, idx = 1, en = 'SP Gobbie Key' }
Keys.Values[4181] = { id = 4181, idx = 2, en = 'Warp Scroll' }

--------------------------------------------------------------------------------
function Keys.GetByProperty(key, value)
    return ByValue(tostring(key), value, Keys.Values)
end

--------------------------------------------------------------------------------
function Keys.GetAllByProperty(key, value)
    return AllByValue(tostring(key), value, Keys.Values)
end

return Keys