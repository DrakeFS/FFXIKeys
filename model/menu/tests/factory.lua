local LuaUnit = require('luaunit')
local MenuFactory = require('model/menu/factory')
local SimpleMenu = require('model/menu/simple')
local BuyMenu = require('model/menu/buy')
local CountMenu = require('model/menu/count')
local ItemMenu = require('model/menu/item')
local UseMenu = require('model/menu/use')
local NilMenu = require('model/menu/nil')

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
MenuFactoryTests = {}

--------------------------------------------------------------------------------
function MenuFactoryTests:SetUp()
    packets = {}
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadPacket()
    local menu = MenuFactory.CreateUseMenu()
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenNoPacketLib()
    packets = nil
    local menu = MenuFactory.CreateUseMenu({})
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadParse()
    function packets.parse(dir, data)
        return nil
    end

    local menu = MenuFactory.CreateUseMenu({})
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadMenuId()
    function packets.parse(dir, data)
        return { ['Menu ID'] = 0 }
    end

    local menu = MenuFactory.CreateUseMenu({})
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestSimpleMenuCreatedWhenAllGood()
    function packets.parse(dir, data)
        return { ['Menu ID'] = 1 }
    end

    local menu = MenuFactory.CreateUseMenu({})
    LuaUnit.assertEquals(menu:Type(), 'SimpleMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestUseMenuCreatedWhenAllGood()
    function packets.parse(dir, data)
        return { ['Menu ID'] = 1, ['Menu Parameters'] = '' }
    end

    local menu = MenuFactory.CreateUseMenu({})
    LuaUnit.assertEquals(menu:Type(), 'UseMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadPacket_Extra()
    local menu = MenuFactory.CreateExtraMenu(nil, {}, 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadMenu_Extra()
    local menu = MenuFactory.CreateExtraMenu({}, nil, 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadParam1_Extra()
    local menu = MenuFactory.CreateExtraMenu({}, {}, nil, 0)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadParam2_Extra()
    local menu = MenuFactory.CreateExtraMenu({}, {}, 0, nil)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenNoPacketLib_Extra()
    packets = nil
    local menu = MenuFactory.CreateExtraMenu({}, {}, 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenUnableToParsePacket_Extra()
    function packets.parse(_, _)
        return nil
    end

    local menu = MenuFactory.CreateExtraMenu({}, NilMenu:NilMenu(0), 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestSimpleMenuCreatedWhenLastMenuWasSimple()
    function packets.parse(_, _)
        return {}
    end

    local menu = MenuFactory.CreateExtraMenu({}, SimpleMenu:SimpleMenu(), 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'SimpleMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestSimpleMenuCreatedWhenLastMenuWasAction()
    function packets.parse(_, _)
        return {}
    end

    local menu = MenuFactory.CreateExtraMenu({}, UseMenu:UseMenu(), 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'SimpleMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestItemMenuCreatedWhenLastMenuWasBuy()
    function packets.parse(_, _)
        return {}
    end

    local menu = MenuFactory.CreateExtraMenu({}, BuyMenu:BuyMenu(), 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'ItemMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestCountMenuCreatedWhenLastMenuWasItem()
    function packets.parse(_, _)
        return {}
    end

    local menu = MenuFactory.CreateExtraMenu({}, ItemMenu:ItemMenu(0, 0), 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'CountMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenLastMenuWasCount()
    function packets.parse(_, _)
        return {}
    end

    local menu = MenuFactory.CreateExtraMenu({}, CountMenu:CountMenu(0, 0, 0), 0, 0)
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadPacket_Buy()
    local menu = MenuFactory.CreateBuyMenu()
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenNoPacketLib_Buy()
    packets = nil
    local menu = MenuFactory.CreateBuyMenu({})
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadParse_Buy()
    function packets.parse(dir, data)
        return nil
    end

    local menu = MenuFactory.CreateBuyMenu({})
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestNilMenuCreatedWhenBadMenuId_Buy()
    function packets.parse(dir, data)
        return { ['Menu ID'] = 0 }
    end

    local menu = MenuFactory.CreateBuyMenu({})
    LuaUnit.assertEquals(menu:Type(), 'NilMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestSimpleMenuCreatedWhenAllGood_Buy()
    function packets.parse(dir, data)
        return { ['Menu ID'] = 1 }
    end

    local menu = MenuFactory.CreateBuyMenu({})
    LuaUnit.assertEquals(menu:Type(), 'SimpleMenu')
end

--------------------------------------------------------------------------------
function MenuFactoryTests:TestBuyMenuCreatedWhenAllGood_Buy()
    function packets.parse(dir, data)
        return { ['Menu ID'] = 1, ['Menu Parameters'] = '' }
    end

    local menu = MenuFactory.CreateBuyMenu({})
    LuaUnit.assertEquals(menu:Type(), 'BuyMenu')
end

LuaUnit.LuaUnit.run('MenuFactoryTests')