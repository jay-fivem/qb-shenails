local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("shenails:server:billplayer", function(playerId, amount)
    local src = source
    local biller = QBCore.Functions.GetPlayer(src)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'shenails' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', src, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No Access', 'error')
    end
end)

QBCore.Functions.CreateUseableItem("blacknails", function(source, item) -- change this
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ped = GetPlayerPed(src)
    local model = GetEntityModel(ped)
    if Player.Functions.RemoveItem("blacknails", 1) then -- change this
        if model ~= nil then
            local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
            if result[1] ~= nil then
                skin = json.decode(result[1].skin)
            end
            skin["accessory"].item = 121 -- change this
            skin["accessory"].texture = 0 -- change this
            SetPedComponentVariation(ped, 7, skin["accessory"].item, skin["accessory"].texture, 2)
            TaskPlayAnim(ped, "nmt_3_rcm-10", "cs_nigel_dual-10", 8.00, -8.00, 1200, 51, 0.00, 0, 0, 0)
            skin = json.encode(skin)
            -- TODO: Update primary key to be citizenid so this can be an insert on duplicate update query
            MySQL.Async.execute('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
                MySQL.Async.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                    Player.PlayerData.citizenid,
                    model,
                    skin,
                    1
                })
            end)
        end
    end
end)

QBCore.Functions.CreateUseableItem("pinknails", function(source, item) -- change this
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ped = GetPlayerPed(src)
    local model = GetEntityModel(ped)
    if Player.Functions.RemoveItem("pinknails", 1) then -- change this
        if model ~= nil then
            local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
            if result[1] ~= nil then
                skin = json.decode(result[1].skin)
            end
            skin["accessory"].item = 121 -- change this
            skin["accessory"].texture = 1 -- change this
            SetPedComponentVariation(ped, 7, skin["accessory"].item, skin["accessory"].texture, 2)
            TaskPlayAnim(ped, "nmt_3_rcm-10", "cs_nigel_dual-10", 8.00, -8.00, 1200, 51, 0.00, 0, 0, 0)
            skin = json.encode(skin)
            -- TODO: Update primary key to be citizenid so this can be an insert on duplicate update query
            MySQL.Async.execute('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
                MySQL.Async.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                    Player.PlayerData.citizenid,
                    model,
                    skin,
                    1
                })
            end)
        end
    end
end)

QBCore.Functions.CreateUseableItem("bluenails", function(source, item) -- change this
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ped = GetPlayerPed(src)
    local model = GetEntityModel(ped)
    if Player.Functions.RemoveItem("bluenails", 1) then -- change this
        if model ~= nil then
            local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
            if result[1] ~= nil then
                skin = json.decode(result[1].skin)
            end
            skin["accessory"].item = 121 -- change this
            skin["accessory"].texture = 5 -- change this
            SetPedComponentVariation(ped, 7, skin["accessory"].item, skin["accessory"].texture, 2)
            TaskPlayAnim(ped, "nmt_3_rcm-10", "cs_nigel_dual-10", 8.00, -8.00, 1200, 51, 0.00, 0, 0, 0)
            skin = json.encode(skin)
            -- TODO: Update primary key to be citizenid so this can be an insert on duplicate update query
            MySQL.Async.execute('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
                MySQL.Async.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                    Player.PlayerData.citizenid,
                    model,
                    skin,
                    1
                })
            end)
        end
    end
end)

QBCore.Functions.CreateUseableItem("rednails", function(source, item) -- change this
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ped = GetPlayerPed(src)
    local model = GetEntityModel(ped)
    if Player.Functions.RemoveItem("rednails", 1) then -- change this
        if model ~= nil then
            local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
            if result[1] ~= nil then
                skin = json.decode(result[1].skin)
            end
            skin["accessory"].item = 121 -- change this
            skin["accessory"].texture = 7 -- change this
            SetPedComponentVariation(ped, 7, skin["accessory"].item, skin["accessory"].texture, 2)
            TaskPlayAnim(ped, "nmt_3_rcm-10", "cs_nigel_dual-10", 8.00, -8.00, 1200, 51, 0.00, 0, 0, 0)
            skin = json.encode(skin)
            -- TODO: Update primary key to be citizenid so this can be an insert on duplicate update query
            MySQL.Async.execute('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
                MySQL.Async.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                    Player.PlayerData.citizenid,
                    model,
                    skin,
                    1
                })
            end)
        end
    end
end)

QBCore.Functions.CreateUseableItem("mixednails", function(source, item) -- change this
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ped = GetPlayerPed(src)
    local model = GetEntityModel(ped)
    if Player.Functions.RemoveItem("mixednails", 1) then -- change this
        if model ~= nil then
            local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
            if result[1] ~= nil then
                skin = json.decode(result[1].skin)
            end
            skin["accessory"].item = 121 -- change this
            skin["accessory"].texture = 21 -- change this
            SetPedComponentVariation(ped, 7, skin["accessory"].item, skin["accessory"].texture, 2)
            TaskPlayAnim(ped, "nmt_3_rcm-10", "cs_nigel_dual-10", 8.00, -8.00, 1200, 51, 0.00, 0, 0, 0)
            skin = json.encode(skin)
            -- TODO: Update primary key to be citizenid so this can be an insert on duplicate update query
            MySQL.Async.execute('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
                MySQL.Async.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                    Player.PlayerData.citizenid,
                    model,
                    skin,
                    1
                })
            end)
        end
    end
end)