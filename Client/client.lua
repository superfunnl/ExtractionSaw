ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('ExtractionSaw:checkjob')
AddEventHandler('ExtractionSaw:checkjob', function()
	if ESX.PlayerData.job == nil then
		-- deze check kan weg
	end
	if ESX.PlayerData.job.name == "fire" then
		TriggerEvent("ExtractionSaw:correctJob", true)
	else
		TriggerEvent("ExtractionSaw:correctJob", false)
	end
end)