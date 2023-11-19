config = {}
--[[
    recipe:
        You can define here the recipes for anything you want, 
        with the minimum amount of each ingredient, and the maximum one.

        Also, you define the perfect amount of each ingredient and if the client uses all the perfect values creating a drug,
        it will give config.perfectRecipeReward items instead of config.baseRecipeReward
        (so don't give the perfect recipe to anyone, people should find it after many tries)

    baseRecipeReward:
        This will be the quantity of drug that will be gave each time the player crafts the drug with all ingredients
        between the min and max quantity, but not all ingredients are in the perfect quantities

    perfectRecipeReward:
        This will be the quantity of drug that will be gave each time the player crafts the drug with ALL ingredients in perfect quantities.

    allowedLabs:
        Labs where the player can craft the drug, you have to use the same number of the config.Labs in cl_config.lua
]]

config.drugs = {
    drug_lean = {
        recipe = {
            ["citrus_drink"] = {min = 1, max = 3, perfect = 2, loseOnUse = true},
            ["codeine"] = {min = 2, max = 4, perfect = 3, loseOnUse = true},
            ["candy"] = {min = 10, max = 15, perfect = 12, loseOnUse = true},
            ["ice"] = {min = 4, max = 8, perfect = 7, loseOnUse = true},
        },

        baseRecipeReward = 1, 
        perfectRecipeReward = 2, 

        allowedLabs = {
            [1] = true,
            [2] = true,
        },
    },

    drug_meth = {
        recipe = {
            ["red_phosphorus"] = {min = 15, max = 30, perfect = 23, loseOnUse = true},
            ["muriatic_acid"] = {min = 1, max = 5, perfect = 2, loseOnUse = true},
            ["sulfuric_acid"] = {min = 5, max = 10, perfect = 6, loseOnUse = true},
            ["water"] = {min = 10, max = 20, perfect = 18, loseOnUse = true},
            ["ammonium_nitrate"] = {min = 4, max = 12, perfect = 8, loseOnUse = true},
            ["sodium_hydroxide"] = {min = 1, max = 3, perfect = 2, loseOnUse = true},
            ["pseudoephedrine"] = {min = 18, max = 23, perfect = 18, loseOnUse = true},
        },

        baseRecipeReward = 1, -- Base reward if the player, uses each ingredient between the minimum and the maximum, without having everything in perfect quantities
        perfectRecipeReward = 2, -- Better reward if the player, uses rights ingredients, each one in the perfect quantity

        allowedLabs = {
            [1] = true,
            [2] = true,
        },
    },

    drug_ecstasy = {
        recipe = {
            ["ampul1"] = {min = 1, max = 4, perfect = 1, loseOnUse = true},
            ["hydrogen"] = {min = 2, max = 7, perfect = 3, loseOnUse = true},
            ["nitrogen"] = {min = 5, max = 10, perfect = 4, loseOnUse = true},
            ["oxygen"] = {min = 8, max = 12, perfect = 11, loseOnUse = true},
            ["candy"] = {min = 2, max = 7, perfect = 4, loseOnUse = true},
        },

        baseRecipeReward = 1, 
        perfectRecipeReward = 2,
        
        allowedLabs = {
            [1] = true,
            [2] = true,
        },
    },

    drug_lsd = {
        recipe = {
            ["ampul3"] = {min = 1, max = 12, perfect = 11, loseOnUse = true},
            ["hydrogen"] = {min = 1, max = 2, perfect = 2, loseOnUse = true},
            ["nitrogen"] = {min = 1, max = 16, perfect = 6, loseOnUse = true},
            ["oxygen"] = {min = 1, max = 8, perfect = 5, loseOnUse = true},
        },

        baseRecipeReward = 1, 
        perfectRecipeReward = 2,

        allowedLabs = {
            [1] = true,
            [2] = true,
        },
    },
}

-- Required time to create each drug (in ms). If not defined here the default time will be 1000ms (1 second)
config.drugsCreationTime = {
    drug_lean = 8000,
    drug_meth = 4000,
    drug_ecstasy = 3000,
    drug_lsd = 4000,
}

-- Define the quantity of each item you harvest each time, if you want to make them to be harvested (if not defined here, the default quantity will be 1)
config.ingredientQuantityOnPickup = {
    ["oxygen"] = 20, -- example 
}

-- Remove items if wrong recipes
config.removeOnError = false
