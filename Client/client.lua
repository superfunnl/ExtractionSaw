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
	correctjob = (ESX.PlayerData.job.name = "fire") ? true : false;
	TriggerEvent("ExtractionSaw:correctJob", correctjob)
end)