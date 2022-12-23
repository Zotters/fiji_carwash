--[[



███████╗██╗░░░░░██╗██╗  ░█████╗░░█████╗░██████╗░░██╗░░░░░░░██╗░█████╗░░██████╗██╗░░██╗
██╔════╝██║░░░░░██║██║  ██╔══██╗██╔══██╗██╔══██╗░██║░░██╗░░██║██╔══██╗██╔════╝██║░░██║
█████╗░░██║░░░░░██║██║  ██║░░╚═╝███████║██████╔╝░╚██╗████╗██╔╝███████║╚█████╗░███████║
██╔══╝░░██║██╗░░██║██║  ██║░░██╗██╔══██║██╔══██╗░░████╔═████║░██╔══██║░╚═══██╗██╔══██║
██║░░░░░██║╚█████╔╝██║  ╚█████╔╝██║░░██║██║░░██║░░╚██╔╝░╚██╔╝░██║░░██║██████╔╝██║░░██║
╚═╝░░░░░╚═╝░╚════╝░╚═╝  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝
                 [ V1.1 - https://github.com/Zotters/fiji_carwash ]

[ *** DEPENDENCIES *** ]
        ** NDCORE **
        ** OxLib - For UI and Notifications **
[[     SETTINGS:
                * Not recommended to change minDirt
                * Do not overlay blips with locations             
                * Only functions with UI = true ]]
                
Config = {

        Settings = {
         UI = true, -- [true/false] Car Wash User-Interface or drive through style car wash
        },
}


carWash = {
       
        Settings = { 
                      -- [[ Core Settings ]] -- 
                -- [[ 0.0 = Clean & 15.0 = Dirty]] --
        washCost = 175, -- Cost for a wash [Only for UI = false]        
        rinseCost = 25, -- Cost of a rinse
        basicCost = 100, -- Cost of a basic wash
        detailedCost = 200, -- Cost of a detailed wash
        rinseTime = 1500, -- How long it takes to rinse a vehicle
        basicTime = 3000, -- How long it takes for a basic wash
        detailTime = 6000, -- How long it take for detailed wash
        rinseLevel = 10.0, -- 
        basicLevel = 6.0, -- Dirt level the vehicle is set to based off player selection
        detailedLevel = 0.0, -- 
        minDirt = 2.0, -- Minimum dirt level to activate carwash
                          -- [[ UI Settings ]] --
        cWicon = 'car-side', -- https://www.fontawesomecheatsheet.com/
        rinseNoti = 'Vehicle rinsed!',
        basicNoti = 'Vehicle washed!',
        detailNoti = 'Vehicle spotless!'

        },

}

Locations = {
        {x = 20.9, y = -1391.84, z = 29.33},
        {x = 174.15, y = -1736.87, z = 29.35},
        {x = -699.79, y = -932.07, z = 19.00},
        {x = 1361.88, y = 3592.15, z = 34.92},
        {x = -70.98, y = 6428.81, z = 31.44},
}

Blips = {
        -- General Blip Settings
        {x = 25.29, y = -1391.96, z = 29.33}, 
        {x = 174.18, y = -1736.66, z = 29.35}, 
        {x = -74.56, y = 6427.87, z = 31.44}, 
        {x =  1363.22, y = 3592.7, z = 34.92},
        {x = -699.62, y = -932.7, z = 19.01},

}

