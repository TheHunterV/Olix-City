Config.CustomStash = function(id)
    -- You can add the stash function of the inventory you are using here.
end

Config.OpenWardrobe = function()
    TriggerEvent('illenium-appearance:client:openOutfitMenu') -- for illenium-appearance
    --TriggerEvent('qb-clothing:client:openOutfitMenu') -- for qb-clothing
    -- TriggerEvent('ox_appearance:wardrobe') -- for ox_appearance
    -- TriggerEvent('ex_clothingstore:wardrobe') -- for bp_clothing v3
end

Config.GetPlayerPhoneNumber = function(source)
    local PlayerPhoneNumber = nil 
    local GetMySQLData = nil
    -- It varies depending on the phone you use.
    if exports["0r_lib"]:GetFramework() == 'QBCore' then
        GetMySQLData = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = ?', {Resmon.Lib.GetPlayerFromSource(source).identifier})
        local PlayerCharInfo = json.decode(GetMySQLData[1].charinfo)
        PlayerPhoneNumber = PlayerCharInfo.phone
    else
        GetMySQLData = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = ?', {Resmon.Lib.GetPlayerFromSource(source).identifier})
        PlayerPhoneNumber = GetMySQLData[1].phone
    end
    -- Edit the code below without touching it. If you do not want the phone number to appear, do not touch this function.

    return PlayerPhoneNumber
end

Config.CustomLockPickSystem = function() -- if Config.LockPickSystem is work for false 
    return exports["2na_lockpick"]:createGame(3, 1)
end