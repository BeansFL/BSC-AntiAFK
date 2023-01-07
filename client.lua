Citizen.CreateThread(function()
	while true do
		Wait(1000) 

		local playerPed = PlayerPedId()
		if playerPed then
			local currentPos = GetEntityCoords(playerPed, true)

			if prevPos and currentPos == prevPos then
				if timeLeft > 0 then
					if Config.kickWarning and timeLeft == math.ceil(Config.secondsUntilKick / 4) then
						if Config.EnableWarningSound then PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 0, 1)
						end
						if Config.Framework == "esx" then
							ESX.ShowNotification(Config.KickedSoonMsg .. " " .. timeLeft .. " seconds" .. " (" .. Config.Notifytreason .. ")", Config.Notifytime)
						elseif Config.Framework == "qbcore" then
							TriggerEvent("qb:sendNotification", {text = Config.KickedSoonMsg .. " " .. timeLeft .. " seconds" .. " (" .. Config.Notifytreason .. ")", type = "warning", timeout = Config.Notifytime, layout = "centerLeft", queue = "left"})
						end
					end
 
					timeLeft = timeLeft - 1 
				else 
					TriggerServerEvent("BSC:AntiAFK:kick")
				end
			else
				timeLeft = Config.secondsUntilKick
			end

			prevPos = currentPos
		end 
	end 
end)
 