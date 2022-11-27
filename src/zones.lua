NDCore = exports["ND_Core"]:GetCoreObject()

local wash1 = lib.zones.poly({
	name = "carwash",
    -- Car Wash 1
    points = {
		vec3(37.0, -1391.0, 29.0),
		vec3(37.0, -1393.0, 29.0),
		vec3(7.0, -1393.0, 29.0),
		vec3(7.0, -1391.0, 29.0),
	},
    -- Car Wash 2
    points = {
		vec3(170.0, -1739.0, 29.0),
		vec3(171.0, -1734.0, 29.0),
		vec3(180.0, -1734.0, 29.0),
		vec3(179.0, -1740.0, 29.0),
	},
    -- Car Wash 3
    points = {
		vec3(-70.0, 6425.0, 31.0),
		vec3(-75.0, 6430.0, 31.0),
		vec3(-72.0, 6433.0, 31.0),
		vec3(-67.0, 6428.0, 31.0),
	},
    -- Car Wash 4
    points = {
		vec3(1358.0, 3594.0, 35.0),
		vec3(1365.0, 3596.0, 35.0),
		vec3(1367.0, 3590.0, 35.0),
		vec3(1361.0, 3588.0, 35.0),
	},
    --Car Wash 5
    points = {
		vec3(-698.0, -929.0, 19.0),
		vec3(-702.0, -929.0, 19.0),
		vec3(-702.0, -938.0, 19.0),
		vec3(-698.0, -938.0, 19.0),
    },
	thickness = 6.0,
    debug = Config.Settings.debug,
    onEnter = onEnter,


})


function wash1:onEnter()
       TriggerEvent('fiji:popup')
end

