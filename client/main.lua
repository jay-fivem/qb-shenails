local QBCore = exports['qb-core']:GetCoreObject()

function OpenShop()
    local ShopItems = {}
    ShopItems.label = "Nail Salon"
    ShopItems.items = Config.ShopItems
    ShopItems.slots = #Config.ShopItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop", ShopItems)
end

exports['qb-target']:AddBoxZone("SheNailsRegister", vector3(224.82, -1546.7, 29.29), 1, 1, {
    name = "SheNailsRegister",
    heading=0,
    debugPoly = false,
    minZ = 29.0,
    maxZ = 30.0,
    }, {
        options = {
            {
                action = function() 
                    local bill = exports["qb-input"]:ShowInput({
                        header = "Create Receipt",
                        submitText = "Bill",
                        inputs = {
                            {
                                text = "Server ID",
                                name = "serverid",
                                type = "number",
                                isRequired = true ,
                            },
                            {
                                text = "Amount",
                                name = "amount",
                                type = "number",
                                isRequired = true,
                            }
                        }
                    })
                    if bill ~= nil then
                        TriggerServerEvent("shenails:server:billplayer", bill.serverid, bill.amount) 
                    end
                end,
                icon = "far fa-clipboard",
                label = "Bill",
                job = "shenails",
            },
        },         
        distance =2.5
    }
)

exports['qb-target']:AddBoxZone("SheNailsTable1", vector3(219.79, -1546.2, 29.29), 2, 1, {
    name = "SheNailsTable1",
    heading=40,
    debugPoly=false,
    minZ=28.29,
    maxZ=29.49,
    }, {
        options = {
            {
                action = OpenShop,
                icon = "fas fa-shopping-cart",
                label = "Buy Nails",
                job = "shenails",
            },
        },         
        distance =2.5
    }
)
exports['qb-target']:AddBoxZone("SheNailsTable2", vector3(217.07, -1548.3, 29.29), 2, 1, {
    name = "SheNailsTable2",
    heading=35,
    debugPoly=false,
    minZ=28.29,
    maxZ=29.29,
    }, {
        options = {
            {
                action = OpenShop,
                icon = "fas fa-shopping-cart",
                label = "Buy Nails",
                job = "shenails",
            },
        },         
        distance =2.5
    }
)