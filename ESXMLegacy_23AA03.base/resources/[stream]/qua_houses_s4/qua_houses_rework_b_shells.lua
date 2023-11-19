Citizen.CreateThread(function()


    RequestIpl("qua_rework_b_milo")
    
        interiorID = GetInteriorAtCoords(-626.96000000, -744.00000000, -115.08000000)
        
        if IsValidInterior(interiorID) then      
                EnableInteriorProp(interiorID, "esyali")
                -- EnableInteriorProp(interiorID, "kirmizi")
                -- EnableInteriorProp(interiorID, "mavi")
                -- EnableInteriorProp(interiorID, "mor")
                -- EnableInteriorProp(interiorID, "turuncu")
                -- EnableInteriorProp(interiorID, "yesil")
                EnableInteriorProp(interiorID, "bw")
                
        RefreshInterior(interiorID)
    
        end
    
    end)
  
    CreateThread(function()
      interiorID = GetInteriorAtCoords(-626.96000000, -744.00000000, -115.08000000)
      SetInteriorEntitySetColor(interiorID, "qua_int2_xm3_tint_01", 1)
    end)

    local emitters = {
      
      "se_dlc_apt_yacht_bedroom",
    }
    
    Citizen.CreateThread(function()
      for i = 1, #emitters do
        SetStaticEmitterEnabled(emitters[i], false)
      end
    end)
  
  local autoexbbmin, autoexbbmax = vec3(-1282.66357000, -1392.28000000, -616.43243400), vec3(20.4573975, -92.02008000, 387.00085400)
  if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
    AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
  end
