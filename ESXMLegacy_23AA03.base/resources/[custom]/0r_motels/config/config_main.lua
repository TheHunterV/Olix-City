Config = {}

Config.Motels = {}

Config.Locale = 'en' -- "tr" "pt" "de" "es" "en"

Config.Corridor = {
    Coord = vec3(-238.2847, -832.6072, 95.2551),
    SecondFloor = vec3(-238.0607, -832.6706, 100.7658),
    Colors = {
        {name = 'marble', price = 0, default = true},
        {name = 'blue', price = 600, default = false},
        {name = 'orange', price = 1000, default = false},
        {name = 'red', price = 500, default = false},
        {name = 'normal', price = 500, default = false},
    }
}

Config.MetaDataSystem = true
-- Metadata System If True, you must have an inventory with metadata. Because the system will work with a unique motel key.

Config.MotelGarages = true 
-- Motel Garages Bool

Config.TargetedRevenueValue = 1500000 
-- The maximum income value that can appear in the Boss Menu.

Config.GarageVehiclesLock = true 
-- It ensures that the vehicles in the garage are locked.

Config.AutoLock = true 
-- If true, the doors will automatically close.

Config.KeysListCommand = 'mykeys'
-- This feature will only work if Config.MetaDataSystem is turned off. It allows you to give your room keys to other players.

Config.KeyPrices = {
    ChangeKeyPrice = 100, -- Player Motel Key Change Price
    CopyKeyPrice = 100 -- Player Motel Key Copy Price
}

Config.LockPickSystemOxSkillbar = true
-- If this is checked true you will need to run ox_lib on your server.
-- But if you do not want to use ox_lib, you can integrate a skillbar of your own choice or use into the function below.

Config.ShowerCoords = { -- Locations where players can shower in their rooms.
    vec3(-223.6933, -840.7189, 108.2197),
    vec3(-383.5846, 148.9360, 62.1624)
}

Config.GarageCoord = vec3(519.9156, -2639.1565, -38.6916) -- Garage Entrance Coordinate.
Config.GarageElevator = vec3(532.0820, -2637.8948, -38.6916) -- Garage Elevator Coordinate.

Config.GaragePos = { -- Coordinates of vehicles in the garage.
    vec4(514.4383, -2612.6721, -39.0003, 274.1918),
    vec4(514.4879, -2616.6702, -39.0006, 274.1838),
    vec4(514.3720, -2620.6768, -39.0003, 274.1891),
    vec4(514.3495, -2624.6777, -39.0005, 274.1892), 
    vec4(514.4037, -2628.6765, -39.0002, 274.1837),
    vec4(514.3548, -2632.6812, -39.0005, 274.1834),
    vec4(523.8234, -2612.4009, -39.0002, 99.1836),
    vec4(525.1952, -2616.7732, -39.0016, 93.8991),
    vec4(525.2364, -2620.6472, -38.9987, 92.5212),
    vec4(525.1260, -2624.6538, -38.9999, 92.5225),
    vec4(525.3015, -2628.6465, -39.0003, 92.5232), 
    vec4(525.2893, -2632.6470, -39.0004, 92.5235), 
}

Config.MotelCardItem = 'motelcard' 
-- Motel Card Item Name || If Config.MetaDataSystem true

Config.DoorLockPickItem = 'doorlockpick' 
-- This doorlockpick item allows players to enter rooms.

Config.StashInfo = {
    Weight = 40,
    StashWeightPrice = 50, -- 1kg
    StashWeightMaxValue = 400 -- kg
}

