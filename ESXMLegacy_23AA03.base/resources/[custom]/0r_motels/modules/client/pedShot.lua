local id = 0
local MugshotsCache = {}
local Answers = {}

function GetPedMugshot(ped)
    if not DoesEntityExist(ped) then return end
    local mugshot = RegisterPedheadshot_3(ped) 

    while not IsPedheadshotReady(mugshot) do
        Wait(0)
    end

    return mugshot, GetPedheadshotTxdString(mugshot)
end

function GetMugShotBase64(Ped,Tasparent)
	if not Ped then return "" end
	id = id + 1

	local Handle, MugShotTxd = GetPedMugshot(Ped)
   
	if (IsPedheadshotReady(Handle) and IsPedheadshotValid(Handle)) then
		MugshotsCache[id] = Handle
	end

	SendNUIMessage({
		type = 'convert',
		pMugShotTxd = MugShotTxd,
		removeImageBackGround = Tasparent or false,
		id = id,
	})

	local p = promise.new()
	Answers[id] = p

	return Citizen.Await(p)
end


RegisterNUICallback('Answer', function(data)
	if MugshotsCache[data.Id] then
		UnregisterPedheadshot(MugshotsCache[data.Id])
		MugshotsCache[data.Id] = nil
	end
	Answers[data.Id]:resolve(data.Answer)
	Answers[data.Id] = nil
end)

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  for k,v in pairs(MugshotsCache) do
	UnregisterPedheadshot(v)
  end
  MugshotsCache = {}
  id = 0
end)
