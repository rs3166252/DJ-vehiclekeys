local Translations = {
    info = {
        givekey = "Get a key",
        resetlocks = "Change car locks",
        givekeyheader = "Choose car to get a key",
        givekeyitem = "%{value} (%{value2})",
        resetkeyheader = "Choose car to reset locks",
        resetkeyitem = "%{value} (%{value2})",
        blip = "Locksmith",
        hotwire = "~g~[H]~w~ - Hotwire",
        engine = 'Toggle Engine',
        tlock = 'Toggle Vehicle Locks',
    },
    message = {
        not_initialized = "Locks are not initialized, please reset locks",
        key_received = "You received the key",
        locks_reset = "Locks changed for car",
        not_enough_money = "You have not enough money",
        temp_key_received = "You received a temporary key",
        vehicle_locked = "Vehicle locked!",
        vehicle_unlocked = "Vehicle unlocked!",
        no_key = "You don't have keys to this vehicle.",
        police = "Vehicle theft in progress. Type: %{value}",
        lockpicked = "You managed to pick the door lock open!",
        hotwiring = "Hotwiring the vehicle...",
        hotwiring_fail = "You fail to hotwire the car and get frustrated.",
        vlockpick = 'You have successfully picked the vehicle lock!',
        hotwire_success = 'nice Work', 
    },
    
}

local templocale = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
    locale = "en"
}) 
if templocale then
    Lang = templocale
end