Config.RoomTypes = {
    {
        RoomLabel = "Double",
        Image = 'roomplus.png',

        Coords = {
            Stash = vec3(-224.6644, -833.6180, 108.1514),
            Exit = vec4(-226.2884, -839.8974, 105.3926, 76.7111),
            Wardrobe = vec3(-223.1058, -838.1527, 108.1514)
        },

        EditRoomMenu = vec3(-225.3148, -843.6209, 105.3927),

        Teleport = true,
        Colors = {
            {name = 'marble', price = 0, default = true},
            {name = 'blue', price = 600, default = false},
            {name = 'orange', price = 1000, default = false},
            {name = 'red', price = 500, default = false},
            {name = 'normal', price = 500, default = false},
        },

        Description = 'Big, Double Room, Bedroom and Lux Toilet',
        DetailDescription = 'Modern Comfort: 2-Storey Motel Room Warm welcome and spacious design. Large living area and kitchen on the ground floor. Comfy bed and private bathroom upstairs. We are here for your unforgettable stay!'
    },

    {
        RoomLabel = 'Standard',
        Image = 'roomtype1int4.png',

        Coords = {
            Exit = vec4(-384.4520, 152.1615, 62.1190, 96.5731),
            Stash = vec3(-379.86370849609,153.00648498535,62.118995666504),
            Wardrobe = vec3(-382.78698730469,152.97123718262,62.118995666504)
        },
        
        Teleport = true,
        Colors = false,

        EditRoomMenu = vector3(1,1,1),

        Description = 'Standard Room',
        DetailDescription = 'Comfortable and Simple: Standard Motel Room Welcome! A comfortable bed and basic furniture await you in our simple and comfortable standard room. The modern bathroom offers freshness and comfort.'
    },

    {
        RoomLabel = 'Basic',
        Image = 'room.jpg',
        Teleport = true,
        Colors = false,

        EditRoomMenu = vector3(1,1,1),
        -- Değişecek
        Coords = {
            Exit = vec4(-1231.5031, 3874.0898, 154.1273, 1),
            Stash = vec3(-1231.3580, 3878.5823, 154.1143),
            Wardrobe = vec3(-1235.4760, 3880.3147, 154.1143)
        },

        Description = 'Basic Room',
        DetailDescription = 'Basic Comfort: Motel Room A simple and functional room. It meets your needs with beds and basic furniture. We offer a clean and peaceful accommodation experience. We are waiting for you!'
    },

    {
        RoomLabel = 'Simple',
        Image = 'roomtype1int6.png',
        Teleport = true,
        Colors = false,

        EditRoomMenu = vector3(1,1,1),
        -- Değişecek
        Coords = {
            Exit = vec4(291.1445, -925.0584, -22.9948, 178.6922),
            Stash = vec3(283.4391, -925.4509, -23.0018),
            Wardrobe = vec3(286.5710, -922.4359, -23.0018)
        },

        Description = 'Simple Room',
        DetailDescription = "Welcome to our cozy, simple room. It's designed for your comfort and convenience. You'll find a comfortable bed, a clean, functional bathroom, and a small sitting area. While it's not extravagant, it has everything you need for a peaceful and relaxing stay."
    },

    {
        RoomLabel = 'Classic',
        Image = 'roomtype1int.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Classic Room',
        DetailDescription = 'Comfortable and Simple: Classic Motel Room Welcome! A comfortable bed and basic furniture await you in our simple and comfortable standard room. The modern bathroom offers freshness and comfort.'
    },

    {
        RoomLabel = 'Rustic',
        Image = 'roomtype1int5.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Rustic Room',
        DetailDescription = 'Rustic Motel Room: Comfort & Simplicity Experience simplicity and comfort in our rustic motel room. Enjoy a cozy bed, basic furniture, and a modern bathroom for your stay.'
    },

    {
        RoomLabel = 'Economy',
        Image = 'roomtype1int7.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Economy Room',
        DetailDescription = "Our economy room offers a budget-friendly stay with essential amenities. It's a comfortable and practical choice for travelers looking to save without sacrificing comfort."
    },

    {
        RoomLabel = 'Deluxe',
        Image = 'roomtype1int8.png',
        Teleport = false,
        Colors = false,
        EditRoomMenu = false,
        Description = 'Deluxe Room',
        DetailDescription = "Deluxe Room: Comfort and convenience for your perfect stay, whether for business or leisure. Cozy ambiance, modern amenities, and a comfortable bed await you in this well-appointed space."
    }
}

Config.DueDate = 7
-- The number of days entered into this variable ensures that the player's room will be canceled if he does not pay the room rent within the specified day.

Config.MotelAdminMenuAccessible = { -- Enter the license IDs of the players you want to be able to access the /moteladmin menu here.
    "identifier.fivem:8501288",
}

Config.Keys = {
    ["reception"] = {"E", 38, "Reception"}
}

Config.CreateMotelEditorKeys = {
    ["reception"] = {"E", 38, "Reception"},
    ["room"] = {"E", 38}
}

Config.MotelAdminMenuCommand = 'moteladmin' -- Motel Admin Menu Open Command