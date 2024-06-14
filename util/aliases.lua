--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Aliases = {}

--------------------------------------------------------------------------------
function Aliases.Update()
    windower.send_command('alias usekeys input //keys use "SP Gobbie Key"')
    windower.send_command('alias usekeyfo input //keys use "Dial Key #Fo"')
    windower.send_command('alias usekeyanv input //keys use "Dial Key #ANV"')
end

return Aliases