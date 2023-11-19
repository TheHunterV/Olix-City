Citizen.CreateThread(function()


    RequestIpl("qua_adez_k_milo")
    
        interiorID = GetInteriorAtCoords(-626.96000000, -744.00000000, -137.13382000)
            
        
        if IsValidInterior(interiorID) then      
                EnableInteriorProp(interiorID, "esyali")
                EnableInteriorProp(interiorID, "kirmizi")
                -- EnableInteriorProp(interiorID, "mavi")
                -- EnableInteriorProp(interiorID, "mor")
                -- EnableInteriorProp(interiorID, "turuncu")
                -- EnableInteriorProp(interiorID, "yesil")
                -- EnableInteriorProp(interiorID, "bw")                
        RefreshInterior(interiorID)
    
        end
    
    end)
  
    local emitters = {
      
      "se_dlc_apt_yacht_bedroom",
    }
    
    Citizen.CreateThread(function()
      for i = 1, #emitters do
        SetStaticEmitterEnabled(emitters[i], false)
      end
    end)
  
  local autoexbbmin, autoexbbmax = vec3(-1276.91600000, -1389.90747000, -638.52610000), vec3(18.45788570, -95.49939000, 364.94702100)
  if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
    AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
  end

--     RegisterCommand("test", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if test then
--         test = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "black")
--     else
--         test = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "blue")
--     end
-- end, false)