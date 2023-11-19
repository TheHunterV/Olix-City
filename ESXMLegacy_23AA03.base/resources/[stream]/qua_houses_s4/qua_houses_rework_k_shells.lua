Citizen.CreateThread(function()


    RequestIpl("qua_adez_k_milo")
    
        interiorID = GetInteriorAtCoords(-626.96000000, -744.00000000, -126.34231600)
            
        
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
  
  local autoexbbmin, autoexbbmax = vec3(-1272.84860000, -1390.27258000, -627.73460000), vec3(17.84283450, -98.71960450, 375.73852500)
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