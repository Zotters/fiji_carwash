--[[



█▀▀ █ ░░█ █   █▀▀ ▄▀█ █▀█ █░█░█ ▄▀█ █▀ █░█                            
█▀░ █ █▄█ █   █▄▄ █▀█ █▀▄ ▀▄▀▄▀ █▀█ ▄█ █▀█                            

█▀ █▄░█ █▀▄ █▀▀ █▀█ █▀█ █▀▀ ░   █▀█ ▀▄▀ █░░ █ █▄▄ ░   █▀█ █▀█ █░░ █▄█ ▀█ █▀█ █▄░█ █▀▀ ▀█
█▄ █░▀█ █▄▀ █▄▄ █▄█ █▀▄ ██▄ █   █▄█ █░█ █▄▄ █ █▄█ █   █▀▀ █▄█ █▄▄ ░█░ █▄ █▄█ █░▀█ ██▄ ▄█

█░█ █▀▀ █▀█ █▀ █ █▀█ █▄░█   █▀ ▄█ ░ █▀█ ░ █▀█ ▀█
▀▄▀ ██▄ █▀▄ ▄█ █ █▄█ █░▀█   █▄ ░█ ▄ █▄█ ▄ █▄█ ▄█


[ *** DEPENDENCIES *** ]
        ** NDCORE **
        ** OxLib **
        ** PolyZone **
[ *** CURRENT FEATURES *** ]
        - Polyzone support, OxLib Required, NDCore Required
        - Checks if player is in a vehicle before activating zone options    
        - Checks the dirty level of the car before activating events in the zone  
        - Deducts cash from the player (Checks for adequate funding) 
        
        ]]

-- General Configuration
Config = {

        Settings = {
         Price = 100, -- Price of a carwash, deducted from CASH
         FreezeVeh = true,
                -- 0.0 to 15.0
                -- 0.0 Clean
                -- 15.0 Very dirty
         minDirt = 5.0, -- Minimum dirt level to activate carwash
         minClean = 3.0, -- Minimum dirt level to be considered clean
         washLevel = 0.0, -- What to set the dirt level at when washed
        },

}

-- Creates blips for Car Wash
Blips = {
        -- General Blip Settings
        {x = -699.99, y = -932.35, z = 19.01}, -- In the City
        {x = 21.07, y = -1391.84, z = 29.31}, -- In the City

}

-- Used for Car Wash zones.
Zones = {
        Settings = {
                debug = false -- Developer use
        },
}



