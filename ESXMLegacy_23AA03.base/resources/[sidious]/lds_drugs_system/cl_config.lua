config = {}

config.locale = 'en'

-- Coordinates where you can pick up each ingredient (Not every ingredient is already here, I suggest you to add the remaining ones where you want the, 
--- add like sprite and other items of the like in a market instead of making it harvestable.
config.ingredientsCoords = {
    --["codeine"] = {x = 2193.8, y = 5594.4, z = 53.7, radius = 2.0},
}

-- Time to pickup an ingredient (obviously just ingredients you chose to make harvestable from config.ingredientQuantityOnPickup and config.ingredientsCoords.)
config.timeToPickup = 5000

-- Coordinates of labs
config.Labs = {
    [1] = vector3(1388.4, 3605.51, 38.94),
    [2] = vector3(2436.24, 4965.56, 42.36),
}

-- If config.sellUseWholeOcean = false for specific vehicle, when in radius will the area be shown?
config.showRadiusWhileSelling = true

-- Should ingredients blips be showed on the map?
config.enableIngredientsBlips = false

-- Should labs blips be showed on the map?.
config.enableLabsBlips = false

config.enableFireOnError = true