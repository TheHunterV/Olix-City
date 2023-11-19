config.locale = 'en'
-- Time to pickup an ingredient (obviously just ingredients you chose to make harvestable from config.ingredientQuantityOnPickup and config.ingredientsCoords)
config.timeToPickup = 5000
-- Required time to create each drug (in ms). If not defined here the default time will be 1000ms (1 second)
config.drugsCreationTime = {
    drug_lean = 8000,
    drug_meth = 4000,
    drug_ecstasy = 3000,
    drug_lsd = 4000,
}