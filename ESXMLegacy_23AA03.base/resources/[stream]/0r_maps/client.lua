Citizen.CreateThread(function()
    RequestIpl("qua_loft_milo")
    interiorID = GetInteriorAtCoords(-220.37213100, -840.17486600, 104.39260000)
    if IsValidInterior(interiorID) then      
        -- EnableInteriorProp(interiorID, "normal")
        -- EnableInteriorProp(interiorID, "red")
        -- EnableInteriorProp(interiorID, "blue")
        -- EnableInteriorProp(interiorID, "orange")
        EnableInteriorProp(interiorID, "marble")
        RefreshInterior(interiorID)
    end
end)

Citizen.CreateThread(function()
    RequestIpl("qua_corridor_milo")
    interiorIDD = GetInteriorAtCoords(-243.98768600, -826.93790000, 94.23494000)
    if IsValidInterior(interiorIDD) then      
        -- EnableInteriorProp(interiorID, "normal")
        -- EnableInteriorProp(interiorID, "red")
        -- EnableInteriorProp(interiorID, "blue")
        -- EnableInteriorProp(interiorID, "orange")
        EnableInteriorProp(interiorIDD, "marble")
        RefreshInterior(interiorIDD)
    end 
end)

local emitters = {"se_dlc_apt_yacht_bedroom",}
  
local autoexbbmin, autoexbbmax = vec3(-841.02080000, -1460.62720000, -395.61740000), vec3(399.73986800, -219.04882800, 610.03120000)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
   AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end

local autoexbbmin, autoexbbmax = vec3(-890.29693600, -1485.16382000, -405.83790000), vec3(434.88990000, -159.10302700, 602.32794200)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
   AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end
