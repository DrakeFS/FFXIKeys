--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Keys = {}
Keys.Values = {}
Keys.Values[''] = {id = 0, option = 0}
Keys.Values['spgobbiekey'] = {id = 8973, option = 0}

--------------------------------------------------------------------------------
function Keys.GetKey(key_str)
    if not key_str then
        return 0
    end

    local value = Keys.Values[key_str]
    if not value then
        return Keys.Value['']
    end

    return value
end

return Keys