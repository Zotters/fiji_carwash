--[[



███████╗██╗░░░░░██╗██╗  ░█████╗░░█████╗░██████╗░░██╗░░░░░░░██╗░█████╗░░██████╗██╗░░██╗
██╔════╝██║░░░░░██║██║  ██╔══██╗██╔══██╗██╔══██╗░██║░░██╗░░██║██╔══██╗██╔════╝██║░░██║
█████╗░░██║░░░░░██║██║  ██║░░╚═╝███████║██████╔╝░╚██╗████╗██╔╝███████║╚█████╗░███████║
██╔══╝░░██║██╗░░██║██║  ██║░░██╗██╔══██║██╔══██╗░░████╔═████║░██╔══██║░╚═══██╗██╔══██║
██║░░░░░██║╚█████╔╝██║  ╚█████╔╝██║░░██║██║░░██║░░╚██╔╝░╚██╔╝░██║░░██║██████╔╝██║░░██║
╚═╝░░░░░╚═╝░╚════╝░╚═╝  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝
                 [ V1.0.1 - https://github.com/Zotters/fiji_carwash ]

[ *** DEPENDENCIES *** ]
        ** NDCORE **
        ** OxLib **
[ *** CURRENT FEATURES *** ]
        - NDCore + OxLib Support
        - Checks if player is in a vehicle before activating zone options    
        - Checks the dirty level of the car before activating events in the zone  
        - Deducts cash from the player (Checks for adequate funding) 
        - Popup with a vacuum feature

        ]]

-- General Configuration
Config = {

        Settings = {
         debug = false, -- Developer
         Price = 100, -- Price of a carwash, deducted from CASH
         vacuumTime = 6000,-- Time it takes to check dirt and accept payment
         washTime = 6000, -- Time in mS (3000ms = 3s)
                -- 0.0 to 15.0
                -- 0.0 Clean
                -- 15.0 Very dirty
         minDirt = 5.0, -- Minimum dirt level to activate carwash
         minClean = 3.0, -- Minimum dirt level to be considered clean
         washLevel = 0.0, -- What to set the dirt level at when washes

        },

}

-- Creates blips for Car Wash
Blips = {
        -- General Blip Settings
        {x = 25.29, y = -1391.96, z = 29.33}, -- Car Wash 1 [Wash1]
        {x = 174.18, y = -1736.66, z = 29.35}, -- Car Wash 2 [Wash2]
        {x = -74.56, y = 6427.87, z = 31.44}, -- Car Wash 3 [Wash3]
        {x =  1363.22, y = 3592.7, z = 34.92},
        {x = -699.62, y = -932.7, z = 19.01},

}






