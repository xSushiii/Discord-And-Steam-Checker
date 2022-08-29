-- This event is fired when a player join the server
AddEventHandler("playerConnecting", function (name, setKickReason, deferrals)
    local player = source -- the player's id on the server
    local identifiers = GetPlayerIdentifiers(player) -- the player's identifiers table
    deferrals.defer()

    Wait(0) -- mandatory wait

    deferrals.update(string.format("Hello %s. We're checking if you have discord and steam.", name))

    local steamIdentifer
    local discordIdentifier

    -- Will search for the steam and discord identifiers
    for , v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break -- don't continue the actual loop if we found steam
        end

        if string.find(v, "discord") then
            discordIdentifier = v
            break -- don't continue the actual loop if we found discord
        end
    end

    Wait(0) -- mandatory wait!

    if not steamIdentifier or not discordIdentifier 
        deferrals.done("You are not connected to either Steam or discord.")
    else
        deferrals.done()
        print(("%s (%s, %s) is connecting"):format(name, steamIdentifier, discordIdentifier))
    end
end)