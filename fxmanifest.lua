fx_version 'cerulean'
game 'gta5'

author 'Rohtash'
description 'Advanced Vehicle Key System for QBCore Framework'
version '1.0.0'

-- Shared Scripts
shared_scripts {
    '@qb-core/shared/locale.lua',   -- Locale support for multiple languages
    'locales/*.lua',                -- Localized files
    'config.lua'                    -- Configuration file
}

-- Client Scripts
client_scripts {
    'client/main.lua',              -- Core client-side logic
    'client/vehicle_keys.lua'       -- Advanced vehicle key handling logic
}

-- Server Scripts
server_scripts {	
    '@oxmysql/lib/MySQL.lua',       -- Database library for saving data
    'server/main.lua',              -- Server-side logic
    'server/vehicle_keys.lua'       -- Server-side handling for vehicle keys
}

-- Extra Data
lua54 'yes'                         -- Enable Lua 5.4 features

-- Dependencies
dependencies {
    'qb-core',                      -- Ensure QBCore Framework is available
    'oxmysql'                       -- Database support
}
