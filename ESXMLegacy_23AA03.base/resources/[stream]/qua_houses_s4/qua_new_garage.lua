Citizen.CreateThread(function()
  interiorID = GetInteriorAtCoords(520.00000000, -2625.00000000, -39.69168000)
  RequestIpl("qua_int_placement_xm3_interior_1_dlc_int_02_xm3_milo_")
  if IsValidInterior(interiorID) then      
    EnableInteriorProp(interiorID, "tint")
    EnableInteriorProp(interiorID, "gri")
    EnableInteriorProp(interiorID, "objeler")
    EnableInteriorProp(interiorID, "B1")
    RefreshInterior(interiorID)
  end
end)

CreateThread(function()
  SetInteriorEntitySetColor(interiorID, "tint", 6)
end)

local emitters = {
  "se_dlc_apt_yacht_bedroom",
}

Citizen.CreateThread(function()
  for i = 1, #emitters do
    SetStaticEmitterEnabled(emitters[i], false)
  end
end)

RegisterCommand('epx', function(src,args) --Enable Prop
  local type = tonumber(args[1])
  SetInteriorEntitySetColor(interiorID, "tint", type)
  RefreshInterior(interiorID)
end)


local autoexbbmin, autoexbbmax = vec3(476.539,-2675.496,-74.79168), vec3(568.2525,-2563.3930,-0.59168)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end